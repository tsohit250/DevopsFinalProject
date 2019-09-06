<html>
<head><title>Is it Considered a Bonus?</title></head>
<body>
  <%
    double num = Math.random();
    if (num > 0.2) {
  %>
      <h2>Amiel and Adam deserve a Bonus$$$!!!!!!!!!!!!!!!!!!</h2><p>(<%= num %>)</p>
  <%
    } else {
  %>
      <h2>Amiel and Adam deserver a bonus, try again!!</h2><p>(<%= num %>)</p>
  <%
    }
  %>
  <a href="<%= request.getRequestURI() %>"><h3>Try Again</h3></a>
</body>
</html>

