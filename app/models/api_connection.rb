class ApiConnection
  require 'faraday_middleware'

  def get_authentication_cookie(user)
    res = connection.post do |req|
      req.url  '/api/open-v1.0/user_sessions.json'
      req.headers['Content-Type'] = 'application/json'
      req.body = '{"user_session": {"email" : "' + user.email +
        '", "password" : "' + user.password +
        '" }, "device" : {"app_uid" : "' + user.api_uuid + '"}'
    end.to_hash

    if res[:response_headers]
      set_cookie = res[:response_headers]["Set-Cookie"]
    end

    set_cookie
  end

  private

  def connection
    @connection ||= Faraday.new(:url => 'https://my.workshare.com/') do |faraday|
      faraday.request  :json
      faraday.response :json, :content_type => /\bjson$/
      faraday.adapter  Faraday.default_adapter
    end
  end
end
