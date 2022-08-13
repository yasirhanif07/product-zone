module VideoPlayerConcern
  def iframe_video_url(url)
    unless url.blank?
      video_id = get_video_id(url)
      vimeo_video(video_id)
    end
  end

  def get_video_id(url)
    url&.match(/(?:www\.|player\.)?vimeo.com\/(?:channels\/(?:\w+\/)?|groups\/(?:[^\/]*)\/videos\/|album\/(?:\d+)\/video\/|video\/|)(\d+)(?:[a-zA-Z0-9_\-]+)?/i)[1]
  end

  def vimeo_video(id)
    VimeoVideoService.new.fetch_video(id)[:resp]
  end

end