# frozen_string_literal: true

require 'spec_helper'

describe 'puppet_applocker_fervid::rule_status' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:pre_conditon) { 'include puppet_applocker_fervid' }
      let(:params) { {'executable_rules' => 'Enabled', 'msi_rules' => 'Enabled', 'dll_rules' => 'Enabled', 'script_rules' => 'Enabled', 'packaged_app_rules' => 'Enabled'}}
      let(:facts) { os_facts }

      it { is_expected.to compile }
    end
  end
end
