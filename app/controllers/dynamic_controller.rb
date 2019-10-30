class DynamicController < ApplicationController
  
  def welcome
  end
  
  def user
    @user = User.find(params[:id])
  end

end