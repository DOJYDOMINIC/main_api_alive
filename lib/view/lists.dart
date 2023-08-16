import 'package:flutter/material.dart';

// List traingrequared = [
//   {'text': 'MANAGEMENT', 'value': 'MANAGEMENT'},
//   {'text': 'COW REARING', 'value': 'COW REARING'},
//   {'text': 'GOAT KEEPING', 'value': 'GOAT KEEPING'},
//   {'text': 'LAYER UNITS', 'value': 'LAYER UNITS'},
//   {'text': 'BROILER UNITS', 'value': 'BROILER UNITS'},
//   {'text': 'DUCK REARING', 'value': 'DUCK REARING'},
//   {'text': 'PIGGERY', 'value': 'PIGGERY'},
//   {'text': 'PISCICULTURE', 'value': 'PISCICULTURE'},
//   {'text': 'BUFFALO MALE CALF REARING', 'value': 'BUFFALO MALE CALF REARING'},
//   {'text': 'BUFFALO REARING', 'value': 'BUFFALO REARING'},
//   {'text': 'QUAILREARING', 'value': 'QUAILREARING'},
//   {'text': 'KEEPING OF PET ANIMAL/PET ANIMAL MANAGEMENT', 'value': 'KEEPING OF PET ANIMAL/PET ANIMAL MANAGEMENT'},
//   {'text': 'KEEPING AND MANAGEMENT OF PET BIRDS.', 'value': 'KEEPING AND MANAGEMENT OF PET BIRDS.'},
//   {'text': 'Breeding of layinghens', 'value': 'Breeding of layinghens'},

// ];
List<String> dataclass = ['APL', 'BPL', 'APL,BPL'];
List<String> dataclassadd = ['APL', 'BPL'];
List<String> dataclass2 = [
  "General",
  "OBC",
  "OEC",
  "SC",
  "ST",
];
List<String> products = [
  'MILK',
  'MEAT',
  'EGG',
  'MANURE',
  'FEED',
  // male buffalo calf
  // Gras fooder
  // tree fooder
  'KID',
  'DAY OLD CHICK',
  'PULLETS',
  'CALF',
  'BEIFER',
];
List<String> datacls3 = [
  "Coastal",
  "Minority",
  "Extreampoor",
  "Asraya",
  "Physicallychallenged",
  "MentalChallenge_Buds",
  "Thoseabove60yearsofage",
  "widow",
  "femaleleaded",
];

List<String> salesmethod = [
  'direct',
  'localmarket',
  'cluster',
  'group',
  'wholesale',
];
List<String> familyincome = [
  "below2000",
  "20001_30000",
  "2001_5000",
  "5001_8333",
  "8334_20000",
  "above30000",
];

List<String> position = ['Member', 'Family Member'];
List<String> house = ['Own', 'Rented'];
List<String> tf = ['Yes', 'No'];
List<String> enterpricetype = ['Individual', 'Group'];
List<String> loan = ['Applied', 'Sanctioned', 'Notapplied'];
List<String> condition = ['Yes Good', 'Yes Poor', 'No'];

final List options = [
  {'text': 'കോസ്റ്റൽ', 'value': 'Coastal'},
  {'text': 'ന്യൂനപക്ഷം', 'value': 'Minority'},
  {'text': 'അതി ദരിദ്രർ', 'value': 'Extreampoor'},
  {'text': 'ആശ്രയ', 'value': 'Asraya'},
  {'text': 'ശാരീരിക വെല്ലുവിളി ഉള്ളവർ', 'value': 'Physicallychallenged'},
  {'text': 'മാനസീക വെല്ലുവിളി /ബഡ്‌സ് ', 'value': 'MentalChallenge_Buds'},
  {'text': '60 വയസിനു മുകളിലുള്ളവർ', 'value': 'Thoseabove60yearsofage'},
  {'text': 'വിധവ', 'value': 'widow'},
  {'text': 'സ്ത്രീകൾ മാത്രമുള്ള കുടുംബം', 'value': 'femaleleaded'},
  // {'text': 'NO Value', 'value': ''}

];

