class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates(
    :title,
    presence: {message: "Please give a title. Thanks."},
    uniqueness: true
  )

  validates :body, presence: true, length: {minimum: 5, maximum: 500}

  before_save :squeeze

#---class method, find the most recnet 10 posts-----------------------------
  def self.recent_ten
    order("created_at DESC").limit(10)
  end


  private

  def squeeze
    self.title.squeeze!(' ')
  end




end
