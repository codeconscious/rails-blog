class Article < ApplicationRecord
  include Visible

  has_many :comments, dependent: :destroy

  scope :public_articles, -> { where(status: 'public') }
  scope :private_articles, -> { where(status: 'private') }
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
