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

  private
  
  def show_spinner(msg_start, msg_end = "(Concluído com sucesso!)")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end
end
