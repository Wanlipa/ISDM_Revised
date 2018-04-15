class Subtopic < ApplicationRecord
  belongs_to :maintopic
  has_many :uses, :dependent => :destroy
  has_many :materials, :through => :uses
  accepts_nested_attributes_for :materials, reject_if: :all_blank, allow_destroy: true
end
