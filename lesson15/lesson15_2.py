import streamlit as st  #在streamlit做一個計數器

if 'count' not in st.session_state:
    st.session_state.count = 0

st.title("計數器範例")

increment = st.button("增加計數器的值",key="mybottom")  #建立一個按鈕 #default value:False
if increment:    #increment增加或增值的意思，通常用於數值或計數的增加。
    st.session_state.count += 1

st.write("計數器:",st.session_state.count)