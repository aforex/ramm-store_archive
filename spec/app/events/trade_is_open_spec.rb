describe :trade_is_open do
  let(:message) { build :event, :trade_is_open }

  subject { EventBuilder.new(message: message).call }

  it { expect(subject).to be_valid }

  context 'when invalid params' do
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
end
