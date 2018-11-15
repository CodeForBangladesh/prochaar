# README


###Features

- User Registration
- Complete user profile
- Collect User location using google maps API
- Report missing person
- Location wise push search notifications after a specific time

###Requirements

- Ruby: `2.4.1`
- Rails: `5.1.4`
- MySQL

###Installation

- [Install ruby using RVM](https://bokdharmik.wordpress.com/2015/06/27/%E0%A6%89%E0%A6%AC%E0%A7%81%E0%A6%A8%E0%A7%8D%E0%A6%9F%E0%A7%81%E0%A6%A4%E0%A7%87-ruby-on-rails-%E0%A6%B8%E0%A7%87%E0%A6%9F%E0%A6%BE%E0%A6%AA/)
- [Install MySQL](https://websiteforstudents.com/install-phpmyadmin-apache2-and-mysql-on-ubuntu-18-04-lts-beta-server/)
- Clone the repository.
- Goto cloned repository using - `cd sondhanchai/`
- Install required gems(libraries) - `bundle install`
- Create a **database.yml** and **secrets.yml** file in `config` folder. There is a **database.sample.yml** and **secrets.sample.yml** file in the same directory. Copy and paste the contents of those files in your newly created YAML file. Then change accordingly. (e.g. change database username/password/db_name)
- In your command line run - `rake db:create`  (_It'll create a new database in mysql_)
- In your command line run - `rake db:migrate`  (_It'll add tables to your  newly created database_)
- In your command line run - `rake db:seed`  (_It'll create a admin user in the USERS table_)



###Contribute

> Fork the repository then create pull request. 

Happy Contributing!



