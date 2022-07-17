# frozen_string_literal: true

class Reports::CommentsController < CommentsController
  before_action :set_commentable, only: %i[create show]
  before_action :set_render, only: %i[create]
  # before_action :set_contents_in_show

  private

  def set_commentable
    @commentable = Report.find(params[:report_id])
  end

  def set_contents_in_show
    # @contents_in_show = Report.find(params[:report_id])
  end

  def set_render
    @template = 'reports/show'
  end
end
