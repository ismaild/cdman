class Album
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug

  field :title
  field :release_date, type: DateTime
  field :artist

  slug :title

  validates :title, presence: true
  validates :release_date, presence: true
  validates :artist, presence: true
end
