require 'unifaun/base.rb'
class Sender < Base
  attr_accessor :phone
  attr_accessor :email
  attr_accessor :zipcode
  attr_accessor :name
  attr_accessor :address1
  attr_accessor :country
  attr_accessor :city
  attr_accessor :quickId
  def initialize(name,phone,email,zipcode,address1,city,country,quickId)
    @name = name
    @phone = phone
    @email = email
    @zipcode = zipcode
    @address1 = address1
    @country = country
    @city = city
    @quickId = quickId
  end
  def to_json
    JSON.dump to_h
  end
end
