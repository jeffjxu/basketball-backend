class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def render_unprocessable_entity_response(exception)
    render json: exception.record.errors, status: :unprocessable_entity
  end

  def render_not_found_response(exception)
    render json: { error: exception.message }, status: :not_found
  end

  include ActionController::HttpAuthentication::Basic::ControllerMethods
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :authenticate_with_token, except: [:token]

  # A method to handle initial authentication
  def token
    authenticate_username_password || render_unauthorized
  end

  def authenticate_username_password
    authenticate_or_request_with_http_basic do |username, password|
      user = User.authenticate(username, password)
      if user
        render json: user, serializer: TokenUserSerializer
      end
    end
  end

  def authenticate_with_token
    authenticate_user_from_token || render_unauthorized
  end

  def authenticate_user_from_token
    authenticate_with_http_token do |token, options|
      @current_user = User.find_by(api_key: token)
    end
  end

  def render_unauthorized(realm = "Application")
    self.headers["WWW-Authenticate"] = %(Token realm="#{realm.gsub(/"/, "")}")
    render json: {error: "Bad Credentials"}, status: :unauthorized
  end
end
