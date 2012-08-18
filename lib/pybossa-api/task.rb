module PyBossa
  class Task
    class << self
      # @param [Hash] opts optional arguments
      # @option opts [Integer] :limit number of results to return [default 20]
      # @option opts [String] :api_key an API key
      # @return [Array] a list of tasks
      def list(opts = {})
        PyBossa::API.many 'task', opts
      end

      # @param [Integer] id a task ID
      # @param [Hash] opts optional arguments
      # @option opts [String] :api_key an API key
      # @return [Hash] a task
      def get(id, opts = {})
        PyBossa::API.one 'task', id, opts
      end

      # Creates a task.
      #
      # @param [Hash] opts optional arguments
      # @option opts [Integer] :app_id the app ID to which this object belongs
      # @option opts [String] :state one of:
      #   * "all": Default state
      #   * "in_progress": A user is running the task
      #   * "pending": The task is completed but requires validation
      #   * "valid": The task is completed and valid
      #   * "invalid": The task is completed and invalid
      #   * "error": The task has an error
      # @option opts [Integer] :quorum number of users who should do this task [not in use]
      # @option opts [Boolean] :calibration whether this is a calibration task [not in use]
      # @option opts [Float] :priority_0 between 0 (low) and 1 (high) [not in use]
      # @option opts [Hash] :info all other task details
      # @option opts [String] :api_key an API key
      # @return [Hash] a task
      #
      # @see https://github.com/PyBossa/pybossa/blob/master/pybossa/model.py#L214
      def create(opts = {})
        if opts.has_key? :calibration
          opts[:calibration] = opts[:calibration] ? 1 : 0
        end
        PyBossa::API.create 'task', opts
      end

      # Updates a task.
      #
      # @param [Integer] id a task ID
      #
      # @see PyBossa::Task#create
      def update(id, opts = {})
        if opts.has_key? :calibration
          opts[:calibration] = opts[:calibration] ? 1 : 0
        end
        PyBossa::API.update 'task', id, opts
      end

      # Deletes a task.
      #
      # @param [Integer] id a task ID
      # @param [Hash] opts optional arguments
      # @option opts [String] :api_key an API key
      def delete(id, opts = {})
        PyBossa::API.delete 'task', id, opts
      end
    end
  end
end
