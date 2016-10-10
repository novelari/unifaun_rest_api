require 'json'
class Tracker<Base
  attr_accessor :href
  attr_accessor :id
  attr_accessor :status
  attr_accessor :shipmentNo
  attr_accessor :orderNo
  attr_accessor :reference
  attr_accessor :serviceId
  attr_accessor :parcelCount
  attr_accessor :sndName
  attr_accessor :sndZipcode
  attr_accessor :sndCity
  attr_accessor :sndCountry
  attr_accessor :rcvName
  attr_accessor :rcvZipcode
  attr_accessor :rcvCity
  attr_accessor :rcvCountry
  attr_accessor :created
  attr_accessor :changed
  attr_accessor :shipDate
  attr_accessor :returnShipment
  attr_accessor :normalShipment
  attr_accessor :consolidated
  attr_accessor :parcels
  attr_accessor :pdfs
  attr_accessor :previousPdfs

  def self.CreateInstances(json_string)
    # JSON.parse(json_string, object_class: Tracker)
    trackersJson = JSON.parse(json_string)
    trackers=trackersJson.map do |trackerJson|
      tracker = Tracker.new()
      tracker.href = trackerJson['href']
      tracker.id = trackerJson['id']
      tracker.status = trackerJson['status']
      tracker.shipmentNo = trackerJson['shipmentNo']
      tracker.orderNo = trackerJson['orderNo']
      tracker.reference = trackerJson['reference']
      tracker.serviceId = trackerJson['serviceId']
      tracker.parcelCount = trackerJson['parcelCount']
      tracker.sndName = trackerJson['sndName']
      tracker.sndZipcode = trackerJson['sndZipcode']
      tracker.sndCity = trackerJson['sndCity']
      tracker.sndCountry = trackerJson['sndCountry']
      tracker.rcvName = trackerJson['rcvName']
      tracker.rcvZipcode = trackerJson['rcvZipcode']
      tracker.rcvCity = trackerJson['rcvCity']
      tracker.rcvCountry = trackerJson['rcvCountry']
      tracker.created = trackerJson['created']
      tracker.changed = trackerJson['changed']
      tracker.shipDate = trackerJson['shipDate']
      tracker.returnShipment = trackerJson['returnShipment']
      tracker.normalShipment = trackerJson['normalShipment']
      tracker.consolidated = trackerJson['consolidated']
      tracker.parcels = trackerJson['parcels']
      tracker.pdfs = trackerJson['pdfs']
      tracker.previousPdfs = trackerJson['previousPdfs']
      tracker
    end
    trackers
  end
end
