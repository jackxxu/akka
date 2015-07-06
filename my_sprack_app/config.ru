require 'bundler/setup'
Bundler.require(:default)

app = proc do |env|
  sleep 0.02
  [200, { 'Content-Type' => 'text/html' }, ['<html>Hello simple application!</html>']]
end

run app
