class OwnerController < ApplicationController
	def change
    create_table :owners do |t|
      t.string :owner
      t.string :entries

      t.timestamps null: false
    end
  end

end

def index
  	@owners = Owners.all
  	@entries = Entries.all
  end

def owner_total
  	@owner = Owner.find(params[:id])
  end  
end
