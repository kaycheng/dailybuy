class AddUserIdOnProducts < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :user, index: true
  end
end
