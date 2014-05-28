module UserDetailsSupport
  require 'pp'
  def env_email
    pp "WARNING: No value in ENV['USER_EMAIL']" unless ENV['USER_EMAIL']
    ENV['USER_EMAIL']
  end

  def env_password
    pp "WARNING: No value in ENV['USER_PASSWORD']" unless ENV['USER_PASSWORD']
    ENV['USER_PASSWORD']
  end

  def env_api_uuid
    pp "WARNING: No value in ENV['API_UUIP']" unless ENV['API_UUIP']
    ENV['API_UUIP']
  end
end

