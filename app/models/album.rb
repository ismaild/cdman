class Album
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug
  include AlgoliaSearch

  after_create :retrieve_album_details

  embeds_many :tracks, cascade_callbacks: true
  accepts_nested_attributes_for :tracks

  field :title
  field :release_date, type: DateTime
  field :artist
  field :image_url
  field :mbid

  slug :title

  validates :title, presence: true
  validates :release_date, presence: true
  validates :artist, presence: true

  algoliasearch per_environment: true, :disable_indexing => Rails.env.test? do
    attribute :title, :artist, :image_url
  end

  def retrieve_album_details
    Resque.enqueue(RetrieveAlbumDetails, slug)
  end
end
