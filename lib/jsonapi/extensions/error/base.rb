module JSONAPI
  module Extensions
    module Error
      class Base < ::JSONAPI::Error
        attr_accessor :meta

        def initialize(options = {})
          @meta = options[:meta]
          super
        end
      end
    end
  end
end
