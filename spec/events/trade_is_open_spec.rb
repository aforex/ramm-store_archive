require 'spec_helper'

describe Events::TradeIsOpen do
  let(:params) do
    {
      trade: FactoryBot.build(:trade)
    }
  end

  subject { described_class.new(**params) }

  it { expect(subject).to be_valid }
end