final List businesstype = [
  {'disply': 'പശു വളർത്തൽ', 'value': 'Cowbreeding'},
  {'disply': 'ആട്  വളർത്തൽ ', 'value': 'Sheepfarming'},
  {'disply': 'മുട്ട കോഴി വളർത്തൽ ', 'value': 'Breedingoflayinghens'},
  {'disply': 'ഇറച്ചി കോഴി വളർത്തൽ ', 'value': 'Broilerfarming'},
  {'disply': 'താറാവ് വളർത്തൽ ', 'value': 'Duckfarming'},
  {'disply': 'പന്നി വളർത്തൽ ', 'value': 'Pigfarming'},
  {'disply': 'മത്സ്യം വളർത്തൽ ', 'value': 'Fishfarming'},
  {'disply': 'പോത്തു  വളർത്തൽ ', 'value': 'Cattlerearing'},
  {'disply': 'എരുമ വളർത്തൽ ', 'value': 'Buffalorearing'},
  {'disply': 'കാട വളർത്തൽ', 'value': 'Quailbreeding'},
  {'disply': 'പെറ്റ്മൃഗങ്ങൾ വളർത്തൽ', 'value': 'Keepingpets'},
  {'disply': 'പെറ്റ് ബേഡ്‌സ്  വളർത്തൽ   ', 'value': 'RaisingPetBirds'},
  {'disply': 'തേനീച്ച വളർത്തൽ  ', 'value': 'Beekeeping'},
  {'disply': 'വളം നിർമാണം  ', 'value': 'Fertilizermanufacturing'},
  {'disply': 'കാലിത്തീറ്റ നിർമാണം ', 'value': 'Foddermanufacturing'},
  {'disply': 'വാല്യൂ പ്രോഡക്റ്റ് നിർമാണം  ', 'value': 'valueproductcreation'},
  {'disply': 'പുല്ല് കൃഷി', 'value': 'Cultivationofgrass'},
  {'disply': 'പാൽ വിപണനം  ', 'value': 'Marketingofmilk'},
  {'disply': 'ഇറച്ചി വിൽപന  ', 'value': 'Meatsales'},
  {'disply': 'മാർക്കറ്റിങ് ', 'value': 'Marketing'},
  {'disply': 'ഫാർമസി  ', 'value': 'Pharmacy'},
  {'disply': 'പേരെൻറ് സ്റ്റോക്ക്', 'value': 'Parentstock'},
  {'disply': ' എഗ്ഗർ നഴ്‌സറി  ', 'value': 'EggerNursery'},
  {'disply': 'ഹാച്ചറി', 'value': 'Hatchery'},
  {'disply': 'സംയോജിത കൃഷി', 'value': 'Integratedfarming'},
  {'disply': 'മറ്റുള്ളവ ', 'value': 'Others'},
  // {'text': 'NO Value', 'value': ''}

];

final List sourceofinvestment = [
  {'source': 'ബാങ്ക് ലോൺ', 'value': 'bankloan'},
  {'source': 'അയൽക്കൂട്ടം', 'value': 'Ng'},
  {'source': 'കുടുംബത്തിൽ നിന്ന്', 'value': 'family'},
  {'source': 'കൂട്ടുകാരിൽ നിന്ന്', 'value': 'Asraya'},
  {'source': 'പ്രൈവറ്റ് ഫിനാൻസ്', 'value': 'private finance'},
  {'source': 'പ്രൈവറ്റ് ഫിനാൻസ്', 'value': 'privatefinance'},
  {'source': 'മറ്റുള്ളവ', 'value': 'other'},
  // {'text': 'NO Value', 'value': ''}

];

