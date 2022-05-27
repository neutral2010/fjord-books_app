# frozen_string_literal: true

class FollowRelationsController < ApplicationController
  def create
    @followed_user = User.find(params[:followed_id])
    active_follow_relation = current_user.active_follow_relations.build(followed_id: @followed_user.id)
    if active_follow_relation.valid?
      current_user.follow(@followed_user)
      redirect_to user_path(@followed_user), notice: t('controllers.follow_relations.notice.You could follow')
    else
      redirect_to user_path(@followed_user), alert: t('controllers.follow_relations.alert.You already followed')
    end
  end

  def destroy
    FollowRelation.find_by(params[:id]).destroy
    redirect_to user_path
  end
end
