describe Attributes do
  let(:attributes) { double('attr', as_json: as_json ).extend Attributes }
  let(:as_json) { { 'asa' => 'asa' } }

  describe '#get_attributes' do
    let(:attrs) { double 'attrs', keys: 'asa', values: 'asa' }
    let(:options) { {} }

    context 'keys' do
      let(:which) { 'keys' }

      it 'converts as_json and gets array of keys' do
        expect(as_json).to receive(:except).with(no_args).and_return attrs
        expect(attrs).to receive :keys
      end
      context 'omits array of keys' do
        let(:options) { { except: ['asa'] } }

        it 'converts as_json and gets array of keys' do
          expect(as_json).to receive(:except).with('asa').and_return attrs
          expect(attrs).to receive :keys
        end
      end
    end

    context 'values' do
      let(:which) { 'values' }

      it 'converts as_json and gets array of values' do
        expect(as_json).to receive(:except).with(no_args).and_return attrs
        expect(attrs).to receive :values
      end
    end


    after { attributes.get_attributes which, options }

  end

end
