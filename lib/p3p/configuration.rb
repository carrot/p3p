module P3P
  # Responsible for handling P3P configuration
  class Configuration
    DEFAULT_HEADER = 'CP="NOI ADM DEV PSAi COM NAV OUR OTRo STP IND DEM"'
    attr_accessor :header

    def initialize
      set_default_header!
    end

    def set_default_header!
      @header = DEFAULT_HEADER
    end
  end
end
