# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :confirmable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable

  include DeviseTokenAuth::Concerns::User
  before_validation :set_uid

  PASSWORD_REQUIREMENTS = /\A
    (?=.{8,})
    (?=.*\d)
    (?=.*[a-z])
    (?=.*[A-Z])
    (?=.*[[:^alnum:]])
  /x

  has_many :user_profiles, class_name: 'UserProfile', dependent: :destroy
  has_many :profiles, through: :user_profiles, class_name: 'Profile'
  has_many :articles, through: :articles, class_name: 'Article'

  validates :email, presence: true
  validates :password,
            format: { with: PASSWORD_REQUIREMENTS,
                      message: I18n.t(:message_strong_password) }

  private

  def set_uid
    self[:uid] = self[:email] if self[:uid].blank? && self[:email].present?
  end
end
