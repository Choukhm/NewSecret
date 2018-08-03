class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new(email: "example@example.com", password: "cococo", password_confirmation: "cococo")
  end

  def create
    @user = User.new(user_params)
     if @user.save
      flash[:success] = "Ton compte a bien ete cree !"
      redirect_to "/users/#{@user.id}"
      log_in @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])

    if current_user.id != @user.id 
      flash[:danger] = "Tu n'as pas le droit de faire ça !"
      redirect_to "/users/#{@user.id}"
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to "/users/#{current_user.id}"
  end

  def show

    @user = User.find(params[:id])

    if current_user.id != @user.id 
      redirect_to "/users/#{current_user.id}"
    end
  end

  def destroy
  end

  private

    def user_params
      params.require(:user).permit(:email, :password,
                                   :password_confirmation)
    end
end
