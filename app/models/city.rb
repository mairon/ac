class City < ActiveRecord::Base
  validates_presence_of :name, :country_id, :state_id
  validates_uniqueness_of :name
  has_many :companies, dependent: :restrict_with_exception
	belongs_to :country
	belongs_to :state
end
