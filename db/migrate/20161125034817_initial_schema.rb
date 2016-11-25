class InitialSchema < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.date :publication_date
      t.text :title
      t.text :journal
      t.text :type_of_work
      t.text :link
      t.text :bibliographic_entry
      t.text :language
      t.text :keywords
      t.timestamps null: false
    end

    create_table :authors do |t|
      t.text :first_name
      t.text :last_name
      t.timestamps null: false
    end

    create_table :authorings do |t|
      t.integer :author_id
      t.integer :work_id
    end

    add_foreign_key :authorings, :authors
    add_foreign_key :authorings, :works
  end
end
