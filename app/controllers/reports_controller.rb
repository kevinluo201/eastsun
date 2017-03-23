class ReportsController < ApplicationController
  def index
    @bought = Purchase.all.inject(0) { |sum, purchase| sum += purchase.price * purchase.amount }
    @sold = Invoice.all.inject(0) { |sum, invoice| sum += invoice.total }
    @total = @sold - @bought
  end
end
