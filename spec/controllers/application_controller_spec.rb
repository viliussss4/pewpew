describe ApplicationController do

  describe '#cannot_connect_to_remote' do
    it 'renders template with info' do
      expect(controller).to receive(:render).with(file: 'shared/no_data')
    end

    after { controller.method(:cannot_connect_to_remote).call }
  end

  describe '#fetch_data' do

    it 'syncs data' do
      expect(Pewpew::Data).to receive :sync!
    end

    after { controller.method(:fetch_data).call }
  end

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
