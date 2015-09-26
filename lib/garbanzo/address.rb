module Garbanzo
  class Address
    ATTRIBUTES = [
      :first_name,
      :last_name,
      :company,
      :address1,
      :address2,
      :city,
      :state,
      :zip,
      :country
    ]

    attr_accessor *ATTRIBUTES

    def initialize(options = {})
      options.each do |attribute, value|
        public_send("#{attribute}=", value)
      end
    end

    def valid?
      first_name.to_s != '' && last_name.to_s != ''
    end

    def to_h
      ATTRIBUTES.reduce({}) do |hash, attribute|
        value = public_send(attribute)
        hash.merge!(attribute => value) if value
        hash
      end
    end
  end
end
