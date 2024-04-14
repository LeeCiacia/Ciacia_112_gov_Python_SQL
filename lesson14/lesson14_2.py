#建立網頁欄位跟圖片，這次用貓狗應的照片

import streamlit as st

st.title('哈哈動物園')

col1, col2, col3 = st.columns(3)  #分成三個欄位 col1, col2, col3。(3)表示欄位有3個

with col1:   #with
   st.header("A cat")
   st.image("https://static.streamlit.io/examples/cat.jpg")

with col2:
   st.header("A dog")
   st.image("https://static.streamlit.io/examples/dog.jpg")

with col3:
   st.header("An owl")
   st.image("https://static.streamlit.io/examples/owl.jpg")