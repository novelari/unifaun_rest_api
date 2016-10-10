require 'unifaun/base.rb'
require 'json'
require "unifaun/sender.rb"
require "unifaun/parcel.rb"
require "unifaun/receiver.rb"
require "unifaun/service.rb"
require "unifaun/option.rb"
require 'rest-client'
require "unifaun/tracker.rb"
class Shipment < Base
  attr_accessor :sender
  attr_accessor :parcels
  attr_accessor :orderNo
  attr_accessor :receiver
  attr_accessor :senderReference
  attr_accessor :service
  attr_accessor :receiverReference
  attr_accessor :options
  attr_accessor :test

  def setSender(name,phone,email,zipcode,address1,city,country,quickId)
    @sender = Sender.new(name,phone,email,zipcode,address1,city,country,quickId)
  end

  def setReciver(name,phone,email,address1,zipcode,city,country)
    @receiver = Receiver.new(name,phone,email,address1,zipcode,city,country)
  end

  def setService(id)
    @service = Service.new(id)
  end

  def addParcel(copies,weight,contents,valuePerParcel)
    newParcel = Parcel.new(copies,weight,contents,valuePerParcel)
    if @parcels
      @parcels << newParcel
    else
      @parcels = [newParcel]
    end
  end

  def addOption(message,to,id,languageCode,from)
    newOption = Option.new(message,to,id,languageCode,from)
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
      response = e.response
      p response.code
      p JSON.parse(response.body)
    end
  end

  def to_json
    JSON.dump to_h
  end
end
