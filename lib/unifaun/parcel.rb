class Parcel<Base
  attr_accessor :copies
  attr_accessor :weight
  attr_accessor :contents
  attr_accessor :valuePerParcel
  def initialize(args)
    args.each do |k,v|
      send("#{k}=",v) rescue p "#{k} dose not exist"
    end
  end
  def to_json
    JSON.dump to_h
  end
end
