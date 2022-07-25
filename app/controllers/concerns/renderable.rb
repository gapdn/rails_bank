# frozen_string_literal: true

module Renderable
  extend ActiveSupport::Concern

  included do
    private

    def app_render(object, redirect_url:, return_action:)
      case object
      when Dry::Validation::Result
        render_error(object, return_action)
      else
        render_success(object, redirect_url)
      end
    end

    def render_success(object, redirect_url)
      respond_to do |format|
        format.html do
          redirect_to redirect_url, notice: I18n('response.success.created', object: object.class.capitalize)
        end

        format.json { render :show, status: :created, location: object }
      end
    end

    def render_error(object, return_action)
      respond_to do |format|
        format.html do
          render return_action, status: :unprocessable_entity, alert: I18n('response.fail.invalid', errors: object.resource.errors.to_h)
        end

        format.json { render json: object.resource.errors.to_h, status: :unprocessable_entity }
      end
    end
  end
end
