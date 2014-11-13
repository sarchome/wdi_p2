class Restaurant
    include Mongoid::Document
    field :name, type: String
    field :address, type: String
    field :city, type: String
    field :state, type: String
    field :zip, type: String
    field :phone, type: String
    field :email, type: String
    has_and_belongs_to_many :menu_items, autosave: true
    has_many :orders, autosave: true

    def remove_menu_item(item)
        self.menu_items.delete(item)
        self.save!
    end

end
