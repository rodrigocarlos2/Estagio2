class Person < ActiveRecord::Base
    
    # gender: 0 - Feminino / 1 - Masculino

    # Montador de imagem
    mount_uploader :photo, ImageUploader
    
    # Injeção de funções de auditória
    audited
    is_impressionable
    
    # Validates
    validates :name, presence: true
end
