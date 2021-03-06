if !(isServer) exitWith {};
//This is the path to external storage folder(folder should be in the root of arma3 folder).
externalConfigFolder = "\A3Antistasi";
private ["_mList"];

//TODO remove this after external loading is tested
_mList = [
	"76561197960604947",  	//Fenris
	"76561197961960492",  	//ForeingInvestor
	"76561197962099476", 	//LightSix
	"76561197963732572",  	//Hypno
	"76561197964180503",
	"76561197964873761",	//Decoy
	"76561197966369172",  	//Nuvix
	"76561197966814991",	//DeathTouchWilly
	"76561197971206352",  	//Senty
	"76561197981549243",	//Sparker
	"76561197983686485",	//Gaunt
	"76561197984758941",	//Mechanist
	"76561197985005719",	//Fish
	"76561197988778391",	//Amer
	"76561197992975040",	//Chris
	"76561198005296652",  	//Stef
	"76561198011043004",	//Jackson
	"76561198012553600",	//Hakase
	"76561198013878464",	//Bobchaos
	"76561198015557763",	//Baldtune
	"76561198016063072",	//Veiler
	"76561198018659169",	//Brocko
	"76561198018980931",	//Ghost
	"76561198019158241",	//Dinadan
	"76561198034977762",	//Jeroen
	"76561198036417817",	//Alberto / Barbolani
	"76561198038487624",	//Robbie
	"76561198039888227",	//MysticDaedra
	"76561198052336764",	//Xaphies
	"76561198053067481",
	"76561198057181548",
	"76561198065337478",	//Abburo
	"76561198066044187",	//CameronW
	"76561198068948124",  	//Eric Weber / Gideon
	"76561198070770670",	//DustinPeak
	"76561198072605756",
	"76561198087534605",
	"76561198090170897",
	"76561198093241035",
	"76561198104698955",
	"76561198117496601",	//Reaver
	"76561198137323583",
	"76561198138138288",
	"76561198187982333",
	"76561198209790760",
	"76561198254999696",
	"76561198005636017",  	// Gaby
	"76561198023203552", 	// Fireman
	"76561197963525439",  	// Dethleffs
	"76561198068009040",   	// Neatpie
	"76561198059398987",	// Luigi
	"76561198057119793"		// Duke
];

diag_log format ["isFilePatchingEnabled: %1", isFilePatchingEnabled];
if(isFilePatchingEnabled) then {
    _memberList = loadFile (externalConfigFolder + "\memberlist.txt");
    if ( _memberList != "" ) then
	{
	    //Members list is in form of CRLF separated playerIds
	    _mList = _memberList splitString toString [13,10];
	    diag_log format ["DEBUG: External content from %1",externalConfigFolder + "\memberlist.txt"];
	    {diag_log format ["DEBUG: members list> %1", _x];} forEach _mList;
	};
};

{
	membersPool pushBackUnique _x;
} forEach _mList;
publicVariable "membersPool";