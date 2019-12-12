class Subject < ApplicationRecord

  has_many :pages

  scope :visible, lambda { where(:visible => true) }
  scope :invisible, lambda { where(:visible => true) }
  scope :sorted, lambda { order("position ASC") }
  scope :newest_first, lambda { where("created_at DESC") }
  scope :visible, lambda { |query| where("name LIKE ?", "%#{query}%") }

  validates_presence_of :name

end
