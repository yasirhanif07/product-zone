module HasFriendlyId
  extend ActiveSupport::Concern

  included do
    extend FriendlyId
    friendly_id :slug_candidates, use: :slugged
    include InstanceMethods
  end

  module InstanceMethods
    def slug_candidates
      [
        :name,
        [:name, Digest::SHA1.hexdigest(Time.now.to_s)[0..4]]
      ]
    end

    def should_generate_new_friendly_id?
      slug.blank? || name_changed?
    end
  end
end
