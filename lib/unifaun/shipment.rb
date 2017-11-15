require 'unifaun/base.rb'
require 'json'
require "unifaun/sender.rb"
require "unifaun/senderPartner.rb"
require "unifaun/parcel.rb"
require "unifaun/receiver.rb"
require "unifaun/service.rb"
require "unifaun/option.rb"
require 'rest-client'
require "unifaun/tracker.rb"
require "unifaun/tracker.rb"
require "unifaun/customsDeclaration.rb"

class Shipment < Base
  attr_accessor :sender
  attr_accessor :senderPartners
  attr_accessor :parcels
  attr_accessor :orderNo
  attr_accessor :receiver
  attr_accessor :senderReference
  attr_accessor :service
  attr_accessor :receiverReference
  attr_accessor :options
  attr_accessor :test
  attr_accessor :customsDeclaration

  def setSender(args)
    @sender = Sender.new(args)
  end

  def setReciver(args)
    @receiver = Receiver.new(args)
  end

  def setSenderPartners(args)
    @senderPartners = args.map{|s| SenderPartners.new(s)}
  end

  def setService(id,paymentMethod = "*NONE*",addons = [])
    @service = Service.new(id,paymentMethod,addons)
  end

  def setCustomsDeclaration(args,lines,sender)
    @customsDeclaration = CustomsDeclaration.new(args,lines,sender)
  end

  def addParcel(args)
    newParcel = Parcel.new(args)
    if @parcels
      @parcels << newParcel
    else
      @parcels = [newParcel]
    end
  end

  def addOption(args)
    newOption = Option.new(args)
    if @options
      @options << newOption
    else
      @options = [newOption]
    end
  end

  def request_body_json(pdfConfig)
    JSON.dump requestBody = :shipment => to_h , :pdfConfig => pdfConfig.to_h
  end

  def save(pdfConfig)
    begin
      response = RestClient::Request.execute(:url => API.Url+'/shipments', :method => :post, :verify_ssl => false,:headers => {content_type: :json , Authorization: "Bearer #{API::KEY}"},:payload => request_body_json(pdfConfig))
      trackers = Tracker.CreateInstances(response.body)
      tracker = trackers[0]
      tracker
    rescue Exception => e
      p e.message
      if e.response
        response = e.response
        p response.code
        p JSON.parse(response.body)
      end
    end
  end

  def to_json
    JSON.dump to_h
  end
end
