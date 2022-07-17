# frozen_string_literal: true

class Books::CommentsController < CommentsController
  before_action :set_commentable, only: %i[create show]
  before_action :set_render, only: %i[create]

  # def create; end
  #
  # def show; end

  private

  def set_commentable
    @commentable = Book.find(params[:book_id])
  end

  def set_render
    @template = 'books/show'
  end
end
