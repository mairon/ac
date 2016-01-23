class Country < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name
  has_many :states, dependent: :restrict_with_exception
  has_many :cities, dependent: :restrict_with_exception
  has_many :companies, dependent: :restrict_with_exception
end
