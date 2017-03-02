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
    s.setReciver(name:"Unifaun AB",phone:"+46 8 34 35 15",email:"sales@unifaun.com",address1:"Tegnérgatan 34",address2:"test address2",zipcode:"11359",city:"cairo",country:"SE")
    s.setService("PUA")
    # s.addOption(message:"This is order number 123",to:"sales@unifaun.com",id:"ENOT",languageCode:"SE",from:"info@unifaun.com")
    # s.orderNo = "order number 123"
    # s.senderReference = "sender ref 234"
    # s.receiverReference = "receiver ref 345"
    pdfConfig = PdfConfig.new()
    # s.save(pdfConfig)
    tracker = Unifaun.createShipment(s,pdfConfig)
    p tracker
    f=File.new("file.pdf", "w")
    f.write(Unifaun.getShipmentPDF(tracker.pdfs[0].href))
    f.close
    # p s.to_json
  end

  it "shipment with customsDeclaration " do
    s  = Shipment.new()
    s.test = true
    s.setSender({name: "ahmed",phone: "+46 31 725 35 00",email: "ahmed@elnaqah.com",zipcode: "41121",address1: "Skeppsbron 5-6",address2: "test address2",city: "GÖTEBORG",country: "SE",quickId: "1"})
    s.addParcel(copies: "1",weight:"0.16",contents:"important things",valuePerParcel:true)
    s.setReciver(name:"Unifaun AB",phone:"+46 8 34 35 15",email:"sales@unifaun.com",address1:"Tegnérgatan 34",address2:"test address2",zipcode:"620089",city:"EKATERINBURG",country:"RU")
    #*NONE*
    s.setService("BREKI","INVO",["NOINSU"])

    s.setCustomsDeclaration({invoiceType:"STANDARD",invoiceNo:"2016-05-01",termCode:"022",currencyCode:"SEK",printSet:["CN22"]},[{statNo:"12345678",value:150,contents:"Imported stuff",copies:1,netWeight:0.2,sourceCountryCode:"SE",valuesPerItem:true}])

    p s.to_json
    # s.addOption(message:"This is order number 123",to:"sales@unifaun.com",id:"ENOT",languageCode:"SE",from:"info@unifaun.com")
    # s.orderNo = "order number 123"
    # s.senderReference = "sender ref 234"
    # s.receiverReference = "receiver ref 345"
    pdfConfig = PdfConfig.new("thermo-brev3")
    # p pdfConfig.to_json
    # s.save(pdfConfig)
    tracker = Unifaun.createShipment(s,pdfConfig)
    p tracker
    # expect(tracker).not_to be_empty, "failed to create shippment"
    expect(tracker).to be_a_kind_of(Tracker)

    # p tracker
    for i in 0..(tracker.pdfs.count-1)
      f=File.new("file#{i}.pdf", "w")
      f.write(Unifaun.getShipmentPDF(tracker.pdfs[i].href))
      f.close
    end
    # p s.to_json
  end
  # it "shipment is Failed" do
  #   s  = Shipment.new()
  #   s.test = true
  #   s.setSender({name: "ahmed",phone: "+46 31 725 35 00",email: "ahmed@elnaqah.com",zipcode: "41121",address1: "Skeppsbron 5-6",address2: "test address2",city: "GÖTEBORG",country: "SE",quickId: "1"})
  #   s.addParcel(copies: "1",weight:"0.16",contents:"important things",valuePerParcel:true)
  #   s.setReciver(name:"Unifaun AB",phone:"+46 8 34 35 15",email:"sales@unifaun.com",zipcode:"Tegnérgatan 34",address1:"11359",city:"STOCKHOLM",country:"SE")
  #   s.setService("PUA")
  #   s.addOption(message:"This is order number 123",to:"sales@unifaun.com",id:"ENOT",languageCode:"SE",from:"info@unifaun.com")
  #   s.orderNo = "order number 123"
  #   s.senderReference = "sender ref 234"
  #   s.receiverReference = "receiver ref 345"
  #   pdfConfig = PdfConfig.new()
  #   # s.save(pdfConfig)
  #   Unifaun.createShipment(s,pdfConfig)
  #   # p s.to_json
  # end
  # it "shipments creating is working" do
  #   s  = Shipment.new()
  #   s.test = true
  #   s.setSender({name: "ahmed",phone: "+46 31 725 35 00",email: "ahmed@elnaqah.com",zipcode: "41121",address1: "Skeppsbron 5-6",address2: "test address2",city: "GÖTEBORG",country: "SE",quickId: "1"})
  #   s.addParcel(copies: "1",weight:"0.16",contents:"important things",valuePerParcel:true)
  #   s.setReciver(name:"Unifaun AB",phone:"+46 8 34 35 15",email:"sales@unifaun.com",address1:"Tegnérgatan 34",zipcode:"11359",city:"STOCKHOLM",country:"SE")
  #   s.setService("PUA")
  #   s.addOption(message:"This is order number 123",to:"sales@unifaun.com",id:"ENOT",languageCode:"SE",from:"info@unifaun.com")
  #   s.orderNo = "order number 123"
  #   s.senderReference = "sender ref 234"
  #   s.receiverReference = "receiver ref 345"
  #   pdfConfig = PdfConfig.new()
  #   # s.save(pdfConfig)
  #   Unifaun.createShipments([s],pdfConfig)
  #   # p s.to_json
  # end
end
