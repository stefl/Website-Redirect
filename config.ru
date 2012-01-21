#!/usr/bin/env rackup
# encoding: utf-8

require 'rubygems'
require 'bundler'

Bundler.require

configure do
  @@config = YAML::load(File.open(File.join(File.dirname(__FILE__), "config.yaml")).read)
end
get %r{/*/} do
  puts @@config.inspect
  redirect "http://#{@@config[:to]}#{request.path}"
end
run Sinatra::Application