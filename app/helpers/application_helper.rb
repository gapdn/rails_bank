# frozen_string_literal: true

module ApplicationHelper
  FLASH_CLASSES = {
    notice: 'alert alert-success',
    success: 'alert alert-success',
    error: 'alert alert-danger',
    alert: 'alert alert-danger'
  }.freeze

  def active_class(link_path)
    current_page?(link_path) ? 'active' : ''
  end

  def flash_class(level)
    FLASH_CLASSES[level.to_sym]
  end
end
