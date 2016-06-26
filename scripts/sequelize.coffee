# js2coffee scripts/sequelize.js > scripts/sequelize.coffee

# CREATE USER infinith4 IDENTIFIED BY PASSWORD 'infinith4';
#
# mysql> use infbot_db;
# mysql> GRANT ALL PRIVILEGES ON *.* TO infinith4@localhost IDENTIFIED BY 'infinith4' WITH GRANT OPTION;
# mysql> FLUSH PRIVILEGES;
Sequelize = require('sequelize')
sequelize = new Sequelize('infbot_db', 'infinith4', 'infinith4')
DataTypes = require('sequelize/lib/data-types')
#すこしでもDBと定義が違っていると新しいテーブルを作成しようとする
Users = sequelize.define('users', {
  uid:
    type: DataTypes.INTEGER(11)
    allowNull: false
    primaryKey: true
    autoIncrement: true
  name:
    type: DataTypes.TEXT
    allowNull: false
  password:
    type: DataTypes.TEXT
    allowNull: true
},
  timestamps: false
  tableName: 'users')
sequelize.sync().then(->
  Users.create
    name: 'infinith4'
    password: 'infinith4'
).then (jane) ->
  console.log jane.get(plain: true)
  return
# Users.find({where:{uid:1}}).success (person) ->
#   console.log person.uid

Users.findAll().then (person) ->
  for item in person
    console.log item.uid

# sequelize.sync().complete(function() {
#   return Users.find({ where: {name: 'janedoe'} })
#       .error(function(err) {
#         //参照エラー時の処理
#         console.log(err);
#       })
#       .success(function(result) {
#         //参照成功時の処理
#         console.log("name: " + result.name);
#         console.log("password: " + result.password);
#       });
# });
#
# var Users = sequelize.define('users', {
#   uid: Sequelize.INTEGER,
#   name: Sequelize.STRING,
#   password: Sequelize.STRING
# });
#
# var result = Users.sync()
# console.log result
#
# Users.sync().complete(function(){
#   Users.create({ uid: 300, name: 'excale', password: 'excale'})
#     .error(function(err) {
#       //作成エラー時の処理
#       console.log(err);
#     })
#     .success(function(result) {
#       //作成成功時の処理
#       User.find({ where: {name: 'excale'} })
#       .error(function(err) {
#         //参照エラー時の処理
#         console.log(err);
#       })
#       .success(function(result) {
#         //参照成功時の処理
#         console.log("name: " + result.name);
#         console.log("password: " + result.password);
#       });
#     });
# });
