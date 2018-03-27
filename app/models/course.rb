class Course < ApplicationRecord
  belongs_to :category
  belongs_to :user
  mount_uploader :avatar, AvatarUploader
  validates :courseName, :presence => true, :if => :active?

  def active?
    status == 'active'
  end
end
