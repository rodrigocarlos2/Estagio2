# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Criando usuários"
user_administrador = User.create! name: 'Administrador', email: 'administrador@email.com', password: '12345678', password_confirmation: '12345678', approved: true
user_delegado = User.create! name: 'Delegado', email: 'delegado@email.com', password: '12345678', password_confirmation: '12345678', approved: true
user_perito = User.create! name: 'Perito', email: 'perito@email.com', password: '12345678', password_confirmation: '12345678', approved: true
user_perito2 = User.create! name: 'Perito', email: 'perito2@email.com', password: '12345678', password_confirmation: '12345678', approved: true
user_agente = User.create! name: 'Agente', email: 'agente@email.com', password: '12345678', password_confirmation: '12345678', approved: true
puts '
    email: administrador@email.com 
    senha: 12345678 
    email: delegado@email.com 
    senha: 12345678 
    email: perito@email.com 
    senha: 12345678 
    email: perito2@email.com
    senha: 12345678
    email: agente@email.com 
    senha: 12345678 '
    
puts 'Criando módulos'  
# Nome da classe ou modelo. 
# Ordem alfabetica
segment_auditor = Segment.create! name: 'auditor', description: 'Segmento ou nome dos módulos da aplicação: Auditoria'
segment_district = Segment.create! name: 'district', description: 'Segmento ou nome dos módulos da aplicação: Distrito'
segment_group_permission = Segment.create! name: 'group_permission', description: 'Segmento ou nome dos módulos da aplicação: Permissão de Grupo'
segment_image_report = Segment.create! name: 'image_report', description: 'Segmento ou nome dos módulos da aplicação: Imagem Laudo'
segment_image_for_report = Segment.create! name: 'image_for_report', description: 'Segmento ou nome dos módulos da aplicação: Imagem para laudo'
segment_person = Segment.create! name: 'person', description: 'Segmento ou nome dos módulos da aplicação: Pessoa'
segment_permission = Segment.create! name: 'permission', description: 'Segmento ou nome dos módulos da aplicação: Permissão'
segment_question = Segment.create! name: 'question', description: 'Segmento ou nome dos módulos da aplicação: Questão'
segment_question_resquest_criminal = Segment.create! name: 'question_resquest_criminal', description: 'Segmento ou nome dos módulos da aplicação: Resquisição Questão'
segment_report = Segment.create! name: 'report', description: 'Segmento ou nome dos módulos da aplicação: Laudo'
segment_resquest_criminal = Segment.create! name: 'resquest_criminal', description: 'Segmento ou nome dos módulos da aplicação: Requisição'
segment_segment = Segment.create! name: 'segment', description: 'Segmento ou nome dos módulos da aplicação: Módulo'
segment_user = Segment.create! name: 'user', description: 'Segmento ou nome dos módulos da aplicação: Usuário'
segment_user_group = Segment.create! name: 'user_group', description: 'Segmento ou nome dos módulos da aplicação: Grupo de Usuário'
segment_user_permission = Segment.create! name: 'user_permission', description: 'Segmento ou nome dos módulos da aplicação: Permissão de Usuário'
segment_resquest_type = Segment.create! name: 'resquest_type', description: 'Segmento ou nome dos módulos da aplicação: Tipo de requisição'

# Nome do método do controlador
puts 'Criando permissões'
permission_create = Permission.create! name: 'create', description: 'método create do controlador'
permission_destroy = Permission.create! name: 'destroy', description: 'método destroy do controlador'
permission_index = Permission.create! name: 'index', description: 'método index do controlador'
permission_show = Permission.create! name: 'show', description: 'método show do controlador'
permission_new = Permission.create! name: 'new', description: 'método new do controlador'
permission_update = Permission.create! name: 'update', description: 'método update do controlador'
permission_change_approved = Permission.create! name: 'change_approved', description: 'método update do controlador user'
permission_general = Permission.create! name: 'general', description: 'método update do controlador Report'

# Criando grupo de usuário
puts 'Criando grupo de usuário'
# Administrador
user_group_administrador_level_0 = UserGroup.create! function: 3, level: 0, description: 'Administrador'
# Agente
user_group_agente_level_0 = UserGroup.create! function: 0, level: 0, description: 'Agente 0'
#user_group_agente_level_1 = UserGroup.create! function: 0, level: 1, description: 'Agente 1'
#user_group_agente_level_2 = UserGroup.create! function: 0, level: 2, description: 'Agente 2'

