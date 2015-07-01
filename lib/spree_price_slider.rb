require 'spree_core'
require 'spree_price_slider/engine'

module SpreePriceSlider
  def self.price_slider_filter(product_ids)
    prices = Spree::Price.includes(variant: :product)
                         .where(spree_variants: {product_id: product_ids})
                         .where(currency: Spree::Config[:currency])

    minimum = (prices.minimum(:amount) || 0).floor.to_i
    maximum = (prices.maximum(:amount) || 0).ceil.to_i

    {
      name:    Spree.t(:price_slider),
      scope:   :price_slider,
      maximum: maximum,
      minimum: minimum,
      step:    1
    }
  end
end
