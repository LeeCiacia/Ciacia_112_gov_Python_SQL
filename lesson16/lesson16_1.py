import streamlit as st

st.title("Session_state基礎")
st.write(st.session_state)
##使用input widget
number:int=st.slider("數值",min_value=1,max_value=10,key='mySlider')
#st.write("加入slider後的session_state",st.session_state)

next = st.button("下一個選項")
if next:
    if st.session_state.radio_option == "a":
        st.session_state.radio_option = "b"
    elif st.session_state.radio_option == "b":
        st.session_state.radio_option = "c"
    elif st.session_state.radio_option == "c":
        st.session_state.radio_option = "d"
    else:
        st.session_state.radio_option = "a"

col1, buff, col2= st.columns([1, 0.5, 3])

with col1:
    option_names = ["a", "b", "c", "d"]
    option = st.radio("請選擇1個",option_names,key="radio_option")
    #st.write("加入radio後的session_state",st.session_state)

with col2:
    if option == 'a':
        st.write("您選擇的是'a':apple:")
    elif option =='b':
        st.write("您選擇的是'b':bear:")
    elif option =='c':
        st.write("您選擇的是'c':cat:")
    elif option =='d':
        st.write("您選擇的是'd':dog:")


    