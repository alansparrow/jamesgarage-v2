# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Album < ActiveRecord::Base
  attr_accessible :title
  has_many :pictures, dependent: :destroy
  
  validates :title, presence: true
end
