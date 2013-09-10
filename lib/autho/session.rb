require "attr_extras"

module Autho
  class Session
    pattr_initialize :controller, :session_key, :finder

    # NOTE: Not memoized yet.
    def user
      if id
        finder.find(id)
      else
        nil
      end
    end

    def user=(user)
      controller.session[session_key] = user.id
    end

    def clear
      controller.session[session_key] = nil
    end

    private

    def id
      controller.session[session_key]
    end
  end
end
