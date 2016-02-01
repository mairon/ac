class AddDefFormatToStandardExchanges < ActiveRecord::Migration
  def change
    add_column :standard_exchanges, :def_format, :integer, default: 0
  end
end
