class ParcelTracker
  attr_accessor :parcelNo
  attr_accessor :returnParcelNo
  attr_accessor :reference
  def initialize(args)
    args.each do |k,v|
      send("#{k}=",v) rescue p "#{k} dose not exist"
    end
  end
end
