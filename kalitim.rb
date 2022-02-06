# encoding: utf-8

require 'forwardable'

class Omurgalilar

    def ye
        "yemek yer."
    end

    def ic
        "içer."
    end

    def uyu
        "uyur."
    end

end

class Hareket
    
    def surun
        "sürünür."
    end

    def adim
       "adım atar."
    end

    def uc
        "uçar."
    end

end

class Insan < Omurgalilar
    extend Forwardable
    def_delegators :@hareket, :adim
    def initialize
        @hareket = Hareket.new
    end

    def ye
       puts "İnsan #{super()}"
    end

    def ic
        puts "İnsan #{super()}"
    end

    def uyu
        puts "İnsan #{super()}"
    end

    def adimAt
        puts "İnsan #{adim}"
    end

end

class Kus < Omurgalilar

    extend Forwardable
    def_delegators :@hareket, :uc

    def initialize
        @hareket = Hareket.new
    end

    def ye
        puts "Kuş #{super()}"
    end

    def ic
        puts "Kuş #{super()}"
    end

    def uyu
        puts "Kuş #{super()}"
    end

    def ucus
        puts "Kuş #{uc}"
    end
end

class Timsah < Omurgalilar

    extend Forwardable
    def_delegators :@hareket, :surun

    def initialize
        @hareket = Hareket.new
    end

    def ye
        puts "Timsah #{super()}"
    end

    def ic
        puts "Timsah #{super()}"
    end

    def uyu
        puts "Timsah #{super()}"
    end

    def surunmek
        puts "Timsah #{surun}"
    end
end

class App
    def initialize
        @insan = Insan.new
        @kus = Kus.new
        @timsah = Timsah.new
    end

    def insan_run
        #İnsan sınıfı uc ve surun metotlarını kullanamaz çünkü komposizyon ile aktarmadık.
        insan.ye
        insan.ic
        insan.uyu
        insan.adimAt
    end

    def kus_run
        #Kus sınıfı adim ve surun metotlarını kullanamaz çünkü komposizyon ile aktarmadık.
        kus.ye
        kus.ic
        kus.uyu
        kus.ucus
    end

    def timsah_run
        #Timsah sınıfı uc ve adim metotlarını kullanamaz çünkü komposizyon ile aktarmadık.
        timsah.ye
        timsah.ic
        timsah.uyu
        timsah.surunmek
    end

    private

    attr_reader :insan, :kus, :timsah
end

def main

    app = App.new
    app.insan_run
    print "\n"
    app.kus_run
    print "\n"
    app.timsah_run
    
end

main