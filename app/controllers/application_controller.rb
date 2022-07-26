class ApplicationController < ActionController::Base
  include Renderable

  before_action :authenticate_user!
end
