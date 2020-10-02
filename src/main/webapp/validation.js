"use strict";

let form = document.querySelector(".send_form"),
    x = document.getElementById("x_select"),
    y = document.getElementById("y_select"),
    r = document.getElementById("r_select");

function checkX() {
    if (x.value === "") {
        x.classList.add("input_err");
        return false;
    }
    return true;
}

function checkY() {
    let yVal = y.value.replace(',', '.');
    if (yVal.trim() === "" || !isFinite(yVal) || (yVal <= -3 || yVal >= 3)) {
        y.classList.add("input_err");
        return false;
    }
    return true;
}

function checkR() {
    let buttons = document.querySelectorAll(".r_button");
    if (r.value === undefined) {
        buttons.forEach(button => button.classList.add("input_err"));
        return false;
    }
    buttons.forEach(button => button.classList.remove("input_err"));
    return true;
}

function changeR(rValue) {
    let button = document.getElementById("r_" + rValue);
    if (!button.classList.contains("sel")) {
        r.value = rValue;
        let oldSelectedButton = document.querySelector(".sel");
        if (oldSelectedButton !== null)
            oldSelectedButton.classList.remove("sel");
        button.classList.add("sel");
        checkR();
    } else {
        r.value = undefined;
        button.classList.remove("sel");
    }
}


form.addEventListener("submit", function (e) {
    if (!checkX() || !checkY() || !checkR()) e.preventDefault();
});

x.addEventListener("input", function () {
    x.classList.remove("input_err");

});
y.addEventListener("input", function () {
    y.classList.remove("input_err");
});