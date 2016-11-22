Rails.application.configure do

  config.react.variant = :development

  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local = false

  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => 'public, max-age=172800'
    }
  else
    config.action_controller.perform_caching = false
    config.cache_store = :null_store
  end

  config.action_mailer.delivery_method = :smtp #or :test
  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.perform_caching = false
  config.action_mailer.default_url_options = { host: '192.168.80.3', port: 3000  }
  config.action_mailer.perform_deliveries = true

  config.action_mailer.smtp_settings = {
    address: "smtp.gmail.com",
    port: 587,
    domain: "flyover.dk",
    authentication: "plain",
    user_name: Rails.application.secrets.email_user,
    password: Rails.application.secrets.email_password,
    enable_starttls_auto: true
  }


  config.active_support.deprecation = :log
  config.active_record.migration_error = :page_load
  config.assets.debug = true
  config.assets.quiet = true
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker


end
