class WorkTime

  def initialize
    @select = nil
    @start_time = nil
    @end_time = nil
    @rest_time = 0
    @error = "もう一度正しく入力してください"
    @select_word = "y | n ："
  end

  def rest_time
    loop do
      puts "休憩時刻を換算しますか？"
      print @select_word
      select = gets.to_s.chomp
      case select
      when "y"
        puts "休憩時間は１時間以上ですか？"
        print @select_word
        select = gets.to_s.chomp
        case select
        when "y"
          loop do
            puts "例｜１時間 => 100"
            print "１時間４０分 => 140 ："
            stime2 = gets.to_s.chomp
            if stime2.match(/\d{3}/) == nil
              puts @error
              redo
            else
              stime1 = stime2.slice!(0,1)
              stime1 = stime1.to_i
              stime2 = stime2.to_i
              stime = Time.new(Time.now.year, Time.now.month, Time.now.day, stime1, stime2)
              @rest_time = stime.hour + stime.min / 60.0
              break
            end
          end
        when "n"
          loop do
            print "例４０分=> 40 ："
            stime = gets.to_s.chomp
            if stime.match(/\d{2}/) == nil
              puts @error
              redo
            else
              rest_time = stime.to_i
              @rest_time = rest_time / 60.0
              break
            end
          end
          break
        end
        break
      when "n"
        @rest_time = 0
        break
      end
      puts @error
      redo
    end
  end

  def start_time_input
    loop do
      puts "作業開始時刻を入力してください"
      print "例12:30=> 1230 ："
      ftime2 = gets.to_s.chomp
      if ftime2.length == 4 && ftime2.match(/\D{4}/) == nil then
        ftime1 = ftime2.slice!(0, 2)
        ftime1 = ftime1.to_i
        ftime2 = ftime2.to_i
        @start_time = Time.new(Time.now.year, Time.now.month, Time.now.day, ftime1, ftime2)
        break
      else
        puts @error
        redo
      end
    end
  end

  def end_time_input
    loop do
      puts "作業終了時刻を入力してください"
      print "例12:30=> 1230 ："
      ltime2 = gets.to_s.chomp
      if ltime2.length == 4 && ltime2.match(/\D{4}/) == nil then
        ltime1 = ltime2.slice!(0, 2)
        ltime1 = ltime1.to_i
        ltime2 = ltime2.to_i
        @end_time = Time.new(Time.now.year, Time.now.month, Time.now.day, ltime1, ltime2)
        break
      else
        puts @error
        redo
      end
    end
  end

  def result
    time = @end_time - @start_time
    2.times do
      time /= 60
    end
    time -= @rest_time
    puts "作業時間は#{time}です。"
  end

end

work_time = WorkTime.new
work_time.rest_time
puts "作業時間を計算します"
work_time.start_time_input
work_time.end_time_input
work_time.result
puts "正常に終了しました"
puts "お疲れ様でした (￣∇￣;)"
