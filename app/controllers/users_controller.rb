class UsersController < Clearance::UsersController

  def new
    @user = User.new
  end

  def create
    @user = user_from_params

    if @user.save
      sign_in @user
      redirect_back_or url_after_create
    else
      flash[:danger] = @user.errors.full_messages.join(', ')
      redirect_to '/sign_up'
    end
  end

  def user_from_params
    User.new(user_params)
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def show
  end

  def edit
  end

  private
  def get_user
    @user = User.find(params[:id])
  end
end
