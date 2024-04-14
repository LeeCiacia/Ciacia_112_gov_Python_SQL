#應用lesson13_1.py的資料來連結網頁的dataframe
import streamlit as st 
#把lesson13_1的程式碼貼過來 
from dotenv import load_dotenv
import psycopg2
import os
load_dotenv()

with psycopg2.connect(os.environ['POSTGRE_PASSWORD']) as conn:
    with conn.cursor() as cursor:
        sql='''
            SELECT 聯絡人id,客戶名稱,聯絡人姓名,電話,郵件
            FROM 聯絡人 LEFT JOIN 客戶 ON 聯絡人.客戶id = 客戶.客戶_id
        '''
        cursor.execute(sql)
        datas:list = cursor.fetchmany(10)
        
datas    #利用streamlit的magic功能來成資料庫的內容，因為這段程式碼是由上而下最後呈現datas，所以要打上datas(不能間隔太遠，不然跑不出來)

# 這些原來lesson13_1的程式碼要刪掉⬇️⬇️
#for item in datas:
#print(item)

