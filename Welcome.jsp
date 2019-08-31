<%@ page import="java.util.ArrayList" %>
<%--
  Created by IntelliJ IDEA.
  User: yubraj
  Date: 11/20/16
  Time: 4:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Number Guess System</title>
      <style>
          .error{ color: red; }
          .success { color: greenyellow; }
      </style>
  </head>
  <body>
    <h1>Hello world</h1>
    <%
        for(int i = 1; i<=10; i++){ %>
        <h5><%= +i%></h5>
    <% } %>
    <h1>Number Guess System</h1>
    <p>Guess Number within 1 and 10</p>

    <%
        final HttpSession       Sess = request.getSession();
        final boolean           JustStarted = Sess.isNew();
        final Integer           randomNumber;

        if(JustStarted){
                randomNumber = new Integer(new java.util.Random().nextInt(10));
                System.out.println("Random Number : " + randomNumber);
                Sess.setAttribute("number", randomNumber);
            } else {
                randomNumber = (Integer) Sess.getAttribute("number");
            }
    %>

    <%
        String inputText = request.getParameter("number");
        String errorMsg = null;
        boolean success = false;

        if(!JustStarted) {
            if (inputText != null && inputText.length() > 0) {
                int myNumber = Integer.parseInt(inputText);
                if (randomNumber != myNumber) {
                    if (myNumber > randomNumber)
                        errorMsg = "Number too large!";
                    else
                        errorMsg = "Number too Low!";
                } else {
                    errorMsg = "Congrats! you win";
                    success = true;
                }
            }
        }
    %>

    <div>
        <% if(errorMsg != null){ %>
            <p class="<% if(success){ %>
                        success
                       <% }else{ %>
                        error
                        <% } %>
                      ">
                <%= errorMsg %>
            </p>
        <% } %>
        <form method="post">
            <label for="number">Enter the Number : </label> <input type="tex" name="number" id="number" maxlength="3">
            <input type="submit" value="Submit">
        </form>
    </div>
  </body>
</html>

