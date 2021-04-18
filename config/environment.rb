# frozen_string_literal: true

require File.expand_path('application', __dir__)
require File.expand_path('rollbar', __dir__)

notify = lambda do |e|
  Rollbar.with_config(use_async: false) do
    Rollbar.error(e)
  end
rescue StandardError => e
  Rails.logger.error('Synchronous Rollbar notification failed. Sending async to preserve info')
  Rollbar.error(e)
end

begin
  Rails.application.initialize!
rescue StandardError => e
  notify.call(e)
  raise
end
