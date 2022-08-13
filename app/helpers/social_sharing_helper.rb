module SocialSharingHelper

  def facebook_sharing_url(product)
    product_url       = base_url+product_path(product)
    facebook_base_url = "https://www.facebook.com/sharer.php"
    "#{facebook_base_url}?u=#{product_url}"
  end

  def twitter_sharing_url(product)
    text             = "product zone"
    product_url      = base_url+product_path(product)
    twiiter_base_url =  "https://twitter.com"
    "#{twiiter_base_url}/share?text=#{text}&url=#{product_url}"
  end

  def share_with_email(product)
    subject     = product.name
    product_url = base_url+product_path(product)
    body        = "sharing product #{product_url}"
    "mailto: ?&subject=#{subject}&body=#{body}"
  end

  def base_url
    Rails.env.production? ? "http://www.productzone.com" : "https://localhost:3000"
  end

end