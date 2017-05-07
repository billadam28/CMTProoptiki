/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function showHidePay (that) {

    if (that.value === "1") {
        document.getElementById("pay1").style.display = "block";
        document.getElementById("pay2").style.display = "none";
        document.getElementById("pay3").style.display = "none";
        document.getElementById("pay4").style.display = "none";
    } else if (that.value === "2") {
        document.getElementById("pay1").style.display = "block";
        document.getElementById("pay2").style.display = "block";
        document.getElementById("pay3").style.display = "none";
        document.getElementById("pay4").style.display = "none";
    } else if (that.value === "3") { 
        document.getElementById("pay1").style.display = "block";
        document.getElementById("pay2").style.display = "block";
        document.getElementById("pay3").style.display = "block";
        document.getElementById("pay4").style.display = "none";
    } else {
        document.getElementById("pay1").style.display = "block";
        document.getElementById("pay2").style.display = "block";
        document.getElementById("pay3").style.display = "block";
        document.getElementById("pay4").style.display = "block";
    }
}


