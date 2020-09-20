var canvas1 = document.getElementById("canvas1");
var ctx1 = canvas1.getContext("2d");
ctx1.fillRect(0, 0, 10, 10);

var canvas2 = document.getElementById("canvas2");
var ctx2 = canvas2.getContext("2d");
for (var i = 0; i < 10; i++) {
    ctx2.fillRect(i * 10, i * 10, 10, 10)
}

var canvas3 = document.getElementById("canvas3");
var ctx3 = canvas3.getContext("2d");
ctx3.fillStyle = "Red";
ctx3.fillRect(0, 0, 100, 100);

var canvas4 = document.getElementById("canvas4");
var ctx4 = canvas4.getContext("2d");
ctx4.strokeRect(40, 40, 20, 20);

var canvas5 = document.getElementById("canvas5");
var ctx5 = canvas5.getContext("2d");
ctx5.strokeStyle = "DeepPink"
ctx5.lineWidth = 8
ctx5.strokeRect(10, 10, 50, 20);

var canvas6 = document.getElementById("canvas6");
var ctx6 = canvas6.getContext("2d");
ctx6.strokeStyle = "Turquoise";
ctx6.lineWidth = 4;
ctx6.beginPath();
ctx6.moveTo(10, 10);
ctx6.lineTo(60, 60);
ctx6.moveTo(60, 10);
ctx6.lineTo(10, 60);
ctx6.stroke();

var canvas7 = document.getElementById("canvas7");
var ctx7 = canvas7.getContext("2d");
ctx7.fillStyle = "SkyBlue";
ctx7.beginPath();
ctx7.moveTo(10, 80);
ctx7.lineTo(10, 40);
ctx7.lineTo(40, 10);
ctx7.lineTo(70, 40);
ctx7.lineTo(70, 80);
ctx7.lineTo(10, 80);
ctx7.fill();

var canvas8 = document.getElementById("canvas8");
var ctx8 = canvas8.getContext("2d");
ctx8.lineWidth = 2;
ctx8.strokeStyle = "Green";
ctx8.beginPath();
ctx8.arc(10, 50, 20, 0, Math.PI / 2, false);
ctx8.stroke();
ctx8.beginPath();
ctx8.arc(60, 50, 20, 0, Math.PI, false);
ctx8.stroke();
ctx8.beginPath();
ctx8.arc(110, 50, 20, 0, Math.PI * 2, false);
ctx8.stroke();

var canvas9 = document.getElementById("canvas9");
var ctx9 = canvas9.getContext("2d");
var circle = function (x, y, radius, ctxNum, color, fillCheck) {
    ctxNum.strokeStyle = color;
    ctxNum.beginPath();
    ctxNum.arc(x, y, radius, 0, Math.PI * 2, false);
    ctxNum.stroke();
    if (fillCheck === true || fillCheck != undefined) {
        ctxNum.fillStyle = color.toString();
        ctxNum.fill();
    };
};
ctx9.lineWidth = 3;
circle(50, 50, 7, ctx9, "Red", true);
circle(50, 50, 14, ctx9, "Orange");
circle(50, 50, 21, ctx9, "Yellow");
circle(50, 50, 28, ctx9, "Green");
circle(50, 50, 35, ctx9, "Blue");
circle(50, 50, 42, ctx9, "Purple");

var canvas10 = document.getElementById("canvas10");
var ctx10 = canvas10.getContext("2d");
ctx10.lineWidth = 3;
circle(50, 20, 18, ctx10, "Black");
circle(50, 23, 2, ctx10, "Orange", true);
circle(42, 18, 2, ctx10, "Black", true);
circle(58, 18, 2, ctx10, "Black", true);
circle(50, 68, 30, ctx10, "Black");
for (var i = 0; i < 3; i++) {
    circle(50, 54 + (i * 12), 2, ctx10, "Black", true)
};

var canvas11 = document.getElementById("canvas11");
var ctx11 = canvas11.getContext("2d");
var position = 0;
setInterval(function () {
    ctx11.clearRect(0, 0, 400, 100);
    ctx11.fillRect(position, 40, 20, 20);
    position += 2;
    if (position > 100) {
        position = -20;
    };
}, 30);

