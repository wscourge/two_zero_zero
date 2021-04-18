# frozen_string_literal: true

require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = 'vcr/cassettes'
  config.hook_into(:webmock)
  config.ignore_localhost = true
  config.allow_http_connections_when_no_cassette = false
  config.configure_rspec_metadata!
  # config.default_cassette_options = {
  #   allow_playback_repeats: true,
  #   match_requests_on: [:method, :host, :uri],
  #   serialize_with: :json
  # }
  # config.filter_sensitive_data('sensitive') { 'placeholder' }
  # config.debug_logger = File.open('path/to/file', 'w')
  # config.preserve_exact_body_bytes do |http_message|
  #   http_message.body.encoding.name == 'ASCII-8BIT' ||
  #   !http_message.body.valid_encoding?
  # end
end
