// To parse this JSON data, do
//
//     final addData = addDataFromJson(jsonString);

import 'dart:convert';

AddData addDataFromJson(String str) => AddData.fromJson(json.decode(str));

String addDataToJson(AddData data) => json.encode(data.toJson());

class AddData {
  String? dataDistrict;
  String? dataBlock;
  String? dataPanchayath;
  int? dataWard;
  String? dataName;
  String? dataAddress;
  int? dataPhonenumber;
  String? dataClass;
  String? dataClass2;
  List<String>? dataClass3;
  String? dataFamilyincome;
  String? dataNameofNg;
  String? dataNameofNGmember;
  String? dataRoleinNg;
  String? dataHouseOwnership;
  int? dataLanddetailsLandarea;
  int? dataLanddetailsAgricultureland;
  List<String>? dataAnimalhusbendaryBusinesstype;
  String? dataAnimalhusbendaryOthers0;
  String? dataAnimalhusbendaryCdsregistration;
  String? dataAnimalhusbendaryRegdetailsRegnumber;
  String? dataAnimalhusbendaryRegdetailsCdsunitname;
  String? dataEnterpisetype;
  int? dataNoofgroupmembers;
  String? dataYearofstartingagriculture;
  String? dataYearofstartingbussiness;
  int? dataAmountinvested;
  List<String>? dataSourceofinvestment;
  String? dataSupportrecived;
  String? dataLoan;
  int? dataLoandetailsTotalinvestment;
  String? dataLoandetailsDateofLoanApplication;
  String? dataBusinessidea;
  String? dataInfraInfrastructure;
  String? dataInfraShed;
  String? dataInfraWastage;
  String? dataInfraBiogas;
  String? dataInfraEquipments;
  String? dataInfraOthers;
  List<String>? dataSupport;
  String? dataOthers2;
  List<String>? dataMgnregAsupport;
  String? dataLanddetails1Landforgrass;
  int? dataLanddetails1Qtyofownland;
  int? dataLanddetails1Qtyofleasedland;
  String? dataLanddetails2Siteforworkshed;
  int? dataLanddetails2Qtyofownland;
  String? dataOthers4;
  List<String>? dataTrainingsrequired;
  String? dataOthers3;
  String? dataComments;
  String? dataNameofcrp;
  String? dataNameofrespondent;
  String? dataDateofsurvey;
  int? dataStarttime;
  List<String>? dataSalesPrdct2;
  int? milkQnty;
  int? meatQnty;
  int? eggQnty;
  int? salesManureQnty;
  int? feedQnty;
  int? maleBuffaloCalfQnty;
  int? grasFooderQnty;
  int? treeFooderQnty;
  int? kidQnty;
  int? dayOldChickQnty;
  int? pulletsQnty;
  int? calfQnty;
  int? beiferQnty;
  List<String>? dataSalesSalesmethod;
  String? dataProductsPrdct;
  int? dataProductsQuantum;
  int? dataProductsPrice2;
  String? dataLivelihoodIncomesource;
  int? dataLivelihoodNumbers;
  String? dataLivelihoodCapitalsource;
  int? dataLivelihoodRevenue;
  List<String>? dataPurchaseofrawmaterialsItemtype;
  List<String>? pulletsList;
  List<String>? manureList;
  int? cowDungQnty;
  int? goatManureQnty;
  int? poultryManureQnty;
  int? vermyCompostQnty;
  List<String>? fodderSlipsList;
  int? napierQnty;
  int? co4Qnty;
  int? co5Qnty;
  int? redNapierQnty;
  int? superNapierQnty;
  int? guineaGrassQnty;
  int? paraGrassQnty;
  int? congoSignalQnty;
  int? maleBuffaloCalvesQnty;
  List<String>? calvesList;
  int? calvesHfQnty;
  int? calvesGerseyQnty;
  List<String>? heipersList;
  int? heipersHfQnty;
  int? heipersGerseyQnty;
  List<String>? cowsList;
  int? cowsHfQnty;
  int? cowsGerseyQnty;
  int? malabariGoatsQnty;
  int? materialForPoultryQnty;
  int? eggTraysQnty;
  int? poultryFeedQnty;
  String? layerList;
  String? cattleFeedList;
  int? cattleFeedQnty;
  String? milkReplacerList;
  int? milkReplacerQnty;
  String? energyRichFeedList;
  int? energyRichFeedQnty;
  int? byPassProteinQnty;
  int? byPassFatQnty;
  int? tmrQnty;
  int? silageQnty;
  int? hayQnty;
  int? ureaTreatedStrawQnty;
  int? goatFeeDqnty;
  int? kidStarterQnty;
  List<String>? modePurchaseofrawmaterials;
  String? dataPurchaseofrawmaterialsBrand;
  int? brandQnty;
  List<Member>? members;

