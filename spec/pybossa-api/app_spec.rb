require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

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
    pending "Must use API key to test this method"
  end

  describe '#update' do
    pending "Must use API key to test this method"
  end

  describe '#delete' do
    pending "Must use API key to test this method"
  end
end
