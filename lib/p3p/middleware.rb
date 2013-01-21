module P3P
  class Middleware
    def initialize app
      @app = app
    end

    def call env
      res           = @app.call(env)
      res[1]["P3P"] = 'CP="NOI ADM DEV PSAi COM NAV OUR OTRo STP IND DEM"'
      res
    end
  end
end