# Delegado
user_group_delegado_level_0 = UserGroup.create! function: 2, level: 0, description: 'Delegado 0'
#user_group_delegado_level_1 = UserGroup.create! function: 2, level: 1, description: 'Delegado 1'
#user_group_delegado_level_2 = UserGroup.create! function: 2, level: 2, description: 'Delegado 2'

# Périto
user_group_perito_level_0 = UserGroup.create! function: 1, level: 0, description: 'Perito 0'
#user_group_perito_level_1 = UserGroup.create! function: 1, level: 1, description: 'Perito 1'
#user_group_perito_level_2 = UserGroup.create! function: 1, level: 2, description: 'Perito 2'

# Permissão de grupo
puts 'Adicionando permissões de grupo'
# Grupo Administrador
# Módulo Auditor
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_auditor, permission: permission_index
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_auditor, permission: permission_show
# Módulo District
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_district, permission: permission_create
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_district, permission: permission_destroy
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_district, permission: permission_index
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_district, permission: permission_show
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_district, permission: permission_new
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_district, permission: permission_update
# Módulo GroupPermission
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_group_permission, permission: permission_create
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_group_permission, permission: permission_destroy
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_group_permission, permission: permission_index
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_group_permission, permission: permission_show
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_group_permission, permission: permission_new
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_group_permission, permission: permission_update
# Módulo ImageReport
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_image_report, permission: permission_create
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_image_report, permission: permission_destroy
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_image_report, permission: permission_index
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_image_report, permission: permission_show
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_image_report, permission: permission_new
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_image_report, permission: permission_update
# Módulo ImageForReport
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_image_for_report, permission: permission_index
# Módulo Person
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_person, permission: permission_create
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_person, permission: permission_destroy
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_person, permission: permission_index
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_person, permission: permission_show
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_person, permission: permission_new
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_person, permission: permission_update
# Módulo Permission
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_permission, permission: permission_create
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_permission, permission: permission_destroy
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_permission, permission: permission_index
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_permission, permission: permission_show
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_permission, permission: permission_new
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_permission, permission: permission_update
# Módulo QuestionResquestCriminal
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_question_resquest_criminal, permission: permission_create
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_question_resquest_criminal, permission: permission_destroy
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_question_resquest_criminal, permission: permission_index
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_question_resquest_criminal, permission: permission_show
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_question_resquest_criminal, permission: permission_new
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_question_resquest_criminal, permission: permission_update
# Módulo Question
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_question, permission: permission_create
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_question, permission: permission_destroy
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_question, permission: permission_index
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_question, permission: permission_show
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_question, permission: permission_new
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_question, permission: permission_update
# Módulo Segment 
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_segment, permission: permission_create
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_segment, permission: permission_destroy
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_segment, permission: permission_index
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_segment, permission: permission_show
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_segment, permission: permission_new
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_segment, permission: permission_update
# Módulo User
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_user, permission: permission_create
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_user, permission: permission_destroy
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_user, permission: permission_index
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_user, permission: permission_show
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_user, permission: permission_new
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_user, permission: permission_update
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_user, permission: permission_change_approved
# Módulo UserGroup
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_user_group, permission: permission_create
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_user_group, permission: permission_destroy
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_user_group, permission: permission_index
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_user_group, permission: permission_show
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_user_group, permission: permission_new
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_user_group, permission: permission_update
# Módulo UserPermission
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_user_permission, permission: permission_create
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_user_permission, permission: permission_destroy
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_user_permission, permission: permission_index
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_user_permission, permission: permission_show
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_user_permission, permission: permission_new
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_user_permission, permission: permission_update

# Módulo Report
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_report, permission: permission_create
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_report, permission: permission_destroy
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_report, permission: permission_index
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_report, permission: permission_show
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_report, permission: permission_new
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_report, permission: permission_update
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_report, permission: permission_general

# Módulo ResquestCriminal
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_resquest_criminal, permission: permission_create
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_resquest_criminal, permission: permission_destroy
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_resquest_criminal, permission: permission_index
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_resquest_criminal, permission: permission_show
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_resquest_criminal, permission: permission_new
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_resquest_criminal, permission: permission_update
# Módulo ResquestType
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_resquest_type, permission: permission_create
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_resquest_type, permission: permission_destroy
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_resquest_type, permission: permission_index
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_resquest_type, permission: permission_show
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_resquest_type, permission: permission_new
GroupPermission.create! user_group: user_group_administrador_level_0, segment: segment_resquest_type, permission: permission_update

