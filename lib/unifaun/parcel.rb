class Parcel<Base
  attr_accessor :copies
  attr_accessor :weight
  attr_accessor :contents
  attr_accessor :valuePerParcel
  def initialize(copies,weight,contents,valuePerParcel)
    @copies = copies
    @weight = weight
    @contents = contents
    @valuePerParcel = valuePerParcel
  end
  def to_json
    JSON.dump to_h
  end
end
