class MenuItem
    include Mongoid::Document
    field :item, type: String
    field :price, type: Float
    # field :add_on_price, type: Float
    # field :add_on, type: Boolean
    field :category, type: String
    field :description, type: String
    field :photo, type: String
    has_and_belongs_to_many :restaurants, autosave: true

    def get_locations
        self.restaurants.collect {|r| r.city}
    end

end

