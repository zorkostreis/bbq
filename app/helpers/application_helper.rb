module ApplicationHelper
  # bootstrap icon

  def bi_icon(icon_class)
    content_tag 'span', '', class: "bi bi-#{icon_class}"
  end

  # user_avatar

  def user_avatar(user)
    if user.avatar.attached?
      user.avatar.variant(resize_to_fit: [400, 400])
    else
      asset_path('avatar.png')
    end
  end

  def user_avatar_thumb(user)
    if user.avatar.attached?
      user.avatar.variant(resize_to_fit: [50, 50])
    else
      asset_path('avatar.png')
    end
  end

  # event_photo

  def event_photo(event)
    photos = event.photos.persisted

    if photos.any?
      photos.sample.photo.url
    else
      asset_path('event.jpg')
    end
  end

  def event_thumb(event)
    photos = event.photos.persisted

    if photos.any?
      photos.sample.photo.thumb.url
    else
      asset_path('event_thumb.jpg')
    end
  end
end
