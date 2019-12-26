<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <!--**********************************
            Footer start
        ***********************************-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <!-- 
                  여기 수정해야됨 온 오프랑 에러 하나 뜸 12.24 이용욱
        <script type="text/javascript">
        $(function(){
        	$('#chatopen').click(function(){
            	if($(this).('name')=='on'){
            		$(this).attr('src','./images/chat/chatclose.png');
               	}else{
               		$(this).attr('src','./images/chat/chatopen.png');
                   	}
            });
        });
		</script> -->
        <style>
		#chatopen {
		  position: fixed;
		  bottom: 16px;
		  right: 16px;
		  font-size: 18px;
		}
		</style>
        <div class="footer">
            <div class="copyright">
                <p>Copyright &copy; Designed & Developed by <a href="https://themeforest.net/user/quixlab">Quixlab</a> 2018</p>
            </div>
        </div>
        <img src="./images/chat/chatopen.png" id="chatopen" name="on" width=75px height=auto style="cursor: pointer;">
        <!--**********************************
            Footer end
        ***********************************-->