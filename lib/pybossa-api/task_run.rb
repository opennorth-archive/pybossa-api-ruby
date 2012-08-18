module PyBossa
  class TaskRun
    class << self
      # @param [Hash] opts optional arguments
      # @option opts [Integer] :limit number of results to return [default 20]
      # @option opts [String] :api_key an API key
      # @return [Array] a list of task runs
      def list(opts = {})
        PyBossa::API.many 'taskrun', opts
      end

      # @param [Integer] id a task run ID
      # @param [Hash] opts optional arguments
      # @option opts [String] :api_key an API key
      # @return [Hash] a task run
      def get(id, opts = {})
        PyBossa::API.retrieve 'taskrun', id, opts
      end

      # Creates a task run.
      #
      # @param [Hash] opts optional arguments
      # @option opts [Integer] :app_id the app ID to which this object belongs
      # @option opts [Integer] :task_id the task ID to which this object belongs
      # @option opts [Boolean] :timeout timeout for completing a task [not in use]
      # @option opts [Boolean] :calibration whether this is a calibration task [not in use]
      # @option opts [Hash] :info all other task run details
      # @option opts [String] :api_key an API key
      # @return [Hash] a task run
      #
      # @see https://github.com/PyBossa/pybossa/blob/master/pybossa/model.py#L261
      # @see https://github.com/PyBossa/pybossa/blob/master/pybossa/api.py#L169
      def create(opts = {})
        if opts.has_key? :calibration
          opts[:calibration] = opts[:calibration] ? 1 : 0
        end
        PyBossa::API.create 'taskrun', opts
      end

      # Updates a task run.
      #
      # @param [Integer] id a task run ID
      #
      # @see PyBossa::TaskRun#create
      def update(id, opts = {})
        if opts.has_key? :calibration
          opts[:calibration] = opts[:calibration] ? 1 : 0
        end
        PyBossa::API.update 'taskrun', id, opts
      end

      # Deletes a task run.
      #
      # @param [Integer] id a task run ID
      # @param [Hash] opts optional arguments
      # @option opts [String] :api_key an API key
      def delete(id, opts = {})
        PyBossa::API.destroy 'taskrun', id, opts
      end
    end
  end
end
