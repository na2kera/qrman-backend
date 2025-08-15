class Website < ApplicationRecord
  include Rails.application.routes.url_helpers

  belongs_to :user

  has_one_attached :image
  
  def image_url
    image.attached? ? Rails.application.routes.url_helpers.rails_blob_url(image) : nil
  end
end