final List traingrequared = [
  {'text': 'Marketing', 'value': 'Marketing'},
  {'text': 'Beekeeping', 'value': 'Beekeeping'},
  {'text': 'Breeding of laying hens', 'value': 'Breeding of laying hens'},
  {'text': 'Broiler farming', 'value': 'Broiler farming'},
  {'text': 'Buffalo rearing', 'value': 'Buffalo rearing'},
  {'text': 'Cattle breeding', 'value': 'Cattle breeding'},
  {'text': 'Cattle rearing', 'value': 'Cattle rearing'},
  {'text': 'Cultivation of grass', 'value': 'Cultivation of grass'},
  {'text': 'Duck farming', 'value': 'Duck farming'},
  {'text': 'Egger Nursery', 'value': 'Egger Nursery'},
  {
    'text': 'Fertilizer manufacturing training',
    'value': 'Fertilizer manufacturing training'
  },
  {'text': 'Fish farming', 'value': 'Fish farming'},
  {'text': 'Fodder manufacturing', 'value': 'Fodder manufacturing'},
  {'text': 'Goat rearing', 'value': 'Goat rearing'},
  {'text': 'Hatchery', 'value': 'Hatchery'},
  {'text': 'integrated farming', 'value': 'integrated farming'},
  {'text': 'Keeping pets', 'value': 'Keeping pets'},
  {'text': 'Management', 'value': 'Management'},
  {'text': 'Marketing of milk', 'value': 'Marketing of milk'},
  {'text': 'Meat sales', 'value': 'Meat sales'},
  {'text': 'Parent stoke', 'value': 'Parent stoke'},
  {'text': 'Pharmacy', 'value': 'Pharmacy'},
  {'text': 'Pig farming', 'value': 'Pig farming'},
  {'text': 'Quailb reeding', 'value': 'Quailb reeding'},
  {'text': 'Raising Pet Birds', 'value': 'Raising Pet Birds'},
  {'text': 'Value product creation', 'value': 'Value product creation'},
  {'text': 'Other', 'value': 'Other'},
];

// final List datasupprtlistss = [
//   "AADHAR  LINKING WITH MOBILE"
//  	"AGRO MARKET"
//  	"ASSISTANCE THROUGH MGNREGS"
//  	"BANK ACCOUNT"
//  	"BUSINESS EXPANSION"
//  	"CATTLE FEED"
//  	"CATTLE SHED CONSTRUCTION"
//  	"DESIGNING LOGO"
//  	"DESIGNING OF PACKAGE"
//  	"DIGITAL MARKETING SUPPORT"
//  	"E-SHRAM"
//  	"EQUIPMENTS"
//  	"FINANCIAL ASSISTANCE/SUPPORT"
//  	"FSSAI"
//  	"G S T REGISTRATION"
//  	"GEM REGISTRATION"
//  	"INSURANCE"
//  	"K S.E.B"
//  	"K-SWIFT"
//  	"KISSAN CREDIT"
//  	"LABOR CARD"
//  	"LEGAL METROLOGY AUTHORITY"
//  	"LIVESTOCK REGISTRATION"
//  	"LIVESTOCK REGISTRATION/FARMER REGISTRATION"
//  	"MACHINERY"
//  	"MARKETING SUPPORT"
//     "MANURE PRODUCTION"
//  	"NNP"
//  	"OTHERS"
//  	"PACKING AND LABELLING"
//  	"PAN CARD"
//  	"PARTNERSHIP"
//  	"POLLUTION UNDER CONTROL CERTIFICATE"
//  	"PRODUCTION OF VERMICOMPOST "
//  	"PROJECT PREPARATION"
//  	"PURCHASE OF CATTLE FEED"
//  	"PURCHASE OF MACHINERY AND EQUIPMENTS"
//  	"RAW MATERIAL"
//  	"REGISTRATION FOR SOCIETY"
//  	"REGISTRATION FROM C D S "
//  	"REGISTRATION FROM PANCHAYATH"
//  	"REGISTRATION OF COMPANY"
//  	"SKILL TRAINING"
//  	"SKILLED LABORERS"
//  	"STORE PROPRITERSHIP"
//  	"TRADE MARKET"
//  	"UDHYAM AADHAR"
//  	"WEB STORE"
//
// ];

