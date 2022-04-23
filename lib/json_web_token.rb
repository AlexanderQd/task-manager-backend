class JsonWebToken
  class << self
    KEY = File.read("#{Rails.root}/config/master.key")

    def encode payload, exp = 24.hours.from_now
      payload[:exp] = exp.to_i
      JWT.encode payload, KEY
    end

    def decode token
      body = JWT.decode(token, KEY).first
      HashWithIndifferentAccess.new body
    rescue
      nil
    end
  end
end