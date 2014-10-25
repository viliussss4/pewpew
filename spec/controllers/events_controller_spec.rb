describe EventsController do

  it { expect(EventsController._process_action_callbacks.map &:filter).to including :find_sport }

  describe '#index' do
    let(:sport) { double 'sport', events: [] }
    before { controller.instance_variable_set :@sport, sport }

    it 'gets all the sport events' do
      expect(sport).to receive(:events).with(no_args).and_return sport.events
      controller.index
      expect(assigns(:events)).to eq sport.events
    end

  end

  describe '#show' do
    let(:sport) { double 'sport', events: double('events', find!: event) }
    let(:event) { double 'event', id: 1 }
    let(:params) { { id: event.id } }
    before { allow(controller).to receive(:params).and_return params }
    before { controller.instance_variable_set :@sport, sport }

    it 'fetches single event' do
      expect(sport.events).to receive(:find!).with(event.id).and_return event
      controller.show
      expect(assigns(:event)).to eq event
    end
  end

  describe '#find_sport' do
    let(:params) { { sport_id: sport.id } }
    let(:sport) { double 'sport', id: 1 }
    before { allow(controller).to receive(:params).and_return params }

    it 'searches for the sport' do
      expect(Sport).to receive(:find!).with(sport.id).and_return sport
      controller.method(:find_sport).call
      expect(assigns(:sport)).to eq sport
    end

  end

end
