# encoding: utf-8

class Sekil
    
    def initialize
        raise NotImplementedError
    end

    def ekranGoster
        raise NotImplementedError
    end

    def bilgiAlma
        raise NotImplementedError
    end

    def alan
        raise NotImplementedError
    end

    #bilgi alma işleminin tek satırda tutmamsı için
    def prompt
        raise NotImplementedError
    end

    def hacim
        raise NotImplementedError
    end
    
end

class IkiBoyutluSekil < Sekil
    
    @x
    @y

    def initialize
        #Soyut sınıflardan nesne üretilemez bu sebeple yazdım.
        raise NotImplementedError
    end

    def prompt (*args)
        print(*args)
        gets.chomp.to_i
    end


    class << self
        attr_accessor :x, :y
    end


end

class UcBoyutluSekil < IkiBoyutluSekil
    @z
    def initialize
        raise NotImplementedError
    end

    class << self
        attr_accessor :z
    end
end


class Kare < IkiBoyutluSekil

    attr_reader :uzunluk
    def initialize(uzunluk = 0)
        @uzunluk = uzunluk

        puts "--------------------------------------"
        puts "(İKİ BOYUTLU, KARE şekli oluşturuldu.)"
        puts "--------------------------------------"
            
    end
    

    def alan
        uzunluk*uzunluk
    end
   
    def ekranGoster
        puts "Kenar uzunluğu : #{uzunluk}"
        puts "Alanı : #{alan}"
        puts "Merkezi X koordinatı :#{Kare.x}"
        puts "Merkezi y koordinatı : #{Kare.y}"
    end

    def bilgiAlma
        Kare.x = prompt 'Karenin x koordinatını giriniz : '
        Kare.y = prompt 'Karenin y koordinatını giriniz : '
    end 

end

class Daire < IkiBoyutluSekil

    attr_reader :yaricap
    def initialize(yaricap = 0)
        @yaricap = yaricap

        puts "---------------------------------------"
        puts "(İKİ BOYUTLU, DAİRE şekli oluşturuldu.)"
        puts "---------------------------------------"

    end

    def ekranGoster
        puts "Yarıçapı : #{yaricap}"
        puts "Alanı : #{alan}"
        puts "Merkezi X koordinatı :#{Daire.x}"
        puts "Merkezi y koordinatı : #{Daire.y}"
    end
   
    def bilgiAlma
        Daire.x = prompt 'Dairenin x koordinatını giriniz : '
        Daire.y = prompt 'Dairenin y koordinatını giriniz : '
    end 

    def alan
        Math::PI * yaricap ** 2
    end

end

class Kup < UcBoyutluSekil

    attr_reader :uzunluk, :hacimArttır
    def initialize(uzunluk = 0, hacimArttır)
        @uzunluk = uzunluk
        @hacimArttır = hacimArttır

        puts "-------------------------------------"
        puts "(ÜÇ BOYUTLU, KÜP şekli oluşturuldu.)"
        puts "-------------------------------------"

    end
    
    def ekranGoster
        puts "Kenar uzunluğu : #{uzunluk}"
        puts "Alanı : #{alan}"
        puts "Hacmi : #{hacim}"
        puts "Yeni hacmi : #{yeni}" unless hacimArttır == 0 
        puts"\n"
        puts "Merkezi X koordinatı : #{Kup.x}"
        puts "Merkezi y koordinatı : #{Kup.y}"
        puts "Merkezi z koordinatı : #{Kup.z}"
        
    end

    def bilgiAlma
        Kup.x = prompt 'Küpün x koordinatını giriniz : '
        Kup.y = prompt 'Küpün y koordinatını giriniz : '
        Kup.z = prompt 'Küpün z koordinatını giriniz : '
    end 

    def alan
        uzunluk*uzunluk*6
    end

    def hacim 
        uzunluk*uzunluk*uzunluk
    end

    def yeni
        hacim*hacimArttır unless hacimArttır == 0
    end

end


class Kure < UcBoyutluSekil
    
    attr_reader :yaricap, :hacimArttır
    def initialize(yaricap = 0, hacimArttır)
        @yaricap = yaricap
        @hacimArttır = hacimArttır

        puts "-------------------------------------"
        puts "(ÜÇ BOYUTLU, KÜRE şekli oluşturuldu.)"
        puts "-------------------------------------"
        
    end

    def ekranGoster
        puts "Yarıçapı: #{yaricap}"
        puts "Alanı : #{alan}"
        puts "Hacmi : #{hacim}"
        puts "Yeni hacmi : #{yeni}" unless hacimArttır == 0 
        puts"\n"
        puts "Merkezi X koordinatı : #{Kure.x}"
        puts "Merkezi y koordinatı : #{Kure.y}"
        puts "Merkezi z koordinatı : #{Kure.z}"
    
    end


    def bilgiAlma
        Kure.x = prompt 'Kürenin x koordinatını giriniz : '
        Kure.y = prompt 'Kürenin y koordinatını giriniz : '
        Kure.z = prompt 'Kürenin z koordinatını giriniz : '
    end 

    def alan
        4*(Math::PI) * (yaricap*yaricap)
    end

    def hacim
        (4/3)*(Math::PI) * (yaricap*yaricap*yaricap)
    end

    def yeni
        hacim * hacimArttır unless hacimArttır == 0
    end
end

class App
    attr_reader :kare, :daire, :kup , :kure
    def initialize
        @kare
        @daire
        @kup
        @kure
    end

    def calis
        
        loop do true
            puts '***************************************************************************************************'
            print "\t1-Kare -> KARE/kare\n\t2-Daire -> DAIRE/daire\n\t3-Küp -> KUP/kup\n\t4-Küre -> KURE/kure\n\t5-Çıkış -> CIKIS/cikis\n\tŞEKİLİ GİRİNİZ :"
            secim = gets.chomp 
    
            case secim
            when 'KARE','kare'
                uzunluk = prompt 'Karenin kenar uzunluğunu giriniz(varsayılan 0):'

                kare = Kare.new(uzunluk) 

                kare.bilgiAlma
                kare.ekranGoster

                puts " "
            when 'DAIRE','daire'
                yaricap = prompt 'Dairenin yarıçap uzunluğunu giriniz(varsayılan 0):'

                daire = Daire.new(yaricap) 

                daire.bilgiAlma
                daire.ekranGoster

                puts " "
            when 'KUP','kup'
                uzunluk = prompt 'Küpün kenar uzunluğunu giriniz(varsayılan 0):'
                hacimArttır = prompt 'Küpün hacim artış değerini giriniz (Değer girilmezse artış olmaz.) :'

                kup = Kup.new(uzunluk,hacimArttır) 

                kup.bilgiAlma
                kup.ekranGoster

                puts " "
            when 'KURE','kure'
                yaricap = prompt 'Kürenin yarıçap uzunluğunu giriniz(varsayılan 0):'
                hacimArttır = prompt 'Kürenin hacim artış değerini giriniz (Değer girilmezse artış olmaz.) :'

                kure = Kure.new(yaricap,hacimArttır) 

                kure.bilgiAlma
                kure.ekranGoster

                puts " "
            when 'CIKIS','cikis'
                puts '***************************************************************************************************'
                break
            end
        end
    end

    private
    def prompt (*args)
        print(*args)
        gets.chomp.to_i
    end 

end
    


def main
    app = App.new
    app.calis
end


main