require_relative 'employee.rb'

class Owner < Employee

  def initialize(last_name, first_name, position, base_salary, owner_bonus, owner_sales_target, total_gross_sales)
    @last_name          = last_name
    @first_name         = first_name
    @position           = position
    @base_salary        = base_salary
    @owner_bonus        = owner_bonus
    @owner_sales_target = owner_sales_target
    @tax_rate           = 0.3
    @total_gross_sales  = total_gross_sales
  end

  def gross_pay
    (@base_salary/12.0 + bonus).floor_to_penny
  end

  def bonus
    if @total_gross_sales > @owner_sales_target
      @owner_bonus
    else
      0.0
    end
  end
end
