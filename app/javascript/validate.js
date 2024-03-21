document.addEventListener("DOMContentLoaded", function() {
    let regex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
    let emailInput = document.getElementById('user_email');
    let noticee = document.getElementById("noticee");
  
    emailInput.addEventListener("input", function() {
      var email = emailInput.value;
      if (email.match(regex)) {
        noticee.innerHTML = "";
      } else {
        noticee.innerHTML = "<p>Enter Valid Email</p>";
      }
    });
  });
  