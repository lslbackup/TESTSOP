<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Logina.aspx.cs" Inherits="SaleOrderBooking.Logina" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <%--<meta charset="utf-8">--%>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Log in</title>
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  
  <!-- icheck bootstrap -->

  <link rel="stylesheet" href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">

  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">

</head>
<body class="hold-transition login-page">
    <form id="form1" runat="server">
       <div class="login-box">
       <div class="login-logo">
   
  
  <!-- /.login-logo -->
  <div class="card" id="login-panel">
    <div class="card-body login-card-body">
      <p class="login-box-msg">Login</p>      
        <div class="input-group mb-3">
          <input type="textbox" class="form-control" placeholder="Username" name="Username" id="Username"/>
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-envelope"></span>
            </div>
          </div>
        </div>


        <div class="input-group mb-3">
          <input type="password" class="form-control" placeholder="Password" name="Password" id="Password">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        <div class="mb-3 error-class">          
        </div>
        <div class="row call-button">
          <div class="col-6">
            <input type="submit" class="btn btn-primary btn-block" value="Sign In" name="Login" id="Login" runat ="server" >
          </div>
          <div class="col-6">
            <input type="button" class="btn btn-primary btn-block" value="Cancel" name="Cancel" id="Cancel" runat ="server">
          </div>
            <br />
            <h2 id ="result"> </h2> 
            
        </div>
<%--        <div class="col-12 loader">        
        </div>        --%>
      <!-- /.social-auth-links -->        
  </div>
</div>

  </div>
</div>   

  </form>
    <script src="jquery-3.5.1.min.js"></script>
  
  <script type="text/javascript">
      $(document).ready(function () {

         // $("body").on("click", "#Login", function () {
             $("#Login").click(function () {
              var username = $("#Username").val();
              var password = $("#Password").val();

              if (username == "" || password == "") {
                  alert("Please enter User name and password");
              }
            
              else {

                  $.ajax({
                      type: 'POST',
                      url: 'Logina.aspx/Getdataa',
                     
                      contentType: 'application/json; charset=utf-8',
                      data: JSON.stringify({ username: username, password: password }),
                      dataType: 'json',
                      
                      success: function (result) {
                      window.location.href = "FinancialYr.aspx"; 
                    
                      },
                      error: function (xhr, status, result) {
                          alert("User Name or Password Mismatch ");

                      },
                      complete: function (xhr, result) {
                         // alert(result);
                      },
                  });
              }
          });
      });

</script>
</body>


</html>
