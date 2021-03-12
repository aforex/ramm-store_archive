describe :trade_is_open do
  let(:params) do
    {
      trade: FactoryBot.build(:trade)
    }
  end

  subject { Event.new(data: params, validations: %i[trade]) }

  it { expect(subject).to be_valid }

  context 'when invalid params' do
    context 'as empty hash' do
      let(:params) { {} }
      it { expect(subject).not_to be_valid }
    end

    context 'as trade nil' do
      let(:params) { { trade: nil } }
      it { expect(subject).not_to be_valid }
    end

    context 'as trade empty' do
      let(:params) { { trade: {} } }
      it { expect(subject).not_to be_valid }
    end

    context 'as trade invalid' do
      let(:params) { { trade: { entry: 123 } } }
      it { expect(subject).not_to be_valid }
    end
  end
end
