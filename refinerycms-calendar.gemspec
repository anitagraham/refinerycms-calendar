# Encoding: UTF-8

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-calendar'
  s.version           = %q{4.0.1}
  s.authors           = ['Philip Arndt', 'Joe Sak', 'Willem van Kerkhof']
  s.description       = 'Ruby on Rails Calendar extension for Refinery CMS'
  s.date              = Time.now
  s.summary           = 'Calendar extension for Refinery CMS'
  s.require_paths     = %w(lib)
  s.files             = Dir["{app,config,db,lib,vendor}/**/*"] + ["readme.md"]

  # Runtime dependencies
  s.add_dependency    'refinerycms-core',    '~> 4.0'
  s.add_dependency    'friendly_id',         '~> 5.1'
  s.add_dependency    'refinerycms-page-images'
  s.add_dependency    'jquery-ui-rails'
  s.add_dependency    'time_splitter'
end
