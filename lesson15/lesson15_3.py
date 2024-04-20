import streamlit as st

#建立預設的session_state的key  #參考lesson15_3.ipynb，自己建立dict
if 'a1' not in st.session_state:
    st.session_state['a1']=100

if 'a2' not in st.session_state:
    st.session_state['a2']=200

if 'a3' not in st.session_state:
    st.session_state['a3']=300

st.write(st.session_state)