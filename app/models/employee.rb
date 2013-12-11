require 'csv'
class Employee
  def initialize(last_name, first_name, position, base_salary)
    @last_name   = last_name
    @first_name  = first_name
    @position    = position
    @base_salary = base_salary
    @tax_rate    = 0.3
  end

  def self.load(filename = './assets/employees.csv')
    sales = Sale.load
    employee_info = []
    csv_table = CSV.table(filename).to_a
    csv_table.delete_at(0)
    csv_table.each do |row|
      last_name          = row[0]
      first_name         = row[1]
      position           = row[2]
      base_salary        = row[3]
      commission_rate    = row[4]
      quota_bonus        = row[5]
      quota_sales_target = row[6]
      owner_bonus        = row[7]
      owner_sales_target = row[8]
      case position
      when 'commission'
        if sales.key?(last_name)
          gross_sale_value = sales[last_name].reduce(0) {|gross, sale| gross + sale.gross_sale_value}
        else
          gross_sale_value = 0
        end
        employee = CommissionSalesPerson.new(last_name, first_name, position, base_salary, commission_rate, gross_sale_value)
      when 'quota'
        if sales.key?(last_name)
          gross_sale_value = sales[last_name].reduce(0) {|gross, sale| gross + sale.gross_sale_value}
        else
          gross_sale_value = 0
        end
        employee = QuotaSalesPerson.new(last_name,first_name,position,base_salary,quota_bonus,quota_sales_target,gross_sale_value)
      when 'owner'
        total_gross_sales = 0
        sales.each do |last_name, sales_array|
          total_gross_sales += sales[last_name].reduce(0){|gross, sale| gross + sale.gross_sale_value}
        end
        employee = Owner.new(last_name, first_name, position, base_salary, owner_bonus, owner_sales_target, total_gross_sales)
      else
        employee = Employee.new(last_name,first_name,position,base_salary)
      end
      employee_info << employee
    end
    employee_info
  end

  def gross_salary
    (@base_salary/12.0).floor_to_penny
  end

  def net_pay
    (gross_salary * (1.0 - @tax_rate)).floor_to_penny
  end

  def print
    puts "***#{@first_name} #{@last_name}***"
    puts "Gross Salary: $#{gross_salary}"
    if !commission.nil?
      puts "Commission: $#{commission}"
    end
    if !bonus.nil?
      puts "Bonus: $#{bonus}"
    end
    puts "Net Pay: $#{net_pay}"
    puts "***"
  end

  def commission
    nil
  end

  def bonus
    nil
  end

end

class Float
  def floor_to_penny
    (self*100).floor.to_f/100
  end
end

