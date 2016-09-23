class Car
  attr_accessor :name, :color
  attr_reader :x, :fuel

  @@count = 0

  def self.count
    @@count
  end

  def initialize(name, color)
    @name = name
    @color = color
    @x = 0
    @fuel = 100
    @@count += 1
  end

  def info
    puts "名前：#{self.name}, 色：#{self.color}"
    puts "現在の位置: #{self.x}km"
    puts "ガソリン量: #{self.fuel}リットル"
  end

  def run(distance)
    if distance > @fuel
      puts "ガソリンが足りません"
      return
    end
    @x += distance
    set_fuel(@fuel - distance)
  end

  def charge(litre)
    set_fuel(@fuel + litre)
  end

  private

  def set_fuel(litre)
     @fuel = litre
  end
end

class Taxi < Car
  attr_reader :money

  def initialize(name, color)
    super
    @money = 730
  end

  def price
    puts "最低料金730円、1kmごとに700円です"
  end

  def info
    super
    puts "料金: #{self.money}円"
  end

  def run(distance)
    if distance <= @fuel
      @money += distance * 700
    end
    super
  end
end


my_taxi = Taxi.new("ゴンフォート", "赤")

while true
  puts "--------------------------------------"
  puts "なにをしますか？"
  puts "1: 走る, 2: 給油する"
  puts "3: 車の情報を編集する, 4: 停止する"
  menu = gets.chomp.to_i
  case menu
  when 1
    puts "何km走りますか？"
    distance = gets.chomp.to_i
    my_taxi.run(distance)
  when 2
    puts "何リットル給油しますか？"
    litre = gets.chomp.to_i
    my_taxi.charge(litre)
  when 3
    puts "新しい名前を入力してください"
    my_taxi.name = gets.chomp
    puts "新しい色を入力してください"
    my_taxi.color = gets.chomp

  when 4
    puts "停止しました"

    break
  end

  my_taxi.info

end
