class PhoneBook
    def initialize
        @names = Array.new
        @phoneNumbers = Array.new
        @listed = Array.new
    end

    def add(name, number, is_listed)
        for i in 0..@names.length do
            if @names[i] == name or ((@phoneNumbers[i] == number) and (@listed[i] and is_listed)) then
                return false
            end
        end
        if !(number =~ /\A\d{3}-\d{3}-\d{4}\z/) then
            return false
        end
        @names << name
        @phoneNumbers << number
        @listed << is_listed
        return true
    end

    def lookup(name)
        for i in 0..@names.length do
            if @names[i] == name and @listed[i]then
                return @phoneNumbers[i]
            end
        end
        return nil
    end

    def lookupByNum(number)
        for i in 0..@names.length do
            if @phoneNumbers[i] == number and @listed[i]then
                return @names[i]
            end
        end
        return nil
    end

    def namesByAc(areacode)
        arr = Array.new
        for i in 0..@names.length-1 do
            currentAreaCode = (@phoneNumbers[i])[0] + (@phoneNumbers[i])[1] + (@phoneNumbers[i])[2]
            puts currentAreaCode
            if areacode == currentAreaCode then
                arr << @names[i]
            end
        end
        return arr
    end
end
