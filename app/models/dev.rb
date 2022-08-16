class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one?(item_name)
        self.freebies.any?{ |freebie| freebie.item_name.downcase == item_name.downcase }
    end

    def give_away(dev, freebie)
        freebie.update(dev_id: dev.id) unless freebie.dev != self
    end
end
