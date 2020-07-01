class AuthsController < ApplicationController
  skip_before_action :logged_in, only: [:new, :create]
  layout "users", only: [:new, :create]
  def new
    @auth = Auth.new
  end

  def create
    @auth = Auth.new(auth_params)
    if @auth.valid?
      user = User.find_by(email: params[:auth][:email])
      if user && user.password == params[:auth][:password]
        # ログイン情報と一致する時ユーザー id をセッションへ保存 
        session[:user_id] = user.id
        redirect_to root_path
      else
        redirect_to new_auths_path # 該当ユーザーなしの時ログインへ
      end 
    else
      # バリデーションエラーの時入力画面再表示
        render :new
    end
  end

  def destroy
    reset_sessions
    redirect_to new_auths_path
  end

  private
    def auth_params
      params.require(:auth).premit(:email, :password)
    end
end
