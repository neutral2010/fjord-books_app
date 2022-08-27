# frozen_string_literal: true

class Reports::CommentsController < CommentsController
  before_action :set_commentable
  before_action :set_render

  def set_report_or_book
    @commentable = Report.find(params[:report_id])
  end

  private

  def set_commentable
    @commentable = Report.find(params[:report_id])
  end

  def set_render
    @commentable_type = 'reports/show'
  end
end
