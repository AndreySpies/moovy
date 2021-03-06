class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :photo, PhotoUploader

  has_many :videos, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, format: {
    with: /\A[\w|\s]+\z/,
    message: 'only allow letters and spaces'
  }
  validates :last_name, format: {
    with: /\A[\w|\s]+\z/,
    message: 'only allow letters and spaces'
  }
  validates :display_name,
            uniqueness: true,
            format: {
              with: /\A[\w|\-|\s|\u00C0-\u00FF]+\z/,
              message: "only allows letters, numbers, underscores, dashes and spaces"
            }
end
