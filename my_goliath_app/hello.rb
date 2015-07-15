require 'goliath'

class Hello < Goliath::API
  def response(env)
    sleep 0.1
    [200, {}, "Hello World"]
  end
end
