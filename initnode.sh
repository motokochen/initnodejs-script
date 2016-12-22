#!/bin/sh

# Create Folder Layout
# Main Folder/
# - CSS/   --- For style.
# - JS/    --- For common javascript functions.
# - PIC/   --- pictures, movies, media...etc. resource.
# - VIEW/  --- For Response Web View.
mkdir $1 
mkdir $1/CSS $1/JS $1/PIC $1/VIEW

ROOT=$pwd/$1/
# Download Baisc Modules
cd $1/
npm install express async body-parser multer fs sqlite3 passport cookie-session passport-facebook

# Create mainjs.js with basic modules
MAINJS="mainjs.js"
touch $MAINJS
echo "var express = require('express');" >> $MAINJS
echo "var async = require('async');" >> $MAINJS
echo "var bodyParser = require('body-parser');" >> $MAINJS
echo "var multer = require('multer');" >> $MAINJS
echo "var fs = require('fs');" >> $MAINJS
echo "var sql = require('sqlite3');" >> $MAINJS

# Create html server app
echo "var app = express();" >> $MAINJS

echo '\n' >> $MAINJS
# Define for HTML
echo "var HEAD = '<!DOCTYPE HTML><html><head>';" >> $MAINJS
echo "var META = '<meta http-equiv=\"content-type\" content=\"text/html; charset=UTF-8\"/>';" >> $MAINJS
echo "var LINK = '<link rel=\"stylesheet\" type=\"text/css\" href=\"style/common.css\" />';" >> $MAINJS
#echo "var JS = '<script type=\"text/javascript\" src=\"js/common.js\"></script>';" >> $MAINJS
echo "var NECK = '</head>';" >> $MAINJS
echo "var FOOT = '</html>';" >> $MAINJS

# Set Path
echo '\n' >> $MAINJS
echo "app.use('/src', express.static(__dirname + '/PIC'));" >> $MAINJS
echo "app.use('/style', express.static(__dirname + '/CSS'));" >> $MAINJS
echo "app.use('/js', express.static(__dirname + '/JS'));" >> $MAINJS
echo "app.use('/path', express.static(__dirname + '/VIEW'));" >> $MAINJS

echo '\n' >> $MAINJS
echo "app.get('/', function(req, res) {" >> $MAINJS
#echo "	var htmlcode = '';" >> $MAINJS
#echo "	htmlcode += HEAD;" >> $MAINJS
#echo "	htmlcode += META;" >> $MAINJS
#echo "	htmlcode += LINK;" >> $MAINJS
#echo "	htmlcode += VIEW;" >> $MAINJS
#echo "	htmlcode += '<title>Template</title>';" >> $MAINJS
#echo "	htmlcode += NECK;" >> $MAINJS
#echo "	htmlcode += '<p>test</p>'" >> $MAINJS
#echo "	htmlcode += FOOT;" >> $MAINJS
#echo "	res.send(htmlcode);" >> $MAINJS
#echo "	res.end();" >> $MAINJS
echo "	res.sendFile(__dirname + '/VIEW/mainpage.html')" >> $MAINJS
echo "})" >> $MAINJS

# Server Start
echo '\n' >> $MAINJS
echo "var server = app.listen(3000, function() {" >> $MAINJS
echo "	var host = server.address().address;" >> $MAINJS
echo "	var port = server.address().port;" >> $MAINJS
echo '\n' >> $MAINJS
echo "	console.log('Server Start!! Listening at http://%s:%s', host, port);" >> $MAINJS
echo "})" >> $MAINJS

# Create html file named mainpage.html
MAINPAGE="VIEW/mainpage.html"
touch $MAINPAGE
echo "<!DOCTYPE HTML><html><head>" >> $MAINPAGE
echo "<meta http-equiv='content-type' content='text/html; charset=UTF-8'/>" >> $MAINPAGE
echo "<link rel='stylesheet' type='text/css' href='style/common.css' />" >> $MAINPAGE
echo "<title>template</title>" >> $MAINPAGE
echo "</head>" >> $MAINPAGE
echo "<body>" >> $MAINPAGE
echo "<p>Hello World!!</p>" >> $MAINPAGE
echo "<script src='js/common.js'></script>" >> $MAINPAGE
echo "<script src='https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js'></script>" >> $MAINPAGE
echo "</body>" >> $MAINPAGE
echo "</html>" >> $MAINPAGE

# Create Javascript file named common.js for RWD
JS="JS/common.js"
touch $JS

# Create CSS file named common.css for RWD
CSS="CSS/common.css"
touch $CSS
## 22", 24":1920px
## 17"
echo "@media screen and (min-width:1600px) {" >> $CSS
echo "	p { color:blue }" >> $CSS
echo "}" >> $CSS




