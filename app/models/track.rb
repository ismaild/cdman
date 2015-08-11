class Track
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug

  embedded_in :album

  field :number, type: Integer
  field :title
  field :duration, type: Integer
  
  slug :title

  validates :number, presence: true
  validates :title, presence: true
end