  AddData({
     this.dataDistrict,
     this.dataBlock,
     this.dataPanchayath,
     this.dataWard,
     this.dataName,
     this.dataAddress,
     this.dataPhonenumber,
     this.dataClass,
     this.dataClass2,
     this.dataClass3,
     this.dataFamilyincome,
     this.dataNameofNg,
     this.dataNameofNGmember,
     this.dataRoleinNg,
     this.dataHouseOwnership,
     this.dataLanddetailsLandarea,
     this.dataLanddetailsAgricultureland,
     this.dataAnimalhusbendaryBusinesstype,
     this.dataAnimalhusbendaryOthers0,
     this.dataAnimalhusbendaryCdsregistration,
     this.dataAnimalhusbendaryRegdetailsRegnumber,
     this.dataAnimalhusbendaryRegdetailsCdsunitname,
     this.dataEnterpisetype,
     this.dataNoofgroupmembers,
     this.dataYearofstartingagriculture,
     this.dataYearofstartingbussiness,
     this.dataAmountinvested,
     this.dataSourceofinvestment,
     this.dataSupportrecived,
     this.dataLoan,
     this.dataLoandetailsTotalinvestment,
     this.dataLoandetailsDateofLoanApplication,
     this.dataBusinessidea,
     this.dataInfraInfrastructure,
     this.dataInfraShed,
     this.dataInfraWastage,
     this.dataInfraBiogas,
     this.dataInfraEquipments,
     this.dataInfraOthers,
     this.dataSupport,
     this.dataOthers2,
     this.dataMgnregAsupport,
     this.dataLanddetails1Landforgrass,
     this.dataLanddetails1Qtyofownland,
     this.dataLanddetails1Qtyofleasedland,
     this.dataLanddetails2Siteforworkshed,
     this.dataLanddetails2Qtyofownland,
     this.dataOthers4,
     this.dataTrainingsrequired,
     this.dataOthers3,
     this.dataComments,
     this.dataNameofcrp,
     this.dataNameofrespondent,
     this.dataDateofsurvey,
     this.dataStarttime,
     this.dataSalesPrdct2,
     this.milkQnty,
     this.meatQnty,
     this.eggQnty,
     this.salesManureQnty,
     this.feedQnty,
     this.maleBuffaloCalfQnty,
     this.grasFooderQnty,
     this.treeFooderQnty,
     this.kidQnty,
     this.dayOldChickQnty,
     this.pulletsQnty,
     this.calfQnty,
     this.beiferQnty,
     this.dataSalesSalesmethod,
     this.dataProductsPrdct,
     this.dataProductsQuantum,
     this.dataProductsPrice2,
     this.dataLivelihoodIncomesource,
     this.dataLivelihoodNumbers,
     this.dataLivelihoodCapitalsource,
     this.dataLivelihoodRevenue,
     this.dataPurchaseofrawmaterialsItemtype,
     this.pulletsList,
     this.manureList,
     this.cowDungQnty,
     this.goatManureQnty,
     this.poultryManureQnty,
     this.vermyCompostQnty,
     this.fodderSlipsList,
     this.napierQnty,
     this.co4Qnty,
     this.co5Qnty,
     this.redNapierQnty,
     this.superNapierQnty,
     this.guineaGrassQnty,
     this.paraGrassQnty,
     this.congoSignalQnty,
     this.maleBuffaloCalvesQnty,
     this.calvesList,
     this.calvesHfQnty,
     this.calvesGerseyQnty,
     this.heipersList,
     this.heipersHfQnty,
     this.heipersGerseyQnty,
     this.cowsList,
     this.cowsHfQnty,
     this.cowsGerseyQnty,
     this.malabariGoatsQnty,
     this.materialForPoultryQnty,
     this.eggTraysQnty,
     this.poultryFeedQnty,
     this.layerList,
     this.cattleFeedList,
     this.cattleFeedQnty,
     this.milkReplacerList,
     this.milkReplacerQnty,
     this.energyRichFeedList,
     this.energyRichFeedQnty,
     this.byPassProteinQnty,
     this.byPassFatQnty,
     this.tmrQnty,
     this.silageQnty,
     this.hayQnty,
     this.ureaTreatedStrawQnty,
     this.goatFeeDqnty,
     this.kidStarterQnty,
     this.modePurchaseofrawmaterials,
     this.dataPurchaseofrawmaterialsBrand,
     this.brandQnty,
     this.members,
  });

