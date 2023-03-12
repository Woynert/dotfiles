
let eContainer;
let eBaseTagContainer;
let eBaseItem;
const listContainers = {};

const TAGS = {
	COLLEGUE: "Collegue",
	UTIL: "Utility",
	SOCIAL: "Social",
}

// start
document.addEventListener("DOMContentLoaded", function () {
	add_elements();
});

function addItem(name, url, icon, tag){
	const newitem = eBaseItem.cloneNode(true);

	newitem.href = url;
	newitem.getElementsByClassName("itemname")[0].innerText = name;
	newitem.getElementsByClassName("itemimg")[0].src = "./icon/"+icon;

	if (!listContainers[tag]){
		const newTag = eBaseTagContainer.cloneNode(true);

		newTag.getElementsByClassName("tagTitle")[0].innerText = tag;

		eContainer.appendChild(newTag);
		listContainers[tag] = newTag;
	}

	listContainers[tag].appendChild(newitem);
}

function add_elements(){
	eContainer = document.getElementById("container");
	eBaseTagContainer = document.getElementById("baseTagContainer");
	eBaseItem = document.getElementById("baseItem");

	let tag;
	tag = TAGS.COLLEGUE;

	addItem("Microsoft Teams",
		"https://teams.microsoft.com",
		"teams.png",
		tag
	);

	addItem("SIGAA",
		"https://sigaa.upb.edu.co/BANPDN/twbkwbis.P_WWWLogin",
		"upb.png",
		tag
	);

	addItem("Campus Virtual",
		"https://virtual.upb.edu.co/d2l/home/41074",
		"upb.png",
		tag
	);

	addItem("Moodle",
		"https://auladigital.upb.edu.co/",
		"upb.png",
		tag
	);

	addItem("Horarios",
		"http://horariosupb.bucaramanga.upb.edu.co/",
		"upb.png",
		tag
	);

	tag = TAGS.SOCIAL;

	addItem("Notion",
		"http://www.notion.so",
		"notion.png",
		tag
	);

	addItem("Youtube",
		"https://youtu.be/z9vMczQ3jiM",
		"youtube.png",
		tag
	);

	addItem("SoundCloud",
		"https://soundcloud.com/you/likes",
		"soundcloud.png",
		tag
	);

	addItem("Whatsapp",
		"https://web.whatsapp.com/",
		"whatsapp.png",
		tag
	);

	addItem("AWS community",
		"https://aws-emergingtalent.influitive.com/challenges",
		"awscommunity.png",
		tag
	);
	
	addItem("AWS",
		"https://aws.amazon.com/",
		"awscommunity.png",
		tag
	);


	tag = TAGS.UTIL;

	addItem("Overleaf",
		"https://www.overleaf.com/",
		"overleaf.png",
		tag
	);

	addItem("Google Translator",
		"https://translate.google.com/",
		"googletranslate.png",
		tag
	);

	addItem("Rocket",
		"https://emergency.nofap.com/",
		"rocket.png",
		tag
	);

	addItem("Regex101",
		"https://regex101.com/",
		"regex101.png",
		tag
	);

	addItem("Github",
		"https://github.com/",
		"github.png",
		tag
	);

	//addItem("",
		//"",
		//"");

	// hide eBaseItem
	eBaseItem.style.display = "none";
	eBaseTagContainer.style.display = "none";
}


