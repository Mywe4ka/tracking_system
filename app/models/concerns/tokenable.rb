module Tokenable
  extend ActiveSupport::Concern
  
  TOKEN_COMBINATIONS = 5
  COMBINTAION_LENGTH = 3

  included do
    before_create :assign_token
  end

  protected

  def assign_token
    self.token = loop do
      reference = generate_token
      break reference unless self.class.exists?(token: reference)
    end
  end

  def generate_token
    e = Enumerator.new do |y| 
      loop do 
        y << charset_combination(Array('A'..'Z'))
        y << charset_combination(Array(0..9))
      end
    end
    e.first(TOKEN_COMBINATIONS).join('-')
  end

  def charset_combination(charset)
    Array.new(COMBINTAION_LENGTH) { charset.sample }.join
  end
end
