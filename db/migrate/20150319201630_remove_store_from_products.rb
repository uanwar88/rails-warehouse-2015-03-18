class RemoveStoreFromProducts < ActiveRecord::Migration
  def change
    remove_reference :products, :store, index: true
    remove_foreign_key :products, :stores
  end
end
