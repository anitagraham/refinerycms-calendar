Refinery::Core.configure do |config|
  # Register extra javascripts for backend
  config.register_javascript "refinerycms-calendar.js"

  # Register extra stylesheets for backend
  config.register_stylesheet "refinerycms-calendar.css"
end

Rails.application.config.assets.precompile += %w( refinerycms-calendar.css refinerycms-calendar.js)
