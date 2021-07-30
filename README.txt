Mycountry is small web application with following features:

	-> list all country in the world
	-> show details on each country
	-> option to add to user favourite countries 
	-> option to write comments on each user favourite country
	-> remove from favourites

User can sign in with Credentials below:

Username: john.smith@gmail.com
Password: Mycountry@123


SetUp on Local machine using WAMP:

Step 1 (Virtual Host): 
#####################

Inside file: C:\wamp64\bin\apache\apache2.4.35\conf\extra\httpd-vhosts.conf ,
create new virtual host like below (notice that path can be different on each machine):


<VirtualHost mycountry.net>
	ServerName mycountry.net
	ServerAlias mycountry.net
	DocumentRoot "${INSTALL_DIR}/www/Projects/mycountry/public"
	  <Directory "${INSTALL_DIR}/www/Projects/mycountry/public">
		Options Indexes FollowSymLinks Includes ExecCGI
		Order allow,deny
		Allow from all
	  </Directory>
</VirtualHost>


Inside file: C:\Windows\System32\drivers\etc\hosts
add new line: 127.0.0.1 mycountry.net 


Step 2 (Database): 
######################

Create new database:
CREATE DATABASE mycountry;

Run .mysql file `mycountry.sql` in order tables and data to be created

Step 3 (Project files (front/backend) ): 
#######################################

Project files are inside mycountry folder. 
This files should be included inside virtual host path folder definition (example: "${INSTALL_DIR}/www/Projects/mycountry/public")


Step 4:
##########

Restart WAMP services.
Open browser and type: mycountry.net and login page should appear on which user can log in with:
Username: john.smith@gmail.com
Password: Mycountry@123

