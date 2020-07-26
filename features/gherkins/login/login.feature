# encoding: utf-8
# language:pt

@validar_login
Funcionalidade: Login - validar tela de login no site
  Eu como usuário do site
  Quero validar o login do aplicativo
  Para que eu possa ter acesso a loja e meus produtos comprados

  Contexto: Acessar a tela home principal
    * acessar a home do site

  @#francllin_rios
  @%login
  @login_valido
  Esquema do Cenário: Validar login com sucesso no site
    Quando realizar o login com usuário "<tipo_acesso>"
    Então validar o login com sucesso

  # (se caso utilizar o login do cadastro, será um diferencial/plus)
  @login_usuario_gerado_no_cadastro
    Exemplos:
      | tipo_acesso |
      | email       |

  # Login Sucesso
  @login_usuario_email_local
    Exemplos:
      | tipo_acesso                     |
      | adriana.gibson@grant-rippin.com |

  @#francllin_rios
  @%login
  @login_invalido
  Cenário: Validar login invalido
    Quando realizar o login com usuário "tdriana.gibson@grant-rippin.com"
    Então validar a mensagem de erro de login invalido

  @#francllin_rios
  @%login
  @login_em_branco
  Cenário: Validar login em branco
    Quando clicar no botão sign in no login
    Então validar a mensagem de erro de login em branco