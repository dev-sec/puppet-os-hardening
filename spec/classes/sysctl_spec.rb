require 'spec_helper'

describe 'os_hardening::sysctl' do

  context 'with enable_module_loading => true' do
    let(:params) { {:enable_module_loading => true} }

    it do
      should_not contain_sysctl('kernel.modules_disabled')
    end
  end

  context 'with enable_module_loading => false' do
    let(:params) { {:enable_module_loading => false} }

    it do
      should contain_sysctl('kernel.modules_disabled').with_value('1')
    end
  end

end