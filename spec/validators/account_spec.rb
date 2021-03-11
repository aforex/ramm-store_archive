require 'spec_helper'

describe Validators::Account do
  let(:params) { FactoryBot.build(:account) }

  subject { described_class.new.call(params) }

  it { expect(subject.errors).to be_empty }
end
