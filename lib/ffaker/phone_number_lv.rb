module FFaker
  module PhoneNumberLV
    extend ModuleUtils
    extend self

    COUNTRY_CODE           = '+371'.freeze
    HOME_PHONE_PREFIX      = '6'.freeze
    MOBILE_PHONE_PREFIX    = '2'.freeze
    FREE_PHONE_PREFIX      = '80'.freeze
    EXPENSIVE_PHONE_PREFIX = '90'.freeze
    MOBILE_PHONE_DIGITS    = '#######'.freeze

    def country_code
      COUNTRY_CODE
    end

    def home_work_phone_number
      home_phone_number
    end

    def home_work_phone_prefix
      HOME_PHONE_PREFIX
    end

    def international_home_work_phone_number
      FFaker.numerify "#{COUNTRY_CODE}#{HOME_PHONE_PREFIX}#{MOBILE_PHONE_DIGITS}"
    end

    def international_mobile_phone_number
      FFaker.numerify "#{COUNTRY_CODE}#{MOBILE_PHONE_PREFIX}#{MOBILE_PHONE_DIGITS}"
    end

    def international_phone_number
      case rand(2)
      when 0 then international_home_work_phone_number
      when 1 then international_mobile_phone_number
      end
    end

    def phone_number
      case rand(2)
      when 0 then home_work_phone_number
      when 1 then mobile_phone_number
      end
    end

    def phone_prefix
      case rand(2)
      when 0 then home_work_phone_prefix
      when 1 then mobile_phone_number
      end
    end

    def home_phone_number
      FFaker.numerify "#{HOME_PHONE_PREFIX}#{MOBILE_PHONE_DIGITS}"
    end

    def mobile_phone_number
      FFaker.numerify "#{MOBILE_PHONE_PREFIX}#{MOBILE_PHONE_DIGITS}"
    end

    def mobile_phone_number_prefix
      MOBILE_PHONE_PREFIX
    end

  end
end
