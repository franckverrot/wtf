module Wtf
  module Dsl
    module Tracker
    attr_accessor :_tracker
      def tracker preferred_tracker, args = {}
        _tracker = Tracker::const_get(preferred_tracker.to_s.classify).new(*args)
      end
    end
  end
end
