class Contact < ActiveRecord::Base
  belongs_to :company
  attr_accessible :company_id, :email_adress, :first_name, :last_name, :phone_numer, :photo, :tweet_user

  validates :first_name, :presence=>true
  validates :email_adress, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/, :on => :create, :on => :update }
  validates :phone_numer, :format => { :with => /44+([0-9]{3,})+[0-9]{6,}/, :on => :create , :on => :update}

    #Thumbnail
  has_attached_file :photo,
     :styles => {
       :thumb=> "70x70#",
       :small  => "250x250>",
       :medium  => "400x400>" },
       :default_url => "/photos/missing.png"

validates_attachment_size :photo, :less_than => 3.megabytes
validates_attachment_content_type :photo, :content_type => ['image/jpeg','image/jpg', 'image/png'], :message => "only pngs and jpgs are allowed with less than 3 Mb."

	def self.search(search)
	  if search
	    find(:all, :conditions => ['first_name LIKE ?', "%#{search}%"])
	  else
	    find(:all)
	  end
	end


end
