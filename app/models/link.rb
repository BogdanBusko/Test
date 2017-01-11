class Link
  

  include Mongoid::Document
  field :link_text, type: String
  field :tags, type: String
  field :descriptio, type: String

  embedded_in :user
end
