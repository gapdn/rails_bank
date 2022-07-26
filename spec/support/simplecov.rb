# frozen_string_literal: true

require 'simplecov'

SimpleCov.start 'rails' do
  minimum_coverage 90

  track_files 'app/**/*.rb'

  add_filter 'app/channels'
  add_filter 'app/jobs'
  add_filter 'app/views'
end
