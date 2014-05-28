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

    if res[:status] == 201
      set_cookie = res[:response_headers]["Set-Cookie"]
    end

    set_cookie
  end

  def get_files(cookie)
    connection.get do |req|
      req.url  '/api/open-v1.0/files.json'
      req.headers['Content-Type'] = 'application/json'
      req.headers['Cookie'] = cookie
    end
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
