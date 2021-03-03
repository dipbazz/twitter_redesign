module ApplicationHelper
  def yield_based_on_user_authentication
    if user_signed_in?
      render partial: 'layouts/only_for_logged_in'
    else
      render partial: 'layouts/not_logged_in'
    end
  end

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
      link_to('Edit Profile', edit_user_registration_path, **options)
    elsif current_user.follows?(user)
      options[:class] = options[:class].sub '-outline-', '-' if options[:class]
      link_to('Unfollow', unfollow_user_path(user), method: :post, **options)
    else
      link_to('Follow', follow_user_path(user), method: :post, **options)
    end
  end

  def opinion_like_or_dislike_link(opinion)
    like = Like.find_by(opinion: opinion, user: current_user)

    if like
      link_to(
        opinion_likes_path(id: like.id, opinion_id: opinion),
        method: :delete,
        class: 'card-link like-btn text-danger'
      ) do
        content_tag(:i, '', class: 'fas fa-heart icon') +
          content_tag(:span, opinion.likes.count, class: 'ml-2')
      end
    else
      link_to(opinion_likes_path(opinion), method: :post, class: 'card-link like-btn') do
        content_tag(:i, '', class: 'far fa-heart icon') +
          content_tag(:span, opinion.likes.count, class: 'ml-2')
      end
    end
  end
end
