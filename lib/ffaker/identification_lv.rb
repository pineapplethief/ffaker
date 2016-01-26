module FFaker
  module IdentificationLV
    extend ModuleUtils
    extend self

    PASSPORT_PREFIX = 'LV'.freeze
    PASSPORT_NUMBER = '#######'.freeze

    def passport_number_with_prefix
      FFaker.numerify "#{PASSPORT_PREFIX}#{PASSPORT_NUMBER}"
    end

    def passport_number
      FFaker.numerify PASSPORT_NUMBER
    end

    def personal_code(year_range: 50, year_latest: 0)
      "#{formatted_date_of_birth}-#{century_code}#{serial_number}#{checksum}"
    end

    private

    def formatted_date_of_birth(year_range: 50, year_latest: 0)
      date_of_birth.strftime('%d%m%y')
    end

    def date_of_birth(year_range: 50, year_latest: 0)
      year  = (rand * year_range).ceil + (::Time.now.year - year_latest - year_range)
      month = (rand * 12).ceil
      day   = (rand * 31).ceil
      ::Time.local(year, month, day)
    end

    def century_code
      beginning_of_20_century = Date.new(1901, 1, 1)
      beginning_of_21_century = Date.new(2001, 1, 1)
      if date_of_birth > beginning_of_20_century
        1
      elsif date_of_birth > beginning_of_21_century
        2
      end
    end

    def serial_number
      FFaker.numerify '###'
    end

    def checksum
      # TODO: failed to find any mention of checksum digit mentioned on wikipedia,
      #   so this will do for now
      FFaker.numerify '#'
    end

  end
end
