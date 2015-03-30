class Article < ActiveRecord::Base
	has_attached_file :main_image, styles: {:thumb => '50x50', :medium => '100x100'}
	validates_attachment_content_type :main_image, :content_type => /\Aimage\/.*\Z/
	crop_attached_file :main_image, :aspect => "11:6"
	has_many :comments

end
