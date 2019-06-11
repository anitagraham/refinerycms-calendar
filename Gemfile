source "https://rubygems.org"

gemspec
gem 'refinerycms', git: 'https://github.com/anitagraham/refinerycms', branch: 'duplicate'

git "https://github.com/anitagraham/refinerycms", branch: "duplicate" do
  gem "refinerycms"

  group :test do
    gem "refinerycms-testing"
  end
end

gem 'time_splitter', git: "https://github.com/paulodiovani/time_splitter"


# Database Configuration
unless ENV["TRAVIS"]
  gem "activerecord-jdbcsqlite3-adapter", :platform => :jruby
  gem "sqlite3", '~>1.3.6', :platform => :ruby
end

if !ENV["TRAVIS"] || ENV["DB"] == "mysql"
  gem "activerecord-jdbcmysql-adapter", :platform => :jruby
  gem "jdbc-mysql", "= 5.1.13", :platform => :jruby
  gem "mysql2", :platform => :ruby
end

if !ENV["TRAVIS"] || ENV["DB"] == "postgresql"
  gem "activerecord-jdbcpostgresql-adapter", :platform => :jruby
  gem "pg", :platform => :ruby
end

gem "jruby-openssl", :platform => :jruby

group :development, :test do
  gem 'rspec-its'
end

group :development do
  gem 'listen'
end

group :test do
  gem 'launchy'
end

# Load local gems according to Refinery developer preference.
if File.exist? local_gemfile = File.expand_path("../.gemfile", __FILE__)
  eval File.read(local_gemfile)
end