final List datasupprtlistss = [
  {'text': 'സാമ്പത്തിക പിന്തുണ', 'value': 'Financial Support'},
  {'text': 'ബാങ്ക് അക്കൗണ്ട്', 'value': 'Bank Account'},
  {'text': 'സി.ഡി.എസ്. രജിസ്ട്രേഷൻ', 'value': 'CDS Registration'},
  {'text': 'പഞ്ചായത്ത് രജിസ്ട്രേഷൻ', 'value': 'Panchayat Registration'},
  {'text': 'FSSI', 'value': 'FSSI'},
  {'text': 'ഇ- ശ്രം', 'value': 'E-shrm'},
  {'text': 'ലീഗൽ മെട്രേളജി', 'value': 'Legalmetrology'},
  {'text': 'പൊല്യൂഷൻ സർട്ടിഫിക്കേറ്റ്', 'value': 'Polution Certification'},
  {'text': 'ജം രജിസ്ട്രേഷൻ', 'value': 'Gem- Registration'},
  {'text': 'ജി.എസ്.ടി', 'value': 'GST'},
  {'text': 'ഉദ്യം ആധാർ', 'value': '	Udyam Aadhar'},
  {'text': 'കെ.എസ്.ഇ.ബി', 'value': 'K.S.E.B'},
  {'text': 'വൈദഗ്ത്യ പരിശീലനം', 'value': 'Skill training'},
  {'text': 'മാർക്കറ്റിംഗ് സപ്പോർട്ട്', 'value': 'Marketing Support'},
  {'text': 'തൊഴുത്ത് നിർമ്മാണം', 'value': 'Stable Construction'},
  {'text': 'കാലിത്തീറ്റ', 'value': 'Fodder'},
  {'text': 'ഉപകരണങ്ങൾ', 'value': 'Equipment'},
  {'text': 'ലൈവ് സ്റ്റോക്ക് രജിസ്ട്രേഷൻ', 'value': 'Live stock registration'},
  {'text': 'ഇൻഷുറൻസ്', 'value': 'Insurance'},
  {'text': 'K-Swift', 'value': 'K Swift'},
  {'text': 'വളം നിർമ്മാണം', 'value': 'Fertilizer Manufacturing'},
  {'text': 'പാൻ കാർഡ്', 'value': 'Pan Card'},
  {'text': 'ആധാർ മൊബൈൽ ലിങ്ക്', 'value': 'Aadhar Mobile Link'},
  {'text': 'അഗ്രോ മാർക്കറ്റ്', 'value': 'Agro Marketing'},
  {'text': 'ട്രേഡ് മാർക്ക്', 'value': 'Trad Mark'},
  {'text': 'സോൾ പ്രൊപ്രൈറ്റർ ഷിപ്പ്', 'value': 'Sole Propritership'},
  {'text': 'എൽ.എൽ.പി', 'value': 'LLP'},
  {'text': 'പാർട്ട്ണർ ഷിപ്പ്', 'value': 'Partnership'},
  {'text': 'സൊസൈറ്റി രജിസ്ട്രേഷൻ', 'value': 'Socity Registration'},
  {'text': 'കമ്പനി രജിസ്ട്രേഷൻ', 'value': 'Company Registration'},
  {'text': 'പാക്കിംഗ് ആന്റ് ലേബലിംഗ്', 'value': 'Packing and labeling'},
  {'text': 'ഡിസൈനിംഗ്', 'value': 'Desings'},
  {'text': 'ലോഗോ', 'value': 'Logo'},
  {'text': 'അസംസ്കൃത പദാർത്ഥങ്ങൾ', 'value': 'Raw-materials'},
  {'text': 'മെഷിനറി', 'value': 'Machinery'},
  {'text': 'വെബ് സ്റ്റോർ', 'value': 'Web Store'},
  {'text': 'വിദഗ്ദ്ധ തൊഴിലാളികൾ', 'value': 'Skilled work'},
  {'text': 'ഡിജിറ്റൽ മാർക്കറ്റിംഗ്', 'value': 'Digital Marketing'},
  {'text': 'കിസാൻ ക്രഡിറ്റ്', 'value': 'Kissan Credit'},
  {'text': 'പ്രൊജക്ട് തയ്യാറാക്കൽ', 'value': 'Project Preparation'},
  {'text': 'കാലിത്തീറ്റ വാങ്ങൽ', 'value': 'Purchase of fodder'},
  {'text': 'വെർമി കമ്പോസ്റ്റ്', 'value': 'Vermicompost'},
  {'text': 'ഉപകരണങ്ങൾ വാങ്ങൽ', 'value': 'Purchase of equipment'},
  {'text': 'തൊഴിൽ കാർഡ്', 'value': 'Job Card'},
  {'text': 'തൊഴിലുറപ്പ് സഹായം', 'value': 'Employment assistance'},
  {'text': 'ബിസിനസ്സ് എക്സ്പാൻഷൻ', 'value': 'Business Expansion'},
  {'text': 'മറ്റു പിന്തുണകൾ', 'value': 'Other Supports'},

];

