require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

class PyBossa::API
  # We don't want to test the PyBossa API. We just want to check that the
  # wrapper works.
  describe PyBossa::API do
    EXAMPLE_SHORT_NAME = PyBossa::API.many('app').first['short_name']

    describe '#many' do
      it 'should return a non-empty array of hashes' do
        response = PyBossa::API.many 'app'
        expect(response).to be_an(Array)
        expect(response.size).to be >= 1
        response.each{|x| expect(x).to be_a(Hash)}
      end

      it 'should respect the :limit argument' do
        expect(PyBossa::API.many('app', :limit => 1).size).to eq(1)
      end

      it 'should respect a field argument' do
        expect(PyBossa::API.many('app', :short_name => EXAMPLE_SHORT_NAME).find{|result|
          result['short_name'] == EXAMPLE_SHORT_NAME
        }).to_not be_nil
      end
    end

    describe '#one' do
      it 'should return a hash' do
        expect(PyBossa::API.retrieve('app', PyBossa::API.many('app').last['id'])).to be_a(Hash)
      end
    end

    describe '#create' do
      pending "Must use API key. See http://about.travis-ci.org/docs/user/build-configuration/#Secure-environment-variables"
    end

    describe '#update' do
      pending "Must use API key. See http://about.travis-ci.org/docs/user/build-configuration/#Secure-environment-variables"
    end

    describe '#delete' do
      pending "Must use API key. See http://about.travis-ci.org/docs/user/build-configuration/#Secure-environment-variables"
    end
  end
end

