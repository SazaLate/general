# encoding: UTF-8
filename = gets.chomp.to_s.encode(Encoding::UTF_8) #ここで入力した文字コードをwindows-31Jからutf-8に変換したい
File.open("結合結果_" + filename + ".log","r",:encoding => Encoding::UTF_8, :invalid => :replace, :undef => :replace) do |io|
  File.open("台詞集_" + filename + ".txt", "w") do |f|
    io.each_line do |line|
      episode = line.chomp
      episode.scan(/([「『])(.*?)([」』])/) do |a,b,c|
        serif = a + b + c
        f.puts serif
      end
    end
  end
end
