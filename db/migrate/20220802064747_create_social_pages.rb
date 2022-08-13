class CreateSocialPages < ActiveRecord::Migration[6.1]
  def change
    create_table :social_pages do |t|
      t.string :facebook_url
      t.string :twitter_url
      t.string :email_url
      t.string :instagram_url
      t.string :trailer_video_url
      t.timestamps
    end
  end
end
