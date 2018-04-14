class Material < ApplicationRecord
  has_many :uses
  has_many :subtopics, :through => :uses
end
