require 'test_helper'
java_import 'akka.actor.UntypedActor'

# module Mikka
#   class TestActor < Mikka::Actor
#     def receive(msg)
#       sender << msg
#     end
#   end
# end

class GreetingActor < UntypedActor
  def onReceive(message)
    puts "Hello " + message.who;
  end
end

class TestActor1 < Minitest::Test

  def test_actor_creation_from_a_class
    actor_props = Mikka::Props[GreetingActor]
    actor = @system.actor_of(actor_props, 'some_actor')
    actor.should be_a(ActorRef)
  end

end
