module Pages
  class Login < SitePrism::Page

    element :inpt_email, '#email'
    element :inpt_senha, '#passwd'
    element :inpt_sign_in, '#SubmitLogin'
    element :txt_alet, '#center_column > div.alert.alert-danger'

    def logar_no_site(**options)
      await(30) { inpt_email.visible? }
      inpt_email.set(options[:email])
      inpt_senha.set(options[:senha])
      scroll_to inpt_sign_in
      await(30) { inpt_sign_in.visible? }
      inpt_sign_in.click
    end
  end
end
