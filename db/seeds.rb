# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

spinner = TTY::Spinner.new("[:spinner] Cadastrando as moedas...")
spinner.auto_spin
coins = [
  { 
    description: "Bitcoin",
    acronym: "BTC",
    url: "https://png.pngtree.com/png-vector/20220527/ourmid/pngtree-bitcoin-logo-design-template-png-image_4749408.png"
  },

  {
    description: "Ethereum",
    acronym: "ETH",
    url: "https://img1.gratispng.com/20180516/ouw/kisspng-ethereum-cryptocurrency-blockchain-logo-eos-io-crypto-5afc9ab9b20d86.8643914515265041217293.jpg"
  },
  
  {
    description: "Dash",
    acronym: "DSH",
    url: "https://www.pngall.com/wp-content/uploads/10/Dash-Crypto-Logo-PNG-Cutout.png"
  }

]

coins.each do |coin| 
  Coin.find_or_create_by!(coin)
end

spinner.success("(Moedas cadastradas com sucesso...)")