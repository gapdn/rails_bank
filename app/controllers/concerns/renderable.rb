# frozen_string_literal: true

module Renderable
  extend ActiveSupport::Concern

  included do
    private

    def app_render(object, redirect_url:, return_action:)
      case object
      when Dry::Validation::Result then render_error(object, return_action)
      else
        render_success(object, redirect_url)
      end
    end

    def render_success(object, redirect_url)
      respond_to do |format|
        format.html do
          redirect_to redirect_url, notice: I18n.t('response.success.created', entity: object.class.name.capitalize)
        end
        format.json { render :show, status: :created, location: object }
      end
    end

    def render_error(object, return_action)
      respond_to do |format|
        format.html do
          flash.alert = I18n.t('response.fail.invalid', errors: object.errors.messages.map(&:text))
          render(action: return_action, status: :unprocessable_entity)
        end
        format.json { render json: object.errors.messages.map(&:text), status: :unprocessable_entity }
      end
    end
  end
end
