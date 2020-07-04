# encoding: Shift_JIS
require 'natto'
require 'nkf'
mecab = Natto::MeCab.new(output_format_type: :wakati)
filename = gets.chomp.to_s.encode(Encoding::Shift_JIS) #ここで入力した文字コードをwindows-31Jからutf-8に変換したい
File.open("結合結果_" + filename + ".log","r",:encoding => Encoding::Shift_JIS, :invalid => :replace, :undef => :replace) do |io|
  File.open("分かち書き_" + filename + ".txt", "w") do |f|
    io.each_line do |line|
      episode = line.chomp
      result_str = mecab.parse(episode).encode("Shift_JIS")
      puts result_str.encoding
    end
  end
end
