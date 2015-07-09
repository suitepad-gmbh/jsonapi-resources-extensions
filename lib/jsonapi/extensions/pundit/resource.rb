module JSONAPI
  module Extensions
    module Pundit
      module Resource
        extend ActiveSupport::Concern

        included do
          [:save, :remove].each do |action|
            set_callback action, :before, :authorize
          end
        end

        delegate :authorize_policy, to: :class

        def authorize
          authorize_policy(model, context[:controller])
        end

        def records_for(association_name, options={})
          records = model.public_send(association_name)
          return records if context.nil?
          authorize_policy(records, context[:controller]) if records
          records
        end

        def policy(object)
          self.class.policy(context, object)
        end

        class_methods do
          def records(options = {})
            authorized_records(
              options[:records_base] || _model_class,
              options[:context][:controller]
            )
          end

          def policy(context, object)
            context[:controller].policy(object)
          end

          def authorized_records(records, controller)
            records = controller.policy_scope records
            authorize_policy(records, controller)
            records
          end

          def authorize_policy(records, controller)
            if records.is_a?(ActiveRecord::Relation) && records.count == 0
              controller.skip_authorization
              return
            end
            controller.authorize policy_record_for(records)
          rescue ::Pundit::NotAuthorizedError
            raise JSONAPI::Extensions::Exceptions::Forbidden.new
          end

          private

          def policy_record_for(records)
            case records
            when ActiveRecord::Base then records
            when ActiveRecord::Relation then records.first || records.model
            else
              records
            end
          end
        end
      end
    end
  end
end
