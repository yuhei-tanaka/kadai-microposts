class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    post = Micropost.find(params[:micropost_id])
    current_user.like(post)
    flash[:success] = '投稿をいいねしました。'
    redirect_to root_url
  end

  def destroy
    post = Micropost.find(params[:micropost_id])
    current_user.unlike(post)
    flash[:success] = '投稿のいいねを解除しました。'
    redirect_to root_url
  end
end
