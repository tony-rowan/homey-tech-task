module Middleware
  module Test
    class Login
      LOGIN_PATH_PREFIX = "/__login__/".freeze

      def initialize(app)
        @app = app
      end

      def call(env)
        request = ActionDispatch::Request.new(env)

        if login_path?(request.path)
          fake_login(request)

          [200, {}, []]
        else
          @app.call(env)
        end
      end

      private

      def login_path?(path)
        path.start_with?(LOGIN_PATH_PREFIX)
      end

      def fake_login(request)
        request.cookie_jar.encrypted[:user_id] = user_id_from_request(request.path)
      end

      def user_id_from_request(path)
        path.split("/").last
      end
    end
  end
end
