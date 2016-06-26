# # js2coffee scripts/sequelize.js > scripts/sequelize.coffee
#
# # CREATE USER infinith4 IDENTIFIED BY PASSWORD 'infinith4';
# #
# # mysql> use infbot_db;
# # mysql> GRANT ALL PRIVILEGES ON *.* TO infinith4@localhost IDENTIFIED BY 'infinith4' WITH GRANT OPTION;
# # mysql> FLUSH PRIVILEGES;
# Sequelize = require('sequelize')
# sequelize = new Sequelize('infbot_db', 'infinith4', 'infinith4')
# DataTypes = require('sequelize/lib/data-types')
# #すこしでもDBと定義が違っていると新しいテーブルを作成しようとする
# Users = sequelize.define('users', {
#   uid:
#     type: DataTypes.INTEGER(11)
#     allowNull: false
#     primaryKey: true
#     autoIncrement: true
#   name:
#     type: DataTypes.TEXT
#     allowNull: false
#   password:
#     type: DataTypes.TEXT
#     allowNull: true
# },
#   timestamps: false
#   tableName: 'users')
#
# sequelize.sync().then(->
#   Users.create
#     name: 'infinith4'
#     password: 'infinith4'
# ).then (jane) ->
#   console.log jane.get(plain: true)
#   return
#
# Users.findAll().then (person) ->
#   for item in person
#     console.log item.uid
