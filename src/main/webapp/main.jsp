<%@ page import="servlets.Point" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<%@ page contentType="text/html;charset=UTF-8" %>
<jsp:useBean id="history" type="servlets.History" scope="session"/>
<html>
<head>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@200;300&display=swap" rel="stylesheet">
    <meta charset="UTF-8">
    <title>Second checker</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="icon" href="img/favicon.png" type="image/x-icon">
</head>
<body>
<div class="header-section">
    <div>
        <div class="hatter d-flex">
            <div class="hatter__logo">
                <a href="main.jsp"><img src="images/favicon.png" alt="Logo" class="hatter__img"></a>
            </div>
            <div class="hatter__desc">
                <p class="font1">
                    Дворянчикова Дарья <span>312326</span>
                </p>
                <p class="font1">
                    Группа P3233<span>, вариант 33006</span>
                </p>
            </div>
        </div>
    </div>
</div>

<div class="main">
    <table width="50%">
        <tr>
            <th colspan="3"><h1>Попадет ли точка в область?</h1></th>
        </tr>
        <tr>
            <td width="100%">
                <table width="50%">
                    <form id="inputForm" action="" method="post">
                        <p class="warn-checkbox" hidden>Нужно выбрать R!</p>


                        <h2>X:</h2>
                        <div class="button-div">
                            <input type="hidden" name="X">
                            <button type="button" class="button in-button x-button" value="-5">-5</button>
                            <button type="button" class="button in-button x-button" value="-4">-4</button>
                            <button type="button" class="button in-button x-button" value="-3">-3</button>
                            <button type="button" class="button in-button x-button" value="-2">-2</button>
                            <button type="button" class="button in-button x-button" value="-1">-1</button>
                            <button type="button" class="button in-button x-button" value="0">0</button>
                            <button type="button" class="button in-button x-button" value="1">1</button>
                            <button type="button" class="button in-button x-button" value="2">2</button>
                            <button type="button" class="button in-button x-button" value="3">3</button>
                        </div>

                        <p class="warn-checkbox" hidden>Некорректный X.</p>


                        <h2>Y:</h2>
                        <label>
                            <input name="Y" placeholder="Digit from -3 to 3." size="20px" type="text">
                        </label>
                        <p class="warn-checkbox" hidden>Это не число</p>
                        <p class="warn-checkbox" hidden>Y должен быть в пределах -3 до 3.</p>
                        <p class="warn-checkbox" hidden>Сократите количество значащих цифр в дробной части до 15.</p>
                        <p class="warn-checkbox" hidden>Введите число.</p>


                        <h2>R:</h2>
                        <div class="button-div">
                            <input type="hidden" name="R">
                            <button type="button" class="button in-button r-button" value="1">1</button>
                            <button type="button" class="button in-button r-button" value="2">2</button>
                            <button type="button" class="button in-button r-button" value="3">3</button>
                            <button type="button" class="button in-button r-button" value="4">4</button>
                            <button type="button" class="button in-button r-button" value="5">5</button>
                        </div>

                        <p class="warn-checkbox" hidden>Некорректый R.</p>


                        <br>
                        <input type="hidden" name="offset">
                        <button type="submit" class="button submit-button" id="submit">Проверить</button>
                        <button type="button" class="button submit-button">Очистить</button>
                    </form>
                </table>
            </td>
            <td>
                <canvas height="320px" width="320px" style="margin: 15px"></canvas>
            </td>

        </tr>
    </table>
    <%if (history.getList().size() >= 0) {%>
    <h1>История запросов</h1>
    <button type="button" onclick="clearHistory(); location.reload()" id="history-button" class="button history-button">
        Очистить историю
    </button>
    <br>
    <table id="result-table">
        <tr id="table-headers">
            <th>X</th>
            <th>Y</th>
            <th>R</th>
            <th>Попадание</th>
            <th>Время запроса</th>
        </tr>
        <%
            List<Point> list = new ArrayList<Point>(history.getList());
            Collections.reverse(list);
            for (Point p : list) {%>
        <tr>
            <td><%=p.getX()%>
            </td>
            <td><%=p.getY()%>
            </td>
            <td><%=p.getR()%>
            </td>
            <td><%=p.isInArea()%>
            </td>
            <td><%=p.getTime()%>
            </td>
        </tr>
        <%}%>
    </table>
    <%}%>
</div>
<script src="${pageContext.request.contextPath}/js/drawing.js"></script>
<script src="${pageContext.request.contextPath}/js/main.js"></script>
<script src="${pageContext.request.contextPath}/js/ajax.js"></script>
</body>
</html>
