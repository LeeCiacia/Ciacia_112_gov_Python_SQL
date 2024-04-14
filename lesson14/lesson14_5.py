#應用lesson13_1.py的資料來連結網頁的dataframe
import streamlit as st 
#把lesson13_1的程式碼貼過來 
from dotenv import load_dotenv
import psycopg2
import os
load_dotenv()

@st.cache_resource #加這個效能好
def get_contacts() -> list:  #自訂function功能def get_contact():
    with psycopg2.connect(os.environ['POSTGRE_PASSWORD']) as conn:
        with conn.cursor() as cursor:
            sql='''
                SELECT 聯絡人id,客戶名稱,聯絡人姓名,電話,郵件
                FROM 聯絡人 LEFT JOIN 客戶 ON 聯絡人.客戶id = 客戶.客戶_id
            '''
            cursor.execute(sql)
            datas:list = cursor.fetchmany(10)
            contacts = []
            for item in datas:
                contacts.append({'id':item[0],'客戶名稱':item[1],'姓名':item[2],'電話':item[3],'郵件':item[4]}) 
            return contacts  #要return 資料contacts才會傳出來


@st.cache_resource #加這個效能好
def get_names() -> list:
    with psycopg2.connect(os.environ['POSTGRE_PASSWORD']) as conn:
        with conn.cursor() as cursor:
            sql='''
                SELECT DISTINCT 客戶名稱
                FROM 聯絡人 LEFT JOIN 客戶 ON 聯絡人.客戶id = 客戶.客戶_id
            '''
            cursor.execute(sql)
            datas:list(tuple) = cursor.fetchmany(10)
            names=[]
            for item in datas:
                 names.append(item[0])
            return(datas)
        

source_data:list[dict] = get_contacts()
with st.sidebar:  # 這些要做成sidebar
    option = st.selectbox(
    '請選擇姓名:',
    get_names())

