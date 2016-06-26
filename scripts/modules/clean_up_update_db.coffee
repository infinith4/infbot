# js2coffee scripts/sequelize.js > scripts/sequelize.coffee

# CREATE USER infinith4 IDENTIFIED BY PASSWORD 'infinith4';
#
# mysql> use infbot_db;
# mysql> GRANT ALL PRIVILEGES ON *.* TO infinith4@localhost IDENTIFIED BY 'infinith4' WITH GRANT OPTION;
# mysql> FLUSH PRIVILEGES;
# INSERT INTO clean_up VALUES (1, 'A', '2016-06-21 22:30:00', '2016-06-21 22:30:00');

# ここはrequire()された時点で実行される
console.log "モジュールをロード中"
moment = require 'moment'
Sequelize = require('sequelize')
sequelize = new Sequelize('infbot_db', 'infinith4', 'infinith4')
DataTypes = require('sequelize/lib/data-types')
#すこしでもDBと定義が違っていると新しいテーブルを作成しようとする
Clean_up = sequelize.define('clean_up', {
  id:
    type: DataTypes.INTEGER(11)
    allowNull: false
    primaryKey: true
    autoIncrement: true
  group_name:
    type: DataTypes.TEXT
    allowNull: false
},
  timestamps: true
  tableName: 'clean_up'
  timezone: '+09:00')

# require()で返されるオブジェクト
module.exports =
  find: ->
    Clean_up.find({order:'createdAt DESC'}).then (record) ->
      console.log record.get(plane:true)
      record_created_date = moment(record.createdAt).format("YYYY-MM-DD HH:mm:ss Z")
      console.log moment(record.createdAt).format("YYYY-MM-DD HH:mm:ss Z")
      console.log record.group_name
      console.log "record.group_name"
      switch record.group_name
        when "A"
          insert_group_name = "B"
        when "B"
          insert_group_name = "A"
      console.log insert_group_name
      new Promise (resolve)->
        setTimeout ->
          console.log "insert_group_name: #{insert_group_name} complete"
          resolve "#{insert_group_name}"
          , 200 + Math.random() * 100
  update: ->
    console.log "last week: #{moment().add(-7,"day").format("YYYY-MM-DD HH:mm:ss Z")}"
    last_week = moment().add(-7,"day").format("YYYY-MM-DD HH:mm:ss Z")
    insert_group_name = ""
    Clean_up.find({order:'createdAt DESC'}).then (record) ->
      console.log record.get(plane:true)
      record_created_date = moment(record.createdAt).format("YYYY-MM-DD HH:mm:ss Z")
      console.log moment(record.createdAt).format("YYYY-MM-DD HH:mm:ss Z")
      console.log record.group_name
      console.log "record.group_name"
      switch record.group_name
        when "A"
          insert_group_name = "B"
        when "B"
          insert_group_name = "A"
      console.log insert_group_name
      console.log "insert_group_name"
      diffday = moment().diff(record_created_date, "days")
      #以下のindenｔを下げるとinsert_group_nameに文字が入る前に実行されるので注意
      if(insert_group_name != "")
        if(diffday == -6 || diffday == -7)
          sequelize.sync().then(->
            Clean_up.create
              group_name: insert_group_name
          ).then (result) ->
            console.log result.get(plain: true)
            new Promise (resolve)->
              setTimeout ->
                console.log "result.get(plain: true): #{result.get(plain: true)} complete"
                resolve "#{result.get(plain: true)}"
                , 200 + Math.random() * 100
        else
          console.log('error message. diffday:' + diffday)
