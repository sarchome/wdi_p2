class Order
    include Mongoid::Document
    include Mongoid::Timestamps
    field :status, type: String
    field :ordered_at, type: DateTime
    field :order_completed_at, type: DateTime
    belongs_to :user, autosave: true
    belongs_to :restaurant, autosave: true
    has_many :order_menu_items, autosave: true

    def total
        total = 0
        temp = self.order_menu_items
        temp.each do |x|
            if !x.menu_item.price.nil?
                total += x.menu_item.price
        # prices = self.order_menu_items.collect {|item| item.menu_item.price}
        # order_total = prices.inject(0,:+)
            end
        end
        return total
    end

end