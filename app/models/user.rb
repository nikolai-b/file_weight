class User
  include Virtus.value_object

  values do
    attribute :email,    String
    attribute :password, String
    attribute :api_uuid, String
  end
end

