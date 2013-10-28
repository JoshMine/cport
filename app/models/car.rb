# == Schema Information
#
# Table name: cars
#
#  id                 :integer          not null, primary key
#  participant_id     :integer
#  brand              :string(255)
#  model              :string(255)
#  prod_year          :integer
#  price              :float
#  photo_file_name    :string(255)
#  photo_content_type :string(255)
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Car < ActiveRecord::Base
  attr_accessible :brand, :model, :photo, :price, :prod_year
  
  belongs_to :participant
  
  validates :brand, presence: true
  validates :model, presence: true
  validates :price, presence: true
  validates :prod_year, presence: true
  
  has_attached_file :photo, :styles => { :medium => "300x600>", :thumb => "100x100>" }, :default_url => "http://placehold.it/100x100"
  
  
end
