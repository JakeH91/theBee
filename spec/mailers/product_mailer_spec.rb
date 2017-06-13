require "rails_helper"

RSpec.describe ProductMailer, type: :mailer do
  describe "payment_successful" do
    let(:mail) { ProductMailer.payment_successful(Product.first, "to@example.org") }

    it "renders the headers" do
      expect(mail.subject).to eq("Payment successful")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
