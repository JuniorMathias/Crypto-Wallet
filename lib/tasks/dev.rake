namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
   if Rails.env.development?

    show_spinner("Apagando BD ...") {puts %x(rails db:drop)}

    show_spinner("Criando BD ...")  {puts %x(rails db:create)}

    show_spinner("Migrando BD ...") {puts %x(rails db:migrate)}

    show_spinner("Populando BD ...") {puts %x(rails db:seed)}

   else
      puts "Você não está em ambiente de desenvolvimento"
   end
  end


  desc "Cadastra as Moedas"
  task add_coins: :environment do
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
  end

  private
  
  def show_spinner(msg_start, msg_end = "(Concluído com sucesso!)")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end
end
