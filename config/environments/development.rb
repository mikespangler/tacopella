Tacopella::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
  address:              'smtp.gmail.com',
  port:                 587,
  domain:               'localhost',
  user_name:            'tacopella.app',
  password:             'tacopella55!!',
  authentication:       'plain',
  enable_starttls_auto: true  }

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  #   create the OAuth consumer credentials
  # consumer = oauth.Consumer(ENV['RDIO_KEY'], ENV['RDIO_SECRET'])

  # # make the initial request for the request token
  # client = oauth.Client(consumer)
  # response, content = client.request('http://api.rdio.com/oauth/request_token', 'POST', urllib.urlencode({oauth_callback: :oob}))
  # parsed_content = dict(cgi.parse_qsl(content))
  # request_token = oauth.Token(parsed_content['oauth_token'], parsed_content['oauth_token_secret'])

  # # ask the user to authorize this application
  # # print 'Authorize this application at: %s?oauth_token=%s' % (parsed_content['login_url'], parsed_content['oauth_token'])
  # # puts 'Enter the PIN / OAuth verifier: '
  # # oauth_verifier = gets.strip
  # # # associate the verifier with the request token
  # # request_token.set_verifier(oauth_verifier)

  # # upgrade the request token to an access token
  # client = oauth.Client(consumer, request_token)
  # response, content = client.request('http://api.rdio.com/oauth/access_token', 'POST')
  # parsed_content = dict(cgi.parse_qsl(content))
  # access_token = oauth.Token(parsed_content['oauth_token'], parsed_content['oauth_token_secret'])

  # # make an authenticated API call
  # client = oauth.Client(consumer, access_token)
  # response = client.request('http://api.rdio.com/1/', 'POST', urllib.urlencode({method: 'currentUser'}))
end
