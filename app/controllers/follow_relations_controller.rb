# frozen_string_literal: true

class FollowRelationsController < ApplicationController
  before_action :set_followed_user, only: %I[create destroy]

  def create
    current_user.follow(@followed_user)
    redirect_to user_path(@followed_user)
  end

  def destroy
    current_user.unfollow(@followed_user)
    redirect_to user_path(@followed_user)
  end

  private

  def set_followed_user
    @followed_user = User.find(params[:followed_id])
  end
end
