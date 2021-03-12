require 'spec_helper'

describe Validators::Trade do
  let(:params) { FactoryBot.build(:trade) }

  subject { described_class.new.call(params) }

  it { expect(subject.errors).to be_empty }
end
