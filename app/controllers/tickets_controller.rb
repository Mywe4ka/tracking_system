class TicketsController < ApplicationController

  before_action :authorize, only: [:index, :destroy, :search, :reply_window, :submit_reply]
  before_action :set_ticket, except: [:index, :new, :create, :search]

  def index
    @tickets = Ticket.all
  end

  def show
  end

  def new
    @ticket = Ticket.new
  end

  def edit
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.customer = Customer.first_or_initialize(ticket_params[:customer])
    respond_to do |format|
      if @ticket.save
        format.html { redirect_to @ticket, notice: 'Ticket was successfully created.' }
        format.json { render :show, status: :created, location: @ticket }
      else
        format.html { render :new }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to @ticket, notice: 'Ticket was successfully updated.' }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :edit }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to tickets_url, notice: 'Ticket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    ticket = Ticket.find_by(token: params[:search]) if params[:search].present?
    if ticket
      redirect_to(ticket_path(ticket))
    else     
      redirect_to(root_path, alert: "Ticket does not exist")
    end  
  end

  def reply_window
  end

  def submit_reply
    ActionNotifier.reply_for_the_ticket(@ticket.token, @ticket.customer, params[:note])
    redirect_to(tickets_path)
  end

  private
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    def ticket_params
      params.require(:ticket).permit(:token, :department, :subject, :body, :customer_id, customer_attributes: [:id, :name, :email, :type])
    end
end
