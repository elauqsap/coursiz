class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable, :timeoutable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :year, :discipline
  validates_presence_of :name
  
  def self.years
    %w(Freshman Sophomore Junior Senior)
  end

  def self.disciplines
    %w(Biomedical Computer Chemical Civil Electrical Industrial Mechanical)
  end

end
