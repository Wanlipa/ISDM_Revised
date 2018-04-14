class Chapter < ApplicationRecord
  belongs_to :course
  has_many :maintopics, :dependent => :destroy
  accepts_nested_attributes_for :maintopics, reject_if: :all_blank, allow_destroy: true
end
