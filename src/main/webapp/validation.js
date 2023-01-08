function blockingButton(){
    let q = validateY();
    let q1 = validateR();
    console.log("q1 = " + q1);
    if (q === "notNumber" || q1==="notNumber"){
        console.log("notNumber");
        document.getElementById("submitButton").disabled = true;
    }else if (q==="badNumber" || q1==="badNumber"){
        console.log("badNumber");
        document.getElementById("submitButton").disabled = true;
    }else {
        console.log("good");
        document.getElementById("submitButton").disabled = false;
    }

}
function validateY() {

    let s = document.getElementById("y_field").value;
    console.log(s);
    s = s.replace(",", ".");
    document.getElementById("y_field").value = s;

    console.log("y = " + parseFloat(s));
    if (s === parseFloat(s).toString()){
        if (s > 5 || s < -5 || Number.isNaN(s)) {
            return "badNumber";
        } else return "good"
    }else return "badNumber";

}
function validateR(){
    let s1 = document.getElementById("r_value").value;
    console.log(s1);
    s1 = s1.replace(",", ".");
    document.getElementById("r_value").value = s1;

    console.log("r = " + parseFloat(s1));
    if (s1 === parseFloat(s1).toString()){
        if (s1 > 4 || s1 < 1 || Number.isNaN(s1)) {
            return "badNumber";
        } else{
            //drawFirst();
            redraw(s1);
            return "good";
        }
    }else return "badNumber";
}
function click(){
    console.log("gg");
}

document.addEventListener("input",blockingButton);
//document.getElementById("r_value").addEventListener("input",blockingButton);