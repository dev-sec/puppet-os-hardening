# encoding: utf-8
#
# Copyright 2014, Deutsche Telekom AG
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require 'spec_helper'

describe 'os_hardening::sysctl' do

  it { should contain_class('os_hardening::sysctl') }

  context 'with enable_ipv4_forwarding => true' do
    let(:params) { { :enable_ipv4_forwarding => true } }
    it do
      should contain_sysctl('net.ipv4.ip_forward').with_value('1')
    end
  end

  context 'with enable_ipv4_forwarding => false' do
    let(:params) { { :enable_ipv4_forwarding => false } }
    it do
      should contain_sysctl('net.ipv4.ip_forward').with_value('0')
    end
  end

  context 'with enable_ipv6 => true' do
    let(:params) { { :enable_ipv6 => true } }
    it do
      should contain_sysctl('net.ipv6.conf.all.disable_ipv6').with_value('0')
      should contain_sysctl('net.ipv6.conf.all.forwarding').with_value('0')
    end
  end

  context 'with enable_ipv6 => false' do
    let(:params) { { :enable_ipv6 => false } }
    it do
      should contain_sysctl('net.ipv6.conf.all.disable_ipv6').with_value('1')
      should contain_sysctl('net.ipv6.conf.all.forwarding').with_value('0')
      should contain_sysctl('net.ipv6.conf.default.router_solicitations').with_value('0')
      should contain_sysctl('net.ipv6.conf.default.accept_ra_rtr_pref').with_value('0')
      should contain_sysctl('net.ipv6.conf.default.accept_ra_pinfo').with_value('0')
      should contain_sysctl('net.ipv6.conf.default.accept_ra_defrtr').with_value('0')
      should contain_sysctl('net.ipv6.conf.default.autoconf').with_value('0')
      should contain_sysctl('net.ipv6.conf.default.dad_transmits').with_value('0')
      should contain_sysctl('net.ipv6.conf.default.max_addresses').with_value('1')
    end
  end

  context 'with enable_ipv6_forwarding => true' do
    let(:params) { { :enable_ipv6_forwarding => true, :enable_ipv6 => true } }
    it do
      should contain_sysctl('net.ipv6.conf.all.forwarding').with_value('1')
    end
  end

  context 'with enable_ipv6_forwarding => false' do
    let(:params) { { :enable_ipv6_forwarding => false, :enable_ipv6 => true } }
    it do
      should contain_sysctl('net.ipv6.conf.all.forwarding').with_value('0')
    end
  end

  context 'with arp_restricted => true' do
    let(:params) { { :arp_restricted => true } }
    it do
      should contain_sysctl('net.ipv4.conf.all.arp_ignore').with_value('1')
      should contain_sysctl('net.ipv4.conf.all.arp_announce').with_value('2')
    end
  end

  context 'with arp_restricted => false' do
    let(:params) { { :arp_restricted => false } }
    it do
      should contain_sysctl('net.ipv4.conf.all.arp_ignore').with_value('0')
      should contain_sysctl('net.ipv4.conf.all.arp_announce').with_value('0')
    end
  end

  context 'with enable_module_loading => true' do
    let(:params) { { :enable_module_loading => true } }
    it do
      should_not contain_sysctl('kernel.modules_disabled')
    end
  end

  context 'with enable_module_loading => false' do
    let(:params) { { :enable_module_loading => false } }
    it do
      should contain_sysctl('kernel.modules_disabled').with_value('1')
    end
  end

  context 'with enable_sysrq => true' do
    let(:params) { { :enable_sysrq => true } }
    it do
      allowed_sysrq = 4 + 16 + 32 + 64 + 128
      should contain_sysctl('kernel.sysrq').with_value("#{allowed_sysrq}")
    end
  end

  context 'with enable_sysrq => false' do
    let(:params) { { :enable_sysrq => false } }
    it do
      should contain_sysctl('kernel.sysrq').with_value('0')
    end
  end

  context 'with enable_stack_protection => true' do
    let(:params) { { :enable_stack_protection => true } }
    it do
      should contain_sysctl('kernel.randomize_va_space').with_value('2')
    end
  end

  context 'with enable_stack_protection => false' do
    let(:params) { { :enable_stack_protection => false } }
    it do
      should contain_sysctl('kernel.randomize_va_space').with_value('0')
    end
  end

  context 'with enable_core_dump => true' do
    let(:params) { { :enable_core_dump => true } }
    it do
      should contain_sysctl('fs.suid_dumpable').with_value('1')
    end
  end

  context 'with enable_core_dump => false' do
    let(:params) { { :enable_core_dump => false } }
    it do
      should contain_sysctl('fs.suid_dumpable').with_value('0')
    end
  end

end
