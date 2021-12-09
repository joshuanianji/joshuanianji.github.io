var main = function () {
	var droppyOn = false //for the "Snippets" section
	var dropDownOn = false //for the "snippet" dropdown
	var headJsOn = false //for the "head first in javascript stuff" secrtion
	var dropDown2On = false //for the "Head First In Javascript Stuff" dropdown
	var dropBlog = false //for the dropdown blog
	var blog = false //for the blog
	var allArray = [];
	var WDArray = [];

	$(".navbar ul li").click(function () {
		window.location = $(this).find("a").attr("href");
		return false;
		//makes the entire li clickable
	});

	$(".dropdown").hide();
	$(".dropdown-2").hide();
	$(".dropdown-blog").hide();

	$(".droppy").hover(function () {
		//mouse on
		droppyOn = true;
		$(".dropdown").show();
	}, function () {
		//mouse off
		droppyOn = false;
		if (dropDownOn === false || dropDown2On === false) {
			$(".dropdown").hide();
		};
	});
	$(".dropdown").hover(function () {
		//mouse on
		dropDownOn = true
		$(".dropdown").show();
	}, function () {
		//mouse off
		dropDownOn = false;
		if (droppyOn === false || dropDown2On === false) {
			$(".dropdown").hide();
		};
	});

	$(".head-first").hover(function () {
		//mouse on
		headJsOn = true;
		$(".dropdown-2").show();
	}, function () {
		//mouse off
		headJsOn = false;
		if (dropDown2On === false) {
			$(".dropdown-2").hide();
		};
	});
	$(".dropdown-2").hover(function () {
		//mouse on
		dropDown2On = true
		$(".dropdown-2").show();
		$(".dropdown").show();
	}, function () {
		//mouse off
		dropDown2On = false;
		if (headJsOn === false || dropDownOn === false || droppyOn === false) {
			$(".dropdown-2").hide();
			$(".dropdown").hide();
		};
	});
	$("#blogLi").hover(function () {
		blog = true;
		$(".dropdown-blog").show();
	}, function () {
		blog = false;
		if (dropBlog === false) {
			$(".dropdown-blog").hide();
		};
	});
	$(".dropdown-blog").hover(function () {
		dropBlog = true;
		$(".dropdown-blog").show();
	}, function () {
		dropBlog = false;
		if (blog === false) {
			$(".dropdown-blog").hide();
		};
	});

	var months = [
		"January",
		"February",
		"March",
		"April",
		"May",
		"June",
		"July",
		"August",
		"September",
		"October",
		"November",
		"December"
	];
	var dateArray = $(".date").toArray();
	for (var x in dateArray) {
		var letter = 0;
		var letters = "";
		var counter = 0;
		var result = "";
		var slashes = 0;
		for (var i = 0; i < dateArray[x].textContent.length; i++) {
			var length = dateArray[x].textContent.length;
			//repeats length of the specific "$(".date")" array
			letter = dateArray[x].textContent.charAt(counter);
			counter++;
			//starts counting "letter" at letter 1 of number 1 of the
			//$(".date") array
			if (counter === length) {
				//it is the third part, the year, so add "20"
				//in the front of it and add it into the result
				//since it is the last part, make slashes 0.
				//related to the last part of the script.
				result = result + " 20" + letters.toString() + letter.toString();
				slashes = 0;
				//if the letter is equal to the last letter if the date
				//array, change the date text to the result
				dateArray[x].textContent = result;
				result = "";
				counter = 0;
				//breaks out of the loop completely, or else they will start to
				//analyze the decoded text.
				break;
			} else {
				//if the letter is not the last letter:
				if (letter != "/") {
					//If the letter is not a slash
					letters = letters + letter;
					//add the letter to then variable letters
					//increase counter by one-which is the variable
					//to keep track of place of variable 'letters'
				} else {
					//if the letter is a slash
					if (slashes === 0) {
						result = result + months[letters - 1];
						letters = "";
						slashes++
						//if it is in the first part of the date, make
						//the first part the date the month. Increase
						//the slash counter as well
					} else if (slashes === 1) {
						result = result + " " + letters.toString() + ",";
						letters = "";
						slashes++;
						//if it is the second part, the day, just make
						//it into a string and add it to the result
						//the last part is
					};
				};
			};
		};
	};

	//document.location.href gets the website url
	// EDIT JULY 2018: I have no idea what this is, but it just redirects the blog and switches what posts are shown. I really don't think this is necessary
	// EDIT AUGUST 2018: this is very necessary lmao
	$(".website").click(function () {
		$(".blog").show();
		$(".blog").not(".WD").hide();
		localStorage.setItem("blogPosts", "WD");
	});
	$(".learning").click(function () {
		$(".blog").show();
		$(".blog").not(".L4C").hide();
		localStorage.setItem("blogPosts", "L4C");
	});
	$(".other").click(function () {
		$(".blog").show();
		$(".blog").not(".OT").hide();
		localStorage.setItem("blogPosts", "OT");
	});

};
var align = function () {
	$(".dropdown").show();
	$(".dropdown-2").show();
	$(".dropdown-blog").show();
	var dropBlogLeft = $("#blogLi").offset().left;
	$(".dropdown-blog").css({
		"position": "absolute",
		"left": dropBlogLeft
	});
	var snippetDrop = $(".droppy").offset().left;
	$(".dropdown").css({
		"position": "absolute",
		"left": snippetDrop
	});
	var headFirstLeft = $(".head-first").offset().left;
	console.log("head-first: " + headFirstLeft + "px from the left");
	var headFirstWidth = $("#head-first").width();
	console.log("Head-first: " + headFirstWidth + "px wide");
	var headFirst = $(".head-first").offset().top;
	console.log("Head-first: " + headFirst + "px from the top");
	$(".dropdown-2").offset({
		"top": headFirst,
		"left": parseInt(headFirstLeft) + parseInt(headFirstWidth)
	});
	console.log("Dropdown-2: " + $(".dropdown-2").offset().left + "px from the left");
	console.log("Dropdown-2: " + $(".dropdown-2").offset().top + "px from the top")
};
$(document).ready(align);
$(document).ready(main);