class EmployeesController < ApplicationController
  def index
    @employees = Employee.load(Rails.root.to_s+"/app/assets/csv/employees.csv", Rails.root.to_s+"/app/assets/csv/sales_data.csv")
    # byebug
    # make your employee objects available to the correlating view here
  end
end
