require 'spec_helper'

describe :wallet_payment do
  let(:message) { build :event, :wallet_payment }

  subject { EventBuilder.new(message: message).call }

  it { 
    expect(subject).to be_valid }

  context 'when invalid trade params' do
    let(:message) { build :event, :trade_is_open, data: data }

    context 'as empty hash' do
      let(:data) { {} }
      it { expect(subject).not_to be_valid }
    end

    context 'as trade nil' do
      let(:data) { { trade: nil } }
      it { expect(subject).not_to be_valid }
    end

    context 'as trade empty' do
      let(:data) { { trade: {} } }
      it { expect(subject).not_to be_valid }
    end

    context 'as trade invalid' do
      let(:data) { { trade: { entry: 123 } } }
      it { expect(subject).not_to be_valid }
    end
  end

  context 'when invalid wallet params' do
    let(:message) { build :event, :wallet_payment, data: data }

    context 'as empty hash' do
      let(:data) { {} }
      it { expect(subject).not_to be_valid }
    end

    context 'as wallet nil' do
      let(:data) { { wallet: nil } }
      it { expect(subject).not_to be_valid }
    end

    context 'as wallet empty' do
      let(:data) { { wallet: {} } }
      it { expect(subject).not_to be_valid }
    end

    context 'as wallet invalid' do
      let(:data) { { wallet: { dt: 123 } } }
      it { expect(subject).not_to be_valid }
    end
  end
end
