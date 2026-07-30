require 'spec_helper'

describe 'os_hardening' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }

      context 'in an LXC container without network sysctl opt-in' do
        let(:params) { { system_environment: 'lxc' } }

        it { is_expected.not_to contain_class('os_hardening::sysctl') }
      end

      context 'in a Docker container without network sysctl opt-in' do
        let(:params) { { system_environment: 'docker' } }

        it { is_expected.not_to contain_class('os_hardening::sysctl') }
      end

      context 'in an LXC container with network sysctl opt-in' do
        let(:params) do
          {
            system_environment: 'lxc',
            manage_container_network_sysctls: true,
          }
        end

        it do
          is_expected.to contain_class('os_hardening::sysctl')
            .with(system_environment: 'lxc')
        end
      end

      context 'in a Docker container with network sysctl opt-in' do
        let(:params) do
          {
            system_environment: 'docker',
            manage_container_network_sysctls: true,
          }
        end

        it do
          is_expected.to contain_class('os_hardening::sysctl')
            .with(system_environment: 'docker')
        end
      end

      context 'with sysctl disabled and container network sysctl opt-in' do
        let(:params) do
          {
            enable_sysctl_config: false,
            system_environment: 'lxc',
            manage_container_network_sysctls: true,
          }
        end

        it { is_expected.not_to contain_class('os_hardening::sysctl') }
      end
    end
  end
end
