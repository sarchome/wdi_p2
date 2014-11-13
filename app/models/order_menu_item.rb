class OrderMenuItem
    include Mongoid::Document
    include Mongoid::Timestamps
    field :quantity, type: Integer
    belongs_to :order, autosave: true
    belongs_to :menu_item
end