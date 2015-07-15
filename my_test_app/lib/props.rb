module Mikka

  Props = Akka::Actor::Props

  class Props

   def self.[](*args, &block)
      options = args.last.is_a?(Hash) && args.pop
      creator = ((args.first.is_a?(Proc) || args.first.is_a?(Class)) && args.first) || (options && options[:creator]) || block
      raise ArgumentError, %(No creator specified) unless creator
      create(creator)
    end

    class << self
      # alias_method :create, :[]
    end
  end

end
