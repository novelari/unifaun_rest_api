require "spec_helper"

describe Unifaun do
  it "has a version number" do
    expect(Unifaun::VERSION).not_to be nil
  end
  #
  # it "does something useful" do
  #   expect(false).to eq(true)
  # end

  it "shipment is working" do
    s  = Shipment.new()
    s.test = true
    s.setSender("ahmed","+46 31 725 35 00","ahmed@elnaqah.com","41121","Skeppsbron 5-6","GÖTEBORG","SE","1")
    s.addParcel("1","0.16","important things",true)
    s.setReciver("Unifaun AB","+46 8 34 35 15","sales@unifaun.com","11359","Tegnérgatan 34","STOCKHOLM","SE")
    s.setService("PUA")
    s.addOption("This is order number 123","sales@unifaun.com","ENOT","SE","info@unifaun.com")
    s.orderNo = "order number 123"
    s.senderReference = "sender ref 234"
    s.receiverReference = "receiver ref 345"
    pdfConfig = PdfConfig.new()
    # s.save(pdfConfig)
    Unifaun.createShipment(s,pdfConfig)
    # p s.to_json
  end
  it "shipment is Failed" do
    s  = Shipment.new()
    s.test = true
    s.setSender("ahmed","+46 31 725 35 00","ahmed@elnaqah.com","41121","Skeppsbron 5-6","GÖTEBORG","SE","1")
    s.addParcel("1","0.16","important things",true)
    s.setReciver("Unifaun AB","+46 8 34 35 15","sales@unifaun.com","Tegnérgatan 34","11359","STOCKHOLM","SE")
    s.setService("PUA")
    s.addOption("This is order number 123","sales@unifaun.com","ENOT","SE","info@unifaun.com")
    s.orderNo = "order number 123"
    s.senderReference = "sender ref 234"
    s.receiverReference = "receiver ref 345"
    pdfConfig = PdfConfig.new()
    # s.save(pdfConfig)
    Unifaun.createShipment(s,pdfConfig)
    # p s.to_json
  end
  it "shipments creating is working" do
    s  = Shipment.new()
    s.test = true
    s.setSender("ahmed","+46 31 725 35 00","ahmed@elnaqah.com","41121","Skeppsbron 5-6","GÖTEBORG","SE","1")
    s.addParcel("1","0.16","important things",true)
    s.setReciver("Unifaun AB","+46 8 34 35 15","sales@unifaun.com","11359","Tegnérgatan 34","STOCKHOLM","SE")
    s.setService("PUA")
    s.addOption("This is order number 123","sales@unifaun.com","ENOT","SE","info@unifaun.com")
    s.orderNo = "order number 123"
    s.senderReference = "sender ref 234"
    s.receiverReference = "receiver ref 345"
    pdfConfig = PdfConfig.new()
    # s.save(pdfConfig)
    Unifaun.createShipments([s],pdfConfig)
    # p s.to_json
  end
end
