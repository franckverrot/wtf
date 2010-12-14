module Wtf
  module Dsl
    module Scm
    attr_accessor :_scm
      def scm preferred_scm, args = {}
        _scm = Scm::const_get(preferred_scm.to_s.classify).new(*args)
      end
    end
  end
end
