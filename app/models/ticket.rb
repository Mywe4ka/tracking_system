class Ticket < ActiveRecord::Base
  include Tokenable

  belongs_to :customer
  validates_uniqueness_of :token
  accepts_nested_attributes_for :customer

  after_create :send_ticket_notification

  def send_ticket_notification
    ActionNotifier.ticket_created(self.token, self.customer)
  end
end
