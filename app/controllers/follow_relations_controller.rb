# frozen_string_literal: true

class FollowRelationsController < ApplicationController
  def create
    user = User.find(params[:followed_id])
    current_user.follow(user)
    redirect_to user_path(user)
  end

  def destroy
    FollowRelation.find_by(follower_id: current_user.id, followed_id: params[:id])&.destroy
    redirect_to user_path
  end
end
