class Switch
  include Mongoid::Document

  field :note, type: String
  field :created_at, type: DateTime, default: Time.now
  field :updated_at, type: DateTime, default: Time.now

  belongs_to :user
end
