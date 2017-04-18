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

describe 'os_hardening' do

  it { should contain_class('os_hardening::login_defs') }

  context 'with default extra_user_paths empty' do
    it do
      should contain_file('/etc/login.defs').with_content(%r{^ENV_PATH  PATH=/usr/local/bin:/usr/bin:/bin$})
    end
  end
  context 'with custom allow_login_without_home => true' do
    let(:params) { { :extra_user_paths => ['/opt/bin', '/foo/bin'] } }
    it do
      should contain_file('/etc/login.defs').with_content(%r{^ENV_PATH  PATH=/usr/local/bin:/usr/bin:/bin:/opt/bin:/foo/bin$})
    end
  end
  context 'with default umask => 027' do
    it do
      should contain_file('/etc/login.defs').with_content(/^UMASK 027/)
    end
  end
  context 'with custom umask => 720' do
    let(:params) { { :umask => 720 } }
    it do
      should contain_file('/etc/login.defs').with_content(/^UMASK 720/)
    end
  end
  context 'with default password_max_age => 60' do
    it do
      should contain_file('/etc/login.defs').with_content(/^PASS_MAX_DAYS 60/)
    end
  end
  context 'with custom password_max_age => 99' do
    let(:params) { { :password_max_age => 99 } }
    it do
      should contain_file('/etc/login.defs').with_content(/^PASS_MAX_DAYS 99/)
    end
  end
  context 'with default password_min_age => 7' do
    it do
      should contain_file('/etc/login.defs').with_content(/^PASS_MIN_DAYS 7/)
    end
  end
  context 'with custom password_min_age => 99' do
    let(:params) { { :password_min_age => 99 } }
    it do
      should contain_file('/etc/login.defs').with_content(/^PASS_MIN_DAYS 99/)
    end
  end
  context 'with default sys_uid_min => 100' do
    it do
      should contain_file('/etc/login.defs').with_content(/^SYS_UID_MIN 100/)
    end
  end
  context 'with custom sys_uid_min => 99' do
    let(:params) { { :sys_uid_min => 99 } }
    it do
      should contain_file('/etc/login.defs').with_content(/^SYS_UID_MIN 99/)
    end
  end
  context 'with default sys_uid_max => 999' do
    it do
      should contain_file('/etc/login.defs').with_content(/^SYS_UID_MAX 999/)
    end
  end
  context 'with custom sys_uid_max => 499' do
    let(:params) { { :sys_uid_max => 499 } }
    it do
      should contain_file('/etc/login.defs').with_content(/^SYS_UID_MAX 499/)
    end
  end
  context 'with default sys_gid_min => 100' do
    it do
      should contain_file('/etc/login.defs').with_content(/^SYS_GID_MIN 100/)
    end
  end
  context 'with custom sys_gid_min => 99' do
    let(:params) { { :sys_gid_min => 99 } }
    it do
      should contain_file('/etc/login.defs').with_content(/^SYS_GID_MIN 99/)
    end
  end
  context 'with default sys_gid_max => 999' do
    it do
      should contain_file('/etc/login.defs').with_content(/^SYS_GID_MAX 999/)
    end
  end
  context 'with custom sys_gid_max => 499' do
    let(:params) { { :sys_gid_max => 499 } }
    it do
      should contain_file('/etc/login.defs').with_content(/^SYS_GID_MAX 499/)
    end
  end
  context 'with default login_retries => 5' do
    it do
      should contain_file('/etc/login.defs').with_content(/^LOGIN_RETRIES 5/)
    end
  end
  context 'with custom login_retries => 10' do
    let(:params) { { :login_retries => 10 } }
    it do
      should contain_file('/etc/login.defs').with_content(/^LOGIN_RETRIES 10/)
    end
  end
  context 'with default login_timeout => 60' do
    it do
      should contain_file('/etc/login.defs').with_content(/^LOGIN_TIMEOUT 60/)
    end
  end
  context 'with custom login_timeout => 10' do
    let(:params) { { :login_timeout => 10 } }
    it do
      should contain_file('/etc/login.defs').with_content(/^LOGIN_TIMEOUT 10/)
    end
  end
  context 'with default chfn_restrict absent ' do
    it do
      should contain_file('/etc/login.defs').without_content(/^CHFN_RESTRICT/)
    end
  end
  context 'with custom chfn_restrict => frwh' do
    let(:params) { { :chfn_restrict => 'frwh' } }
    it do
      should contain_file('/etc/login.defs').with_content(/^CHFN_RESTRICT frwh/)
    end
  end
  context 'with default allow_login_without_home => false' do
    it do
      should contain_file('/etc/login.defs').with_content(/^DEFAULT_HOME no/)
    end
  end
  context 'with custom allow_login_without_home => true' do
    let(:params) { { :allow_login_without_home => true } }
    it do
      should contain_file('/etc/login.defs').with_content(/^DEFAULT_HOME yes/)
    end
  end
end
