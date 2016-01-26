module FFaker
  module AddressLV
    include FFaker::Address

    extend ModuleUtils
    extend self

    POSTAL_CODE_PREFIX = 'LV'.freeze

    POSTAL_CODE_DIGITS = '####'.freeze

    def region
      REGION.sample
    end

    def city
      CITY.sample
    end

    def zip_code
      FFaker.numerify "#{POSTAL_CODE_PREFIX}-#{POSTAL_CODE_DIGITS}"
    end
    alias_method :postal_code, :zip_code

  end
end
