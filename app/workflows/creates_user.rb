class CreatesUser 
  attr_accessor :email, :password, :user

  def initialize(
    email: '',
    password: ''
  ) 
    @email = email
    @password = password
  end

  def build 
    self.user = User.new(
      email:,
      password:
    )
  end

  def success? 
    @success
  end

  def create 
    build
    @success = user.save
  end
end