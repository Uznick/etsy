module Etsy
  class Inventory

    include Etsy::Model

    attributes :product_id, :property_values, :sku, :offerings, :is_deleted

    def self.get_by_listing(listing_id, options={})
      endpoint = "/listings/#{listing_id}/inventory"

      response = Request.get(endpoint, options)
      # print '???????????????????????'
      # print response.result
      # print '???????????????????????'
      result = response.result['products']

      result.map do |data|
        print "\n########################\n"
        print data
        print "\n########################\n"

        if options[:access_token] && options[:access_secret]
          new(data, options[:access_token], options[:access_secret])
        else
          new(data)
        end
      end
    end
  end
end