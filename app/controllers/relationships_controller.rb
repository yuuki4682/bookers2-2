class RelationshipsController < ApplicationController
  
  def create
    current_user.relationships.create(followed_id: params[:user_id])
    redirect_to request.referer
  end
  
  def destroy
    current_user.relationships.find_by(followed_id: params[:user_id]).destroy
    redirect_to request.referer
  end
  
  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end
  
  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end
  
end
