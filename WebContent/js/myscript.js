/* myscript.js */


function showtime(){
			var today=new Date();

			var str="";

			str += today.getFullYear()+".";

			if(today.getMonth()+1<10){
				str += "0";
			}
			str += (today.getMonth()+1)+".";

			if(today.getDate()<10){
				str += "0";
			}
			str += today.getDate();

			var weekName=["일", "월", "화", "수", "목", "금", "토"];
			str += " ("+weekName[today.getDay()]+") ";

			if((today.getHours()>12 && today.getHours()<23) || today.getHours()==0){
				str += "PM "+(today.getHours()-12)+":";
			}else{
			str += "AM "+today.getHours()+":";
			}

			if(today.getMinutes()<10){
				str+="0";
			}
			str += today.getMinutes()+":";

			if(today.getSeconds()<10){
				str+="0";
			}
			str += today.getSeconds();	

			document.myform.clock.value=str;
			timer = setTimeout(showtime, 1000);
		}//showtime() end

function del(){
   if(confirm("삭제할까요?")){
       alert("확인을 선택했습니다");
   }
   else{
       alert("취소를 선택했습니다");
   }
   return;
}
		

function bbsCheck(f){	//답변형 게시판 유효성검사
	// 작성자, 제목, 내용글자, 비번, 글자 갯수 확인
	
	//1) 작성자
	var wname=f.wname.value;
	wname=wname.trim();
	if(wname.length==0){
		alert("작성자 입력해주세요");
		f.wname.focus();
		return false;
	}//end
	
	//2) 제목
	
	
	//3) 내용
	
	
	//4) 비밀번호 4글자이상
	var passwd=f.passwd.value;
	passwd=passwd.trim();
	if(passwd.length<4){
		alert("비밀번호 4글자 이상 입력해주세요");
		f.passwd.focus();
		return false;
	}//end
	
	//5) 글자 갯수
	
	
	return true;	//onsubmit 이벤트에서 서버로 전송
	
}//Check() end

function pwCheck(f){
	//비밀번호가 입력되었는지 확인
	var passwd=f.passwd.value;
	passwd=passwd.trim();
	if(passwd.length<4){
		alert("비밀번호 4글자 이상 입력해주세요");
		f.passwd.focus();
		return false;
	}//end
	
	var msg="진행된 내용은 복구되지 않습니다\n계속 진행 할까요?";
	if(confirm(msg)){	//확인 true, 취소 false 반환
		return true;
	}else{
		return false;
	}
	return true;
}//pwCheck() end

function move(f, file){
	f.action=file;
	f.submit();
}//pwCheck() end


function searchCheck(f){
	var word=f.word.value;
	word=word.trim();
	if(word.length==0){
		alert("검색어를 입력하세요");
		return false;
	}
	
	return true;
}//searchCheck() end












