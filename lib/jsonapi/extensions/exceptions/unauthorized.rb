module JSONAPI
  module Extensions
    module Exceptions
      class Unauthorized < ::JSONAPI::Exceptions::Error
        def errors
          [
            JSONAPI::Extensions::Error::Base.new(
              code:   'errors.unauthorized',
              status: 401,
              title:  'Unauthorized',
              detail: 'You need to sign in'
            )
          ]
        end
      end
    end
  end
end
