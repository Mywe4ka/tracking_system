require './test/test_helper'

describe Ticket do

  context "once creating ticket" do
    let(:ticket) { FactoryGirl.create(:ticket) }

    it "should assign token automatically" do
      expect(ticket.token).not_to be_empty
    end

    it "should generate 19 symbols token" do
      expect(ticket.token.length).to eq 19
    end
  end

end
