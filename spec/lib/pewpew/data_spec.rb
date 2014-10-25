describe Pewpew::Data do

  describe '::sync!' do
    let(:uri) { double 'uri', host: 'mem.cs', port: 80, path: 'asa' }
    let(:http) { double 'http', get: 'mamma' }
    let(:reply) { double 'reply', code: code, body: body.to_json }
    let(:body) { { sports: 'asasa' } }

    before { expect(URI).to receive(:parse).with(Pewpew::Data::DATA_URL).and_return uri }
    before { expect(Net::HTTP).to receive(:new).with(uri.host, uri.port).and_return http }
    before { expect(http).to receive(:get).with(uri.path).and_return reply }

    context 'reply code 200' do
      let(:code) { '200' }

      it 'parses response' do
        expect(JSON).to receive(:parse).with(reply.body).and_return body
        expect(body).to receive(:[]).with 'sports'
      end

      after { expect(Pewpew::Data.sync!).to be true }
    end

    context 'reply code not 200' do
      let(:code) { '3298' }

      it { expect { Pewpew::Data.sync! }.to raise_error Pewpew::Errors::Api }
    end

  end

end
