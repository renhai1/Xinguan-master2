from gettext import translation
from operator import index
from warnings import catch_warnings
from colorama import Cursor
import pymysql
from sqlalchemy import null

# 有一些不太对之后没有改这上面的
# record={"index":%,"timestamp":%,"transaction":%,"proof":%,"previous_hash":%}
# user={"id":%,"password":%}
# biz_out_stock={"id":%,"out_num":%,"operator":%,"product_number":%,"consumer_id":%}
# biz_in_stock={"id":%,"in_num":%,"operator":%,"product_number":%}

#创建数据库链接
def connect():
    conn = pymysql.connect(host="127.0.0.1",port=3306,user="root",password="root",database="new_stock",charset="utf8")
    cursor = conn.cursor()
    return conn,cursor

# 释放资源
def close(conn,cursor):
    cursor.close()
    conn.close()

# 用户增加
def save_user(name,password,id):
    conn,cursor=connect()
    sql = "insert into user(id,password,name) values(%s,%s,%s)"
    cursor.execute(sql,[id,password,name])
    conn.commit()
    close(conn,cursor)

# 用户查询
def get_db_users():
    user={"node_identifier":null,"password":null,"username":null}
    conn,cursor=connect()
    sql = "select * from user"
    cursor.execute(sql)
    tuple=cursor.fetchone()
    user['node_identifier']=tuple[0]
    user['password']=tuple[1]
    user['username']=tuple[2]
    conn.commit()
    close(conn,cursor)
    return user

#清空数据库中的链
def record_clear():
    conn,cursor=connect()
    sql = "SET foreign_key_checks = 0" # 删除外键约束
    cursor.execute(sql)
    sql = "truncate table biz_in_stock"
    cursor.execute(sql)
    sql = "truncate table biz_out_stock"
    cursor.execute(sql)
    sql = "truncate table record"
    cursor.execute(sql)
    sql = "SET foreign_key_checks = 1" # 启动外键约束
    cursor.execute(sql)
    conn.commit()
    close(conn,cursor)

# 块增加操作
def save_block(record):
    conn,cursor=connect()
    transaction=record['transactions']
    sql = "insert into record(biz_index,biz_timestamp,biz_transaction,biz_proof,biz_previous_hash) values(%s,%s,%s,%s,'%s')"%\
        (record['index'],record['timestamp'],record['index'],record['proof'],str(record['previous_hash']))
    cursor.execute(sql)
    conn.commit()
    num=len(transaction)
    while num!=0:
        num-=1
        # print('第%d条'%num)
        if len(transaction[num])==4:
            in_stock_insert(transaction[num],record['index'])
        else:
            out_stock_insert(transaction[num],record['index'])
    close(conn,cursor)


# 链增加操作
def save_full_chain(chain):
    num=0
    while num!=len(chain):
        # print('第%d块'%num)
        save_block(chain[num])
        num+=1

#清空数据库中的临时存储
def current_traintions_clear():
    conn,cursor=connect()
    sql = "truncate table current_in_transactions"
    cursor.execute(sql)
    sql = "truncate table current_out_transactions"
    cursor.execute(sql)
    conn.commit()
    close(conn,cursor)


# 临时交易存储
def save_current_traintions(current_transactions):
    num=len(current_transactions)
    while num!=0:
        num-=1
        if len(current_transactions[num])==4:
            current_in(current_transactions[num])
        else:
            current_out(current_transactions[num])

def current_in(currenet_transaction):
    conn,cursor=connect()
    sql = "insert into current_in_transactions(id,in_num,operator,product_number) values(%s,'%s',%s,%s)"\
        %(currenet_transaction['id'],currenet_transaction['in_num'],currenet_transaction['operator'],currenet_transaction['product_number'])
    cursor.execute(sql)
    conn.commit()
    close(conn,cursor)

def current_out(currenet_transaction):
    conn,cursor=connect()
    sql = "insert into current_out_transactions(id,out_num,operator,product_number,consumer_id) values(%s,'%s',%s,%s,%s)"\
        %(currenet_transaction['id'],currenet_transaction['out_num'],currenet_transaction['operator'],currenet_transaction['product_number'],currenet_transaction['consumer_id'])
    cursor.execute(sql)
    conn.commit()
    close(conn,cursor)

def get_db_current_traintions():
    conn,cursor=connect()
    sql = "select * from current_out_transactions"
    cursor.execute(sql)
    transaction=[]
    tuplee=cursor.fetchall()
    num=len(tuplee)
    while num!=0:
        num-=1
        transaction.append(out_translate(num,tuplee))
    sql = "select * from current_in_transactions"
    cursor.execute(sql)
    tuplee=cursor.fetchall()
    num=len(tuplee)
    while num!=0:
        num-=1
        transaction.append(in_translate(num,tuplee))
    conn.commit()
    close(conn,cursor)
    return transaction
    

def save_nodes(nodes):
    list_node=list(nodes)
    print(type(list_node))
    conn,cursor=connect()
    num=len(list_node)
    while num!=0:
        num-=1
        print(list_node[num])
        sql = "insert into netloc(netloc) values('%s')"%(list_node[num])
        cursor.execute(sql)
    conn.commit()
    close(conn,cursor)

