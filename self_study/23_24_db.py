#!/usr/bin/env python
# coding: utf-8

# In[7]:


get_ipython().system('pip install pymysql')


# In[14]:


import pymysql

# .connect
# .cursor
# .execute
# .commit
# .close

db = pymysql.connect(
    host = "localhost",
    port = 3306,
    db = "user_db",
    user = "root",
    password = "1231isaac**",
    charset = "utf8"
)

dbConnect = db.cursor()

# # create table
# sql = '''
# create table user_info(id varchar(10), pw varchar(10),name varchar(10),age int)
# '''
# dbConnect.execute(sql)

# # insert value
# insert = "insert into user_info values(%s, %s, %s, %s)"
# dbConnect.execute(insert,("i001", "1231", "Isaac", int(5)))

# # update value
# update = "update user_info set id = %s where id = %s"
# dbConnect.execute(update,("mir001","i001"))

# # select
# select = 'select * from user_info where id = %s'
# dbConnect.execute(select,("mir001"))
# print(dbConnect.fetchall())

# # delete
# delete = 'delete from user_info where id = %s'
# dbConnect.execute(delete,("mir001"))

db.commit()
db.close()


# In[19]:


try:

    db = pymysql.connect(
        host = "localhost",
        port = 3306,
        db = "user_db",
        user = "root",
        password = "1231isaac**",
        charset = "utf8"
    )

    dbConnect = db.cursor()
    dbConnect.execute('delete from user_info where id = %s')
    db.commit()

except pymysql.err.ProgrammingError as e:
    code, msg = e.args
    print('EXCEPTION OCCURS', code)
    print('EXCEPTION OCCURS', msg)

finally:
    print('call finally')
    db.close()

