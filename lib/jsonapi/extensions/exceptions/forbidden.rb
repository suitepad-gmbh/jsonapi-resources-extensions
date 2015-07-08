module JSONAPI
  module Extensions
    module Exceptions
      class Forbidden < ::JSONAPI::Exceptions::Error
        def errors
          [
            JSONAPI::Extensions::Error::Base.new(
              code:   'errors.forbidden',
              status: 403,
              title:  'Forbidden',
              detail: 'You are not authorized to perform this action'
            )
          ]
        end
      end
    end
  end
end
