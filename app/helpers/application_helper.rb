module ApplicationHelper
  def alert_class
    if flash[:notice]
      return "alert-success"
    elsif flash[:alert]
      return "alert-danger"
    end

    "d-none"
  end

  def alert_message
    if flash[:notice]
      return content_tag :span, flash[:notice]
    elsif flash[:alert]
      return content_tag :span, flash[:alert]
    end
  end

  def follow_user_link(user, options = {})
    if current_user.follows?(user)
      link_to('Unfollow', unfollow_user_path(user), method: :post, **options)
    else
      link_to('Follow', follow_user_path(user), method: :post, **options)
    end
  end
end
