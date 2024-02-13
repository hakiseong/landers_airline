<%@page import="com.landers.airline.dto.RefundDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    List<RefundDto> list = (List<RefundDto>) request.getAttribute("list");
%>

<html>
<head>
    <meta charset="UTF-8">
    <title>환불승인페이지</title>
    <script>
        function deleteApprovedRefunds() {
            var table = document.getElementById("refundTable");
            var rows = table.getElementsByTagName("tr");

            for (var i = rows.length - 1; i > 0; i--) {
                var cells = rows[i].getElementsByTagName("th");
                var statusCell = cells[4];

                // "승인" 상태인 행을 삭제
                if (statusCell.innerHTML.trim() === "승인") {
                    table.deleteRow(i);
                }
            }
        }
    </script>
</head>
<body>
    <h1>환불승인페이지</h1>

    <table border="1" id="refundTable">
        <tr>
            <th>환불번호</th>
            <th>아이디</th>
            <th>예약번호</th>
            <th>환불내용</th>
            <th>환불상태</th>
            <th></th>
        </tr>

        <%
            for (int i = 0; i < list.size(); i++) {
                RefundDto dto = list.get(i);
        %>
        <tr>
            <th><%=dto.getRefund_id() %></th>
            <th><%=dto.getUser_id()%></th>
            <th><%=dto.getTicket_id() %></th>
            <th><%=dto.getContent()%></th>     
            <th><%=dto.getRefund_status()%></th>            
            <td>
                <a href="refundAf.do?refund_id=<%=dto.getRefund_id()%>">승인하기</a>
            </td>
        </tr>
        <%
            }
        %>
    </table>

    <button onclick="deleteApprovedRefunds()">승인된 데이터 삭제</button>
</body>
</html>