# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
require 'rspec/rails'
require 'support/factory_girl'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end