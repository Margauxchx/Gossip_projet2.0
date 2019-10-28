class DynamicController < ApplicationController
  
  def welcome
  end
  
  def gossip
    @gossip = Gossip.find(params[:id])
  end
  
  def user
    @user = User.find(params[:first_name])
  end

end