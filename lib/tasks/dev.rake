namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
   if Rails.env.development?

    show_spinner("Apagando BD ...") {puts %x(rails db:drop)}

    show_spinner("Criando BD ...")  {puts %x(rails db:create)}

    show_spinner("Migrando BD ...") {puts %x(rails db:migrate)}

    %x(rails dev:add_mining_types)
    %x(rails dev:add_coins)

   else
      puts "Você não está em ambiente de desenvolvimento"
   end
  end


  desc "Cadastra as Moedas"
  task add_coins: :environment do
    show_spinner("Cadastrando Moedas ...") do
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
        },
        { 
          description: "Iota",
          acronym: "IOT",
          url: "https://s2.coinmarketcap.com/static/img/coins/200x200/1720.png"
        },
        { 
          description: "ZCash",
          acronym: "ZEC",
          url: "https://www.cryptocompare.com/media/351360/zec.png"
        }

      ]

      coins.each do |coin| 
        Coin.find_or_create_by!(coin)
      end
    end
  end

  

  desc "Cadastra Tipo de mineração"
  task add_mining_types: :environment do
    show_spinner("Cadastrando tipos de mineração...") do
      mining_types = [
        {name: "Proof of Work", acronym: "PoW"},
        {name: "Proof of Stake", acronym: "PoS"},
        {name: "Proof of Capacity", acronym: "PoC"}
      ]
      
      mining_types.each do |mining_type|
        MiningType.find_or_create_by!(mining_type)
      end
    end
  end

  private
  
  def show_spinner(msg_start, msg_end = "(Concluído com sucesso!)")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end
end
