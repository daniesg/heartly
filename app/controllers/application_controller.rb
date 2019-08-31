class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def policy_scope(scope)
    "#{self.class.name[0..-11]}Policy::Scope".constantize.new(
      current_user, scope
    ).resolve
  end

  def policy(resource)
    @policy ||= begin
      klass = self.class
      loop do
        return nil if klass.nil?

        begin
          policy_klass = klass.name.gsub(/Controller$/, "Policy").constantize
          return policy_klass.new current_user, resource
        rescue
          klass = klass.superclass
        end
      end
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end

  def record_not_found
    respond_to do |format|
      format.html { render "/422", status: 422 }
      format.json { head 422 }
    end
  end
end
