describe EventsController do

  it { expect(EventsController._process_action_callbacks.map &:filter).to including :find_sport }

  describe '#index' do
    let(:sport) { double 'sport', events: [].extend(Queries) }
    before { controller.instance_variable_set :@sport, sport }

    it 'gets all the sport events' do
      expect(sport).to receive(:events).with(no_args).and_return sport.events
      controller.index
      expect(assigns(:events)).to eq sport.events
    end

  end

  describe '#show' do
    let(:event) { double 'event', id: 1 }
    let(:params) { { id: event.id } }
    before { allow(controller).to receive(:params).and_return params }

    it 'finds and assigns event' do
      expect(controller).to receive(:find_event).with(event.id).and_return event
      controller.show
      expect(assigns(:event)).to eq event
    end

  end

end
