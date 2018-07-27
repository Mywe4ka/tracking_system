module FormHelper
  def setup_ticket(ticket)
    ticket.customer ||= Customer.new
    ticket
  end
end
