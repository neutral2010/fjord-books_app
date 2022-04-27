# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %I[show followings followers]

  def index
    @users = User.with_attached_avatar.order(:id).page(params[:page])
  end

  def show; end

  # 自分がフォローしている方
  def followers
    # @user = User.find(params[:id])
    @followers = @user.following
  end

  # 自分がフォローされている方
  def followings
    # @user = User.find(params[:id])
    @followings = @user.followers
  end
  #
  # # 自分がフォローしている方
  # def followers
  #   @followers = @user.followers
  # end
  #
  # # 自分がフォローされている方
  # def followings
  #   @followings = @user.followings
  # end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
