class Receiver<Base
  attr_accessor :phone
  attr_accessor :email
  attr_accessor :zipcode
  attr_accessor :name
  attr_accessor :address1
  attr_accessor :country
  attr_accessor :city
  def initialize(args)
    args.each do |k,v|
      send("#{k}=",v)
    end
  end
  def to_json
    JSON.dump to_h
  end
end