final List datamgnregasupportlist = [
  {'text': 'പശു തൊഴുത്', 'value': 'Cattleshed'},
  {'text': 'ആട്ടിൻ കൂട്', 'value': 'Sheep Shed'},
  {'text': 'കോഴിക്കൂട്', 'value': 'Kozhikood'},
  {'text': 'കമ്പമ്പോസ്റ്റ് പിറ്റ്', 'value': 'Compost pit'},
  {'text': 'വർക്ക് ഷെഡ്', 'value': 'Work Shed'},
  {'text': 'പുൽകൃഷി ഭൂമിയൊരിക്കൽ', 'value': 'Fodder grass land preparation'},
  {'text': 'ജൈവ വേലി', 'value': 'Geofencing'},
  {'text': 'സോക്ക് പിറ്റ്', 'value': 'Sock pit'},
  {'text': 'അസസോള ടാങ്ക് /കുളം', 'value': 'Asola Tank / Pond'},
  {'text': 'കുളം വെട്ട്', 'value': 'Pond renovation'},
  {'text': 'കിണർ റീച്ചാർജ്', 'value': 'Well Recharging'},
  {'text': 'കിണർ നിർമ്മാണം', 'value': 'Construction of wells'},
  {'text': 'NO Value', 'value': ''}
  // {'text': 'other','value': 'source'},
];

