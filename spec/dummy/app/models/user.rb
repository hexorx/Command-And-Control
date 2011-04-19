class User
  include Mongoid::Document
  
  field :admin, :default => false
  
  def admin?
    !!admin
  end
  
  def c2_title
    'Dummy User'
  end
end