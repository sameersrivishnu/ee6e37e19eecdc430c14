class User < ApplicationRecord
 self.per_page = 3

  def self.matches inp
      User.where('firstName LIKE ? or lastName LIKE ? or email LIKE ?',"%#{inp}%","%#{inp}%","%#{inp}%").all
  end	

end
