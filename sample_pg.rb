# pgライブラリを使用する
require 'pg'

connection = PG::connect(dbname: "goya")
connection.internal_encoding = "UTF-8"
begin
  # connection変数を使いPostgreSQLを操作する
  # .execで、goyaDBに"select weight, give_for from crops;"
  # のSQLの命令文を直接実行し、その結果をresult変数に格納する
  result = connection.exec("select weight, give_for from crops;")
  # 取り出した各行を処理する
  result.each do |record|
      # 各行を取り出し、putsでターミナル上に出力する
      puts "ゴーヤの大きさ：#{record["weight"]}　売った相手：#{record["give_for"]}"
  end
ensure
  # 何かしらのエラーが発生した場合、
  # .finishでデータベースへのコネクションを切断する
  connection.finish
end

connection2 = PG::connect(dbname: "goya")
connection2.internal_encoding = "UTF-8"
begin
  result2 = connection2.exec("select * from crops where give_for != '自家消費';")
  result2.each do |record2|
      puts "ゴーヤの長さ：#{record2["length"]} ゴーヤの大きさ：#{record2["weight"]} 品質：#{record2["quality"]} 譲渡先：#{record2["give_for"]} 売却日：#{record2["date"]}　"
  end
ensure
  connection.finish
end

connection3 = PG::connect(dbname: "goya")
connection3.internal_encoding = "UTF-8"
begin
  result3 = connection3.exec("select * from crops where quality = false;")
  result3.each do |record3|
    puts "ゴーヤの長さ：#{record3["length"]} ゴーヤの大きさ：#{record3["weight"]} 譲渡先：#{record3["give_for"]} 売却日：#{record3["date"]}"
  end
ensure
  connection2.finish
end
