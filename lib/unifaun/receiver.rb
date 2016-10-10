class Receiver<Base
  attr_accessor :phone
  attr_accessor :email
  attr_accessor :zipcode
  attr_accessor :name
  attr_accessor :address1
  attr_accessor :country
  attr_accessor :city
  def initialize(name,phone,email,zipcode,address1,city,country)
    @name = name
    @phone = phone
    @email = email
    @address1 = address1
    @zipcode = zipcode
    @city = city
    @country = country
  end
  def to_json
    JSON.dump to_h
  end
end
