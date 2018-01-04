class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes

  validates(
    :title,
    presence: {message: "Please give a title. Thanks."},
    uniqueness: true
  )

  validates :body, presence: true, length: {minimum: 5, maximum: 1000}

  before_save :squeeze
  after_initialize :capitalize

#----------------------------------------------------------------------------
  def like_for(user)
    self.likes.find_by_user_id(user)
  end

  def liked_by?(user)
    likes.find_by_user_id(user.id).present?
  end

  def like_count
    self.likes.count
  end

#---class method, find the most recnet 10 posts-----------------------------
# can be used in any views!! cool!
  def self.recent_ten
    order("created_at DESC").limit(10)
  end
#---------------------------------------------------------------------------
  def self.search(word)
    # all of the title that contain `word`
    title = where 'title ILIKE ?', "%#{word}%"
    # all of the body that contain `word`
    body = where 'body ILIKE ?', "%#{word}%"

    # There may be duplicates, so filter duplicates out of descriptions
    body = body.select do |elem|
      !title.include? elem
    end
    # concat them together, with title going first before body
    title+body
  end

  private

  def squeeze
    self.title.squeeze!(' ')
  end

  def capitalize
    self.title.try(:capitalize!)
  end



end
