#! /usr/bin/env ruby -S rspec # rubocop:disable Lint/ScriptPermission : Rubocop error??
require 'spec_helper'

describe 'retrieve_system_users', type: :fact do
  before(:each) do
    Facter.clear
    allow(File).to receive(:readline)
      .with('/etc/login.defs')
      .and_return(IO.read("#{File.dirname(__FILE__)}/../../fixtures/etc/login.defs"))

    # https://ruby-doc.org/stdlib-2.5.3/libdoc/etc/rdoc/Struct.html#Passwd
    # fields: name, passwd, uid, gid, gecos, homedir, shell
    user_root = Etc::Passwd.new('root', 'x', 0, 0, 'root', '/root', '/bin/bash')
    user_bin = Etc::Passwd.new('bin', 'x', 1, 1, 'bin', '/bin', '/sbin/nologin')
    user_daemon = Etc::Passwd.new('daemon', 'x', 2, 2, 'daemon', '/sbin', '/sbin/nologin')
    user_testuser = Etc::Passwd.new('testuser', 'x', 1000, 1000, 'tesuser', '/home/testuser', '/bin/bash')

    allow(Etc).to receive(:passwd)
      .and_yield(user_root)
      .and_yield(user_bin)
      .and_yield(user_daemon)
      .and_yield(user_testuser)
  end
  after(:each) { Facter.clear }
  context 'on CentOS is should' do
    it 'have basic users set' do
      expect(Facter.fact(:retrieve_system_users).value).to eq('root,bin,daemon')
    end
  end
end
