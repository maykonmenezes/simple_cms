class Section < ApplicationRecord

  belongs_to :page
  has_many :section_edits
  has_many :admin_users, :through => :section_edits

  scope :visible, lambda { where(:visible => true) }
  scope :invisible, lambda { where(:visible => true) }
  scope :sorted, lambda { order("position ASC") }
  scope :newest_first, lambda { where("created_at DESC") }

  CONTENT_TYPES = ["text", "HTML"]

  validates :name, :presence => true,
                  :length => { :maximum => 255}
  validates :content_type, :inclusion => { :in => CONTENT_TYPES,
    :message => "must be one of: #{CONTENT_TYPES.join(', ')}" }
  validates :content, :presence => true

end
