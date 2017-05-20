class ResquestCriminal < ActiveRecord::Base
  
  enum status: {aberto: 0, em_andamento:1, finalizado: 2} 
  
  # Injeção de funções de auditória
  audited
  is_impressionable
  
  # Relacionamentos
  belongs_to :user
  belongs_to :person
  belongs_to :resquest_type
  belongs_to :district_resquest, class_name: 'District', :foreign_key => 'district_resquest_id'
  belongs_to :district_send, class_name: 'District', :foreign_key => 'district_send_id'
  has_many :question_resquest_criminals
  has_many :questions, through: :question_resquest_criminals
  
  # Retrições de criação e atualização
  validates :district_send, presence: true
  validates :district_resquest, presence: true
  validates :person, presence: true
end
