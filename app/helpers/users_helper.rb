# frozen_string_literal: true

module UsersHelper
  def about_comment_user(comment)
    comment.user.name.presence || comment.user.email
  end

  def commented_time(comment)
    l comment.created_at, format: :long, default: '-'
  end
end
