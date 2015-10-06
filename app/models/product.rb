class Product < ActiveRecord::Base
	belongs_to :category
	has_attached_file :image, :styles => { :medium => "200x>", :thumb => "100x100>" }, :default_url => "/images/default.jpg"
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	validates :title, presence: true
	validates :price, presence: true
	validates :description, presence: true
end
