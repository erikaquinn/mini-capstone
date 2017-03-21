class Product < ApplicationRecord
  belongs_to :supplier

  def tax
    return price * 0.09
  end

  def total
    return price + tax
  end

  def discounted?
    return price < 10
  end

#  def supplier
#    Supplier.find_by(id: self.supplier_id)
#  end
end
