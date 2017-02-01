class JsonWebToken
  def self.decode(token)
    return HashWithIndifferentAccess.new(JWT.decode(token, Rails.application.secrets.secret_key_base)[0])
  rescue
    nil
  end

  def self.encode(payload, exp = 1.month.from_now)
    payload[:exp] = exp
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end
end
