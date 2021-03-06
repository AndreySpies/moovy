class Video < ApplicationRecord
  belongs_to :user
  mount_uploader :miniature, PhotoUploader
  after_create :set_url

  validates :name, format: {
    with: /\A[\w|\-|\s|\u00C0-\u00FF]+\z/,
    message: "only allows letters, numbers, underscores, dashes and spaces"
  }
  validates :miniature, presence: true, on: :create

  private

  def set_url
    update(url: "#{id}-#{name.parameterize}.m3u8")
  end
end