def get_db_nodes():
    conn,cursor=connect()
    sql = "select * from netloc"
    cursor.execute(sql)
    netloc=[]
    ip=cursor.fetchone()
    while ip!=None:
        netloc.append(ip[0])
        ip=cursor.fetchone()
    conn.commit()
    close(conn,cursor)
    return netloc

#清空数据库中的临时存储的node
def current_netloc_clear():
    conn,cursor=connect()
    sql = "truncate table netloc"
    cursor.execute(sql)
    conn.commit()
    close(conn,cursor)

# 入库字段添加
def in_stock_insert(biz_in_stock,transaction):
    conn,cursor=connect()
    sql = "insert into biz_in_stock(id,in_num,operator,product_number,biz_transaction) values(%s,%s,%s,%s,%s)"
    cursor.execute(sql,\
    [biz_in_stock['id'],\
    biz_in_stock['in_num'],\
    biz_in_stock['operator'],\
    biz_in_stock['product_number'],\
    transaction])
    conn.commit()

# 出库字段添加
def out_stock_insert(biz_out_stock,transaction):
    conn,cursor=connect()
    sql = "insert into biz_out_stock(id,out_num,operator,product_number,consumer_id,biz_transaction) values(%s,%s,%s,%s,%s,%s)"
    cursor.execute(sql,\
    [biz_out_stock['id'],\
    biz_out_stock['out_num'],\
    biz_out_stock['operator'],\
    biz_out_stock['product_number'],\
    biz_out_stock['consumer_id'],\
    transaction])
    conn.commit()

# 查询所有块
def get_db_allchain():
    conn, cursor = connect()
    sql = "select * from record"
    cursor.execute(sql)
    content = cursor.fetchall()
    list_dic=[]
    num=len(content)
    while num!=0:
        num-=1
        list_dic.append(query_one(content[num][0]))
    close(conn,cursor)
    return list_dic

# 查询一个块，已知index
def query_one(index):
    try:
        tuple_in_transaction=()
        tuple_out_transaction=()
        conn, cursor = connect()
        sql = "select * from record where biz_index=%s"%(index)
        cursor.execute(sql)
        content=cursor.fetchone()
        sql = "select * from biz_in_stock where biz_transaction=%s"%(content[1])
        cursor.execute(sql)
        tuple_in_transaction+=cursor.fetchall()
        sql = "select * from biz_out_stock where biz_transaction=%s"%(content[1])
        cursor.execute(sql)
        tuple_out_transaction+=cursor.fetchall()
    except:
        print("输入块索引有误")
    dic=translate(content,tuple_in_transaction,tuple_out_transaction)
    return dic

# 查询最后一个块
def get_db_lastblock():
    tuple_in_transaction=()
    tuple_out_transaction=()
    conn, cursor = connect()
    sql = "select * from record order by biz_index desc"
    cursor.execute(sql)
    content=cursor.fetchone()
    sql = "select * from biz_in_stock where biz_transaction=%s"%(content[1])
    cursor.execute(sql)
    tuple_in_transaction+=cursor.fetchall()
    sql = "select * from biz_out_stock where biz_transaction=%s"%(content[1])
    cursor.execute(sql)
    tuple_out_transaction+=cursor.fetchall()
    dic=translate(content,tuple_in_transaction,tuple_out_transaction)
    close(conn,cursor)
    # del_db_lastblock(content[0])
    return dic

#删除最后一个块
def del_db_lastblock(index):
    conn,cursor=connect()
    sql = "delete from record where biz_index=%s"%(index)
    cursor.execute(sql)
    conn.commit()
    close(conn,cursor)

# 转化
def translate(content,tuple_in_transaction,tuple_out_transaction):
    block={"index":content[0],"timestamp":content[3],"transactions":[],"proof":int(content[2]),"previous_hash":content[4]}
    list_transaction=[]
    num=len(tuple_in_transaction)
    while num!=0:
        num-=1
        list_transaction.append(in_translate(num,tuple_in_transaction))

    num=len(tuple_out_transaction)
    while num!=0:
        num-=1
        list_transaction.append(out_translate(num,tuple_out_transaction))
    list_transaction.reverse()
    block["transactions"]=list_transaction
    return block

def in_translate(num,tuple_in_transaction):
    biz_in_stock={"id":null,"in_num":null,"operator":null,"product_number":null}
    biz_in_stock["id"]=tuple_in_transaction[num][0]
    biz_in_stock["in_num"]=tuple_in_transaction[num][1]
    biz_in_stock["operator"]=tuple_in_transaction[num][2]
    biz_in_stock["product_number"]=tuple_in_transaction[num][3]
    return biz_in_stock

def out_translate(num,tuple_out_transaction):
    biz_out_stock={"id": null ,"out_num":null,"operator":null,"product_number":null,"consumer_id":null}
    biz_out_stock["id"]=tuple_out_transaction[num][0]
    biz_out_stock["out_num"]=tuple_out_transaction[num][1]
    biz_out_stock["operator"]=tuple_out_transaction[num][2]
    biz_out_stock["product_number"]=tuple_out_transaction[num][3]
    biz_out_stock["consumer_id"]=tuple_out_transaction[num][4]
    return biz_out_stock

# nodes = set(("192.168.0.0", "192.168.0.1", "192.168.0.2"))
# save_nodes(nodes)

print(get_db_nodes())