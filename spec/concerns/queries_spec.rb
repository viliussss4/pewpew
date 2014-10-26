describe Queries do
  let(:queryable_object) { [model].extend Queries }
  let(:model) { Event.new id: id }
  let(:id) { 1 }


  describe '#order_by!' do
    let(:field) { :id }
    context 'asc' do
      let(:direction) { :asc }
      it 'sorts and return sorted collection' do
        expect(queryable_object).to receive(:sort_by!).and_yield(model)
      end
    end
    context 'desc' do
      let(:direction) { :desc }

      it 'reverses sorted colection' do
        expect(queryable_object).to receive(:sort_by!).and_yield(model).and_return queryable_object
        expect(queryable_object).to receive :reverse!
      end

    end

    after { queryable_object.order_by! field, direction }
  end

  describe '#find!' do
    context 'model found' do
      it { expect(queryable_object.find! id).to eq model }
    end

    context 'no model found' do
      let(:id) { 2 }

      it { expect{ queryable_object.find! id + 1 }.to raise_error Pewpew::Errors::DataNotFound }
    end

  end

end
