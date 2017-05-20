class UserPermission < ActiveRecord::Base
  
  # Classe responsável por fazer a permissão personalizavél
  # Exemplo:
  # =>  User: 'josafa@email.com'
  # =>  Segment: 'person'
  # =>  Permission: 'index'
  
  belongs_to :user
  belongs_to :segment
  belongs_to :permission
  
  # Injeção de funções de auditória
  audited
  is_impressionable
  
end
