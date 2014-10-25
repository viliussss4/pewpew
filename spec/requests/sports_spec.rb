context 'sports requests ' do
  before { allow(Sport).to receive(:data).and_return [sport] }
  let(:sport) { Sport.new id: 1, title: 'asa' }

  describe '/sports/:id' do
    context 'GET' do
      let(:route) { "/sports/#{sport.id}" }
      context 'response' do
        before { get route, '' }

        it { expect(response.status).to be 200 }
        it { expect(response).to render_template :show }
      end
      context 'did not find record' do
        let(:route) { 'sports/0' }
        it { expect { get route, '' }.to raise_error ActionController::RoutingError }
      end
    end
  end

  describe '/sports' do
    context 'GET' do
      let(:route) { '/sports' }
      context 'response' do
        before { get route, '' }

        it { expect(response.status).to be 200 }
        it { expect(response).to render_template :index }
      end
    end

  end
end
