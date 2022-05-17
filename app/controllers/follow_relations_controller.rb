# frozen_string_literal: true

class FollowRelationsController < ApplicationController

  def create
    @followed_user = User.find(params[:followed_id])
    if current_user.active_follow_relations.build(followed_id:@followed_user.id).valid?
      current_user.follow(@followed_user)
      redirect_to user_path(@followed_user)
    else
      redirect_to user_path(@followed_user)
    end
  end

  def destroy
    FollowRelation.find_by(params[:id]).destroy
    redirect_to user_path
  end
end
