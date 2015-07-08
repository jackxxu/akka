module Mikka

  module RubyesqueActorCallbacks
    def receive(message); end
    def pre_start; end
    def post_stop; end
    def pre_restart(reason, message); end
    def post_restart(reason); end

    def onReceive(message); receive(message); end
    def supervisorStrategy; supervisor_strategy; end
    def preStart; super; pre_start; end
    def postStop; super; post_stop; end
    def preRestart(reason, message_option)
      super
      pre_restart(reason, message_option.is_defined ? message_option.get : nil)
    end
    def postRestart(reason); super; post_restart(reason); end
  end

end
