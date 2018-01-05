class User < ApplicationRecord
  has_many :posts, dependent: :nullify
  has_many :likes, dependent: :destroy
  has_many :posts, through: :likes, source: :post

  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: VALID_EMAIL_REGEX
  validates :first_name, :last_name, presence: true

  before_create {generate_token(:auth_token)}

   def generate_token(column)
      begin
        self[column] = SecureRandom.urlsafe_base64
      end while User.exists?(column => self[column])
   end

   def send_password_reset
      generate_token(:password_reset_token)
      self.password_reset_sent_at = Time.zone.now
      save!
      UserMailer.password_reset(self).deliver
   end

  def full_name
    "#{first_name} #{last_name}"
  end

  # def deliver_password_reset_instructions
  #   self.perishable_token = SecureRandom.hex(4)
  #   save(validate: false)
  #
  #   PasswordResetNotifierMailer.password_reset_instructions(self).deliver_now
  # end

end
