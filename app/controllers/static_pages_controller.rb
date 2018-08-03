class StaticPagesController < ApplicationController
  def home
  end

  def secret_page
    if not logged_in?
      puts "Nop!"
      puts logged_in?
      redirect_to "/sessions/new"
      flash[:danger] = "Un secret ça se mérite !"
    end
  end
end
