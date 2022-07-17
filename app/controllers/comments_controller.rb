# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment, only: %i[show edit update destroy]

  # GET /comments or /comments.json
  def index
    @comments = @commentable.comments
  end

  # GET /comments/1 or /comments/1.json
  def show
    # @comment = @commentable.comments.build
  end

  # GET /comments/new
  def new
    @comment = @commentable.comments.build
  end

  # GET /comments/1/edit
  def edit; end

  # POST /comments or /comments.json
  def create
    @comment = @commentable.comments.build(comment_params)
    if @comment.save
      @commentable = @comment.commentable
      redirect_to @commentable, notice: t('controllers.common.notice_create', name: Comment.model_name.human)
    elsif @comment[:commentable_type] == 'Report'
      @report = Report.find(params[:report_id])
      # redirect_to @commentable, notice: 'コメントが作成されませんでした'
      render 'reports/show'
    else
      @book = Book.find(params[:book_id])
      render 'books/show'
    end
  end

  # PATCH/PUT /comments/1
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        @commentable = @comment.commentable
        format.html { redirect_to @commentable, notice: t('controllers.common.notice_update', name: Comment.model_name.human) }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @commentable = @comment.commentable
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @commentable, notice: t('controllers.common.notice_destroy', name: Comment.model_name.human) }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:comment).permit(:content, :commentable_id).merge(user_id: current_user.id)
  end
end
