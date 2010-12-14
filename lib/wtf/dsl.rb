module Wtf
  module Dsl
    attr_accessor :_scm, :_tracker

    def scm preferred_scm, args = {}
      _scm = Scm::const_get(preferred_scm.to_s.classify).new(*args)
    end

    def tracker preferred_tracker, args = {}
      _tracker = Tracker::const_get(preferred_tracker.to_s.classify).new(*args)
    end
  end
end
