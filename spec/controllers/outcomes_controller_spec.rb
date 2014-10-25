describe OutcomesController do

  it { expect(OutcomesController._process_action_callbacks.map &:filter).to including :find_sport }

  describe '#index' do
  end

end
