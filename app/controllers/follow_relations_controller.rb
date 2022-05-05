# frozen_string_literal: true

class FollowRelationsController < ApplicationController
  def create
    @followed_user = User.find(params[:followed_id])
    current_user.follow(@followed_user)
    redirect_to user_path(@followed_user)
  end

  def destroy
    @followed_user = User.find(params[:followed_id])
    current_user.unfollow(@followed_user)
    redirect_to user_path(@followed_user)
  end
end