# Permissão de grupo
# Agente 
# Observação: Apenas agente level 0
# Módulo Person
GroupPermission.create! user_group: user_group_agente_level_0, segment: segment_person, permission: permission_index
GroupPermission.create! user_group: user_group_agente_level_0, segment: segment_person, permission: permission_show
# Módulo Report
GroupPermission.create! user_group: user_group_agente_level_0, segment: segment_report, permission: permission_index
GroupPermission.create! user_group: user_group_agente_level_0, segment: segment_report, permission: permission_show


# Permissão de grupo
# Delegado
# Observação: Apenas delegado level 0
GroupPermission.create! user_group: user_group_delegado_level_0, segment: segment_person, permission: permission_create
GroupPermission.create! user_group: user_group_delegado_level_0, segment: segment_person, permission: permission_destroy
GroupPermission.create! user_group: user_group_delegado_level_0, segment: segment_person, permission: permission_index
GroupPermission.create! user_group: user_group_delegado_level_0, segment: segment_person, permission: permission_show
GroupPermission.create! user_group: user_group_delegado_level_0, segment: segment_person, permission: permission_new
GroupPermission.create! user_group: user_group_delegado_level_0, segment: segment_person, permission: permission_update
# Módulo Report
GroupPermission.create! user_group: user_group_delegado_level_0, segment: segment_report, permission: permission_index
GroupPermission.create! user_group: user_group_delegado_level_0, segment: segment_report, permission: permission_show
GroupPermission.create! user_group: user_group_delegado_level_0, segment: segment_report, permission: permission_general
# Módulo ResquestCriminal
GroupPermission.create! user_group: user_group_delegado_level_0, segment: segment_resquest_criminal, permission: permission_create
GroupPermission.create! user_group: user_group_delegado_level_0, segment: segment_resquest_criminal, permission: permission_destroy
GroupPermission.create! user_group: user_group_delegado_level_0, segment: segment_resquest_criminal, permission: permission_index
GroupPermission.create! user_group: user_group_delegado_level_0, segment: segment_resquest_criminal, permission: permission_show
GroupPermission.create! user_group: user_group_delegado_level_0, segment: segment_resquest_criminal, permission: permission_new
GroupPermission.create! user_group: user_group_delegado_level_0, segment: segment_resquest_criminal, permission: permission_update
# Módulo Question
GroupPermission.create! user_group: user_group_delegado_level_0, segment: segment_question, permission: permission_create
GroupPermission.create! user_group: user_group_delegado_level_0, segment: segment_question, permission: permission_destroy
GroupPermission.create! user_group: user_group_delegado_level_0, segment: segment_question, permission: permission_index
GroupPermission.create! user_group: user_group_delegado_level_0, segment: segment_question, permission: permission_show
GroupPermission.create! user_group: user_group_delegado_level_0, segment: segment_question, permission: permission_new
GroupPermission.create! user_group: user_group_delegado_level_0, segment: segment_question, permission: permission_update

# Permissão de grupo
# Périto
# Observação: Apenas périto level 0
GroupPermission.create! user_group: user_group_perito_level_0, segment: segment_person, permission: permission_create
GroupPermission.create! user_group: user_group_perito_level_0, segment: segment_person, permission: permission_index
GroupPermission.create! user_group: user_group_perito_level_0, segment: segment_person, permission: permission_show
GroupPermission.create! user_group: user_group_perito_level_0, segment: segment_person, permission: permission_new
GroupPermission.create! user_group: user_group_perito_level_0, segment: segment_person, permission: permission_update

# Módulo Report
GroupPermission.create! user_group: user_group_perito_level_0, segment: segment_report, permission: permission_create
GroupPermission.create! user_group: user_group_perito_level_0, segment: segment_report, permission: permission_index
GroupPermission.create! user_group: user_group_perito_level_0, segment: segment_report, permission: permission_show
GroupPermission.create! user_group: user_group_perito_level_0, segment: segment_report, permission: permission_new
GroupPermission.create! user_group: user_group_perito_level_0, segment: segment_report, permission: permission_update
GroupPermission.create! user_group: user_group_perito_level_0, segment: segment_report, permission: permission_general
# Módulo ResquestCriminal
GroupPermission.create! user_group: user_group_perito_level_0, segment: segment_resquest_criminal, permission: permission_create
GroupPermission.create! user_group: user_group_perito_level_0, segment: segment_resquest_criminal, permission: permission_destroy
GroupPermission.create! user_group: user_group_perito_level_0, segment: segment_resquest_criminal, permission: permission_index
GroupPermission.create! user_group: user_group_perito_level_0, segment: segment_resquest_criminal, permission: permission_show
GroupPermission.create! user_group: user_group_perito_level_0, segment: segment_resquest_criminal, permission: permission_new
GroupPermission.create! user_group: user_group_perito_level_0, segment: segment_resquest_criminal, permission: permission_update

