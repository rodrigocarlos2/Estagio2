class QuestionResquestCriminal < ActiveRecord::Base
  
  # Injeção de funções de auditória
  audited
  is_impressionable
    
  # Relacionamentos
  belongs_to :question
  belongs_to :resquest_criminal
  
end
