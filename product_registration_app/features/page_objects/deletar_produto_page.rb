module Produto
  class Deletar
    attr_accessor :btn_deletar,
                  :btn_sim

    def initialize
      @btn_deletar = 'br.com.pztec.estoque:id/deletar'
      @btn_sim = 'android:id/button1'
    end
  end
end
