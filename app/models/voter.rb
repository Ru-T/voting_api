class Voter < ActiveRecord::Base
  before_create :generate_access_token

  validates :name, presence: true
  has_one :vote

  private def generate_access_token
    # begin
    self.access_token = SecureRandom.hex
    # end while self.class.exists?(access_token: access_token)
    # commented out code would ensure that all voters have a unique access token
  end

end
