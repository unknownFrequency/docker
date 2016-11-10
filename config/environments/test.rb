Rails.application.configure do
  config.cache_classes = true

  config.eager_load = false

  # Configure public file server for tests with Cache-Control for performance.
  config.public_file_server.enabled = true
  config.public_file_server.headers = {
    'Cache-Control' => 'public, max-age=3600'
  }

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  config.action_dispatch.show_exceptions = false

  config.action_controller.allow_forgery_protection = false
  config.action_mailer.perform_caching = false

  config.action_mailer.delivery_method = :test

  # Print deprecation notices to the stderr.
  config.active_support.deprecation = :stderr

  ActiveRecord::Tasks::DatabaseTasks::LOCAL_HOSTS << "192.168.99.100"
end
