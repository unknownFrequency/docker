Rails.application.configure do
  config.web_console.whitelisted_ips = '172.18.0.1'

  ## React 
  #config.react.variant = :development
  #config.react.server_renderer_pool_size  ||= 1
  #config.react.server_renderer_timeout    ||= 20
  #config.react.server_renderer = React::ServerRendering::SprocketsRenderer
  #config.react.server_renderer_options = {
    #files: ["components.js"], # files to load for prerendering
    #replay_console: true,
  #}

  ## Email 
  config.action_mailer.delivery_method = :smtp #or :test
  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.perform_caching = false
  config.action_mailer.default_url_options = { host: 'localhost', port: 8080  }
  config.action_mailer.perform_deliveries = true
  config.action_mailer.smtp_settings = {
    address: "smtp.gmail.com",
    port: 587,
    domain: "flyover.dk",
    authentication: "plain",
    user_name: ENV['GMAIL_USERNAME'],
    password: ENV['GMAIL_PASSWORD'],
    enable_starttls_auto: true
  }

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

  config.active_support.deprecation = :log
  config.active_record.migration_error = :page_load
  config.assets.debug = true
  config.assets.quiet = true
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker
end
