# == Schema Information
#
# Table name: usuarios
#
#  id                            :integer          not null, primary key
#  acesso_controle_fisico        :boolean
#  acesso_limitado_cartorio      :boolean
#  activated_at                  :datetime
#  activation_code               :string(40)
#  admin                         :boolean          default(FALSE)
#  administrador_cartorio        :boolean
#  bloquear_cartorio             :boolean
#  cadastra_selo_excecao         :boolean
#  celular                       :string
#  certisign_login               :boolean          default(FALSE)
#  chat                          :boolean          default(TRUE)
#  confirmation_sent_at          :datetime
#  confirmation_token            :string(255)
#  confirmed_at                  :datetime
#  cpf                           :string
#  crypted_password              :string(40)
#  current_sign_in_at            :datetime
#  current_sign_in_ip            :string(255)
#  email                         :string(100)
#  encrypted_password            :string(128)      default(""), not null
#  entidade_type                 :string(255)
#  failed_attempts               :integer          default(0), not null
#  flag_cadastro_de_msg          :boolean
#  flag_ressarcimento_save       :boolean
#  flag_ressarcimento_view       :boolean
#  flag_usuario_capital          :boolean
#  flg_admin_crv                 :boolean
#  flg_alterar_data_autenticacao :boolean
#  gerente_financeiro_entidade   :boolean          default(FALSE)
#  gerente_financeiro_master     :boolean          default(FALSE)
#  last_sign_in_at               :datetime
#  last_sign_in_ip               :string(255)
#  locked_at                     :datetime
#  login                         :string(255)
#  master                        :boolean
#  name                          :string(100)      default("")
#  password_salt                 :string(255)      default(""), not null
#  primeiro_acesso               :boolean
#  remember_created_at           :datetime
#  remember_token                :string(40)
#  remember_token_expires_at     :datetime
#  reset_password_sent_at        :datetime
#  reset_password_token          :string(255)
#  roles_mask                    :integer
#  roles_string                  :text             default("")
#  salt                          :string(40)
#  sign_in_count                 :integer          default(0), not null
#  supervisor_entidade           :boolean          default(FALSE)
#  supervisor_master             :boolean          default(FALSE)
#  telefone                      :string
#  unlock_token                  :string(255)
#  visualizar_bloqueio           :boolean
#  created_at                    :datetime
#  updated_at                    :datetime
#  cartorio_id                   :integer
#  entidade_id                   :integer
#
# Indexes
#
#  index_usuarios_on_cartorio_id           (cartorio_id)
#  index_usuarios_on_login                 (login) UNIQUE
#  index_usuarios_on_reset_password_token  (reset_password_token) UNIQUE
#  index_usuarios_on_unlock_token          (unlock_token) UNIQUE
#
module UsuariosHelper

  def usuario_avatar(usuario, size = 100)
    if usuario.avatar.attached?
      usuario.avatar.variant(resize: "#{size}x#{size}!")
    else
      '/assets/avatar/one.png'
    end
  rescue StandardError => e
    logger.info e
    '/assets/avatar/one.png'
  end

  def usuario_descricao_bloqueio(usuario)
    usuario.locked_at? ? 'desbloquear' : 'bloquear'
  end

  def usuario_confirmar_bloqueio(usuario)
    "Tem certeza que deseja #{usuario_descricao_bloqueio(usuario)} o usuário <b>#{usuario.login}</b> ?"
  end

  def usuario_confirmar_logar_como(usuario)
    "Tem certeza que deseja acessar o sistema como '#{usuario.login}' ? </br></br>" \
      'Lembre-se de usar essa ferramenta apenas para realizar consultas com a visualização do Cartório !'
  end

  def badge_grupos_usuario(usuario)
    badge = []
    usuario.grupos.distinct(true).each do |grupo|
      badge << badge_grupo(grupo)
    end
    badge
  end

  # Grupos
  # 1 - Administrador [CARTORIO]
  # 2 - Financeiro [CARTORIO]
  # 3 - Rec de Firma [CARTORIO]
  # 4 - Registro [CARTORIO]
  # 5 - Financeiro [SINDICATO]
  # 6 - Atendimento [SINDICATO]
  # 7 - Mondrian [MONDRIAN]
  # 8 - Atendimento Mondrian [MONDRIAN]
  def badge_grupo(grupo)
    tag = case grupo.id
          when 1, 5 then 'badge-primary'
          when 2, 6 then 'badge-danger'
          when 3, 7 then 'badge-info'
          when 4, 8 then 'badge-success'
          else 'badge-dark'
          end

    content_tag :span, grupo.descricao, class: "badge #{tag} mr-1 mb-1"
  end
end


  IDS_ANOREG = [5, 6].freeze
  IDS_MONDRIAN = [7, 8].freeze
  IDS_CART_MASTER = [1, 2, 3, 4].freeze
