module HomeHelper

  def social_page
    SocialPage.last
  end

  def social_page_url(page)
    page.present? ? admin_social_page_path(page) : new_admin_social_page_path
  end
end