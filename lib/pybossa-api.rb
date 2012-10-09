require 'httparty'
require 'sanitize'
require 'yajl'

module PyBossa
  autoload :App, 'pybossa-api/app'
  autoload :Task, 'pybossa-api/task'
  autoload :TaskRun, 'pybossa-api/task_run'

  # A Ruby wrapper for the PyBossa API.
  # @see http://docs.pybossa.com/en/latest/model.html#restful-api
  class API
    include HTTParty
    base_uri 'pybossa.com/api'

    class Error < StandardError; end

    class << self
      attr_accessor :api_key

      # Lists objects. To filter objects, add key-value pairs to the +:opts+
      # argument in which each key is the name of a field on which you want to
      # filter. For example, you may want to filter tasks by +app_id+.
      #
      # @param [String] klass one of "app", "task" or "taskrun"
      # @param [Hash] opts optional arguments
      # @option opts [Integer] :limit number of results to return [default 20]
      # @option opts [String] :api_key an API key
      # @return [Array] a list of objects
      def many(klass, opts = {})
        request :get, "/#{klass}", opts
      end

      # Gets an object by ID.
      #
      # @param [String] klass one of "app", "task" or "taskrun"
      # @param [Integer] id an object ID
      # @param [Hash] opts optional arguments
      # @option opts [String] :api_key an API key
      # @return [Hash] an object
      def retrieve(klass, id, opts = {})
        request :get, "/#{klass}/#{id}", opts
      end

      # Creates an object.
      #
      # @param [String] klass one of "app", "task" or "taskrun"
      # @param [Hash] opts optional arguments
      # @option opts [String] :api_key an API key
      # @return [Hash] an object
      # @raise [PyBossa::API::Error] if operation failed
      #
      # @see https://github.com/PyBossa/pybossa/blob/master/pybossa/api.py#L91
      def create(klass, opts = {})
        request :post, "/#{klass}", opts
      end

      # Updates an object.
      #
      # @param [String] klass one of "app", "task" or "taskrun"
      # @param [Integer] id an object ID
      # @param [Hash] opts optional arguments
      # @option opts [String] :api_key an API key
      # @raise [PyBossa::API::Error] if operation failed
      #
      # @see https://github.com/PyBossa/pybossa/blob/master/pybossa/api.py#L129
      def update(klass, id, opts = {})
        request :put, "/#{klass}/#{id}", opts
      end

      # Deletes an object.
      #
      # @param [String] klass one of "app", "task" or "taskrun"
      # @param [Integer] id an object ID
      # @param [Hash] opts optional arguments
      # @option opts [String] :api_key an API key
      # @raise [PyBossa::API::Error] if operation failed
      #
      # @see https://github.com/PyBossa/pybossa/blob/master/pybossa/api.py#L108
      def destroy(klass, id, opts = {})
        request :delete, "/#{klass}/#{id}", opts
      end

      # @todo new_task user_progress
      # https://github.com/PyBossa/pybossa/blob/master/pybossa/api.py#L198
      # https://github.com/PyBossa/pybossa/blob/master/pybossa/api.py#L238

    private

      def request(http_method, path, opts)
        opts[:api_key] ||= api_key if api_key
        response = if [:get, :delete].include? http_method
          send http_method, path, :query => opts
        else
          send http_method, path, :query => {:api_key => opts.delete(:api_key)}, :body => Yajl::Encoder.encode(opts), :headers => {'Content-type' => 'application/json'}
        end
        unless [200, 204].include? response.response.code.to_i
          raise PyBossa::API::Error.new Sanitize.clean(response.response.body)
        end
        response.parsed_response
      end
    end
  end
end
