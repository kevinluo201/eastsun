class Invoice < ApplicationRecord
  has_many :invoice_details, dependent: :destroy

  def calculate_total!
    self.total = invoice_details.reduce(0) {|sum, detail| sum += detail.total }
    save!
  end
end
