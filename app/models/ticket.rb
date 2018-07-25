class Ticket < ActiveRecord::Base
  include Tokenable

  validates_uniqueness_of :token
end
