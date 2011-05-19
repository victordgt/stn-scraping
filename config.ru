# config.ru
#path = File.expand_path "../", __FILE__

require 'rubygems'
require 'sinatra'
require 'application'

run Sinatra::Application

# Gemfile
source 'http://rubygems.org'
gem 'sinatra'