class Project < ActiveRecord::Base
  attr_accessible :description, :name

  validates :name, :description, presence: true
  
  belongs_to :owner, foreign_key: "user_id", class_name:"User"
end
