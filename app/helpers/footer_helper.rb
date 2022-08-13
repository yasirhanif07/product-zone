module FooterHelper

  def social_url(url)
    url.present? ? url : 'javascript:void(0);'
  end

  def target_blank(url)
    url.present? ? '_blank' : ''
  end
end