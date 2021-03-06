class CreateRedactorAssets < ActiveRecord::Migration
  def self.up
    create_table :redactor_assets do |t|
      # Change column name and override Redactor3Rails.devise_user_key
      t.integer :user_id

      t.string :custom_file_name
      t.string :data_file_name, :null => false
      t.string :data_content_type
      t.integer :data_file_size

      t.integer :assetable_id
      t.string :assetable_type, :limit => 30
      t.string :type, :limit => 30

      t.integer :width
      t.integer :height

      t.timestamps
    end

    add_index 'redactor_assets', ['assetable_type', 'type', 'assetable_id'], :name => 'idx_redactor_assetable_type'
    add_index 'redactor_assets', ['assetable_type', 'assetable_id'], :name => 'idx_redactor_assetable'
  end

  def self.down
    drop_table :redactor_assets
  end
end
