module AuthenticationHelpers
  module FeatureHelper
    include AuthenticationHelpers

    def login(user)
      visit(login_route_for(user))
    end
  end

  module RequestHelper
    include AuthenticationHelpers

    def login(user)
      get(login_route_for(user))
    end
  end

  def login_route_for(user)
    "#{Middleware::Test::Login::LOGIN_PATH_PREFIX}#{user.id}"
  end
end
