require "rails_helper"

RSpec.describe ProductMailer, type: :mailer do
  describe "payment_successful" do
    let(:product) { Product.create!(name: "Thing", description: "It's a thing") }
    let(:mail) { ProductMailer.payment_successful(product, "to@example.org") }

    it "renders the headers" do
      expect(mail.subject).to eq("Order Successful")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["contact@thebee.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to include("<p>Thank you for purchasing Thing, we'll be sending it out as soon as we can.</p>")
    end
  end

end
