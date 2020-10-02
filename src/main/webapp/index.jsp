<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="lab2.models.TableRow" %>
<%@ page import="java.util.List" %>
<%
    String title = "Лабораторная работа №2<br>по Веб-программированию<br>";
    String titleClass = "class=\"main_title column\"";
    if (request.getAttribute("title") != null){
        title = request.getAttribute("title").toString();
        titleClass = "class=\"main_title column error_title\"";
    }
    List<TableRow> tableRows = (List<TableRow>) session.getAttribute("tableRows");
%>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
    <title>Lab Tw0</title>
    <link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="wrapper">
    <div class="content">
        <header>
            <div class="column logos_block">
                <div class="vt_logo">
                    <a href="https://se.ifmo.ru/" target="_blank"><img src="images/vt_logo.png" width="130px"
                                                                       alt="vt_logo"> </a>
                </div>
                <div class="itmo_block">
                    <a href="https://ifmo.ru/" target="_blank"><img src="images/itmo_logo.png" width="80%"
                                                                    alt="itmo_logo"></a> <br>
                    Мегафакультет компьютерных технологий и управления <br>
                    Факультет программной инженерии и компьютерной техники
                </div>
            </div>
            <div <%=titleClass%>>
                <%= title%>
            </div>
            <div class="made_by column">
                Вариант: <a href="images/tz.png" target="_blank">3151</a><br>
                Выполнил: Остряков Егор
                Александрович<br>
                Группа: P3212
            </div>
        </header>
        <div class="main_content">
            <h1>Попадёт ли точка на плоскости в заданную область?</h1>
            <div class="content_row">
                <div class="column">
                    <img src="images/areas.png" width="80%" alt="areas">
                </div>
                <div class="column">
                    <form method="get" action="controllerServlet" name="sendForm" class="send_form">
                        <div class="x_block coordinate_block">
                            <label for="x_select">X: </label>
                            <select id="x_select" name="coordinate_x">
                                <option disabled selected value>Выберите координату X</option>
                                <option value="-3">-3</option>
                                <option value="-2">-2</option>
                                <option value="-1">-1</option>
                                <option value="0">0</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                            </select>
                        </div>
                        <div class="y_block coordinate_block">
                            <label for="y_select">Y: </label>
                            <input type="text" id="y_select" name="coordinate_y" autocomplete="off"
                                   placeholder="Число в диапазоне (-3; 3)" maxlength="6">
                        </div>
                        <div class="r_block coordinate_block">
                            <label>R: </label>
                            <div class="button_block">
                                <button type="button" class="r_button" id="r_1.0" onclick="changeR('1.0')">1.0
                                </button>
                                <button type="button" class="r_button" id="r_1.5" onclick="changeR('1.5')">1.5
                                </button>
                                <button type="button" class="r_button" id="r_2.0" onclick="changeR('2.0')">2.0
                                </button>
                                <button type="button" class="r_button" id="r_2.5" onclick="changeR('2.5')">2.5
                                </button>
                                <button type="button" class="r_button" id="r_3.0" onclick="changeR('3.0')">3.0
                                </button>
                            </div>
                            <input type="hidden" id="r_select" name="coordinate_r">
                        </div>
                        <div class="send_button_block">
                            <button type="submit" class="send_button">Отправить</button>
                        </div>
                    </form>
                </div>
                <div class="column result_table">
                    <table>
                        <tr>
                            <th>X</th>
                            <th>Y</th>
                            <th>R</th>
                            <th>Время запуска</th>
                            <th>Время работы</th>
                            <th>Результат</th>
                        </tr>
                        <%
                            if (tableRows != null)
                                for (TableRow tableRow : tableRows) {
                        %>
                        <tr>
                            <td><%= tableRow.getX() %>
                            </td>
                            <td><%= tableRow.getY() %>
                            </td>
                            <td><%= tableRow.getR() %>
                            </td>
                            <td><%= tableRow.getCurrentTime() %>
                            </td>
                            <td><%= tableRow.getTime() %>
                            </td>
                            <td><%= tableRow.getResult() %>
                            </td>
                        </tr>
                        <%}%>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <footer class="footer">
        <div class="footer_text">
            Санкт-Петербург<br>
            Октябрь, 2020 год
        </div>
    </footer>
</div>
<script src="validation.js"></script>
</body>
</html>
