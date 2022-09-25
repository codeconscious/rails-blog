# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  body       :text
#  status     :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Article < ApplicationRecord
  include Visible

  has_many :comments, dependent: :destroy

  scope :public_articles, -> { where(status: 'public') }
  scope :private_articles, -> { where(status: 'private') }
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
