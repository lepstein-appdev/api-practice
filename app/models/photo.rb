class Photo < ApplicationRecord
  has_many   :comments,
    dependent: :destroy

  has_many   :likes,
    dependent: :destroy

  belongs_to :owner,
    class_name: "User",
    counter_cache: :own_photos_count

  # Indirect associations

  has_many   :followers,
    through: :owner,
    source: :followers

  def howdy
    return "hiya!"
  end

  def liked_by(user)
    self.likes.where(fan: user).exists?
  end
end
