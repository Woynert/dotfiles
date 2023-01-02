// start
document.addEventListener("DOMContentLoaded", function () {
	add_elements();
});

let cont;
let baseitem;

function addItem(name, url, icon){
	let newitem = baseitem.cloneNode(true);

	newitem.href = url;
	newitem.getElementsByClassName("itemname")[0].innerText = name;
	newitem.getElementsByClassName("itemimg")[0].src = "./icon/"+icon;

	cont.appendChild(newitem);
}

function add_elements(){
	cont = document.getElementById("container");
	baseitem = document.getElementById("baseitem");

	addItem("Microsoft Teams",
		"https://teams.microsoft.com",
		"teams.png");

	addItem("SIGAA",
		"https://sigaa.upb.edu.co/BANPDN/twbkwbis.P_WWWLogin",
		"upb.png");

	addItem("MOODLE",
		"https://auladigital.upb.edu.co/",
		"upb.png");

	addItem("HorariosUPB",
		"http://horariosupb.bucaramanga.upb.edu.co/",
		"upb.png");

	addItem("Notion",
		"http://www.notion.so",
		"notion.png");

	addItem("Youtube",
		"https://youtu.be/z9vMczQ3jiM",
		"youtube.png");

	addItem("Overleaf",
		"https://www.overleaf.com/",
		"overleaf.png");

	addItem("Google Translator",
		"https://translate.google.com/",
		"googletranslate.png");

	addItem("Rocket",
		"https://emergency.nofap.com/",
		"rocket.png");

	addItem("Regex101",
		"https://regex101.com/",
		"regex101.png");

	addItem("SoundCloud",
		"https://soundcloud.com/you/likes",
		"soundcloud.png");

	addItem("Whatsapp",
		"https://web.whatsapp.com/",
		"whatsapp.png");

	addItem("Github",
		"https://github.com/",
		"github.png");

	addItem("AWS community",
		"https://aws-emergingtalent.influitive.com/challenges",
		"awscommunity.png");
	
	addItem("AWS",
		"https://aws.amazon.com/",
		"awscommunity.png");

	//addItem("",
		//"",
		//"");

	// hide baseitem
	baseitem.style.display = "none";
}


