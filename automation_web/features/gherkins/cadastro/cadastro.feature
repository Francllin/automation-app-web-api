# encoding: utf-8
# language:pt

@web
@cadastro
Funcionalidade: Cadastro - validar cadastro no Web-Site
  Como futuro cliente da Web-Site
  Quero poder cadastrar meus dados no Web-Site
  De modo que possa usufruir do acesso ao Web-Site

  @#francllin_rios
  @%cadastro_sucesso
  @validar_novo_cadastro
  Cenário: Validar cadastro de um novo clientes
    Dado acessar a home do site
    E clicar no botão Create an account
    Quando informar os dados do cliente
    Então validar o cadastro realizado com sucesso
