module Spree
  Taxon.class_eval do
    alias_method :original_applicable_filters, :applicable_filters

    def applicable_filters
      fs = original_applicable_filters

      fs = fs.reject{|f| f[:scope] == :price_range_any}

      fs << SpreePriceSlider.price_slider_filter(self.product_ids) if SpreePriceSlider.respond_to?(:price_slider_filter)

      fs
    end
  end
end
