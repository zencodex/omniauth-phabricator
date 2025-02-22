require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Phabricator < OmniAuth::Strategies::OAuth2
      option :client_options, {
        # :token_url => "/oauthserver/token/"
      }

      def request_phase
        # options[:scope] ||= 'whoami'
        options[:response_type] ||= 'code'
        super
      end

      uid{ raw_info['result']['phid'] }

      info do
        {
          :name => raw_info['result']['userName'],
          :email => raw_info['result']['primaryEmail'],
          :image => raw_info['result']['image']
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get("/api/user.whoami?access_token=#{access_token.token}").parsed
      end

      def callback_url
        full_host + script_name + callback_path
      end
    end
  end
end
