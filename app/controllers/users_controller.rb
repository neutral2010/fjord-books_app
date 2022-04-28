# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %I[show followings followers]

  def index
    @users = User.with_attached_avatar.order(:id).page(params[:page])
  end

  def show; end

  def followers
    @followers = @user.following
  end

  def followings
    @followings = @user.followers
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
