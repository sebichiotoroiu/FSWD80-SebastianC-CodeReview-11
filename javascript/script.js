
//Increase likes
var hearts = document.getElementsByClassName("fa-heart");
var likes = document.getElementsByClassName("likes");
var _loop_1 = function (i) {
    hearts[i].addEventListener("click", function () {
        console.log(likes[i]);
        var x = Number(likes[i].textContent) + 1;
        likes[i].innerHTML = x.toString();
    });
};
for (var i = 0; i < hearts.length; i++) {
    _loop_1(i);
}
