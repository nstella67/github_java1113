<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../adminAuth.jsp" %>
<%@ include file="../../bbs/ssi.jsp" %>
<%@ include file="../../Admin_header.jsp" %>	
	<%
	col=Utility.checkNull(request.getParameter("col"));
	ArrayList<BbsDTO> bslist=dao.bslist(col);
	if(bslist==null){
		out.println("<tr><td colspan='7'>자료없음</td>");	
	}else{
	%>
	
				<h3>* 게시판 목록 *</h3>
		전체 글 수 : <strong><%=dao.recordCount() %></strong>
		<hr>
	<form method="get" action="bsDelProc.jsp">
		<table>
		<thead>
			<tr>
				<th><input type="checkbox" name="checkAll" id="checkAll" onclick="cAll(this);"/></th>
				<th>글번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>조회수</th>
				<th>그룹번호</th>
				<th>등록일</th>
			</tr>
		</thead>
	<%
		for(int idx=0; idx<bslist.size(); idx++){
			dto=bslist.get(idx);
	%>

		<tbody>
			<tr>
				<td class="center"><input type="checkbox" name="checkRow" value="<%=dto.getBbsno() %>" /></td>
				<td><%=dto.getBbsno()%></td>
				<td><%=dto.getWname()%></td>
				<td><%=dto.getSubject()%></td>
				<td><%=dto.getReadcnt() %></td>
				<td><%=dto.getGrpno() %></td>
				<td><%=dto.getRegdt() %></td>
			</tr>	
		</tbody>
	<%
			}
	%>
			<tr>
				<td colspan="7" align="left">
					<input type="submit" value="선택한 글 삭제">
					<input type="hidden" name="checkRow" value="<%=dto.getBbsno() %>" >
				</td>
			</tr>
<%-- 		<!-- 정렬 -->
		<table>
		<tr>
			<td colspan="6">
				<form action="bsList.jsp">
					<select name="col" onchange="sort(this.form)">
						<option value="bbsno" <%if(col.equals("")||col.equals("bbsno")){out.println("selected");} %>>글번호순
						<option value="subject" <%if(col.equals("subject")){out.println("selected");} %>>제목순
						<option value="regdt" <%if(col.equals("regdt")){out.println("selected");} %>>등록일순
					</select>
				</form>
			</td>
		</tr>
		</table> --%>
	<%
		}//if end
	%>
		</table>
	</form>


				
		<script>
			function sort(f){
				f.submit();
			}//sort() end
			
			function cAll(obj){	//전체선택/해제
				var chkObj = document.getElementsByName("checkRow");
			      var rowCnt = chkObj.length - 1;
			      var check = obj.checked;
			      if (check) {﻿
			          for (var i=0; i<=rowCnt; i++){
			               chkObj[i].checked = true; 
			          }
			      } else {
			          for (var i=0; i<=rowCnt; i++) {
			               chkObj[i].checked = false; 
			          }
			      }
			}//cAll() end
			
			
			
/*  			function deleteAction(){
				  var checkRow = "";
				  $( "input[name='checkRow']:checked" ).each (function (){
				    checkRow = checkRow + $(this).val()+"," ;
				  });
				  checkRow = checkRow.substring(0,checkRow.lastIndexOf( ",")); //맨끝 콤마 지우기
				 
				  if(checkRow == ''){
				    alert("삭제할 대상을 선택하세요.");
				    return false;
				  }
				  console.log("### checkRow => {}"+checkRow);
				 
				  if(confirm("정보를 삭제 하시겠습니까?")){
				      
				      //삭제처리 후 다시 불러올 리스트 url      
				      var url = document.location.href;
				      var page = $("#page").val();
				      var saleType = $("#saleType").val();
				      var schtype = $("#schtype").val();
				      var schval = $("#schval").val();
				      location.href="${rc.contextPath}/test_proc.do?idx="+checkRow+"&goUrl="+url+"&page="+page+"&saleType="+saleType+"schtype="+schtype+"schval="+schval;      
				  }
				}// */
		</script>
<%@ include file="../../Admin_footer.jsp" %>