<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.example.demo4.Result" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<<html>
<head>
    <title>Моя лаба</title>
    <link rel="stylesheet" href="style.css">
</head>
<body style="background-color: aqua">
<script defer src="validation.js"></script>
<script defer src="diagramm.js"></script>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <th class="header" colspan="4">
            <p>Вагаев Артем P32312<p>
            Вариант 3231208
        </th>
    </tr>
    <tr>
        <td width="300px" style="text-align:center" colspan="4">
            <canvas id="canvas" width="300" height="300"></canvas>
<%--            <img width="300px" height="300px" src="diagramm.png">--%>
        </td>
    </tr>
    <tr style="height: 20px">
        <td width="50%" style="text-align:center" colspan="4">
            <p id="error_field"></p>
        </td>
    </tr>
    <tr>
        <td>

            <table class="XButtons">
                <tbody>
                <tr>
                    <td colspan="3">
                        <h3 style="text-align:center; margin:auto;">X</h3>
                    </td>
                </tr>

                <tr>
                    <td>
                        <!--<button value="-3" name="x" type="button" onclick="setX(this)">-3</button>-->
                        <button  value="-4" name="x" type="button" id="button1" onclick="setX(this)">-4</button>

                    </td>
                    <td>
                        <button  value="-3" name="x" type="button" onclick="setX(this)">-3</button>
                    </td>
                    <td>
                        <button  value="-2" name="x" type="button" onclick="setX(this)">-2</button>
                    </td>
                </tr>
                <tr>
                    <td>
                        <button  value="-1" name="x" type="button" onclick="setX(this)">-1</button>
                    </td>
                    <td>
                        <button  value="0" name="x" type="button" onclick="setX(this)">0</button>
                    </td>
                    <td>
                        <button  value="1" name="x" type="button" onclick="setX(this)">1</button>
                    </td>
                </tr>
                <tr>
                    <td>
                        <button  value="2" name="x" type="button" onclick="setX(this)">2</button>
                    </td>
                    <td>
                        <button  value="3" name="x" type="button" onclick="setX(this)">3</button>
                    </td>
                    <td>
                        <button  value="4" name="x" type="button" onclick="setX(this)">4</button>
                    </td>
                </tr>
                <script>
                    var curr_x;
                    function setX(button){
                        console.log(curr_x);
                        let arr;
                        arr = document.getElementsByName("x");
                        for (let i = 0;i<arr.length;i++){
                            arr[i].style.background = 'white';
                        }
                        button.style.background = 'orange';
                        document.getElementById("x_value").value = button.value;
                        //console.log(button.textContent)
                        curr_x = button.textContent;
                        //console.log(curr_x);
                    }
                </script>
                </tbody>
            </table>
        </td>
        <!--    <form id="kekw" action="action.php" method="get">-->
        <input type="hidden" id="x_value" name="x_value" value="-3">
<%--        <input type="hidden" id="r_value" name="r_value" value="1">--%>
        <td class="y_block" align="middle">
            <h3>Y (от -3 до 5)</h3>
            <input type="text" name="Y" id="y_field" required maxlength="8">
        </td>
        <!--    </form>-->
        <script>
            function send(){
                let time = new Date();
                time = time.getTimezoneOffset()/60*(-1)-3;
                console.log(time);
                let x = document.getElementById("x_value").value;
                let y = document.getElementById("y_field").value;
                let r = document.getElementById("r_value").value;
                console.log(x,y,r);
                const request = new XMLHttpRequest();
                const url = "ControllerServlet?x_value=" + x + "&y_field=" + y + "&r_value=" + r + "&time=" + time;
                request.open("GET",url);
                request.send();
                request.onload = function (){
                    console.log(request.responseText);
                    if (parseInt(request.responseText) === 100500){
                        //alert("Сюда не тыкай");
                        document.getElementById("error_field").innerText = "Нельзя вводить точку с y<-3 или x<-4 или x>4";
                    }else {
                        document.getElementById("error_field").innerText = "";
                        document.getElementById("mainTB").innerHTML += request.responseText;
                        let lines = document.getElementById("mainTB").getElementsByTagName("tr");
                        let elements = lines[lines.length - 1].getElementsByTagName("td");
                        let color;
                        if (elements[3].innerText === "true") color = "#58ff00";
                        else color = "#ff0000";
                        let point = new Point(elements[0].innerText, elements[1].innerText, color);
                        points.push(point);
                        drawPoint(point);
                        //location.reload();
                    }
                }
            }
        </script>
        <td>
            <table class="RButtons">
                <tbody>
                <tr>
                    <h3>R (от 1 до 4)</h3>
                </tr>
                <tr>
                    <input type="text" name="R" id="r_value" required maxlength="8" value="4">
