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
    s.setSender({name: "ahmed",phone: "+46 31 725 35 00",email: "ahmed@elnaqah.com",zipcode: "41121",address1: "Skeppsbron 5-6",address2: "test address2",city: "GÖTEBORG",country: "SE",quickId: "1"})
    s.addParcel(copies: "1",weight:"0.16",contents:"important things",valuePerParcel:true)
    s.setReciver(name:"Unifaun AB",phone:"+46 8 34 35 15",email:"sales@unifaun.com",address1:"Tegnérgatan 34",address2:"test address2",zipcode:"11359",city:"STOCKHOLM",country:"SE")
    s.setService("PUA")
    # s.addOption(message:"This is order number 123",to:"sales@unifaun.com",id:"ENOT",languageCode:"SE",from:"info@unifaun.com")
    # s.orderNo = "order number 123"
    # s.senderReference = "sender ref 234"
    # s.receiverReference = "receiver ref 345"
    pdfConfig = PdfConfig.new()
    # s.save(pdfConfig)
    tracker = Unifaun.createShipment(s,pdfConfig)
    p tracker.parcels[0].parcelNo
    # p s.to_json
  end
  it "shipment is Failed" do
    s  = Shipment.new()
    s.test = true
    s.setSender({name: "ahmed",phone: "+46 31 725 35 00",email: "ahmed@elnaqah.com",zipcode: "41121",address1: "Skeppsbron 5-6",address2: "test address2",city: "GÖTEBORG",country: "SE",quickId: "1"})
    s.addParcel(copies: "1",weight:"0.16",contents:"important things",valuePerParcel:true)
    s.setReciver(name:"Unifaun AB",phone:"+46 8 34 35 15",email:"sales@unifaun.com",zipcode:"Tegnérgatan 34",address1:"11359",city:"STOCKHOLM",country:"SE")
    s.setService("PUA")
    s.addOption(message:"This is order number 123",to:"sales@unifaun.com",id:"ENOT",languageCode:"SE",from:"info@unifaun.com")
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
    s.setSender({name: "ahmed",phone: "+46 31 725 35 00",email: "ahmed@elnaqah.com",zipcode: "41121",address1: "Skeppsbron 5-6",address2: "test address2",city: "GÖTEBORG",country: "SE",quickId: "1"})
    s.addParcel(copies: "1",weight:"0.16",contents:"important things",valuePerParcel:true)
    s.setReciver(name:"Unifaun AB",phone:"+46 8 34 35 15",email:"sales@unifaun.com",address1:"Tegnérgatan 34",zipcode:"11359",city:"STOCKHOLM",country:"SE")
    s.setService("PUA")
    s.addOption(message:"This is order number 123",to:"sales@unifaun.com",id:"ENOT",languageCode:"SE",from:"info@unifaun.com")
    s.orderNo = "order number 123"
    s.senderReference = "sender ref 234"
    s.receiverReference = "receiver ref 345"
    pdfConfig = PdfConfig.new()
    # s.save(pdfConfig)
    Unifaun.createShipments([s],pdfConfig)
    # p s.to_json
  end
end
