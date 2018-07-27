class ActionNotifier < ActionMailer::Base
  default from: "TrackingSystem@example.com"

  def ticket_created(reference, customer)
    title = "You have created a ticket"
    text_plain = "Hi, #{customer.name}! Your ticket was successfully created. Reference number is #{reference}"

    m = mail(to: customer.email, subject: title) do |format|
      format.text { render text: text_plain }
    end

    m.deliver_now
  end

  def reply_for_the_ticket(reference, customer, note)
    title = "Reply for ticket #{reference}"

    m = mail(to: customer.email, subject: title) do |format|
      format.text { render text: note }
    end

    m.deliver_now
  end
end
