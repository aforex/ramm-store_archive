require 'spec_helper'

describe :wallet_is_create do
  let(:message) { build :event, :wallet_is_create }

  subject { EventBuilder.new(message: message).call }

  it { 
    expect(subject).to be_valid }

  context 'when invalid params' do
    let(:message) { build :event, :wallet_is_create, data: data }

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
