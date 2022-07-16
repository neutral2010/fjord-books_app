# frozen_string_literal: true

class Books::CommentsController < CommentsController
  before_action :set_commentable, only: %i[create show]

  def create; end

  def show; end

  private

  def set_commentable
    @commentable = Book.find(params[:book_id])
  end
end
