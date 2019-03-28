class Video < ApplicationRecord
  belongs_to :user
  # extend FriendlyId
  after_create :set_url

  validates :name, format: {
    with: /\A[\w|\-|\s]+\z/,
    message: "only allows letters, numbers, underscores and spaces"
  }

  private

  def set_url
    update(url: "#{id}-#{name}\.m3u8")
  end
end
