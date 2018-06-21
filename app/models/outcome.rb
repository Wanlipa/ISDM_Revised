class Outcome < ApplicationRecord
  belongs_to :course
  has_many :techniques, :dependent => :destroy
  accepts_nested_attributes_for :techniques, reject_if: :all_blank, allow_destroy: true
end
