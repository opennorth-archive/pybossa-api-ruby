require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

class PyBossa::API
  # We don't want to test the PyBossa API. We just want to check that the
  # wrapper works.
  describe PyBossa::API do
    EXAMPLE_SHORT_NAME = PyBossa::API.many('app').first['short_name']

    describe '#many' do
      it 'should return a non-empty array of hashes' do
        response = PyBossa::API.many 'app'
        response.should be_an(Array)
        response.should have_at_least(1).item
        response.each{|x| x.should be_a(Hash)}
      end

      it 'should respect the :limit argument' do
        PyBossa::API.many('app', limit: 1).should have(1).item
      end

      it 'should respect a field argument' do
        PyBossa::API.many('app', short_name: EXAMPLE_SHORT_NAME).find{|result|
          result['short_name'] == EXAMPLE_SHORT_NAME
        }.should_not be_nil
      end
    end

    describe '#one' do
      it 'should return a hash' do
        PyBossa::API.one('app', PyBossa::API.many('app').first['id']).should be_a(Hash)
      end
    end

    describe '#create' do
      pending
    end

    describe '#update' do
      pending
    end

    describe '#delete' do
      pending
    end
  end
end

