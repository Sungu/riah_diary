class Post < ActiveRecord::Base
  belongs_to :user

  scope :private, -> { where(is_priavte: true) }
  scope :public, -> { where(is_priavte: false) }
end
