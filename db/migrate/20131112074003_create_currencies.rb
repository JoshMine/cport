class CreateCurrencies < ActiveRecord::Migration
  def up

    create_table :currencies do |t|
      t.string :name
      t.string :symbol
      t.boolean :enabled, null: false, default: true

      t.timestamps
    end

    [
        {name: 'USD', symbol: '$', enabled: true},
        {name: 'RUB', symbol: 'руб', enabled: true},
        {name: 'EURO', symbol: '&euro;', enabled: true}
    ].each do |curr|
      Currency.create(curr)
    end
  end

  def down
    drop_table :currencies
  end
end
