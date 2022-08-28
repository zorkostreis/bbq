class Subscription < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true

  validates :user_name, presence: true, unless: -> { user.present? }
  validates :user_email, presence: true, format: { with:  URI::MailTo::EMAIL_REGEXP }, unless: -> { user.present? }

  validates :user, uniqueness: { scope: :event_id }, if: -> { user.present? }
  validates :user_email, uniqueness: { scope: :event_id }, unless: -> { user.present? }
  validate :user_email_not_registered, unless: -> { user.present? }
  validate :user_not_event_organizer

  def user_name
    user.present? ? user.name : super
  end
  
  def user_email
    user.present? ? user.email : super
  end

  private

  def user_email_not_registered
    if User.find_by(email: user_email).present?
      errors.add(:user_email, I18n.t('subscriptions.errors.already_registered'))
    end
  end

  def user_not_event_organizer
    if event.user == user
      errors.add(:user, I18n.t('subscriptions.errors.cannot_sub_to_your_own_event'))
    end 
  end
end
