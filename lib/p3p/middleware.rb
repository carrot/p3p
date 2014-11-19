module P3P
  # Responsible for applying the configured P3P header to the response
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      res           = @app.call(env)
      res[1]['P3P'] = P3P.configuration.header
      res
    end
  end
end
