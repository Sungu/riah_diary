class Post < ActiveRecord::Base
  belongs_to :user
  # scope :is_private, -> { where(is_private: true) }
  scope :is_public, -> { where(is_private: false) }
end