# Adicionando usuário a um grupo
puts 'Adicionando usuário a um grupo'
# User Administrador
user_administrador.user_group = user_group_administrador_level_0
user_administrador.save

# User Agente
user_agente.user_group = user_group_agente_level_0
user_agente.save

# User Delegado
user_delegado.user_group = user_group_delegado_level_0
user_delegado.save

# User Périto
user_perito.user_group = user_group_perito_level_0
user_perito.save
user_perito2.user_group = user_group_perito_level_0
user_perito2.save


puts 'Criando pessoas no sistema'
# gender: 0 - Feminino / 1 - Masculino
# Criando uma Pessoa para testar alguns módulos
person1 = Person.create! name: 'Pessoa da Silva', rg: '12345678', cpf: '12345678', gender: 1, phone: '1827121218', cell_phone: '12710928108'
person1.save

person2 = Person.create! name: 'Pessoa Moura Leal', rg: '11342898', cpf: '11281577678', gender: 1, phone: '18299922218', cell_phone: '127105536628'
person2.save

puts 'Criando um órgão no sistema'

# Criando uma Órgão para testar alguns módulos
district1 = District.create! name: 'Instituto Médico Legal', public_place: 'Logradouro', city: 'Teresina', state: 'Piauí', cep: '64600-000', phone: '89172182', email: 'iml@email.com', neighborhood: 'Bairro do IML'
district1.save

district2 = District.create! name: 'Departamento de Polícia Civil de Picos', public_place: 'Logradouro', city: 'Picos', state: 'Piauí', cep: '64620-000', phone: '8914472182', email: 'policiacivil@email.com', neighborhood: 'Bairro de Picos'
district2.save

# Adicionando endereço aos agentes
user_administrador.district = district2
user_administrador.save
user_agente.district = district2
user_agente.save
user_delegado.district = district2
user_delegado.save
user_perito.district = district1
user_perito.save
user_perito2.district = district1
user_perito2.save

# Adicionando tipos de resquisição
puts 'Adicionando tipos de requisição'
resquest_type_cadaverico = ResquestType.create! name: 'Cadavérico', description: 'Laudo cadavérico'
resquest_type_arma = ResquestType.create! name: 'Arma', description: 'Laudo arma'
resquest_type_corpo_de_delito = ResquestType.create! name: 'Corpo de Delito', description: 'Laudo corpo_de_delito'

# Adicionando perguntas padrões
puts "Adicionando questões ao sistema"
Question.create! description: 'Pergunta padrão cadaverico 1' , question_default: true, resquest_type: resquest_type_cadaverico
Question.create! description: 'Pergunta padrão cadaverico 2' , question_default: true, resquest_type: resquest_type_cadaverico
Question.create! description: 'Pergunta padrão cadaverico 3' , question_default: true, resquest_type: resquest_type_cadaverico
Question.create! description: 'Pergunta padrão cadaverico 4' , question_default: true, resquest_type: resquest_type_cadaverico
Question.create! description: 'Pergunta padrão cadaverico 5' , question_default: true, resquest_type: resquest_type_cadaverico
Question.create! description: 'Pergunta padrão arma 1' , question_default: true, resquest_type: resquest_type_arma
Question.create! description: 'Pergunta padrão arma 2' , question_default: true, resquest_type: resquest_type_arma
Question.create! description: 'Pergunta padrão arma 3' , question_default: true, resquest_type: resquest_type_arma
Question.create! description: 'Pergunta padrão arma 4' , question_default: true, resquest_type: resquest_type_arma
Question.create! description: 'Pergunta padrão arma 5' , question_default: true, resquest_type: resquest_type_arma
Question.create! description: 'Pergunta padrão corpo_de_delito 1' , question_default: true, resquest_type: resquest_type_corpo_de_delito
Question.create! description: 'Pergunta padrão corpo_de_delito 2' , question_default: true, resquest_type: resquest_type_corpo_de_delito
Question.create! description: 'Pergunta padrão corpo_de_delito 3' , question_default: true, resquest_type: resquest_type_corpo_de_delito
Question.create! description: 'Pergunta padrão corpo_de_delito 4' , question_default: true, resquest_type: resquest_type_corpo_de_delito
Question.create! description: 'Pergunta padrão corpo_de_delito 5' , question_default: true, resquest_type: resquest_type_corpo_de_delito