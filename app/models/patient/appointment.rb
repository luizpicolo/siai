class Patient::Appointment < ApplicationRecord
  include SearchCop

  validates :patient, presence: true

  belongs_to :patient

  enum complaints: [
    'Exame Preventivo', 'Febre', 'Picada Insetos', 'Geniturinária', 'Orientação',
    'Ocular/Auricular', 'Cólica Mestrual', 'Lesão', 'Gastrintestinal',
    'Tontura/Mal Estar', 'Cefaléia'
  ]
  enum medical_referral: ['Hospital', 'ESF', 'Família', 'Psicóloga']
  enum nursing_conduct: ['Orientações', 'Observação', 'Encaminhamentos']
  enum tanners_stage: [
    'Estágio I', 'Estágio II', 'Estágio III', 'Estágio IV', 'Estágio V'
  ]

  # Atributos para busca com SearchCop
  search_scope :search do
    attributes :complaints
    attributes :created_at
  end

  # Retorna um vetor com os atributos que serão utilizados para a
  # busca nas listagens dos pacientes
  #
  # @return [Array] contendo os atributos para a busca
  def self.ordenation_attributes
    [["ID",'id'], ["Quiexas",'complaints'], ["Data",'created_at']]
  end
end