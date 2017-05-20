class User < ActiveRecord::Base
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  # Usuário recebendo montagem de uploader
  mount_uploader :photo, PhotoUploader

  # Injeção de funções de auditória
  audited
  is_impressionable
  
  # Relacionamentos
  belongs_to :user_group
  belongs_to :district
  has_many :user_permissions

  def active_for_authentication? 
    super && approved? 
  end 

  def inactive_message 
    if !approved? 
      :not_approved 
    else 
      super # Use whatever other message 
    end 
  end

  def self.send_reset_password_instructions(attributes={})
    recoverable = find_or_initialize_with_errors(reset_password_keys, attributes, :not_found)
    if !recoverable.approved?
      recoverable.errors[:base] << I18n.t("devise.failure.not_approved")
    elsif recoverable.persisted?
      recoverable.send_reset_password_instructions
    end
    recoverable
  end
  
  # Função de verificação de permissão dentro do módulo
  # da aplicação
  # Exemplo:
  # =>  segment = :person
  # =>  permission = :create
  
  def permission_segment? segment, permission
    segment = Segment.where name: segment
    permission = Permission.where name: permission
    unless user_group.group_permissions.where(segment: segment, permission: permission).empty?
      return true
    end
    
    unless user_permissions.where(segment: segment, permission: permission).empty? 
      return true
    end  
    
    return false
  end
  
end
