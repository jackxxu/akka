require 'test_helper'

class TestMikka < Minitest::Test

  def setup
    @system = Mikka.create_actor_system('testsystem')
  end

  def teardown
    @system.shutdown
  end

  def test_system_created
    refute_nil @system
  end

end