  factory AddData.fromJson(Map<String, dynamic> json) => AddData(
    dataDistrict: json["data_district"],
    dataBlock: json["data_Block"],
    dataPanchayath: json["data_Panchayath"],
    dataWard: json["data_Ward"],
    dataName: json["data_Name"],
    dataAddress: json["data_Address"],
    dataPhonenumber: json["data_Phonenumber"],
    dataClass: json["data_Class"],
    dataClass2: json["data_Class2"],
    dataClass3: List<String>.from(json["data_Class3"].map((x) => x)),
    dataFamilyincome: json["data_familyincome"],
    dataNameofNg: json["data_NameofNG"],
    dataNameofNGmember: json["data_NameofNGmember"],
    dataRoleinNg: json["data_roleinNG"],
    dataHouseOwnership: json["data_houseOwnership"],
    dataLanddetailsLandarea: json["data_landdetails_landarea"],
    dataLanddetailsAgricultureland: json["data_landdetails_agricultureland"],
    dataAnimalhusbendaryBusinesstype: json["data_Animalhusbendary_businesstype"],
    dataAnimalhusbendaryOthers0: json["data_Animalhusbendary_others0"],
    dataAnimalhusbendaryCdsregistration: json["data_Animalhusbendary_cdsregistration"],
    dataAnimalhusbendaryRegdetailsRegnumber: json["data_Animalhusbendary_regdetails_regnumber"],
    dataAnimalhusbendaryRegdetailsCdsunitname: json["data_Animalhusbendary_regdetails_cdsunitname"],
    dataEnterpisetype: json["data_enterpisetype"],
    dataNoofgroupmembers: json["data_noofgroupmembers"],
    dataYearofstartingagriculture: json["data_Yearofstartingagriculture"],
    dataYearofstartingbussiness: json["data_yearofstartingbussiness"],
    dataAmountinvested: json["data_amountinvested"],
    dataSourceofinvestment: List<String>.from(json["data_Sourceofinvestment"].map((x) => x)),
    dataSupportrecived: json["data_supportrecived"],
    dataLoan: json["data_loan"],
    dataLoandetailsTotalinvestment: json["data_loandetails_totalinvestment"],
    dataLoandetailsDateofLoanApplication: json["data_loandetails_DateofLoanApplication "],
    dataBusinessidea: json["data_businessidea "],
    dataInfraInfrastructure: json["data_Infra_Infrastructure"],
    dataInfraShed: json["data_Infra_Shed"],
    dataInfraWastage: json["data_Infra_wastage"],
    dataInfraBiogas: json["data_Infra_biogas"],
    dataInfraEquipments: json["data_Infra_equipments"],
    dataInfraOthers: json["data_Infra_others"],
    dataSupport: List<String>.from(json["data_support"].map((x) => x)),
    dataOthers2: json["data_others2"],
    dataMgnregAsupport: List<String>.from(json["data_MGNREGAsupport"].map((x) => x)),
    dataLanddetails1Landforgrass: json["data_landdetails1_landforgrass"],
    dataLanddetails1Qtyofownland: json["data_landdetails1_qtyofownland"],
    dataLanddetails1Qtyofleasedland: json["data_landdetails1_qtyofleasedland"],
    dataLanddetails2Siteforworkshed: json["data_landdetails2_siteforworkshed"],
    dataLanddetails2Qtyofownland: json["data_landdetails2_qtyofownland"],
    dataOthers4: json["data_others4"],
    dataTrainingsrequired: List<String>.from(json["data_Trainingsrequired"].map((x) => x)),
    dataOthers3: json["data_others3"],
    dataComments: json["data_comments"],
    dataNameofcrp: json["data_nameofcrp"],
    dataNameofrespondent: json["data_Nameofrespondent"],
    dataDateofsurvey: json["data_dateofsurvey"],
    dataStarttime: json[" data_Starttime"],
    dataSalesPrdct2: List<String>.from(json["data_Sales_prdct2"].map((x) => x)),
    milkQnty: json["MILK_qnty"],
    meatQnty: json["MEAT_qnty"],
    eggQnty: json["EGG_qnty"],
    salesManureQnty: json["Sales_MANURE_qnty"],
    feedQnty: json["FEED_qnty"],
    maleBuffaloCalfQnty: json["male_buffalo_calf_qnty"],
    grasFooderQnty: json["Gras_fooder_qnty"],
    treeFooderQnty: json["tree_fooder_qnty"],
    kidQnty: json["kid_qnty"],
    dayOldChickQnty: json["day_old_chick_qnty"],
    pulletsQnty: json["pullets_qnty"],
    calfQnty: json["calf_qnty"],
    beiferQnty: json["beifer_qnty"],
    dataSalesSalesmethod: List<String>.from(json["data_Sales_salesmethod"].map((x) => x)),
    dataProductsPrdct: json["data_products_prdct"],
    dataProductsQuantum: json["data_products_quantum"],
    dataProductsPrice2: json["data_products_price2"],
    dataLivelihoodIncomesource: json["data_livelihood_incomesource"],
    dataLivelihoodNumbers: json["data_livelihood_numbers"],
    dataLivelihoodCapitalsource: json["data_livelihood_capitalsource"],
    dataLivelihoodRevenue: json["data_livelihood_revenue"],
    dataPurchaseofrawmaterialsItemtype: List<String>.from(json["data_purchaseofrawmaterials_itemtype"].map((x) => x)),
    pulletsList: List<String>.from(json["PULLETS_List"].map((x) => x)),
    manureList: List<String>.from(json["MANURE_List"].map((x) => x)),
    cowDungQnty: json["COW_DUNG_qnty"],
    goatManureQnty: json["GOAT_MANURE_qnty"],
    poultryManureQnty: json["POULTRY_MANURE_qnty"],
    vermyCompostQnty: json["VERMY_COMPOST_qnty"],
    fodderSlipsList: List<String>.from(json["FODDER_SLIPS_List"].map((x) => x)),
    napierQnty: json["NAPIER_qnty"],
    co4Qnty: json["CO4_qnty"],
    co5Qnty: json["CO5_qnty"],
    redNapierQnty: json["RED_NAPIER_qnty"],
    superNapierQnty: json["SUPER_NAPIER_qnty"],
    guineaGrassQnty: json["GUINEA_GRASS_qnty"],
    paraGrassQnty: json["PARA_GRASS_qnty"],
    congoSignalQnty: json["CONGO_SIGNAL_qnty"],
    maleBuffaloCalvesQnty: json["MALE_BUFFALO_CALVES_qnty"],
    calvesList: List<String>.from(json["CALVES_List"].map((x) => x)),
    calvesHfQnty: json["CALVES_HF_qnty"],
    calvesGerseyQnty: json["CALVES_GERSEY_qnty"],
    heipersList: List<String>.from(json["HEIPERS_List"].map((x) => x)),
    heipersHfQnty: json["HEIPERS_HF_qnty"],
    heipersGerseyQnty: json["HEIPERS_GERSEY_qnty"],
    cowsList: List<String>.from(json["COWS_List"].map((x) => x)),
    cowsHfQnty: json["COWS_HF_qnty"],
    cowsGerseyQnty: json["COWS_GERSEY_qnty"],
    malabariGoatsQnty: json["MALABARI_GOATS_qnty"],
    materialForPoultryQnty: json["MATERIAL_FOR_POULTRY_qnty"],
    eggTraysQnty: json["EGG_TRAYS_qnty"],
    poultryFeedQnty: json["POULTRY_FEED_qnty"],
    layerList: json["LAYER_List"],
    cattleFeedList: json["CATTLE_FEED_List"],
    cattleFeedQnty: json["CATTLE_FEED_qnty"],
    milkReplacerList: json["MILK_REPLACER_List"],
    milkReplacerQnty: json["MILK_REPLACER_qnty"],
    energyRichFeedList: json["ENERGY_RICH_FEED_List"],
    energyRichFeedQnty: json["ENERGY_RICH_FEED_qnty"],
    byPassProteinQnty: json["BY_PASS_PROTEIN_qnty"],
    byPassFatQnty: json["BY_PASS_FAT_qnty"],
    tmrQnty: json["TMR_qnty"],
    silageQnty: json["SILAGE_qnty"],
    hayQnty: json["HAY_qnty"],
    ureaTreatedStrawQnty: json["UREA_TREATED_STRAW_qnty"],
    goatFeeDqnty: json["GOAT_FEEDqnty"],
    kidStarterQnty: json["KID_STARTER_qnty"],
    modePurchaseofrawmaterials: List<String>.from(json["Mode_purchaseofrawmaterials"].map((x) => x)),
    dataPurchaseofrawmaterialsBrand: json["data_purchaseofrawmaterials_brand"],
    brandQnty: json["BRAND_qnty"],
    members: List<Member>.from(json["familyDetails"].map((x) => Member.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data_district": dataDistrict,
    "data_Block": dataBlock,
    "data_Panchayath": dataPanchayath,
    "data_Ward": dataWard,
    "data_Name": dataName,
    "data_Address": dataAddress,
    "data_Phonenumber": dataPhonenumber,
    "data_Class": dataClass,
    "data_Class2": dataClass2,
    "data_Class3": dataClass3 != null ? List<dynamic>.from(dataClass3!.map((x) => x)) : [],
    "data_familyincome": dataFamilyincome,
    "data_NameofNG": dataNameofNg,
    "data_NameofNGmember": dataNameofNGmember,
    "data_roleinNG": dataRoleinNg,
    "data_houseOwnership": dataHouseOwnership,
    "data_landdetails_landarea": dataLanddetailsLandarea,
    "data_landdetails_agricultureland": dataLanddetailsAgricultureland,
    "data_Animalhusbendary_businesstype": dataAnimalhusbendaryBusinesstype,
    "data_Animalhusbendary_others0": dataAnimalhusbendaryOthers0,
    "data_Animalhusbendary_cdsregistration": dataAnimalhusbendaryCdsregistration,
    "data_Animalhusbendary_regdetails_regnumber": dataAnimalhusbendaryRegdetailsRegnumber,
    "data_Animalhusbendary_regdetails_cdsunitname": dataAnimalhusbendaryRegdetailsCdsunitname,
    "data_enterpisetype": dataEnterpisetype,
    "data_noofgroupmembers": dataNoofgroupmembers,
    "data_Yearofstartingagriculture": dataYearofstartingagriculture,
    "data_yearofstartingbussiness": dataYearofstartingbussiness,
    "data_amountinvested": dataAmountinvested,
    "data_Sourceofinvestment": dataSourceofinvestment != null ? List<dynamic>.from(dataSourceofinvestment!.map((x) => x)) : [],
    "data_supportrecived": dataSupportrecived,
    "data_loan": dataLoan,
    "data_loandetails_totalinvestment": dataLoandetailsTotalinvestment,
    "data_loandetails_DateofLoanApplication ": dataLoandetailsDateofLoanApplication,
    "data_businessidea ": dataBusinessidea,
    "data_Infra_Infrastructure": dataInfraInfrastructure,
    "data_Infra_Shed": dataInfraShed,
    "data_Infra_wastage": dataInfraWastage,
    "data_Infra_biogas": dataInfraBiogas,
    "data_Infra_equipments": dataInfraEquipments,
    "data_Infra_others": dataInfraOthers,
    "data_support": dataSupport != null? List<dynamic>.from(dataSupport!.map((x) => x)) : [],
    "data_others2": dataOthers2,
    "data_MGNREGAsupport": dataMgnregAsupport !=null ? List<dynamic>.from(dataMgnregAsupport!.map((x) => x)) : [],
    "data_landdetails1_landforgrass": dataLanddetails1Landforgrass,
    "data_landdetails1_qtyofownland": dataLanddetails1Qtyofownland,
    "data_landdetails1_qtyofleasedland": dataLanddetails1Qtyofleasedland,
    "data_landdetails2_siteforworkshed": dataLanddetails2Siteforworkshed,
    "data_landdetails2_qtyofownland": dataLanddetails2Qtyofownland,
    "data_others4": dataOthers4,
    "data_Trainingsrequired":  dataTrainingsrequired != null ? List<dynamic>.from(dataTrainingsrequired!.map((x) => x)) : [],
    "data_others3": dataOthers3,
    "data_comments": dataComments,
    "data_nameofcrp": dataNameofcrp,
    "data_Nameofrespondent": dataNameofrespondent,
    "data_dateofsurvey": dataDateofsurvey,
    " data_Starttime": dataStarttime,
    "data_Sales_prdct2": dataSalesPrdct2 != null ? List<dynamic>.from(dataSalesPrdct2!.map((x) => x)) : [],
    "MILK_qnty": milkQnty,
    "MEAT_qnty": meatQnty,
    "EGG_qnty": eggQnty,
    "Sales_MANURE_qnty": salesManureQnty,
    "FEED_qnty": feedQnty,
    "male_buffalo_calf_qnty": maleBuffaloCalfQnty,
    "Gras_fooder_qnty": grasFooderQnty,
    "tree_fooder_qnty": treeFooderQnty,
    "kid_qnty": kidQnty,
    "day_old_chick_qnty": dayOldChickQnty,
    "pullets_qnty": pulletsQnty,
    "calf_qnty": calfQnty,
    "beifer_qnty": beiferQnty,
    "data_Sales_salesmethod": dataSalesSalesmethod != null ? List<dynamic>.from(dataSalesSalesmethod!.map((x) => x)) : [],
    "data_products_prdct": dataProductsPrdct,
    "data_products_quantum": dataProductsQuantum,
    "data_products_price2": dataProductsPrice2,
    "data_livelihood_incomesource": dataLivelihoodIncomesource,
    "data_livelihood_numbers": dataLivelihoodNumbers,
    "data_livelihood_capitalsource": dataLivelihoodCapitalsource,
    "data_livelihood_revenue": dataLivelihoodRevenue,
    "data_purchaseofrawmaterials_itemtype": dataPurchaseofrawmaterialsItemtype!= null ?  List<dynamic>.from(dataPurchaseofrawmaterialsItemtype!.map((x) => x)) : [],
    "PULLETS_List": pulletsList!= null ? List<dynamic>.from(pulletsList!.map((x) => x)) :[],
    "MANURE_List": manureList!= null ? List<dynamic>.from(manureList!.map((x) => x)) : [],
    "COW_DUNG_qnty": cowDungQnty,
    "GOAT_MANURE_qnty": goatManureQnty,
    "POULTRY_MANURE_qnty": poultryManureQnty,
    "VERMY_COMPOST_qnty": vermyCompostQnty,
    "FODDER_SLIPS_List": fodderSlipsList != null ? List<dynamic>.from(fodderSlipsList!.map((x) => x)) : [],
    "NAPIER_qnty": napierQnty,
    "CO4_qnty": co4Qnty,
    "CO5_qnty": co5Qnty,
    "RED_NAPIER_qnty": redNapierQnty,
    "SUPER_NAPIER_qnty": superNapierQnty,
    "GUINEA_GRASS_qnty": guineaGrassQnty,
    "PARA_GRASS_qnty": paraGrassQnty,
    "CONGO_SIGNAL_qnty": congoSignalQnty,
    "MALE_BUFFALO_CALVES_qnty": maleBuffaloCalvesQnty,
    "CALVES_List": calvesList != null ? List<dynamic>.from(calvesList!.map((x) => x)) : [],
    "CALVES_HF_qnty": calvesHfQnty,
    "CALVES_GERSEY_qnty": calvesGerseyQnty,
    "HEIPERS_List": heipersList != null ? List<dynamic>.from(heipersList!.map((x) => x)) : [],
    "HEIPERS_HF_qnty": heipersHfQnty,
    "HEIPERS_GERSEY_qnty": heipersGerseyQnty,
    "COWS_List": cowsList != null ? List<dynamic>.from(cowsList!.map((x) => x)) : [],
    "COWS_HF_qnty": cowsHfQnty,
    "COWS_GERSEY_qnty": cowsGerseyQnty,
    "MALABARI_GOATS_qnty": malabariGoatsQnty,
    "MATERIAL_FOR_POULTRY_qnty": materialForPoultryQnty,
    "EGG_TRAYS_qnty": eggTraysQnty,
    "POULTRY_FEED_qnty": poultryFeedQnty,
    "LAYER_List": layerList,
    "CATTLE_FEED_List": cattleFeedList,
    "CATTLE_FEED_qnty": cattleFeedQnty,
    "MILK_REPLACER_List": milkReplacerList,
    "MILK_REPLACER_qnty": milkReplacerQnty,
    "ENERGY_RICH_FEED_List": energyRichFeedList,
    "ENERGY_RICH_FEED_qnty": energyRichFeedQnty,
    "BY_PASS_PROTEIN_qnty": byPassProteinQnty,
    "BY_PASS_FAT_qnty": byPassFatQnty,
    "TMR_qnty": tmrQnty,
    "SILAGE_qnty": silageQnty,
    "HAY_qnty": hayQnty,
    "UREA_TREATED_STRAW_qnty": ureaTreatedStrawQnty,
    "GOAT_FEEDqnty": goatFeeDqnty,
    "KID_STARTER_qnty": kidStarterQnty,
    "Mode_purchaseofrawmaterials": modePurchaseofrawmaterials != null ?  List<dynamic>.from(modePurchaseofrawmaterials!.map((x) => x)) : [],
    "data_purchaseofrawmaterials_brand": dataPurchaseofrawmaterialsBrand,
    "BRAND_qnty": brandQnty,
    "familyDetails": List<dynamic>.from(members!.map((x) => x.toJson())),
  };
}

class Member {
  String? dataFamilydetailsNameoffailyfmember;
  String? dataFamilydetailsRelation;
  int? dataFamilydetailsAgeoffamilymember;
  String? dataFamilydetailsEducation;
  String? dataFamilydetailsJob;
  String? dataFamilydetailsSkill;

  Member({
    required this.dataFamilydetailsNameoffailyfmember,
    required this.dataFamilydetailsRelation,
    required this.dataFamilydetailsAgeoffamilymember,
    required this.dataFamilydetailsEducation,
    required this.dataFamilydetailsJob,
    required this.dataFamilydetailsSkill,
  });

  factory Member.fromJson(Map<String, dynamic> json) => Member(
    dataFamilydetailsNameoffailyfmember: json["data_familydetails_nameoffailyfmember"],
    dataFamilydetailsRelation: json["data_familydetails_relation"],
    dataFamilydetailsAgeoffamilymember: json["data_familydetails_ageoffamilymember"],
    dataFamilydetailsEducation: json["data_familydetails_education"],
    dataFamilydetailsJob: json["data_familydetails_job"],
    dataFamilydetailsSkill: json["data_familydetails_skill"],
  );

  Map<String, dynamic> toJson() => {
    "data_familydetails_nameoffailyfmember": dataFamilydetailsNameoffailyfmember,
    "data_familydetails_relation": dataFamilydetailsRelation,
    "data_familydetails_ageoffamilymember": dataFamilydetailsAgeoffamilymember,
    "data_familydetails_education": dataFamilydetailsEducation,
    "data_familydetails_job": dataFamilydetailsJob,
    "data_familydetails_skill": dataFamilydetailsSkill,
  };
}
