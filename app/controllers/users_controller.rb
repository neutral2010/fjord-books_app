# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    # @users = User.all
    @users = User.page(params[:page]).per(2).order(:id)
    # @users = User.order(:id).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end
end
