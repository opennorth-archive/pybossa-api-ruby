require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

class PyBossa::Task
  describe PyBossa::Task do
    describe '#list' do
      it 'should return a list of tasks' do
        response = PyBossa::Task.list
        response.each{|x| x.should have_key('state')}
      end
    end

    describe '#get' do
      it 'should get an task' do
        response = PyBossa::Task.get PyBossa::Task.list.first['id']
        response.should have_key('state')
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
