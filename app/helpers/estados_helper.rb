module EstadosHelper
  def options_estados(opts = { prioridade: true })
    return Estado.order(:uf).pluck(:descricao, :id)
    # return Estado.order(:uf).pluck(:descricao, :uf) unless opts[:prioridade]

    uf_sistema = Estado.where(uf: Configuracao.get('uf')).pluck(:descricao, :id)
    demais_ufs = Estado.where.not(uf: Configuracao.get('uf'))
                       .order(:uf).pluck(:descricao, :id)
    uf_sistema + demais_ufs
  end
end
