require 'bundler/setup'
require 'minitest/autorun'
Bundler.require(:default, :test)

require 'lib/mikka'

module MiniTest
  class Test

    def setup
      @system = Mikka.create_actor_system('testsystem')
    end

    def teardown
      @system.shutdown
    end

  end
end
