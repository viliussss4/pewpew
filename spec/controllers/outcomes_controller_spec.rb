describe OutcomesController do

  it { expect(OutcomesController._process_action_callbacks.map &:filter).to including :find_sport }

  describe '#index' do
    let(:event) { double 'event', id: 1, outcomes: double('outcomes') }
    let(:params) { { event_id: event.id } }
    before { allow(controller).to receive(:params).and_return params }

    it 'fetches outcomes collection' do
      expect(controller).to receive(:find_event).with(event.id).and_return event
      controller.index
      expect(assigns(:outcomes)).to eq event.outcomes
    end

  end

end
