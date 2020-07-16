class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.string :title
      t.string :request_type
      t.string :description
      t.string :location
      t.boolean :fulfilled, :default => false

      t.timestamps
    end
  end
end
