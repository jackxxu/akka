require_relative 'akka'
require_relative 'props'
require_relative 'actor'
require_relative 'rubyesque_actor_callbacks'

module Mikka

  def self.create_actor_system(*args)
    Akka::Actor::ActorSystem.create(*args)
  end

  def self.await_result(future, options={})
    Akka::Dispatch::Await.result(future, Duration[options[:timeout]])
  end

  def self.current_actor=(actor)
    Thread.current[:mikka_current_actor] = actor
  end

  def self.current_actor
    Thread.current[:mikka_current_actor]
  end

  def self.capture_current_actor(ref)
    self.current_actor = ref
    yield
  ensure
    self.current_actor = nil
  end

end
