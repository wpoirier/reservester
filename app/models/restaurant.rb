class Restaurant < ApplicationRecord
  validates :name, :address, :style, :phone_number, presence: true
  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  geocoded_by :address
  after_validation :geocode

  def google_map
    "https://maps.googleapis.com/maps/api/staticmap?center=#{latitude},#{longitude}&size=300x300&zoom=15&markers=color:red%7C#{latitude},#{longitude}"
  end

end
