Quando('realizar o login com usuário {string}') do |tipo|
  email = tipo.eql?('email') ? buscar_massa(tipo, true) : tipo
  options = {email: email,
             senha: buscar_massa('dados_pessoais senha')}
  home_page.btn_sign_in.click
  login.logar_no_site(options)
end

Então('validar o login com sucesso') do
  await(30) { cadastro.txt_account.visible? }
  expect(cadastro.txt_account.visible?).to be_truthy
end

Então('validar a mensagem de erro de login invalido') do
  await(30) { login.txt_alet.visible? }
  expect(login.txt_alet.text).to include('Authentication failed.')
end

Dado('clicar no botão sign in no login') do
  await(30) { home_page.btn_sign_in.visible? }
  home_page.btn_sign_in.click
  await(30) { login.inpt_sign_in.visible? }
  login.inpt_sign_in.click
end

Então('validar a mensagem de erro de login em branco') do
  await(30) { login.txt_alet.visible? }
  expect(login.txt_alet.text).to include('An email address required.')
end
