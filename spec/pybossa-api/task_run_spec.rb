require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

class PyBossa::TaskRun
  describe PyBossa::TaskRun do
    describe '#list' do
      it 'should return a list of task runs' do
        response = PyBossa::TaskRun.list
        response.each{|x| x.should have_key('task_id')}
      end
    end

    describe '#get' do
      it 'should get an task run' do
        response = PyBossa::TaskRun.get PyBossa::TaskRun.list.first['id']
        response.should have_key('task_id')
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
end
