class Website < ApplicationRecord
  include Rails.application.routes.url_helpers

  belongs_to :user

  has_one_attached :image, dependent: :purge_later # DBの制約では削除できないのでアプリケーションで面倒を見る

  def image_url
    image.attached? ? Rails.application.routes.url_helpers.rails_blob_url(image) : nil
  end
end
