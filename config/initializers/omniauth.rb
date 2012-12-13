Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider "37signals", ENV["client_id"], ENV["client_secret"]
end
