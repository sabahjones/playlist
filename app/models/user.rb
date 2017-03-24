class User < ActiveRecord::Base
  has_secure_password

  #has_many :songs, source: :song, through: :songlist
  has_many :songlists, foreign_key: 'user_id'
  has_many :songs, source: :song, through: :songlists

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :first_name, :last_name, presence: true, length: { in: 2..20 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  validates :password, presence: true, length: {in: 7..16}

  def name
    "#{first_name} #{last_name}"
  end

end
