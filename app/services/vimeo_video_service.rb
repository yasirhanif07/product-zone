# frozen_string_literal: true

# Service to get vimeo videos
class VimeoVideoService
  attr_accessor :video_id

  def initialize(*)
    @api_key = Rails.application.credentials.vimeo[:api_key]
    @video_url = '/videos/'
  end

  def fetch_video(video_id = '')
    vimeo = JSON.parse(VimeoMe2::Video.new(@api_key, @video_url + video_id).to_json)
    result = vimeo['video']['player_embed_url']
    { resp: result, status: 200 }
  rescue StandardError => e
    { resp: e.message, status: e.try(:error) || 400 }
  end

end