var canvas12 = document.getElementById("canvas12");
var ctx12 = canvas12.getContext("2d");
var size = 0;
setInterval(function () {
    ctx12.clearRect(0, 0, 100, 100);
    ctx12.fillRect(0, 0, size, size);
    size++;
    if (size > 100) {
        size = 0;
    };
}, 30);
//the bee!
var circle = function (x, y, radius, fillCircle) {
    ctx13.beginPath();
    ctx13.arc(x, y, radius, 0, Math.PI * 2, false);
    if (fillCircle) {
        ctx13.fill();
    } else {
        ctx13.stroke();
    };
};
var drawBee = function (x, y) {
    ctx13.lineWidth = 2;
    ctx13.strokeStyle = "Black";
    ctx13.fillStyle = "Gold";
    circle(x, y, 8, true);
    circle(x, y, 8, false);
    circle(x - 5, y - 11, 5, false);
    circle(x + 5, y - 11, 5, false);
    circle(x - 2, y - 1, 2, false);
    circle(x + 2, y - 1, 2, false);
};
var update = function (coordinate) {
    var offset = Math.random() * 2 - 1;
    coordinate += offset;
    if (coordinate > 100) {
        coordinate = 100;
    }
    if (coordinate < 0) {
        coordinate = 0;
    }
    return coordinate;
};
var canvas13 = document.getElementById("canvas13");
var ctx13 = canvas13.getContext("2d");
var x = 50;
var y = 50;
setInterval(function () {
    ctx13.clearRect(0, 0, 100, 100);
    drawBee(x, y);
    x = update(x);
    y = update(y);
    ctx13.strokeRect(0, 0, 100, 100);
}, 30);

var Ball = function () {
    this.x = 50;
    this.y = 50;
    this.xSpeed = -2;
    this.ySpeed = 3
};
var circle2 = function (x, y, radius, fillCircle) {
    ctx14.beginPath();
    ctx14.arc(x, y, radius, 0, Math.PI * 2, false);
    if (fillCircle) {
        ctx14.fill();
    } else {
        ctx14.stroke();
    };
};
Ball.prototype.draw = function () {
    circle2(this.x, this.y, 3, true);
};
Ball.prototype.move = function () {
    this.x += this.xSpeed;
    this.y += this.ySpeed;
};
Ball.prototype.checkCollision = function () {
    if (this.x < 0 || this.x > 100) {
        this.xSpeed *= -1;
    };
    if (this.y < 0 || this.y > 100) {
        this.ySpeed *= -1;
    };
};
var canvas14 = document.getElementById("canvas14");
var ctx14 = canvas14.getContext("2d");
var ball = new Ball();
setInterval(function () {
    ctx14.clearRect(0, 0, 100, 100);
    ball.draw();
    ball.move();
    ball.checkCollision();
    ctx14.strokeRect(0, 0, 100, 100);
}, 30);

var fillCircle = function (x, y) {
    ctx15.beginPath();
    ctx15.arc(x, y, 3, 0, Math.PI * 2, true);
    ctx15.fill()
}
var followBall = function () {
    this.x = 50;
    this.y = 50;
    this.xSpeed = 0.5;
    this.ySpeed = 0.5
};
followBall.prototype.Draw = function () {
    fillCircle(this.x, this.y)
};
followBall.prototype.Move = function () {
    if (this.x < canvasPos.left) {
        this.x += this.xSpeed;
    } else if (this.x > canvasPos.left) {
        this.x += (this.xSpeed * -1);
    } else {
        this.x = this.x;
    };
    if (this.y < canvasPos.top) {
        this.y += this.ySpeed;
    } else if (this.y > canvasPos.top) {
        this.y += (this.ySpeed * -1);
    } else {
        this.y = this.y;
    };
};
var canvas15 = document.getElementById("canvas15");
var ctx15 = canvas15.getContext("2d");
var mouseDisciple = new followBall();
mouseDisciple.Draw();
canvasPos = {}
$("#canvas15").hover(function () {
    setInterval(function () {
        $("#canvas15").mousemove(function (event) {
            var offset = $("#canvas15").offset()
            canvasPos = {
                left: event.pageX - offset.left,
                top: event.pageY - offset.top
            };
        });
        ctx15.clearRect(0, 0, 100, 100);
        mouseDisciple.Move();
        mouseDisciple.Draw();
    }, 30)
}, function () {
    ctx15.clearRect(0, 0, 100, 100)
    mouseDisciple.Draw();
});