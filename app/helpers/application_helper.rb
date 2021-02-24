module ApplicationHelper
  def alert_class
    return 'alert-success' if flash[:notice]

    return 'alert-danger' if flash[:alert]

    'd-none'
  end

  def alert_message
    if flash[:notice]
      content_tag :span, flash[:notice]
    elsif flash[:alert]
      content_tag :span, flash[:alert]
    end
  end

  def follow_user_link(user, options = {})
    if current_user.id == user.id
      link_to('Edit Profile', '#', **options)
    elsif current_user.follows?(user)
      options[:class] = options[:class].sub "-outline-", "-" if options[:class]
      link_to('Unfollow', unfollow_user_path(user), method: :post, **options)
    else
      link_to('Follow', follow_user_path(user), method: :post, **options)
    end
  end
end
