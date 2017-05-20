class Question < ActiveRecord::Base
    
    # Injeção de funções de auditória
    audited
    is_impressionable
    
    # Relacionamentos
    belongs_to :resquest_type
    has_many :question_resquest_criminals
    has_many :resquest_criminals, through: :question_resquest_criminals
end
