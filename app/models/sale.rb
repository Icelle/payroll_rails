require 'csv'

class Sale
  attr_reader :gross_sale_value
  def initialize(gross_sale_value)
    @gross_sale_value = gross_sale_value
  end

  def self.load(filename = './assets/sales_data.csv')
    sales_data = {}
    csv_table = CSV.table(filename).to_a
    csv_table.delete_at(0)
    csv_table.each do |row|
      last_name             = row[0]
      gross_sale_value      = row[1]
      sales_data[last_name] ||= []
      sales_data[last_name] << Sale.new(gross_sale_value)
    end
    sales_data
  end
end
