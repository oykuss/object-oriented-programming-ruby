#!/usr/bin/ruby
# encoding: utf-8

class Hastane_Ilac
    @@toplam_ilac_sayisi = 0 

    attr_reader :barkod_numarasi, :ilac_adi, :ilac_turu, :uretici_firma, :stok_sayisi, :birimi

    def initialize(barkod_numarasi,ilac_adi,ilac_turu,uretici_firma,stok_sayisi,birimi)

        @@toplam_ilac_sayisi += stok_sayisi #toplam ilaç sayısı stok sayısı kadar arttı
        #nitelikler
        @barkod_numarasi = barkod_numarasi
        @ilac_adi = ilac_adi
        @ilac_turu = ilac_turu
        @uretici_firma = uretici_firma
        @stok_sayisi = stok_sayisi
        @birimi = birimi

    end

    def self.toplam_ilac_sayisi
        @@toplam_ilac_sayisi
    end

end

require 'securerandom'

class Ilaclar
    def initialize
        @ilaclar = []
    end

    def ekle
        print "İlacın barkod numarasını giriniz : "
        barkod_numarasi = gets.chomp.to_i
                
        print "İlacın adını giriniz : "
        ilac_adi = gets.chomp

        print "İlacın türünü giriniz : "
        ilac_turu = gets.chomp

        print "İlacın üretici firmasını giriniz : "
        uretici_firma = gets.chomp

        print "İlacın stok sayısını giriniz : "
        stok_sayisi = gets.chomp.to_i

        print "İlacın ait olduğu birimi giriniz : "
        birimi = gets.chomp
                
        print "\n"

        ilaclar << Hastane_Ilac.new(barkod_numarasi, ilac_adi, ilac_turu, uretici_firma, stok_sayisi, birimi) #ilaç nitelikleri diziye eklendi
    end

    def listele

        if ilaclar.length.zero?
            puts 'Sistemde kayitli ilac bulunamadi.'
        end
        for i in 0...ilaclar.size

            puts "İlacın Barkod Numarası : #{ilaclar[i].barkod_numarasi}"
            puts "İlacın Adı : #{ilaclar[i].ilac_adi}"
            puts "İlacın Türü : #{ilaclar[i].ilac_turu}"
            puts "İlacın Üretici Firması : #{ilaclar[i].uretici_firma}"
            puts "İlacın Stok Sayısı : #{ilaclar[i].stok_sayisi}"
            puts "İlacın Ait Olduğu Birim : #{ilaclar[i].birimi}"
            
        end

        print "\n"
        puts "Stoktaki toplam ilaç sayısı : #{Hastane_Ilac.toplam_ilac_sayisi}"
        print "\n"
    end

    private

    attr_reader :ilaclar
end

class App
    attr_reader :envanter

    def initialize
        @envanter = Ilaclar.new
    end

    def run
        puts "******************************************************************************\n"
        puts "Ondokuz Mayıs Üniversitesi Tıp Fakültesi Hastane Bilgi Sistemine Hoş Geldiniz.\n"
        komutlar = "\n
        \t1-EKLE \n
        \t2-LİSTELE\n
        \t3-ÇIKIŞ\n"
        print komutlar 

        while true
            print "Bir komut giriniz : " 
            komut = gets.chomp.to_i
            print "\n"

            case komut
            when 1
                envanter.ekle
            when 2
                envanter.listele
            when 3
                puts "Güle Güle"
                break
            else
                puts "Hatalı bir komut girdiniz"
                print "\n"
            end
        end
    end
end

def main
    app = App.new
    app.run
end

main