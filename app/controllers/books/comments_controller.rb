# frozen_string_literal: true

class Books::CommentsController < CommentsController
  before_action :set_commentable
  before_action :set_render

  def set_report_or_book
    @commentable = Book.find(params[:book_id])
  end

  private

  def set_commentable
    @commentable = Book.find(params[:book_id])
  end

  def set_render
    @commentable_type = 'books/show'
  end
end
