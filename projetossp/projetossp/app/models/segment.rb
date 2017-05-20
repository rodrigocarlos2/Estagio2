class Segment < ActiveRecord::Base
    # Segment classe responsável por de guarda informações
    # sobre os nomes dos modelos do sistema
    # Padrão de nomeclatura inglês e caixa baixa
    # Exemplo:
    # =>    Modelo Person
    # =>    Segment.new name: 'person', description: 'Módulo de pessoa'
    
    # Injeção de funções de auditória
    audited
    is_impressionable

    # Relacionamentos
    has_many :user_permissions
    has_many :group_permissions
end
