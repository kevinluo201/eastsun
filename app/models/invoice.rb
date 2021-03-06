class Invoice < ApplicationRecord
  has_many :invoice_details, dependent: :destroy
  belongs_to :customer

  validates :customer, presence: true

  def calculate_total!
    self.total = invoice_details.reduce(0) {|sum, detail| sum += detail.total }
    save!
  end
end
