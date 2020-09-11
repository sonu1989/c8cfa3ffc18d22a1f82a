require 'test_helper'

class PhoneTest < ActiveSupport::TestCase
  
  test "should allot a uniq number" do
    phone = Phone.new
    assert phone.allot_and_save
  end

  test "should allot a 1111111111 number if available" do
    number = 1111111111
    phone1 = Phone.new(number: number)
    phone1.allot_and_save
    assert (phone1.reload.number == number.to_s)

    phone2 = Phone.new(number: number)
    phone2.allot_and_save
    assert_not (phone2.reload.number == number.to_s)    
  end

  test "should allot a random number if number is invalid" do
    number = 0000000000
    phone = Phone.new(number: number)
    phone.allot_and_save
    assert_not (phone.reload.number == number.to_s)   
  end
end
