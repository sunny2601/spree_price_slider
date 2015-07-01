module Spree
  Product.class_eval do
    add_search_scope :price_slider do |rprices|
      price_range = rprices.split(',').inject{|s,e| s.to_i..e.to_i }

      scope = Spree::Price.arel_table[:amount].in(price_range)

      Spree::Product.joins(master: :default_price).where(scope)
    end
  end
end
