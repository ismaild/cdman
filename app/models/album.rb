class Album
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug

  embeds_many :tracks, cascade_callbacks: true
  accepts_nested_attributes_for :tracks

  field :title
  field :release_date, type: DateTime
  field :artist
  field :image_url

  slug :title

  validates :title, presence: true
  validates :release_date, presence: true
  validates :artist, presence: true
end
