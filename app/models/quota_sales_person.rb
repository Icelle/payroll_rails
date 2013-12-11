require_relative 'employee.rb'

class QuotaSalesPerson < Employee

  def initialize(last_name, first_name, position, base_salary, quota_bonus, quota_sales_target, gross_sale_value)
    @last_name          = last_name
    @first_name         = first_name
    @position           = position
    @base_salary        = base_salary
    @quota_bonus        = quota_bonus
    @quota_sales_target = quota_sales_target
    @tax_rate           = 0.3
    @gross_sale_value   = gross_sale_value
  end

  def gross_pay
    (@base_salary/12.0 + bonus).floor_to_penny
  end

  def bonus
    if @gross_sale_value > @quota_sales_target
      @quota_bonus
    else
      0.0
    end
  end
end
