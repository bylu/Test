		//检查用户名
		function  checkAccount(){
			if($("#userName").val().length <6 || $("#userName").val().length >16) {
               $("#userNameError").html("请输入用户名(长度为6-16个字符)!");
			   $("#userNameError").css("color","red");
				error1=0;
                return false;
           }else{
				var reg=/^[A-Za-z0-9]+$/;
				if(!reg.test($("#userName").val())){
					$("#userNameError").html("用户名只能是英文和或数字的组合!");
					$("#userNameError").css("color","red");
					error1=2;
					}else{
					$.ajax({
			        	async:false,
			           url: 'http://www.789game.com/api/checkaccounts.html',
			           type: "GET",
			           dataType: 'jsonp',
			           jsonp: 'jsoncallback',
			           data:{'accounts':$("#userName").val()},
			           success: function (json) {
			        		if(json==0){
							$("#userNameError").html("用户名可以注册");
							$("#userNameError").css("color","white");
							error1=1;
			        		 return;
			        		}else{
			        			//alert(json);
								$("#userNameError").html(json);
								$("#userNameError").css("color","red");
			        		}
			           },
			           error: function(xhr){
			        	alert("请求出错,请检查相关度网络状况");
			           }
			        });	
				     }
		       }
		}
		//检查昵称
		function checkNickName(){
			if ($("#userNickName").val().length <6 || $("#userNickName").val().length >16) {
              	 $("#userNickNameError").html("请输入昵称(长度为6-16个字符)!");
				 $("#userNickNameError").css("color","red");
				  error2=0;
                return false;
            }else{
				var reg = /^[a-zA-Z0-9_\u4e00-\u9fa5]+$/;
				if (!reg.test($("#userNickName").val())) {
					$("#userNickNameError").html("由字母、数字、下划线和汉字的组合！");
					$("#userNickNameError").css("color","red");
					 error2=2;
					return false;
				}else{
					$.ajax({
			            async:false,
			            url: 'http://www.789game.com/api/checknickname.html',
			            type: "GET",
			            dataType: 'jsonp',
			            jsonp: 'jsoncallback',
			            data:{'nickname':$("#userNickName").val()},
			            success: function (json) {
			            		if(json==0){
								$("#userNickNameError").html("该昵称可以使用");
								$("#userNickNameError").css("color","white");
								error2=1;
			            		return;
			            		}else{
									 $("#userNickNameError").html(json);
									 $("#userNickNameError").css("color","red");
			            		}
			            },
			            error: function(xhr){
			            	alert("请求出错,请检查相关度网络状况");
			            }
			            });
		        }
			}
		}
		//检查密码
		function  checkPwd(){
		 var reg=/^[A-Za-z0-9]+$/;
			if ($("#userPwd").val().length < 6 || $("#userPwd").val().length > 16) {
              	 $("#userPwdError").html("请输入密码（长度为6到16）");
				 $("#userPwdError").css("color","red");
				 error3=0;
                return false;
            }
			if (!reg.test($("#userPwd").val())) {
					$("#userPwdError").html("密码只能是英文和或数字的组合");
					$("#userPwdError").css("color","red");
					error3=3;
					return false;
				}
			$("#userPwdError").html("该密码可以使用");
			$("#userPwdError").css("color","white");
			error3=1;
			return true;
		}
		
		//检查重复输入密码
		function checkRepPwd(){
			if ($("#userRePwd").val() == "") {
                $("#userRePwdError").html("请输入您的确认密码");
				$("#userRePwdError").css("color","red");
				error4=0;
                return false;
            }else {
				if($("#userRePwd").val() != $("#userPwd").val()){
					$("#userRePwdError").html("两次密码输入不一样");
					$("#userRePwdError").css("color","red");
					error4=2;
					return false;
				}
			$("#userRePwdError").html("重复输入密码正确");
			$("#userRePwdError").css("color","white");
			error4=1;
            return true;
			}
            
			
		}
		//检查数据库里面是否已经存在此用户名