require_relative 'employee.rb'

class CommissionSalesPerson < Employee
  attr_accessor :sales
  attr_reader :commission_rate

  def initialize(last_name, first_name, position, base_salary, commission_rate, gross_sale_value, sales)
    @last_name          = last_name
    @first_name         = first_name
    @position           = position
    @base_salary        = base_salary
    @tax_rate           = 0.3
    @commission_rate    = commission_rate
    @gross_sale_value   = gross_sale_value
    @sales              = sales
  end

  def gross_salary
    (@base_salary/12.0 + commission).floor_to_penny
  end

  def commission
    (@commission_rate*@gross_sale_value).floor_to_penny
  end
end
