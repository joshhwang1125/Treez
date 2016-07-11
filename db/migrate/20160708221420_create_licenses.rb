class CreateLicenses < ActiveRecord::Migration
  def change
    create_table :licenses do |t|
      t.string :body, null: false
      t.string :intro
      t.string :DL
      t.string :DLD
      t.string :DBA
      t.string :DCS
      t.string :DCT
      t.string :DBD
      t.string :DBB
      t.string :DBC
      t.string :DAY
      t.string :DAU
      t.string :DAG
      t.string :DAI
      t.string :DAJ
      t.string :DAK
      t.string :DAQ
      t.string :DCF
      t.string :DCG
      t.string :DCH
      t.string :DAZ
      t.string :DCU

      t.timestamps null: false
    end
  end
end
