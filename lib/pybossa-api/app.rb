module PyBossa
  class App
    class << self
      # @param [Hash] opts optional arguments
      # @option opts [Integer] :limit number of results to return [default 20]
      # @option opts [String] :api_key an API key
      # @return [Array] a list of apps
      def list(opts = {})
        PyBossa::API.many 'app', opts
      end

      # @param [Integer] id an app ID
      # @param [Hash] opts optional arguments
      # @option opts [String] :api_key an API key
      # @return [Hash] an app
      def get(id, opts = {})
        PyBossa::API.one 'app', id, opts
      end

      # Creates an app.
      #
      # @param [Hash] opts optional arguments
      # @option opts [String] :name a name
      # @option opts [String] :short_name a URL slug
      # @option opts [String] :description a short description
      # @option opts [String] :long_description a long HTML description
      # @option opts [Integer] :long_tasks [not in use]
      # @option opts [Boolean] :hidden whether to hide the app from the public
      # @option opts [Integer] :time_estimate estimated time to complete [not in use]
      # @option opts [Integer] :time_limit time limit to complete task [not in use]
      # @option opts [Float] :calibration_frac [not in use]
      # @option opts [Integer] :bolt_course_id [not in use]
      # @option opts [Hash] :info all other task details
      # @option opts [String] :api_key an API key
      # @return [Hash] an app
      #
      # @see https://github.com/PyBossa/pybossa/blob/master/pybossa/model.py#L133
      def create(opts = {})
        if opts.has_key? :hidden
          opts[:hidden] = opts[:hidden] ? 1 : 0
        end
        PyBossa::API.create 'app', opts
      end

      # Updates an app.
      #
      # @param [Integer] id an app ID
      #
      # @see PyBossa::App#create
      def update(id, opts = {})
        if opts.has_key? :calibration
          opts[:calibration] = opts[:calibration] ? 1 : 0
        end
        PyBossa::API.update 'app', id, opts
      end

      # Deletes an app.
      #
      # @param [Integer] id an app ID
      # @param [Hash] opts optional arguments
      # @option opts [String] :api_key an API key
      def delete(id, opts = {})
        PyBossa::API.delete 'app', id, opts
      end
    end
  end
end
