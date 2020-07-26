Dado("acessar a home do site") do
  await(30) { home_page.btn_sign_in.visible? }
end

Dado('clicar no botão Create an account') do
  home_page.btn_sign_in.click
  scroll_to cadastro.inpt_email_create
  await(30) { cadastro.btn_create_an_account.visible? }
  cadastro.inpt_email_create.set(gerar_email)
  await(30) { cadastro.btn_create_an_account.visible? }
  cadastro.btn_create_an_account.click
end

Quando('informar os dados do cliente') do
  data = buscar_massa('dados_pessoais data_nascimento').split('/')
  @options = {customer_firstname: gerar_segundo_nome,
              customer_lastname: gerar_segundo_nome,
              passwd: buscar_massa('dados_pessoais senha'),
              address1: buscar_massa('dados_pessoais endereco'),
              city: buscar_massa('dados_pessoais cidade'),
              state: buscar_massa('dados_pessoais estado'),
              postcode: buscar_massa('dados_pessoais cep'),
              country: buscar_massa('dados_pessoais pais'),
              days: data[0],
              years: data[2],
              months: data[1],
              phone_mobile: buscar_massa('dados_pessoais numero_celular'),
              alias: gerar_alias}
  cadastro.cadastar_usuario(@options)
end

Então('validar o cadastro realizado com sucesso') do
  await(30) { cadastro.txt_account.visible? }
  aggregate_failures do
    expect(cadastro.txt_account.visible?).to be_truthy
    expect(page.text).to include "#{@options[:customer_firstname]} #{@options[:customer_lastname]}"
  end
end
