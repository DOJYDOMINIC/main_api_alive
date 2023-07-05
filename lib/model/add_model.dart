// To parse this JSON data, do
//

import 'dart:convert';

import '../view/test/test.dart';
// final addData = addDataFromJson(jsonString);

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
  List<String?>? dataClass3;
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
  List? dataSourceofinvestment;
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
  String? dataSupport;
  String? dataOthers2;
  List<String>? dataMgnregAsupport;
  String? dataLanddetails1Landforgrass;
  int? dataLanddetails1Qtyofownland;
  int? dataLanddetails1Qtyofleasedland;
  String? dataLanddetails2Siteforworkshed;
  int? dataLanddetails2Qtyofownland;
  String? dataOthers4;
  String? dataTrainingsrequired;
  String? dataOthers3;
  String? dataComments;
  String? dataNameofcrp;
  String? dataNameofrespondent;
  String? dataDateofsurvey;
  int? dataStarttime;
  String? dataSalesPrdct2;
  int? dataSalesQuntum2;
  String? dataSalesSalesmethod;
  String? dataProductsPrdct;
  int? dataProductsQuantum;
  int? dataProductsPrice2;
  String? dataLivelihoodIncomesource;
  int? dataLivelihoodNumbers;
  String? dataLivelihoodCapitalsource;
  int? dataLivelihoodRevenue;
  int? dataPurchaseofrawmaterialsQuantity;
  int? dataPurchaseofrawmaterialsPrice;
  String? dataPurchaseofrawmaterialsBrand;
  String? dataPurchaseofrawmaterialsOwn;
  int? dataPurchaseofrawmaterialsRetail;
  int? dataPurchaseofrawmaterialsP2;
  int? dataPurchaseofrawmaterialsWholesale;
  int? dataPurchaseofrawmaterialsP3;
  int? dataPurchaseofrawmaterialsGroup;
  int? dataPurchaseofrawmaterialsP4;
  int? dataPurchaseofrawmaterialsSubsidy;
  int? dataPurchaseofrawmaterialsP5;
  List<Member> members;

  AddData({
    this.dataDistrict,
     this.dataBlock,
     this.dataPanchayath,
     this.dataWard,
    required this.dataName,
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
     this.dataSalesQuntum2,
     this.dataSalesSalesmethod,
     this.dataProductsPrdct,
     this.dataProductsQuantum,
     this.dataProductsPrice2,
     this.dataLivelihoodIncomesource,
     this.dataLivelihoodNumbers,
     this.dataLivelihoodCapitalsource,
     this.dataLivelihoodRevenue,
     this.dataPurchaseofrawmaterialsQuantity,
     this.dataPurchaseofrawmaterialsPrice,
     this.dataPurchaseofrawmaterialsBrand,
     this.dataPurchaseofrawmaterialsOwn,
     this.dataPurchaseofrawmaterialsRetail,
     this.dataPurchaseofrawmaterialsP2,
     this.dataPurchaseofrawmaterialsWholesale,
     this.dataPurchaseofrawmaterialsP3,
     this.dataPurchaseofrawmaterialsGroup,
     this.dataPurchaseofrawmaterialsP4,
     this.dataPurchaseofrawmaterialsSubsidy,
     this.dataPurchaseofrawmaterialsP5,
    required this.members,
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
    dataClass3: json["data_Class3"],
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
    dataSourceofinvestment: json["data_Sourceofinvestment"],
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
    dataSupport: json["data_support"],
    dataOthers2: json["data_others2"],
    dataMgnregAsupport: json["data_MGNREGAsupport"],
    dataLanddetails1Landforgrass: json["data_landdetails1_landforgrass"],
    dataLanddetails1Qtyofownland: json["data_landdetails1_qtyofownland"],
    dataLanddetails1Qtyofleasedland: json["data_landdetails1_qtyofleasedland"],
    dataLanddetails2Siteforworkshed: json["data_landdetails2_siteforworkshed"],
    dataLanddetails2Qtyofownland: json["data_landdetails2_qtyofownland"],
    dataOthers4: json["data_others4"],
    dataTrainingsrequired: json["data_Trainingsrequired"],
    dataOthers3: json["data_others3"],
    dataComments: json["data_comments"],
    dataNameofcrp: json["data_nameofcrp"],
    dataNameofrespondent: json["data_Nameofrespondent"],
    dataDateofsurvey: json["data_dateofsurvey"],
    dataStarttime: json[" data_Starttime"],
    dataSalesPrdct2: json["data_Sales_prdct2"],
    dataSalesQuntum2: json["data_Sales_quntum2"],
    dataSalesSalesmethod: json["data_Sales_salesmethod"],
    dataProductsPrdct: json["data_products_prdct"],
    dataProductsQuantum: json["data_products_quantum"],
    dataProductsPrice2: json["data_products_price2"],
    dataLivelihoodIncomesource: json["data_livelihood_incomesource"],
    dataLivelihoodNumbers: json["data_livelihood_numbers"],
    dataLivelihoodCapitalsource: json["data_livelihood_capitalsource"],
    dataLivelihoodRevenue: json["data_livelihood_revenue"],
    dataPurchaseofrawmaterialsQuantity: json["data_purchaseofrawmaterials_quantity"],
    dataPurchaseofrawmaterialsPrice: json["data_purchaseofrawmaterials_price"],
    dataPurchaseofrawmaterialsBrand: json["data_purchaseofrawmaterials_brand"],
    dataPurchaseofrawmaterialsOwn: json["data_purchaseofrawmaterials_own"],
    dataPurchaseofrawmaterialsRetail: json["data_purchaseofrawmaterials_retail"],
    dataPurchaseofrawmaterialsP2: json["data_purchaseofrawmaterials_p2"],
    dataPurchaseofrawmaterialsWholesale: json["data_purchaseofrawmaterials_wholesale"],
    dataPurchaseofrawmaterialsP3: json["data_purchaseofrawmaterials_p3"],
    dataPurchaseofrawmaterialsGroup: json["data_purchaseofrawmaterials_group"],
    dataPurchaseofrawmaterialsP4: json["data_purchaseofrawmaterials_p4"],
    dataPurchaseofrawmaterialsSubsidy: json["data_purchaseofrawmaterials_subsidy"],
    dataPurchaseofrawmaterialsP5: json["data_purchaseofrawmaterials_p5"],
    members: List<Member>.from(json["members"].map((x) => Member.fromJson(x))),
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
    "data_Class3": dataClass3,
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
    "data_Sourceofinvestment": dataSourceofinvestment,
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
    "data_support": dataSupport,
    "data_others2": dataOthers2,
    "data_MGNREGAsupport": dataMgnregAsupport,
    "data_landdetails1_landforgrass": dataLanddetails1Landforgrass,
    "data_landdetails1_qtyofownland": dataLanddetails1Qtyofownland,
    "data_landdetails1_qtyofleasedland": dataLanddetails1Qtyofleasedland,
    "data_landdetails2_siteforworkshed": dataLanddetails2Siteforworkshed,
    "data_landdetails2_qtyofownland": dataLanddetails2Qtyofownland,
    "data_others4": dataOthers4,
    "data_Trainingsrequired": dataTrainingsrequired,
    "data_others3": dataOthers3,
    "data_comments": dataComments,
    "data_nameofcrp": dataNameofcrp,
    "data_Nameofrespondent": dataNameofrespondent,
    "data_dateofsurvey": dataDateofsurvey,
    " data_Starttime": dataStarttime,
    "data_Sales_prdct2": dataSalesPrdct2,
    "data_Sales_quntum2": dataSalesQuntum2,
    "data_Sales_salesmethod": dataSalesSalesmethod,
    "data_products_prdct": dataProductsPrdct,
    "data_products_quantum": dataProductsQuantum,
    "data_products_price2": dataProductsPrice2,
    "data_livelihood_incomesource": dataLivelihoodIncomesource,
    "data_livelihood_numbers": dataLivelihoodNumbers,
    "data_livelihood_capitalsource": dataLivelihoodCapitalsource,
    "data_livelihood_revenue": dataLivelihoodRevenue,
    "data_purchaseofrawmaterials_quantity": dataPurchaseofrawmaterialsQuantity,
    "data_purchaseofrawmaterials_price": dataPurchaseofrawmaterialsPrice,
    "data_purchaseofrawmaterials_brand": dataPurchaseofrawmaterialsBrand,
    "data_purchaseofrawmaterials_own": dataPurchaseofrawmaterialsOwn,
    "data_purchaseofrawmaterials_retail": dataPurchaseofrawmaterialsRetail,
    "data_purchaseofrawmaterials_p2": dataPurchaseofrawmaterialsP2,
    "data_purchaseofrawmaterials_wholesale": dataPurchaseofrawmaterialsWholesale,
    "data_purchaseofrawmaterials_p3": dataPurchaseofrawmaterialsP3,
    "data_purchaseofrawmaterials_group": dataPurchaseofrawmaterialsGroup,
    "data_purchaseofrawmaterials_p4": dataPurchaseofrawmaterialsP4,
    "data_purchaseofrawmaterials_subsidy": dataPurchaseofrawmaterialsSubsidy,
    "data_purchaseofrawmaterials_p5": dataPurchaseofrawmaterialsP5,
    "members": List<dynamic>.from(members.map((x) => x.toJson())),
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
     this.dataFamilydetailsNameoffailyfmember,
     this.dataFamilydetailsRelation,
     this.dataFamilydetailsAgeoffamilymember,
     this.dataFamilydetailsEducation,
     this.dataFamilydetailsJob,
     this.dataFamilydetailsSkill,
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
