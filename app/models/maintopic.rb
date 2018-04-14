class Maintopic < ApplicationRecord
  belongs_to :chapter
  has_many :subtopics, :dependent => :destroy
  accepts_nested_attributes_for :subtopics, reject_if: :all_blank, allow_destroy: true
end
