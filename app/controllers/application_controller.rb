# rubocop:disable all

class ApplicationController < ActionController::API
  def encode_token(payload)
    JWT.encode(payload, "my secret")
  end

  def auth_header
    request.headers["Authorization"]
  end

  def decoded_token
    if auth_header
      token = auth_header.split[1]
      begin
        JWT.decode(token, "my secret", true, algorithm: "HS256")
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def logged_in_user
    decoded_hash = decoded_token
    if decoded_token
      user_id = decoded_token[0]["user_id"]
      @user = User.find_by(id: user_id)
    end
  end

  def logged_in?
    !!logged_in_user
  end

  def authorize_user
    render json: { message: "Please login first!" }, status: :unauthorized unless logged_in?
  end
end
