class Report < ActiveRecord::Base
  
  # Injeção de funções de auditória
  audited
  is_impressionable
  
  # Relacionamentos  
  has_many :image_reports, :dependent => :destroy
  has_many :answers
  belongs_to :resquest_criminal
  belongs_to :user

  # Atributos complextos inseridos no formulário do Report
  accepts_nested_attributes_for :image_reports, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true
end
