require 'bundler/setup'
Bundler.require
require "jbundler"
require 'java'

java_import "akka.actor.ActorSystem"
java_import "akka.actor.UntypedActor"
java_import "akka.actor.UntypedActorFactory"
java_import "akka.actor.Props"

class Someone < UntypedActor
  def onReceive(message)
    puts "onReceive: #{message}"
    getContext.system.shutdown

    sleep 1
    puts "Close"
  end
end

class SomeoneFactory
  java_implements UntypedActorFactory
  def create
    Someone.new
  end
end

system = ActorSystem.apply("test-system")
someone = system.actorOf(Props.new(SomeoneFactory.new))
binding.pry
someone.tell "hello"

system.awaitTermination
