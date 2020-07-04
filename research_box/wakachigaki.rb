# encoding: Shift_JIS
require 'natto'
require 'nkf'
mecab = Natto::MeCab.new(output_format_type: :wakati)
filename = gets.chomp.to_s.encode(Encoding::Shift_JIS) #�����œ��͂��������R�[�h��windows-31J����utf-8�ɕϊ�������
File.open("��������_" + filename + ".log","r",:encoding => Encoding::Shift_JIS, :invalid => :replace, :undef => :replace) do |io|
  File.open("����������_" + filename + ".txt", "w") do |f|
    io.each_line do |line|
      episode = line.chomp
      result_str = mecab.parse(episode).encode("Shift_JIS")
      puts result_str.encoding
    end
  end
end