[
{'text': "APIARY",
{'text': "AZOLA TANK",
{'text': "BIOFENCING",
{'text': "CATTLE FEED PRODUCTION",
{'text': "CATTLE SHED",
{'text': "DIGGING A POND",
{'text': "EGGER NURSERY",
{'text': "FODDER CULTIVATION",
{'text': "GOAT SHED",
{'text': "HATCHERY",
{'text': "INTEGRATED FARMING",
{'text': "MANURE PIT",
{'text': "MANURE PRODUCTION",
{'text': "MARKETING",
{'text': "MEAT SALES",
{'text': "MILK MARKETING",
{'text': "PARENT STOCK",
{'text': "PHARMACY",
{'text': "POULTRY CAGES/SHED",
{'text': "PREPARATION OF LAND FOR FODDER CULTIVATION",
{'text': "RECHARGING OF WELL",
{'text': "SINKING OF WELL",
{'text': "SOAK PIT",
{'text': "VALU ADDITION OF PRODUCE",
{'text': "WORK SHED"
{'text': "OTHERS",
]

final List? rawmaterials = [
  {
    'text': 'INGREDIENTS FOR CATTLE FEED',
    'value': 'INGREDIENTS FOR CATTLE FEED'
  },
  {
    'text': 'INGREDIENTS FOR POULTRY FEED',
    'value': 'INGREDIENTS FOR POULTRY FEED'
  },
  {'text': 'PULLETS', 'value': 'PULLETS'},
  {'text': 'MANURE', 'value': 'MANURE'},
  {'text': 'CHEMICAL FERTILIZERS', 'value': 'CHEMICAL FERTILIZERS'},
  {'text': 'FODDER SLIPS', 'value': 'FODDER SLIPS'},
  {'text': 'FODDER SEEDS', 'value': 'FODDER SEEDS'},
  {'text': 'GRASS FOODER', 'value': 'GRASS FOODER'},
  {'text': 'TREE FOODER', 'value': 'TREE FOODER'},
  {'text': 'MALE BUFFALO CALVES', 'value': 'MALE BUFFALO'},
  {'text': 'CALVES', 'value': 'CALVES'},
  {'text': 'HEIFERS', 'value': 'HEIFERS'},
  {'text': 'COWS', 'value': 'COWS'},
  {'text': 'MALABARI GOATS', 'value': 'MALABARI GOATS'},
  {'text': 'MALABARI GOAT-KIDS', 'value': 'MALABARI GOAT-KIDS'},
  {
    'text': 'MATERIAL FOR POULTRY CAGE FABRICATION',
    'value': 'MATERIAL FOR POULTRY CAGE FABRICATION'
  },
  {'text': 'EGG TRAYS', 'value': 'EGG TRAYS'},
  {'text': 'POULTRY FEED', 'value': 'POULTRY FEED'},
  {'text': 'LAYER', 'value': 'LAYER'},
  {'text': 'TMR', 'value': 'TMR'},
  {'text': 'GROWER', 'value': 'GROWER'},
  {'text': 'CATTLE FEED', 'value': 'CATTLE FEED'},
  {'text': 'CAFF STARTER', 'value': 'CAFF STARTER'},
  {'text': 'ENERGY RICH FEED', 'value': 'ENERGY RICH FEED'},
  {'text': 'BYPASS PROTIN', 'value': 'BYPASS PROTIN'},
  {'text': 'BYPASS FAT', 'value': 'BYPASS FAT'},
  {'text': 'TOTAL MIXED RATION', 'value': 'TOTAL MIXED RATION'},
  {'text': 'SILAGE', 'value': 'SILAGE'},
  {'text': 'HAY', 'value': 'HAY'},
  {'text': 'UREA TREATED STRAW', 'value': 'UREA TREATED STRAW'},
  {'text': 'UREA MOLASS BLOCK', 'value': 'UREA MOLASS BLOCK'},
  {'text': 'GOAT FEED', 'value': 'GOAT FEED'},
  {'text': 'KID STARTER', 'value': 'KID STARTER'},
  {'text': 'MILK REPLACER', 'value': 'MILK REPLACER'},
  {'text': 'NO Value', 'value': ''}

];

final List? pullets = [
  {'text': 'BV380', 'value': 'BV380'},
  {'text': 'GRAMALAKSHMI', 'value': 'GRAMALAKSHMI'},
  {'text': 'GRAMAPRIYA', 'value': 'GRAMAPRIYA'},
  {'text': 'OTHER', 'value': 'OTHER'},
  {'text': 'NO Value', 'value': ''}


];

final List? calves = [
  {'text': 'H F', 'value': 'CALVES-H F'},
  {'text': 'GERSEY', 'value': 'CALVES-GERSEY'},
  {'text': 'NO Value', 'value': ''}

];
final List? heifers = [
  {'text': 'H F', 'value': 'HEIFERS-H F'},
  {'text': 'GERSEY', 'value': 'HEIFERS-GERSEY'},
  {'text': 'NO Value', 'value': ''}


];
final List? cows = [
  {'text': 'H F', 'value': 'COWS-H F'},
  {'text': 'GERSEY', 'value': 'COWS-GERSEY'},
  {'text': 'NO Value', 'value': ''}

];


final List? manure = [
  {'text': 'COW DUNG', 'value': 'COW DUNG'},
  {'text': 'GOAT MANURE', 'value': 'GOAT MANURE'},
  {'text': 'POULTRY MANURE', 'value': 'POULTRY MANURE'},
  {'text': 'VERMY COMPOST', 'value': 'VERMY COMPOST'},
  {'text': 'NO Value', 'value': ''},

];

final List? fodderslip = [
  {'text': 'NAPIER', 'value': 'NAPIER'},
  {'text': 'CO4', 'value': 'CO4'},
  {'text': 'CO5', 'value': 'CO5'},
  {'text': 'RED NAPIER', 'value': 'RED NAPIER'},
  {'text': 'SUPER NAPIER', 'value': 'SUPER NAPIER'},
  {'text': 'GUINEA GRASS', 'value': 'GUINEA GRASS'},
  {'text': 'PARA GRASS', 'value': 'PARA GRASS'},
  {'text': 'CONGO SIGNAL', 'value': 'CONGO SIGNAL'},
  {'text': 'NO Value', 'value': ''},

];

List<String> branditem = [
  'VHC',
  'SKM',
  'KRISHI',
  'SUGUNA',
  'GODREJ',
];


List<String> layeritems = [
  'VHC',
  'SKM',
  'KRISHI',
  'SUGUNA',
  'GODREJ',
];


final List? livelihoods = [
  {'text': "BUFFALO", 'value': "BUFFALO",},
  {'text': "CALF", 'value': "CALF",},
  {'text': "COW", 'value': "COW",},
  {'text': "DUCK", 'value': "DUCK",},
  {'text': "FODDER", 'value': "FODDER",},
  {'text': "GOAT", 'value': "GOAT",},
  {'text': "MANURE", 'value': "MANURE",},
  {'text': "POULTRY", 'value': "POULTRY",},
  {'text': "POULTRY MANURE", 'value': "POULTRY MANURE",},
  {'text': 'NO Value', 'value': ''},

];

List<String> cattlefeed = [
  'KERALA FEEDS',
  'KS',
  'MILMA',
  'SKM',
  'GODREJ',
  'KRISHI',
];

List<String> milkreplacer = ['AMUL', 'GEEVAN'];
List<String> Landforgrass = ['OWN', 'LEASED'];

List<String> enrgyrichfeed = [
  'MILMA',
  'VHC',
  'SKM',
  'KRISHI',
  'SUGUNA',
  'GODREJ',
];

final List? produceproduction = [
  {'text': 'NAPIER', 'value': 'NAPIER'},
  {'text': 'CO4', 'value': 'CO4'},
  {'text': 'CO5', 'value': 'CO5'},
  {'text': 'RED NAPIER', 'value': 'RED NAPIER'},
  {'text': 'SUPER NAPIER', 'value': 'SUPER NAPIER'},
  {'text': 'GUINEA GRASS', 'value': 'GUINEA GRASS'},
  {'text': 'PARA GRASS', 'value': 'PARA GRASS'},
  {'text': 'CONGO SIGNAL', 'value': 'CONGO SIGNAL'},
  {'text': 'NO Value', 'value': ''}

];

final List? produceproductavilable = [
  {'text': 'MILK', 'value': 'MILK'},
  {'text': 'MEAT', 'value': 'MEAT'},
  {'text': 'EGG', 'value': 'EGG'},
  {'text': 'MANURE', 'value': 'MANURE'},
  {'text': 'FEED', 'value': 'FEED'},
  {'text': 'MALE BUFFALO CALF', 'value': 'MALE BUFFALO'},
  {'text': 'GRASS FOODER', 'value': 'GRASS FOODER'},
  {'text': 'TREE FOODER', 'value': 'TREE FOODER'},
  {'text': 'KID', 'value': 'KID'},
  {'text': 'DAY OLD CHICK', 'value': 'DAY OLD CHICK'},
  {'text': 'PULLETS', 'value': 'PULLETS'},
  {'text': 'CALF', 'value': 'CALF'},
  {'text': 'BEIFER', 'value': 'BEIFER'},
  {'text': 'NO Value', 'value': ''}

];

final List? mode_of_marketing = [
  {'text': 'DIRECT MARKET', 'value': 'DIRECT MARKET'},
  {'text': 'LOCAL MARKET', 'value': 'LOCAL MARKET'},
  {'text': 'WHOLESALE MARKET', 'value': 'WHOLESALE MARKET'},
  {'text': 'SOCIETY', 'value': 'SOCIETY'},
  {'text': 'CLUSTER', 'value': 'CLUSTER'},
  {'text': 'ONLINE', 'value': 'ONLINE'},
  {'text': 'NO Value', 'value': ''},

];

final List? cowlist = [

  {'text': 'H F', 'value': 'H F'},
  {'text': 'INDIGENOUS', 'value': 'INDIGENOUS'},
  {'text': 'JERSEY', 'value': 'JERSEY'},
  {'text': 'NO Value', 'value': ''},

];

final List? calfgender = [
  {'text': "FEMALE", 'value': "FEMALE"},
  {'text': "MALE", 'value': "MALE"},
  {'text': 'NO Value', 'value': ''},
];


final List? fooderitems = [
  {'text': "FOR SALE", 'value': "FOR SALE",},
  {'text': "OWN USE", 'value': "OWN USE"},
  {'text': 'NO Value', 'value': ''},

];

final List? goatlist = [
  {'text': "ATTAPADI BLACK", 'value': "ATTAPADI BLACK"},
  {'text': "ATTAPADI BLACK KID", 'value': "ATTAPADI BLACK KID"},
  {'text': "MALABARI", 'value': "MALABARI"},
  {'text': "MALABARI KID", 'value': "MALABARI KID"},
  {'text': "OTHERS", 'value': "OTHERS"},
  {'text': 'NO Value', 'value': ''}

];

final List? manuritems = [
  {'text': "DRY", 'value': "DRY",},
  {'text': "FRESH", 'value': "FRESH"},
  {'text': 'NO Value', 'value': ''}
];


final List? poultrylist = [
  {'text': "EGG PRODUCTION", 'value': "EGG PRODUCTION"},
  { 'text': "MARKETING", 'value': "MARKETING"},
  {'text': 'NO Value', 'value': ''}


];

final List<String> ward =
[
  "1",
  "2",
  "3",
  "4",
  "5",
  "6",
  "7",
  "8",
  "9",
  "10",
  "11",
  "12",
  "13",
  "14",
  "15",
  "16",
  "17",
  "18",
  "19",
  "20",
  "21",
  "22",
  "23",
  "24",
  "25",
  "26",
  "27",
  "28",
  "29",
  "30",
  "31",
  "32",
  "33",
  "34",
  "35",

];