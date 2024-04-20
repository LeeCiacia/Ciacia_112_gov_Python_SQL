import streamlit as st  #應用lesson13_1.py的資料來連結網頁的dataframe
from dotenv import load_dotenv
import psycopg2   #把lesson13_1的程式碼貼過來 
import os  #抓電腦的虛擬環境變數
load_dotenv()

def getCity()->list[str]:  #def getCity():：定義了一個名為 getCity 的函式。 #-> list[str]：這部分是型別提示，表示這個函式會返回一個列表（list），列表中的元素都是字符串（str）型別。
    with psycopg2.connect(os.environ['POSTGRE_PASSWORD']) as conn:
        with conn.cursor() as cursor:
            sql='''
                SELECT DISTINCT SUBSTRING(地址, 1, 3) AS county
                FROM stations;
            '''
            cursor.execute(sql)
            queryDatas:list[tuple[str]] = cursor.fetchall()
            #print(queryDatas)
            city_names:list[str] = [item[0] for item in queryDatas]
            #print(city_names)
            return city_names
        
def getStation(city_name:str)->list[str]:
    with psycopg2.connect(os.environ['POSTGRE_PASSWORD']) as conn:
        with conn.cursor() as cursor:
            sql='''
                SELECT DISTINCT 名稱
                FROM stations
                WHERE SUBSTRING(地址, 1, 3) = %(city)s;  
            '''
            cursor.execute(sql,{'city':city_name} )
            queryDatas:list[tuple[str]] = cursor.fetchall()
            station_names:list[str] = [item[0] for item in queryDatas]
            #print(station_names)
            return station_names

with st.sidebar:
    source_data:list[str] = getCity()
    selected_city:str = st.selectbox("選擇縣市",options=source_data)
    #print(selected_city)
    selected_station:list[str] = getStation(selected_city)
    st.selectbox('選擇車站', selected_station)