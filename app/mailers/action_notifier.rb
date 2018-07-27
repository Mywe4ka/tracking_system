class ActionNotifier < ActionMailer::Base

  def ticket_created(reference, customer)
    title = "You have created a ticket"
    text_plain = "Hi, #{customer.name}! Your ticket was successfully created. Reference number is #{reference}"
    from = "TrackingSystem"

    m = mail(from: from, to: customer.email, subject: title) do |format|
      format.text { render text: text_plain }
    end

    m.deliver
  end
end
