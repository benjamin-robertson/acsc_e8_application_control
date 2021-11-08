# frozen_string_literal: true

require 'spec_helper'

describe 'acsc_e8_application_control::rules' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }
      let(:pre_condition) { 'include acsc_e8_application_control' }

      it { is_expected.to compile }
    end
  end
end
