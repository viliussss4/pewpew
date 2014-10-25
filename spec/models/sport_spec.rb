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
    let(:data) { double 'data' }
    let(:queryable_object) { double 'queryable_object', find!: 'yay' }
    let(:id) { 1 }

    it 'extends instance with Queries module and invokes find!' do
      expect(Sport).to receive(:all!).and_return data
      expect(data).to receive(:extend).with(Queries).and_return queryable_object
      expect(queryable_object).to receive(:find!).with id
    end

    after { Sport.find! id }

  end

end
