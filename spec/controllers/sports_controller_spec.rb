describe SportsController do

  describe '#index' do

    it 'fetches all sport models and exposes them' do
      expect(Sport).to receive(:all!).and_return []
      controller.index
      expect(assigns(:sports)).to eq []
    end

  end

  describe '#show' do
    let(:sport) { double 'sport', id: 1 }
    let(:params) { { id: sport.id } }
    before { allow(controller).to receive(:params).and_return params }

    it 'searches for one sport' do
      expect(Sport).to receive(:find!).with(sport.id).and_return sport
      controller.show
      expect(assigns(:sport)).to eq sport
    end

  end

end
