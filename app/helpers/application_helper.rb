module ApplicationHelper
  def user_avatar(user)
    if user.avatar?
      user.avatar.url
    else
      asset_path('avatar.png')
    end
  end

  def bi_icon(icon_class)
    content_tag 'span', '', class: "bi bi-#{icon_class}"
  end
end