<%--                    <td>--%>
<%--                        <button  value="1" name="r" type="button" id="button2" onclick="setR(this)">1</button>--%>
<%--                        <script defer>--%>
<%--                            document.getElementById("button1").style.background = 'orange';--%>
<%--                            document.getElementById("x_value").value = document.getElementById("button1").value;--%>
<%--                            // document.getElementById("button2").style.background = 'orange';--%>
<%--                            // document.getElementById("r_value").value = document.getElementById("button2").value;--%>
<%--                        </script>--%>
<%--                    </td>--%>
<%--                    <td>--%>
<%--                        <button  value="2" name="r" type="button" onclick="setR(this)">2</button>--%>
<%--                    </td>--%>
<%--                    <td>--%>
<%--                        <button  value="3" name="r" type="button" onclick="setR(this)">3</button>--%>
<%--                    </td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td>--%>
<%--                        <button  value="4" name="r" type="button" onclick="setR(this)">4</button>--%>
<%--                    </td>--%>
<%--                    <td>--%>
<%--                        <button  value="5" name="r" type="button" onclick="setR(this)">5</button>--%>
<%--                    </td>--%>
                </tr>
<%--                <script>--%>
<%--                    var curr_r;--%>
<%--                    function setR(button){--%>
<%--                        console.log(curr_r);--%>
<%--                        let arr;--%>
<%--                        arr = document.getElementsByName("r");--%>
<%--                        for (let i = 0;i<arr.length;i++){--%>
<%--                            arr[i].style.background = 'white';--%>
<%--                        }--%>
<%--                        button.style.background = 'orange';--%>
<%--                        document.getElementById("r_value").value = button.value;--%>
<%--                        //console.log(button.textContent)--%>
<%--                        curr_r = button.textContent;--%>
<%--                        //console.log(curr_x);--%>
<%--                    }--%>
<%--                </script>--%>
                </tbody>
            </table>

        </td>
    </tr>
    <tr>
        <td align="middle" colspan="4">
            <button id="submitButton" onclick="send()">submit</button>
            <button type="submit" onclick="clearTable()">clear</button>


            <script>
                document.getElementById("button1").style.background = 'orange';
                document.getElementById("x_value").value = document.getElementById("button1").value;
                document.getElementById("submitButton").disabled = true;
            </script>
        </td>
    </tr>
    <tr>
        <td align="middle" colspan="4">
            <!--        <table class="tabl" border="1" cellpadding="0" cellspacing="0" width="50%">-->
            <table id="tabl">
                <table border='1' cellpadding='0' cellspacing='0' width='50%'>
                    <tr>
                        <th>X</th>
                        <th>Y</th>
                        <th>R</th>
                        <th>Shot</th>
                        <th>Current time</th>
                        <th>Lead time(μs)</th>
                    </tr>
                    <tbody id = "mainTB">
                        <%
                            String session_id = request.getSession(true).getId();
                            session_id = "values_" + session_id;
                            ServletContext servletContext = request.getServletContext();
                            ArrayList<Result> results = new ArrayList<>();
                            if (servletContext.getAttribute(session_id) != null){
                                results = (ArrayList<Result>) servletContext.getAttribute(session_id);
                            }

                            for (int i = 0;i<results.size();i++) {

                                out.println("<tr>");


                                out.println("<td>" + results.get(i).getX() + "</td>");
                                out.println("<td>" + results.get(i).getY() + "</td>");
                                out.println("<td>" + results.get(i).getR() + "</td>");
                                out.println("<td>" + results.get(i).getShot() + "</td>");
                                out.println("<td>" + results.get(i).getCurrentTime() + "</td>");
                                out.println("<td>" + results.get(i).getLeadTime() + "</td>");

                                out.println("</tr>");
                            }
                        %>
                    </tbody>
                </table>
            </table>
            <script>
                function clearTable(){
                    const req = new XMLHttpRequest();
                    req.open("POST", "./ControllerServlet");
                    req.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                    req.send("clearTable=true")
                    document.getElementById("mainTB").innerHTML = "";
                    points = [];
                    redraw(4);
                    document.getElementById("r_value").value = 4;
                }
            </script>

        </td>
    </tr>
</table>
</body>
</html>