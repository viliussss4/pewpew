describe Sport do
  it { expect(Sport.ancestors).to include Pewpew::Data }

  describe '::all!' do
    before { expect(Sport).to receive(:data).at_least(:once).and_return data }
    context 'data fetched' do
      let(:data) { [] }
      let(:datum) { { id: 1 } }

      it 'maps hash to ruby object' do
        expect(data).to receive(:map).and_yield datum
        expect(Sport).to receive(:new).with datum
      end

      after { Sport.all! }
    end
    context 'no data fetched' do
      let(:data) { nil }
      it { expect { Sport.all! }.to raise_error Pewpew::Errors::Api }
    end
  end

end
