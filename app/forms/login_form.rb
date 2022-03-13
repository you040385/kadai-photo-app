class LoginForm
  include ActiveModel::Model
  include ActiveModel::Attributes
  include ActiveModel::Validations::Callbacks

  attribute :login_id, :string
  attribute :password, :string

  validates :login_id, presence: true
  validates :password, presence: true
  validate :authenticate_user

  before_validation :strip_whitespace

  def authenticate
    valid? ? authenticated_user : false
  end

  private

  attr_reader :authenticated_user

  def strip_whitespace
    self.login_id = login_id.strip unless login_id.nil?
    self.password = password.strip unless password.nil?
  end

  def authenticate_user
    return if login_id.blank? || password.blank?

    user = User.find_by(login_id: login_id)
    if user && user.authenticate(password)
      @authenticated_user = user
    else
      errors.add(:base, 'ユーザーIDまたはパスワードが間違っています')
    end
  end
end
