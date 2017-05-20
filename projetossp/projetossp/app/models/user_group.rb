class UserGroup < ActiveRecord::Base
    # UserGroup define a função do Usuário dentro do sistema,
    # atributo function define o cargo e o 
    # atributo level o nível dele dentro do sistema (Ainda a definir essa lógica de nível)
    
    # Caso seja necessário adicionar mais profissões 
    # acrecente a direita do enum
    # Exemplo: 
    # =>    enum function: { agente: 0, perito: 1 }
    # =>    enum function:  { agente: 0, perito: 1, delegado: 2 } 
    # Não mude a chave de elementos já existem!
    
    enum function: { agente: 0, perito: 1, delegado: 2, administrador: 3 }
    
    # Injeção de funções de auditória
    audited
    is_impressionable
    
    # Relacionamentos
    has_many :group_permissions
    has_many :users
end
