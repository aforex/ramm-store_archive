require 'spec_helper'

describe Validators::Wallet do
  let(:params) { FactoryBot.build(:wallet) }

  subject { described_class.new.call(params) }

  it { expect(subject.errors).to be_empty }
end
