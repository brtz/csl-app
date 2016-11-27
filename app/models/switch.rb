class Switch
  include Mongoid::Document

  scope :limited_by_userid, ->(user_id) { where(user_id: user_id) }

  field :note, type: String
  field :created_at, type: DateTime, default: Time.now
  field :updated_at, type: DateTime, default: Time.now

  belongs_to :user
end
