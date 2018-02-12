require 'spec_helper'

describe 'combine_sugid_lists' do
  it { is_expected.not_to eq(nil) }
  it { is_expected.to run.with_params.and_raise_error(ArgumentError) }
  it { is_expected.to run.with_params('one', 'two', 'three').and_raise_error(ArgumentError) }
  it { is_expected.to run.with_params(%w[one two], %w[one two]).and_raise_error(ArgumentError) }
  it { is_expected.to run.with_params(%w[one two three], %w[three], %w[four five]).and_return(%w[one two four five]) }
end
