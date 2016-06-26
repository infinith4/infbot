# # CREATE DATABASE infbot_db CHARACTER SET utf8;
# # create table infbot_db.clean_up(id int, group_name varchar(5));
# # show tables;
# # describe clean_up
# # DROP TABLE clean_up
#
# Sequelize = require 'sequelize'
# sequelize = new Sequelize 'macheb_db', 'infinith4', 'infinith4',
#   host: 'localhost'
#   port: 3306
# console.log sequelize
# #
# # var Sequelize = require ('sequelize');
# # var sequelize = new Sequelize('database', 'user', 'password', { host: 'localhost', port: 330
#
# sequelize.sync()
#
# Users = sequelize.define 'users',
#   uid: Sequelize.INTEGER,
#   name: Sequelize.STRING,
#   password: Sequelize.STRING
#
# console.log Users
#
# Users.findAll().success(Users) ->
#   console.log users
