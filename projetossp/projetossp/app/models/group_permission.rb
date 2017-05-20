class GroupPermission < ActiveRecord::Base
  
  # GroupPermission entidade que consende permissão
  # de um grupo expecífico a um módulo
  # Exemplo:
  # =>  UserGroup.new = delegado
  # =>  Segment.new = person
  # =>  Permission = index
  
  # Injeção de funções de auditória
  audited
  is_impressionable
  
  # Relacionamentos
  belongs_to :user_group
  belongs_to :segment
  belongs_to :permission
end
