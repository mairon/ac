class Currency < ActiveRecord::Base
	has_and_belongs_to_many :companies
	has_attached_file :icon, :styles => { :medium => "120x80>", :thumb => "27x18>" }
  validates_attachment_content_type :icon, :content_type => /\Aimage\/.*\Z/
  validates_presence_of :name, :short
  validates_uniqueness_of :name, :short
end
