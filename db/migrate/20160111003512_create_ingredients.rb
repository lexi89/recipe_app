class CreateRecipeStyles < ActiveRecord::Migration
  def change
    create_table :recipe_styles do |t|
      t.integer :ingredient_id
      t.integer :recipe_id
    end
  end
end
