describe Sport do
  it { expect(Sport.ancestors).to include Pewpew::Data }

  describe '#events' do
    let(:sport) { Sport.new events: [ id: 1 ] }

    it { expect(sport.events).to respond_to :find! }
  end

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

  describe '::find!' do
    let(:sport) { Sport.new id: id }
    before { expect(Sport).to receive(:all!).and_return data }

    context 'sport exists' do
      let(:data) { [sport] }
      let(:id) { 1 }

      it { expect(Sport.find! id).to eq sport }
    end
    context 'sport not found' do
      let(:data) { [sport] }
      let(:id) { 2 }

      it { expect { Sport.find! 1 }.to raise_error Pewpew::Errors::DataNotFound }
    end

  end

end
