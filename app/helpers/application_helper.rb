# frozen_string_literal: true

# Helpers Genericos utilizados no sistema
module ApplicationHelper
  def action_cable?
    action_name.eql?('acompanhar') ||
      action_name.eql?('acompanhar_envio_detran')
  end

  def btn_class(options = [:default], rounded = true)
    btn = 'btn mr-0'
    btn += ' rounded-pill' if rounded
    options = [options] unless options.is_a?(Array)

    options.each do |option|
      btn += (' btn-' + option.to_s)
    end
    # btn += (' float-' + align.to_s) if align
    btn
  end

  def btn_class_border(border, options = %i[light block])
    btn = btn_class(options, false)
    btn + " btn-sm border-left-#{border} text-left font-weight-bold"
  end

  def icon_conexao_detran
    if Rails.env.production? && DETRAN::Detran.ws_code.eql?('200')
      titulo = 'Conectado ao DETRAN-RJ'
      icon = :wifi
    else
      titulo = 'SEM Comunicação com DETRAN-RJ'
      icon = :'wifi-off'
    end

    content_tag(:a, svg_icon(icon), href: '#', class: 'nav-link dropdown-toggle',
                                    title: titulo,
                                    data: { toggle: 'tooltip', placement: 'bottom' })
  end

  def options_months
    Date::MONTHNAMES.compact.each_with_index.collect { |m, i| [m, i + 1] }
  end

  def pattern(tipo = nil)
    case tipo
    when :data     then '^[0-9]{2}\/[0-9]{2}\/[0-9]{4}$'
    when :cep      then '^[0-9]{5}-[0-9]{3}$'
    when :valor    then '((^[0-9]+$)|(^[0-9]+\\.{1}[0-9]+$))'
    when :numero   then '[0-9]+'
    when :email    then '[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+'
    when :telefone then '\([0-9]{2}\) [2-9]{1} [0-9]{4}-[0-9]{4}'
    when :youtube  then 'http://www\.youtube\.com\/watch(.+)|https://www\.youtube\.com\/watch(.+)'
    when :cpf      then '([0-9]{3}[\.]?[0-9]{3}[\.]?[0-9]{3}[-]?[0-9]{2})'
    when :cnpj     then '([0-9]{2}[\.]?[0-9]{3}[\.]?[0-9]{3}[\/]?[0-9]{4}[-]?[0-9]{2})'
    when :uf       then '^[a-zA-Z]{2}'
    else '*'
    end
  end

  def placeholder(tipo  = nil)
    case tipo
    when :data    then '99/99/9999'
    when :valor   then '99.99'
    when :cep     then '99999-999'
    when :cpf     then '999.999.999-99'
    when :cnpj    then '99.999.999/9999-99'
    when :uf      then 'XX'
    when :youtube then 'https://www.youtube.com/watch?v=XXXXXXXXXXX'
    else ''
    end
  end

  def namespace
    controller_name_segments = params[:controller].split('/')
    controller_name_segments.pop
    controller_name_segments.join('/').downcase
  end

  def title_page
    title = ''
    title += namespace + '.'       if namespace.present?
    title += controller_name + '.' if controller_name
    title += action_name + '.'     if action_name
    title += 'title'

    title.gsub('/', '.')
  end

  def ransack_sort(model_class, coluna, ordem)
    sort_link @q, coluna, model_class.human_attribute_name(coluna), default_order: ordem
  end

  def render_haml(haml, locals = {})
    Haml::Engine.new(haml.strip_heredoc, format: :html5).render(self, locals)
  end

  def render_imagem_valida?(content_type)
    !content_type.match(/image/).nil?
  end
end
