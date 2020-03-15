require 'cgi'

cgi = CGI.new
cgi.out("type" => "text/html", "charset" => "UTF-8"){
  get = cgi['input']
  "<html>
    <body>
      <p>受け取った文字列は下記になります。</p>
      <p>文字列：#{get}</p>
    </body>
  </html>"
}
