require 'unifaun/base.rb'
class SenderPartners < Base
  attr_accessor :id
  attr_accessor :custNo
  def initialize(args)
    args.each do |k,v|
      send("#{k}=",v) rescue p "#{k} dose not exist"
    end
  end
  def to_json
    JSON.dump to_h
  end
end
