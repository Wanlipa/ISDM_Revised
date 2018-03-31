class Course < ApplicationRecord
  has_many :targets
  accepts_nested_attributes_for :targets, reject_if: :all_blank, allow_destroy: true
  has_many :instructors
  accepts_nested_attributes_for :instructors, reject_if: :all_blank, allow_destroy: true
  has_many :topics, dependent: :destroy
  accepts_nested_attributes_for :topics, reject_if: :all_blank, allow_destroy: true
  has_many :objectives, dependent: :destroy
  accepts_nested_attributes_for :objectives, reject_if: :all_blank, allow_destroy: true
  has_many :problem_solutions, dependent: :destroy
  accepts_nested_attributes_for :problem_solutions, reject_if: :all_blank, allow_destroy: true
  has_many :chapters, dependent: :destroy
  accepts_nested_attributes_for :chapters, reject_if: :all_blank, allow_destroy: true
  belongs_to :category
  belongs_to :user
  mount_uploader :avatar, AvatarUploader
  validates :courseName, :presence => true, :if => :active?

  def active?
    status == 'active'
  end
end
