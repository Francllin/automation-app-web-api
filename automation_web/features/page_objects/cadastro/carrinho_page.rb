module Pages
  class Cadastro < SitePrism::Page

    element :btn_create_an_account, '#SubmitCreate'
    element :inpt_email_create, '#email_create'

    element :inpt_genero_mr, '#uniform-id_gender1'
    element :inpt_genero_mrs, '#uniform-id_gender2'
    element :inpt_customer_firstname, '#customer_firstname'
    element :inpt_customer_lastname, '#customer_lastname'
    element :inpt_passwd, '#passwd'
    element :slc_days, '#uniform-days'
    element :slc_months, '#uniform-months'
    element :slc_years, '#uniform-years'

    element :inpt_address1, '#address1'
    element :inpt_city, '#city'
    element :slc_state, '#uniform-id_state'
    element :inpt_postcode, '#postcode'
    element :inpt_country, '#uniform-id_country'
    element :inpt_phone_mobile, '#phone_mobile'
    element :inpt_alias, '#alias'
    element :btn_submit_account, '#submitAccount'

    element :txt_account, '#my-account'

    def cadastar_usuario(**options)
      informar_dados_pessoais(options)
      informar_dados_endereco(options)
      btn_submit_account.click
    end

    def informar_dados_pessoais(**options)
      scroll_to_top
      await(30) { inpt_genero_mr.visible? }
      inpt_genero_mr.click
      scroll_to inpt_customer_firstname
      inpt_customer_firstname.set(options[:customer_firstname])
      inpt_customer_lastname.set(options[:customer_lastname])
      inpt_passwd.set(options[:passwd])
      scroll_to slc_days
      slc_days.select(options[:days])
      slc_months.select(options[:months])
      slc_years.select(options[:years])
    end

    def informar_dados_endereco(**options)
      scroll_to inpt_address1
      await(30) { inpt_address1.visible? }
      inpt_address1.set(options[:address1])
      scroll_to inpt_city
      inpt_city.set(options[:city])
      slc_state.select(options[:state])
      inpt_postcode.set(options[:postcode])
      scroll_to inpt_country
      inpt_country.set(options[:country])
      inpt_phone_mobile.set(options[:phone_mobile])
      inpt_alias.set(options[:alias])
      scroll_to btn_submit_account
    end
  end
end
