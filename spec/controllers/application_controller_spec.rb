describe ApplicationController do

  describe '#find_event' do
    let(:sport) { double 'sport', events: double('events', find!: event) }
    let(:event) { double 'event', id: 1 }
    let(:params) { { id: event.id } }
    before { allow(controller).to receive(:params).and_return params }
    before { controller.instance_variable_set :@sport, sport }
    before { controller.instance_variable_set :@sport, sport }

    it 'fetches single event' do
      expect(sport.events).to receive(:find!).with(event.id).and_return event
      expect(controller.method(:find_event).call event.id).to eq event
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
