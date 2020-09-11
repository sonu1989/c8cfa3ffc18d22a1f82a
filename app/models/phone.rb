class Phone < ApplicationRecord
  validates_uniqueness_of :number
  validates_numericality_of :number, 
    greater_than_or_equal_to: 1111111111, 
    less_than_or_equal_to: 9999999999, 
    message: 'is not valid'

  def allot_and_save
    self.number = get_random_number if self.number.blank? or invalid?
    save
  end

  private
    # It will return a random which is not exist into database.
    def get_random_number
      flag = true
      while flag
        r = Random.new
        random_number = r.rand(1111111111...9999999999)
        flag = false if Phone.where(number: random_number).blank?
      end
      random_number
    end
end
