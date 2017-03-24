class Song < ActiveRecord::Base
  has_many :user_listeners, class_name: 'Songlist', foreign_key: 'song_id'
  has_many :playlist_entries, class_name: 'Songlist', foreign_key: 'user_id'

  has_many :listeners, class_name: 'User', through: 'user_listeners', source: :user

  validates :title, :artist, presence: true, length: { minimum: 2 }
  validates_uniqueness_of :artist, :scope => :title

end
