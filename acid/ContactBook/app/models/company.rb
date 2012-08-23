class Company < ActiveRecord::Base
  attr_accessible :adress, :name
attr_accessible :email, :first_name, :last_name, :phone_numer
  validates :name, :presence=>true

  def self.search(search)
	  if search
	    find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
	  else
	    find(:all)
	  end
	end

end
