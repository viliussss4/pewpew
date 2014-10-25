describe Queries do

  describe '#find!' do
    let(:queryable_object) { [model].extend Queries }
    let(:model) { Event.new id: id }

    context 'model found' do
      let(:id) { 1 }
      it { expect(queryable_object.find! id).to eq model }
    end

    context 'no model found' do
      let(:id) { 2 }

      it { expect{ queryable_object.find! id + 1 }.to raise_error Pewpew::Errors::DataNotFound }
    end

  end

end
