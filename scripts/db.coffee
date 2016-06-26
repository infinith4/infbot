# # CREATE DATABASE infbot_db CHARACTER SET utf8;
# # create table infbot_db.clean_up(id int, group_name varchar(5));
# # show tables;
# # describe clean_up
# # DROP TABLE clean_up
#
# Sequelize = require 'sequelize'
# sequelize = new Sequelize 'infbot_db', 'infinith4', 'infinith4',
#   host: 'localhost'
#   port: 3306
# console.log sequelize
#
# sequelize.sync force: true
#
# # Clean_up = sequelize.define 'Clean_up',
# #   ids: { type: Sequelize.INTEGER, allowNull: false}
# #   group_name: { type: Sequelize.STRING, allowNull: false}
# #   date: { type: Sequelize.DATE}
# Clean_up = sequelize.define 'Clean_up',
#   ids: Sequelize.INTEGER,
#   group_name: Sequelize.STRING,
#   date: Sequelize.DATE
#
# clean_up = Clean_up.build
#   ids: 1
#   group_name: "B"
#   date: new Date 2016, 6, 29
#
# clean_up.save().success ->
#   console.log "保存成功"
#
#
#
# Clean_up.find(1).success (clean_up) ->
#   # クエリが完了するとこの部分が実行される。見つからなかった場合はpersonがnullとなる。
#   console.log "ids: #{clean_up.ids}"
#   console.log "group_name: #{clean_up.group_name}"
#   console.log "date: #{clean_up.date}"
