class SalesController < ApplicationController
  def index
    # make your sales objects available to the correlating view here
    @sales = ((Employee.load(Rails.root.to_s+"/app/assets/csv/employees.csv", Rails.root.to_s+"/app/assets/csv/sales_data.csv").find_all {|e| !e.sales.nil?}).map{|employee| employee.sales}).flatten
  end
end
