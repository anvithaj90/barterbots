class Blog < ActiveRecord::Base
  attr_accessible :description, :name, :user_id, :photo

  validates :description, :length => { :maximum => 140 }
  belongs_to :user
  has_attached_file :photo,
                    :styles => {
                       :small  => "100x100>" },
                    :url => "/assets/photos/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/photos/:id/:style/:basename.:extension"
  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_presence_of :name
  validates_presence_of :user_id
end
