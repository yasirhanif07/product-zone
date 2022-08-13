module ApplicationHelper

  def image_url(image)
    Rails.application.routes.url_helpers.rails_blob_url(image, only_path: true) if image.present?
  end

end
