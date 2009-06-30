RAILS_GEM_VERSION = '2.3.2' unless defined? RAILS_GEM_VERSION
 
require File.join(File.dirname(__FILE__), 'boot')
 
Rails::Initializer.run do |config|
  config.gem 'thoughtbot-factory_girl', :lib => 'factory_girl', :source => 'http://gems.github.com'
  config.gem 'cucumber', :lib => false, :version => '>=0.3.0'
  config.gem 'webrat', :lib => false, :version => '>=0.4.3'
  config.gem 'rspec-rails', :lib => false, :version => '>=1.2.2'
  config.gem 'rspec', :lib => false, :version => '>=1.2.2'
  config.gem 'rubyist-aasm', :lib => 'aasm', :source => 'http://gems.github.com', :version => '>=2.0.2'
  config.gem 'mislav-will_paginate', :lib => 'will_paginate', :source => 'http://gems.github.com', :version => '~> 2.3.8'
  config.gem 'RedCloth', :lib => false, :source => 'http://gems.github.com', :version => '>=4.1.9'
# config.load_paths += %W( #{RAILS_ROOT}/extras )
# config.plugins = [ :exception_notification, :ssl_requirement, :all ]
# config.frameworks -= [ :active_record, :active_resource, :action_mailer ]
# config.active_record.observers = :user_observer
config.time_zone = 'UTC'
end
