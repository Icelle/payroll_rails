require 'pry'
require_relative 'employee.rb'
require_relative 'sale.rb'
require_relative 'commission_sales_person.rb'
require_relative 'quota_sales_person.rb'
require_relative 'owner.rb'

class PrintPayroll
  def initialize
    @employees = Employee.load
  end

  def print
    @employees.each do |employee|
      puts employee.print
    end
    return nil
  end
end

PrintPayroll.new.print
