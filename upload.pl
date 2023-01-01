use utf8;
use Encode 'encode';

##############################################################################
# flowchart.txt -> flowchart.htmlへの変換
##############################################################################
my $file = './flowchart.txt';
open my $fh, '<', $file
  or die qq/Can't open file "$file" : $!/;
open(OUT, "> ./flowchart.html");

print OUT "<!DOCTYP html PUBLIC './/W3C//DTD XHTML 1.0 Transitional//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd'>"."\n";
print OUT "<html xmlns='http://www.w3.org/1999/xhtml'>"."\n";
print OUT "<head>"."\n";
print OUT "<title>SmartFlowChart2023_JP_Prototype</title>"."\n";
print OUT "<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>"."\n";
print OUT "<style type='text/css'>"."\n";
print OUT ".col-1 {"."\n";
print OUT "display: inline-block;"."\n";
print OUT "width: 250px;"."\n";
print OUT "/* border: solid 1px; */"."\n";
print OUT "}"."\n";
print OUT ".col-2 {"."\n";
print OUT "display: inline-block;"."\n";
print OUT "width: 150px;"."\n";
print OUT "/* border: solid 1px; */"."\n";
print OUT "}"."\n";
print OUT ".col-3 {"."\n";
print OUT "display: inline-block;"."\n";
print OUT "width: 600px;"."\n";
print OUT "/* border: solid 1px; */"."\n";
print OUT "}"."\n";
print OUT ".col-4 {"."\n";
print OUT "display: inline-block;"."\n";
print OUT "width: 150px;"."\n";
print OUT "/* border: solid 1px; */"."\n";
print OUT "}"."\n";
print OUT "table, th, td { border:1px solid black;}"."\n";
print OUT "</style>"."\n";
print OUT "</head>"."\n";
print OUT "<BODY>"."\n";
print OUT "<h1>FlowChart</h1>"."\n";

# <$fh>;<$fh>;<$fh>;<$fh>;<$fh>;<$fh>;<$fh>;<$fh>;<$fh>;<$fh>;<$fh>;<$fh>;<$fh>;<$fh>;<$fh>;<$fh>;<$fh>;
# print OUT $line."<div>"."\n";

$count = 1;
while (my $line = <$fh>) {
  chomp $line;
  $line =~ s///;
  @subline = split(/,/,$line);

  print OUT "<table style='width:30%'>"."\n";
  print OUT "<tr>"."\n";
  print OUT "<td>"."\n";

  print OUT 
      # "<div><font size='5'><span class='col-1'>$data[0]</span><span class='col-2'>$data[1]</span><span class='col-3'>$data[2]</span><span class='col-4'>$data[3]</span></font></div>";
      # "<font size='5'>".$data[0]."</font><br>"."\n";
      # "<font size='5' color='#00ff00'>".$line."</font><br>"."\n";
      "<font size='5' color='#000000'>".$count.". ".$subline[0]."<a href='".$subline[1]."' target='_blank' rel='noopener noreferrer'>[LINK]</a></font><br>"."\n";
  print OUT "</td>"."\n";
  print OUT "</tr>"."\n";
  print OUT "</table>"."\n";
  print OUT "<p> </p>"."\n";
  $count++;
}

# print OUT "</div>"."\n";
print OUT "</BODY>"."\n";
print OUT "</HTML>"."\n";

close $fh;
close(OUT);

##############################################################################
# Net::FTP - FTPを使ったファイル転送
##############################################################################

# モジュールの読み込み
use Net::FTP;

# FTPサーバへの接続(ホスト名でもIPアドレスでもOK)
my $ftp = Net::FTP->new('xxxx'); # ホスト名 or IPアドレスを入力

# newメソッドに接続先を指定するとFTPサーバに接続することができる
# 戻り値にはオブジェクトが返却される
# -> これを利用してログインしたりFTPコマンドを発行したりする

# ユーザ名とパスワードを指定してログイン
$ftp->login('USER', 'PASSWORD'); # USERとPASSWORDを入力
# loginメソッドにユーザ名とパスワードを指定してFTPサーバにログイン

# cwd: 接続先のカレントディレクトリを変更
$ftp->cwd('./www/'); 

# put: ファイルをアップロードする
$ftp->put('./flowchart.html');

# 接続を終了する
$ftp->quit;

##############################################################################
