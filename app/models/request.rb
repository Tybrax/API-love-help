class Request < ApplicationRecord

    #Presence
    validates :title, :request_type, :description, :location, presence: true

    #Type
    #validates :title, :description, format: { with: /\A[a-zA-Z]+\z/,
    #message: "only allows letters" }
    validates :fulfilled, inclusion: [true, false]

    #Length
    validates_length_of :title, minimum: 10, maximum: 30
    validates_length_of :description, minimum: 30, maximum: 300

end
