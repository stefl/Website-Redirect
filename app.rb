require 'sinatra'

configure do
  @config = YAML::load(File.join(File.dirname(__FILE__), "config.yaml"))
end

get %r{/*/} do
  redirect "http://#{@config[:to]}#{request.path}"
end