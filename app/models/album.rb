class Album
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug
  include AlgoliaSearch

  after_save :retrieve_album_art

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

  algoliasearch per_environment: true, :disable_indexing => Rails.env.test? do
    attribute :title, :artist, :image_url
  end

  def retrieve_album_art
    Resque.enqueue(RetrieveAlbumArt, slug)
  end
end
