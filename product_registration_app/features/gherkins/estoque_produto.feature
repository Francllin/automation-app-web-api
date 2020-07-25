# encoding: utf-8
# language:pt

@app
@crud_cadastro_de_produtos
Funcionalidade: Cadastro de Produtos
  Eu como usuário do das plataformas Android
  Desejo fazer um cadastro, edição e exclusão de um produtos do estoque
  Para o controle do estoque

  @#francllin_rios
  @%cadastro_novo_produtos
  @validar_cadastro_novo_produtos
  Esquema do Cenário: Cadastrar um novo produto no estoque
    Dado esta na home do cadastro de produtos
    Quando incluir um novo produto
      | codigo   | unidade   |
      | <codigo> | <unidade> |
    Então validar que o produto foi cadastrado com sucesso

  @produto_arroz
    Exemplos:
      | codigo | unidade |
      | 1      | quilo   |

  @produto_agua
    Exemplos:
      | codigo | unidade |
      | 2      | litro   |

  @#francllin_rios
  @%cadastro_novo_produtos @%deletar_produto
  @gerar_cadastro_novo_produto
  @validar_exclusao_produto
  Cenário: Excluir um novo produto com sucesso
    Dado esta na home do cadastro de produtos
    Quando excluir um produto
    Então validar que o produto foi excluido com sucesso

  @#francllin_rios
  @%cadastro_novo_produtos @%editar_produto
  @gerar_cadastro_novo_produto
  @validar_edicao_produto
  Cenário: Editar um produto com sucesso
    Dado esta na home do cadastro de produtos
    Quando editar um produto
    Então validar que o produto foi editado com sucesso

