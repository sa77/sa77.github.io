+++
title = "Rails development workflow in ubuntu linux"
slug = "rails-development-workflow-in-ubuntu-linux"
layout = "page.html"
date = 2016-11-27
draft = false
[taxonomies]
tags = ["ubuntu", "ruby-on-rails"]
+++


Ubuntu is the choice of OS for most of the developers who prefer working in linux based dev machines. I am one of them and I mostly do ruby-on-rails based dev work. This post outlines the tools and general workflow for using ubuntu for dev work in rails.

## Tools
---

### **guake**
This is a cool terminal emulator for ubuntu/linux which has some developer friendly handy features

- *Floating terminal with customizable transparency:*The console window floats on top of any open window in the system and the background of the terminal can be customized to be transparent to see through the console.
- *Terminal toggling on/off with key binding:* You can just toggle guake terminal window to appear or hide based on a key-binding (default is F12)
```zsh
sudo apt-get install guake
```

### **Text Editor - sublime text**
This light-weight yet powerful text editor is an awesome tool with so many quirky ways of editing your work. It is free to use and using sublime-text as your primary text editor results guranteed productivity in your dev workflow.

### **RVM**

RVM (Ruby Version Manager) allows you to maintain different versions of ruby-lang and ruby-gemsets on your system making it easy to switch it as suitable to your project requirements.
```zsh
# install the latest ruby
rvm get latest

# list list all your ruby installation
rvm list

# use default ruby or chose a ruby version you want to work with
rvm use default

# install bundler
gem install bundler
# install rails
gem install rails
# now get cracking with your awesome app
rails new awesome-app
```

### **DB - postgreSQL**

postgresSQL is an open source RDBMS that easily sets up with and a lot of cloud providers support it natively (AWS - RDS, Heroku, etc).
Here's a quick guide to set it up and running in Ubuntu (works on 16.04/16.10):

*bash/zsh console*
```zsh
# installs postgres binary (server), psql (client) and libpq-dev (allows gem 'pg' to connect to postgres server)
sudo apt-get install postgresql postgresql-contrib libpq-dev

# default user `postgres` is created upon installation, to create other users and add access rights to them
# login as user postgres to add/remove users
sudo su
su - postgres

# login to default role template (template1) generated on postgres installation
# (template1 is a template for admin/superuser)
psql template1
```

*postgreSQL shell*
```sql
# create a DB role for linux user and provide login rights to this user
# (Ex: 'array101' - check $(whoami))
template1=# create role array101 superuser;
template1=# alter role array101 with login;
# now you can login as 'array101' as a superuser into your postgresSQL server as a normal user
# psql template1

# I usually create a separate user like 'devuser' with password 'devuser' for using for dev
template1=# create role devuser superuser;
template1=# \password devuser;
# type password (for example 'devuser') twice and exit
template1=# alter role array101 with login;
template1=# \q
```
Now add `gem 'psql'` to your `Gemfile`, bundle it from your linux console with `bundle install` and setup your `database.yml` config.</p>

```yaml
default: &default
adapter: postgresql
encoding: unicode
pool: 5

development:
<<: *default
database: awesomeapp_development
host: localhost
username: devuser
password: devuser
```

Now setup your app's db and start the rails server.
```zsh
# create development database and run migrations
$ bundle exec rails db:create && bundle exec rails db:migrate
# start the server
$ rails server
```
