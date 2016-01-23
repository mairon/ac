class Company < ActiveRecord::Base
	has_many :schedules, dependent: :destroy

  has_many :companies_currencies, :dependent => :destroy
  has_and_belongs_to_many :currencies

	accepts_nested_attributes_for :schedules


  has_attached_file :avatar, :styles => {
  			 :medium => {:geometry => "100x100",
  			 			 :convert_options => "-gravity center -extent 100x100  -quality 100"},

  			 :large => {:geometry => "300x300",
  			 			 :convert_options => "-gravity center -extent 300x300  -quality 100"},
  			 :thumb => {:geometry => "50x50",
  						:convert_options => "-gravity center -extent 50x50  -quality 100"}}

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  belongs_to :user
  belongs_to :currency

end
