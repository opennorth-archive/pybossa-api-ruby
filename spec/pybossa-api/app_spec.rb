require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

class PyBossa::App
  describe PyBossa::App do
    describe '#list' do
      it 'should return a list of apps' do
        response = PyBossa::App.list
        response.each{|x| x.should have_key('name')}
      end
    end

    describe '#get' do
      it 'should get an app' do
        response = PyBossa::App.get PyBossa::App.list.first['id']
        response.should have_key('name')
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
