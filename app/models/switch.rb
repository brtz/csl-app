class Switch
  include Mongoid::Document
  field :note, type: String
  embedded_in :user
end
