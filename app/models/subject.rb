class Subject < ApplicationRecord

  acts_as_list

  has_many :pages

  scope :visible, lambda { where(:visible => true) }
  scope :invisible, lambda { where(:visible => true) }
  scope :sorted, lambda { order("position ASC") }
  scope :newest_first, lambda { where("created_at DESC") }

  validates :name, :presence => true,
                  :length => { :maximum => 255 }

end
