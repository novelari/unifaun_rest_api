require "unifaun/version"
require "unifaun/shipment"
require "unifaun/pdfConfig"

module Unifaun
  def self.createShipment(shipment,pdf_config)
    tracker = shipment.save(pdf_config)
    tracker
  end
  def self.createShipments(shipments,pdf_config)
    if shipments.is_a? Array
      trackers = shipments.map do |shipment|
        shipment.save(pdf_config)
      end
    else
      raise "You need to send an array of shipments"
    end
  end

  def self.getShipmentPDF(href)
    response = RestClient::Request.execute(:url => href, :method => :get, :verify_ssl => false,:headers => {Authorization: "Bearer #{API::KEY}"})
  end

end
