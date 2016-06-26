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
  tableName: 'clean_up')

insert_group_name = ""
Clean_up.findOne({order:'createdAt DESC'}).then (record) ->
  console.log record.get(plane:true)
  console.log record.group_name
  console.log "record.group_name"
  switch record.group_name
    when "A"
      insert_group_name = "B"
    when "B"
      insert_group_name = "A"
  console.log "insert_group_name"
  console.log insert_group_name
  #以下のindenｔを下げるとinsert_group_nameに文字が入る前に実行されるので注意
  if(insert_group_name != "")
    sequelize.sync().then(->
      Clean_up.create
        group_name: insert_group_name
    ).then (result) ->
      console.log result.get(plain: true)
