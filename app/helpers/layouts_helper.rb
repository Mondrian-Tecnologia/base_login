# frozen_string_literal: true

# Helpers Genericos utilizados para o Layout do sistema
module LayoutsHelper
  DEFAULT_OPTS = { class: 'tabler-icon' }.freeze
  def active?(hash = {})
    # caso hash[:controller] nao tenha sido enviado como array
    # cria o array com o proprio obj
    hash[:controller] = [hash[:controller]] unless hash[:controller].is_a?(Array)
    # return "#{hash[:controller]} - #{hash[:controller].include?(:cidades)}"
    # compara namespace
    return false     if hash[:namespace] && !hash[:namespace].eql?(namespace.to_sym)
    # compara controller
    return false unless hash[:controller].include?(controller_name.to_sym)
    # compara action
    return false unless hash[:action].eql?([:all]) || hash[:action].include?(action_name.to_sym)
    # retira as excecoes
    return false if hash[:except]&.include?(action_name.to_sym)

    'current'
  end

  def home_page?
    controller_name.eql?('home') && action_name.eql?('index')
  end

  def cpf_cnpj_formatado(cpf_cnpj = '')
    cpf_cnpj ||= ''
    cpf_cnpj = cpf_cnpj.gsub(/[^0-9]/, '').strip

    case cpf_cnpj.size
    when 11 then Cpf.new(cpf_cnpj).numero
    when 14 then Cnpj.new(cpf_cnpj).numero
    else cpf_cnpj
    end
  end

  def flash_message(obj = nil, msg = [])
    titulo = css = nil
    %i[notice alert error information].each do |flash_type|
      flash[flash_type] = params[flash_type] if params[flash_type].present?

      next unless flash[flash_type].present?

      titulo, css = flash_message_style(flash_type)
      msg = flash[flash_type].split('<br/>')
      flash[flash_type] = nil
    end
    if obj && !obj.errors.full_messages.blank?
      titulo, css = flash_message_style(:error)
      obj.errors.full_messages.uniq.each do |erro|
        msg << erro.to_s.gsub('base', '')
      end
    end
    # Se possuir mais de uma mensagem a ser exibida
    render_haml <<-HAML, msg: msg, titulo: titulo, css: css
      - msg.each do |texto|
        .div-flash
          %div{class: css}
            %span
              = titulo
              = texto
    HAML
  end

  def flash_dute_envio_pendente(dute = nil)
    return '' if DETRAN::Detran.ws_code.eql?('200')
    return '' if dute&.envio_pendente

    if dute
      if dute.status_was.eql?('conferencia')
        method = :post
        rota  = envio_pendente_cartorio_informacao_dute_path(dute)
        mensagem = 'Estamos sem comunicação com o DETRAN-RJ, porém você clicar aqui para ' \
                   'marcá-lo como Envio Pendente, ' \
                   'enviaremos a Informação quando restabelecida comunicação com o DETRAN.'
      else
        rota  = '#'
        mensagem = 'Estamos sem comunicação com o DETRAN-RJ, porém você pode preencher os campos, salvá-lo e ' \
                   'marcá-lo como Envio Pendente, ' \
                   'enviaremos a Informação quando restabelecida comunicação com o DETRAN.'
      end
    else
      rota = informar_pendente_cartorio_informacao_dutes_path
      mensagem = 'Clique aqui, caso deseje cadastrar um DUTe com Envio Pendente, ' \
                 'enviaremos a Informação quando restabelecida comunicação com o DETRAN.'
    end
    flash_info_notice(rota, mensagem, method)
  end

  def flash_info_notice(rota, mensagem, method = :get)
    render_haml <<-HAML, rota: rota, mensagem: mensagem, method: method
      = link_to rota, method: method do
        .div-flash
          .alert.alert-info
            %span
              Informativo:
              = mensagem
    HAML
  end

  def flash_message_style(flash_type)
    flash_data = { success:      ['Informação: ', 'alert alert-success'],
                   alert:        ['Atenção: ',    'alert alert-warning'],
                   warning:      ['Atenção: ',    'alert alert-warning'],
                   error:        ['Erros: ',      'alert alert-danger'],
                   information:  ['Nota: ',       'alert alert-info'],
                   notice:       ['Informação: ', 'alert alert-success'] }
    if flash_data[flash_type].present?
      flash_data[flash_type]
    else
      ['Nota: ', 'alert alert-default']
    end
  end

  def item_menu(titulo, icone, tipo = :default, url = '#layouts')
    if tipo.eql?(:default)
      render_haml <<-HAML, titulo: titulo, icone: icone, url: url
        %a.waves-effect.waves-light{href:  url}
          %i{class: icone}
          = titulo
          %i.chevron.ti-angle-right
      HAML
    else
      render_haml <<-HAML, titulo: titulo, icone: icone, url: url
        %a.waves-effect.waves-light{href:  url}
          %div{class: icone}
          .text-menu= titulo
          %i.chevron.ti-angle-right
      HAML
    end
  end

  def l(*args)
    return '' if args.first.nil?

    super(*args)
  end

  def ocultar_zero(value)
    return '' if value.to_i.zero?

    value
  end

  def portal_menus
    [
      ['Acesso ao sistema', new_usuario_session_path, { controller: 'sessions', action: :'new' }]
      # ['Consultar DUTe', dutes_path, { controller: 'dutes', action: :index }],
      # ['Cartórios Filiados', cartorios_path, { controller: 'cartorios', action: :index }],
      # ['Sobre Nós', sobre_nos_path, { controller: 'home', action: :sobre_nos }]
    ]
  end

  def svg_icon(icon, opts = {})
    opts = DEFAULT_OPTS if opts.blank?
    inline_svg_tag("tabler-icons/#{icon}.svg", opts)
  end

  def svg_sidebar(icon, opts = {})
    opts = { class: 'svg-sidebar', width: 20, height: 20 } if opts.blank?
    inline_svg_tag("svg-sidebar/#{icon}.svg", opts)
  end

  def tooltip(title, placement = :top)
    { data: { toggle: :tooltip, placement: placement }, title: title }
  end

  def top_menu_item_class
    classe = 'top-menu-item my-4 '
    classe += 'secondary' unless home_page?
    classe
  end

  def true_or_false(obj)
    obj ? 'Sim' : 'Não'
  end

  def options_true_or_false
    [['Sim', true], ['Não', false]]
  end

  def truncate_html(str, opts = {})
    truncate(strip_tags(str), opts)
  end
end
