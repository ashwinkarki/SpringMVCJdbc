<%@include file="../header.jsp" %>

<c:if test="${param.error!=null}">
    <div class="alert alert-danger alert-dismissible fade in" role="alert"> 
        <b>Invalid Username/Password</b>
    </div>
</c:if>
<form action="" method="post"> 
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" class="form-control" name="email" placeholder="Email" required="required">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" class="form-control" name="password" placeholder="Password" required="required">
  </div>
 
 
  <button type="submit" class="btn btn-default">Login</button>
</form>

<%@include file="../header.jsp" %>