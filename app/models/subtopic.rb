class Subtopic < ApplicationRecord
  belongs_to :maintopic
  has_many :uses, :dependent => :destroy
  accepts_nested_attributes_for :uses, reject_if: :all_blank, allow_destroy: true
  has_many :materials, :through => :uses
  accepts_nested_attributes_for :materials, reject_if: :all_blank, allow_destroy: true

end
