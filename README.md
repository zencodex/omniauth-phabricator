# Omniauth::Phabricator

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-phabricator', :github => 'zencodex/omniauth-phabricator'
```

And then execute:

    $ bundle

vi /srv/gitlab/config/gitlab.rb

```ruby
gitlab_rails['omniauth_allow_single_sign_on'] = ['phabricator']
gitlab_rails['omniauth_providers'] = [
  {
    "name" => "phabricator",
    'app_id' => 'PHID-OASC-ro6q5je6pbekr3ivo2ii',
    'app_secret' => 'ujacvgq7rpsbqztifkuobwobkgrnlmmg',
    "args" => {
      client_options: {
        'site' => 'https://team.bookcapt.com', # including port if necessary
        'authorize_url' => '/oauthserver/auth/',
        'token_url' => '/oauthserver/token/'
      }
    }

  ...
]
```

## Usage

### Rack
```ruby
require "omniauth/phabricator"

class MyRackApp
  use OmniAuth::Builder do
    provider :phabricator, "<My-Phabricator-Client-Id>", "<My-Phabricator-Client-Secret>",
      :client_options => {:site => 'https://phabricator.example.com', :authorize_url => 'https://phabricator.example.com/oauthserver/auth/'}
  end
end
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/omniauth-phabricator/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
