#!/usr/bin/env python
#coding:utf8
#将mysql数据库中所有的 myisam 表升级为 innodb
import sqlalchemy as sa
#示例中的 mysql 服务器的超级用户只允许操作系统信任登录
database = 'db'
engine=sa.create_engine("mysql://127.0.0.1/%s"%db)
for row in engine.execute("SHOW TABLE STATUS from  %s where engine='MyISAM'"%db):
    print "upgrade %s's engine"%row["name"]
    engine.execute("alter table %s engine InnoDB"%row["name"])
