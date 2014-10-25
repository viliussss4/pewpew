context 'events requests' do
  let(:sport) { Sport.new id: 1, title: 'asa', events: [event] }
  let(:event) { Event.new id: 1 }
  before { allow(Sport).to receive(:data).and_return [sport] }

  describe '/sports/:sport_id/events/:id' do
    let(:route) { "/sports/#{sport.id}/events/#{event.id}" }

    context 'GET' do
      before { get route, '' }

      it { expect(response.status).to be 200 }
      it { expect(response).to render_template :show }
    end

    context '404 not found' do
      let(:route) { "/sports/#{sport.id}/events/0" }
      it { expect { get route, '' }.to raise_error ActionController::RoutingError }
    end

  end

  describe '/sports/:sport_id/events' do
    let(:route) { "/sports/#{sport.id}/events" }
    context 'GET' do
      context 'response' do
        before { get route, '' }

        it { expect(response.status).to be 200 }
        it { expect(response).to render_template :index }
      end
      context '404 not found' do
        let(:route) { '/sports/0/events' }
        it { expect { get route, '' }.to raise_error ActionController::RoutingError }
      end
    end
  end
end
