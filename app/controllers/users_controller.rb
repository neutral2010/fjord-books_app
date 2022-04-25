# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %I[show following followers]

  def index
    @users = User.with_attached_avatar.order(:id).page(params[:page])
  end

  def show
    # @user = User.find(params[:id])
  end

  def followers # 自分がフォローしている方
    # @user = User.find(params[:id])
    @followers = @user.following
  end

  def following # 自分がフォローされている方
    # @user = User.find(params[:id])
    @followings = @user.followers
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end
