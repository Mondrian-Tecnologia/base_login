if Rails.env.development?
  dev_server = %w[http://localhost:3000 http://127.0.0.1:3000]
  Rails.application.config.action_cable.allowed_request_origins = dev_server
end