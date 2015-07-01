app.controller("loginCtrl",['service',function(service){
  console.log("Inside controller");
  var login = this;
  login.user = {};

  login.signIn=function(){
    window.location.href = '/#/userhome'
  }
  login.signUp = function(){
    login.user = {};
    $("#signUp").modal("show");
  }

  login.login = function(){
	 
    var data = {
      "username" : login.user.username,
      "password" : login.user.password,
      "role" : login.user.role
    };
    service.login(data).then(function(obj){
    	
      if(obj.status == 200){
        if(login.user.role === 'System Admin'){
        
          window.location.href = '#/setting';
        } else {
          window.location.href = '#/setting';
        }
      } else {
        alert("Error"+obj.data);
      }
    });
  }
  login.save = function(){
    if(login.user.password === login.user.confirmPass){
      login.user.status = 'notapplied';
      service.addUser(login.user).then(function(data){
        if(data.status == 200){
          $("#signUp").modal("hide");
        } else {
          alert("Error"+data.data);
        }
      });
    } else {
      alert("Password mismatch");
    }
  }
}]);
