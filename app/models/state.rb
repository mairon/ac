class State < ActiveRecord::Base
  validates_presence_of :name, :country_id
  validates_uniqueness_of :name
  has_many :cities, dependent: :restrict_with_exception
  has_many :companies, dependent: :restrict_with_exception
	belongs_to :country
end
