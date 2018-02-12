#! /usr/bin/env ruby -S rspec # rubocop:disable Lint/ScriptPermission : Rubocop error??
require 'spec_helper'

describe 'retrieve_system_users', type: :fact do
  before(:each) do
    Facter.clear
    File.stubs(:readline).with('/etc/login.defs')
        .returns(IO.read("#{File.dirname(__FILE__)}/../fixtures/retrieve_system_users/login.defs"))

    user1 = Puppet::Type.type(:user).new(name: 'root', ensure: 'present')
    user2 = Puppet::Type.type(:user).new(name: 'bin', ensure: 'present')
    user3 = Puppet::Type.type(:user).new(name: 'daemon', ensure: 'present')

    Puppet::Type.type(:user).stubs(:instances).returns([user1, user2, user3])
  end
  after(:each) { Facter.clear }
  context 'on CentOS is should' do
    it 'have basic users set' do
      expect(Facter.fact(:retrieve_system_users).value).to eq('root,bin,daemon')
    end
  end
end
