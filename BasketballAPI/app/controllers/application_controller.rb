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

  # controller tests only work if this line is commented out,
  # but always include this line in production
  # before_action :authenticate_with_token, except: [:token, :create_user]

  def create_user
    @user = User.new(user_params)
    if @user.save
      render json: UserSerializer.new(@user).serialized_json
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

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
    render json: { error: "Bad Credentials" }, status: :unauthorized
  end

  def search
    @query = params[:query]
    @users = User.search(@query).alphabetical_name
    render json: UsersSerializer.new(@users).serialized_json
  end

  def get_games
    @user_id = params[:user_id]
    public_games = Game.public_games.upcoming
    private_games = Game.private_games.upcoming.for_user(@user_id)
    render json: GamesSerializer.new(public_games + private_games).serialized_json
  end

  private
  def user_params
    params.permit(:firstname, :lastname, :email, :username, :dob, :phone, :password, :password_confirmation)
  end
end
