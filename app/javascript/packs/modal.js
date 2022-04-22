var mDeposit = document.getElementById("myDeposit");
var btn = document.getElementById("btn-deposit");
var span = document.getElementsByClassName("close-deposit")[0];
 
btn.onclick = function() {
  mDeposit.style.display = "block";
}

span.onclick = function() {
  mDeposit.style.display = "none";
}

window.onclick = function(event) {
  if (event.target == mDeposit) {
    mDeposit.style.display = "none";
  }
}

// withdraw
var myWithdraw = document.getElementById("myWithdraw");
var btn = document.getElementById("btn-withdraw");
var span = document.getElementsByClassName("close-withdraw")[0];
 
btn.onclick = function() {
  myWithdraw.style.display = "block";
}

span.onclick = function() {
  myWithdraw.style.display = "none";
}

window.onclick = function(event) {
  if (event.target == myWithdraw) {
    myWithdraw.style.display = "none";
  }
}
