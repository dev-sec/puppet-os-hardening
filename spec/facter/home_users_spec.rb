#! /usr/bin/env ruby -S rspec # rubocop:disable Lint/ScriptPermission : Rubocop error??
require 'spec_helper'

describe 'home_users', type: :fact do
  before(:each) do
    Facter.clear
    allow(File).to receive(:readline).with('/etc/login.defs')
        .and_return(IO.read("#{File.dirname(__FILE__)}/../fixtures/etc/login.defs"))

    user1 = Puppet::Type.type(:user).new(name: 'root', ensure: 'present')
    user2 = Puppet::Type.type(:user).new(name: 'bin', ensure: 'present')
    user3 = Puppet::Type.type(:user).new(name: 'daemon', ensure: 'present')

    allow(Puppet::Type.type(:user)).to receive(:instances).and_return([user1, user2, user3])
  end
  after(:each) { Facter.clear }
  context 'on CentOS is should' do
    it 'have basic users set' do
      expect(Facter.fact(:home_users).value).to eq('root,bin,daemon')
    end
  end
end
