class WelcomeController < ApplicationController
  def index
    # @meu_nome = params[:nome]
    @nome = "Mathias"
    @curso = "Rails"
  end
end
