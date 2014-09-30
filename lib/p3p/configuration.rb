module P3P
  class Configuration
    DEFAULT_HEADER = 'CP="NOI ADM DEV PSAi COM NAV OUR OTRo STP IND DEM"'
    attr_accessor :header

    def initialize
      header = DEFAULT_HEADER
    end
  end
end
