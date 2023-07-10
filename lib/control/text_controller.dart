import 'package:flutter/cupertino.dart';

enum CheckboxOption {
  applied,
  sanctioned,
  notApplied,
}

class TextMain extends ChangeNotifier {
  //
  bool _isYesSelected = false;

  bool get isYesSelected => _isYesSelected;

  void updateIsYesSelected(bool value) {
    _isYesSelected = value;
    notifyListeners();
  }

  CheckboxOption _selectedOption = CheckboxOption.notApplied;
  CheckboxOption get selectedOption => _selectedOption;

  void updateSelectedOption(CheckboxOption option) {
    _selectedOption = option;
    notifyListeners();
  }

  // void updateTextFieldValue1(String? value) {
  //   _dataTotalinvestment = value;
  //   notifyListeners();
  // }

  void updateTextFieldValue2(String? value) {
    _dataDateofLoanApplication = value;
    notifyListeners();
  }

  String? _dataDistrict;
  String? _dataBlock;
  String? _dataPanchayath;
  int? _dataWard;
  String? _dataName;
  String? _dataAddress;
  int? _dataPhonenumber;
  String? _dataClass;
  String? _dataClass2;
  List? _dataClass3;
  String? _dataFamilyincome;
  String? _dataNameofNg;
  String? _dataNameofNGmember;
  String? _dataRoleinNg;
  String? _dataHouseownership;
  int? _dataLanddetailsLandarea;
  int? _dataLanddetailsAgricultureland;
  List? _dataAnimalhusbendaryBusinesstype;
  String? _dataAnimalhusbendaryOthers0;
  String? _dataAnimalhusbendaryCdsregistration;
  String? _dataAnimalhusbendaryRegdetailsRegnumber;
  String? _dataAnimalhusbendaryRegdetailsCdsunitname;
  String? _dataEnterpisetype;
  int? _dataNoofgroupmembers;
  String? _dataYearofstartingagriculture;
  String? _dataYearofstartingbussiness;
  int? _dataAmountinvested;
  List? _dataSourceofinvestment;
  String? _dataSupportrecived;
  String? _dataLoan;
  int? _dataTotalinvestment;
  String? _dataDateofLoanApplication;
  String? _dataBusinessidea;
  String? _dataInfraInfrastructure;
  String? _dataInfraShed;
  String? _dataInfraWastage;
  String? _dataInfraBiogas;
  String? _dataInfraEquipments;
  String? _dataInfraOthers;
  List ? _dataSupport;
  String? _dataOthers2;
  List? _dataMgnregAsupport;
  String? _dataLanddetails1Landforgrass;
  int? _dataLanddetails1Qtyofownland;
  int? _dataLanddetails1Qtyofleasedland;
  String? _dataLanddetails2Siteforworkshed;
  int? _dataLanddetails2Qtyofownland;
  String? _dataOthers4;
  List? _dataTrainingsrequired;
  String? _dataOthers3;
  String? _dataComments;
  String? _dataNameofcrp;
  String? _dataNameofrespondent;
  String? _dataDateofsurvey;
  int? _dataStarttime;
  String? _dataMetaInstanceId;
  int? _dataLoandetailsTotalinvestment;
  // String? _key;

  //-----------------fsmily--------------

  String? _dataFamilydetailsNameoffailyfmember;
  String? _dataFamilydetailsRelation;
  int? _dataFamilydetailsAgeoffamilymember;
  String? _dataFamilydetailsEducation;
  String? _dataFamilydetailsJob;
  String? _dataFamilydetailsSkill;

  //------------------product--------------
  List? _dataProductsPrdct;
  int? _dataProductsQuantum;
  int? _dataProductsPrice2;

  //-----------------Purchase-----------------
  // String? _dataPurchaseofrawmaterialsItemtype;
  int? _dataPurchaseofrawmaterialsQuantity;
  int? _dataPurchaseofrawmaterialsPrice;
  List? _dataPurchaseofrawmaterialsBrand;
  String? _dataPurchaseofrawmaterialsOwn;
  int? _dataPurchaseofrawmaterialsRetail;
  int? _dataPurchaseofrawmaterialsP2;
  int? _dataPurchaseofrawmaterialsWholesale;
  int? _dataPurchaseofrawmaterialsP3;
  int? _dataPurchaseofrawmaterialsGroup;
  int? _dataPurchaseofrawmaterialsP4;
  int? _dataPurchaseofrawmaterialsSubsidy;
  int? _dataPurchaseofrawmaterialsP5;
  // -----------------sales----------
  List? _dataSalesprdct2;
  int? _dataSalesquntum2;
  String? _dataSalessalesmethod;
  //------------livelyhood------------
  String? _datalivelihoodincomesource;
  int? _datalivelihoodnumbers;
  String? _datalivelihoodcapitalsource;
  int? _datalivelihoodrevenue;
  // --------------------------------------

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
  List<String>? dataProductsPrdct;
  int? dataProductsQuantum;
  int? dataProductsPrice2;
  String? dataLivelihoodIncomesource;
  int? dataLivelihoodNumbers;
  String? dataLivelihoodCapitalsource;
  int? dataLivelihoodRevenue;
  List<String>? dataPurchaseofrawmaterialsItemtype;
  List<String>? pulletsList;
  List<String>? manureList;
  int? manureQnty;
  List<String>? fodderSlipsList;
  int? fodderSlipsQnty;
  String? maleBuffaloCalvesQnty;
  List<String>? calvesList;
  int? calvesQnty;
  List<String>? heipersList;
  int? heipersQnty;
  List<String>? cowsList;
  int? malabariGoatsQnty;
  int? materialForPoultryQnty;
  int? eggTraysQnty;
  int? poultryFeedQnty;
  List<String>? layerList;
  List<String>? cattleFeedList;
  int? cattleFeedQnty;
  List<String>? milkReplacerList;
  List<String>? energyRichFeedList;
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
  List<String>? dataPurchaseofrawmaterialsBrand;
  int? brandQnty;

  String? get dataDistrict => _dataDistrict;

  String? get dataBlock => _dataBlock;

  String? get dataPanchayath => _dataPanchayath;

  int? get dataWard => _dataWard;

  String? get dataName => _dataName;

  String? get dataAddress => _dataAddress;

  int? get dataPhonenumber => _dataPhonenumber;

  String? get dataClass => _dataClass;

  String? get dataClass2 => _dataClass2;

  List? get dataClass3 => _dataClass3;

  String? get dataFamilyincome => _dataFamilyincome;

  String? get dataNameofNg => _dataNameofNg;

  String? get dataNameofNGmember => _dataNameofNGmember;

  String? get dataRoleinNg => _dataRoleinNg;

  String? get dataHouseownership => _dataHouseownership;

  int? get dataLoandetailsTotalinvestment => _dataLoandetailsTotalinvestment;

  int? get dataLanddetailsLandarea => _dataLanddetailsLandarea;

  int? get dataLanddetailsAgricultureland => _dataLanddetailsAgricultureland;

  List? get dataAnimalhusbendaryBusinesstype => _dataAnimalhusbendaryBusinesstype;

  String? get dataAnimalhusbendaryOthers0 => _dataAnimalhusbendaryOthers0;

  String? get dataAnimalhusbendaryCdsregistration => _dataAnimalhusbendaryCdsregistration;

  String? get dataAnimalhusbendaryRegdetailsRegnumber => _dataAnimalhusbendaryRegdetailsRegnumber;

  String? get dataAnimalhusbendaryRegdetailsCdsunitname => _dataAnimalhusbendaryRegdetailsCdsunitname;

  String? get dataEnterpisetype => _dataEnterpisetype;

  int? get dataNoofgroupmembers => _dataNoofgroupmembers;

  String? get dataYearofstartingagriculture => _dataYearofstartingagriculture;

  String? get dataYearofstartingbussiness => _dataYearofstartingbussiness;

  int? get dataAmountinvested => _dataAmountinvested;


  List? get dataSourceofinvestment => _dataSourceofinvestment;

  String? get dataSupportrecived => _dataSupportrecived;

  String? get dataLoan => _dataLoan;

  int? get dataTotalinvestment => _dataTotalinvestment;

  String? get dataDateofLoanApplication => _dataDateofLoanApplication;

  String? get dataBusinessidea => _dataBusinessidea;

  String? get dataInfraInfrastructure => _dataInfraInfrastructure;

  String? get dataInfraShed => _dataInfraShed;

  String? get dataInfraWastage => _dataInfraWastage;

  String? get dataInfraBiogas => _dataInfraBiogas;

  String? get dataInfraEquipments => _dataInfraEquipments;

  String? get dataInfraOthers => _dataInfraOthers;

  List? get dataSupport => _dataSupport;

  String? get dataOthers2 => _dataOthers2;

  List? get dataMgnregAsupport => _dataMgnregAsupport;

  String? get dataLanddetails1Landforgrass => _dataLanddetails1Landforgrass;

  int? get dataLanddetails1Qtyofownland => _dataLanddetails1Qtyofownland;

  int? get dataLanddetails1Qtyofleasedland =>
      _dataLanddetails1Qtyofleasedland;

  String? get dataLanddetails2Siteforworkshed =>
      _dataLanddetails2Siteforworkshed;

  int? get dataLanddetails2Qtyofownland => _dataLanddetails2Qtyofownland;

  String? get dataOthers4 => _dataOthers4;

  List? get dataTrainingsrequired => _dataTrainingsrequired;

  String? get dataOthers3 => _dataOthers3;

  String? get dataComments => _dataComments;

  String? get dataNameofcrp => _dataNameofcrp;

  String? get dataNameofrespondent => _dataNameofrespondent;

  String? get dataDateofsurvey => _dataDateofsurvey;

  int? get dataStarttime => _dataStarttime;

  String? get dataMetaInstanceId => _dataMetaInstanceId;

  // String? get key => _key;

  //-----------------------family----------------------//

  String? get dataFamilydetailsNameoffailyfmember =>
      _dataFamilydetailsNameoffailyfmember;

  String? get dataFamilydetailsRelation => _dataFamilydetailsRelation;

  int? get dataFamilydetailsAgeoffamilymember =>
      _dataFamilydetailsAgeoffamilymember;

  String? get dataFamilydetailsEducation => _dataFamilydetailsEducation;

  String? get dataFamilydetailsJob => _dataFamilydetailsJob;

  String? get dataFamilydetailsSkill => _dataFamilydetailsSkill;


  //-----------------product-----------------

  // List? get dataProductsPrdct => _dataProductsPrdct;
  //
  // int? get dataProductsQuantum => _dataProductsQuantum;
  //
  // int? get dataProductsPrice2 => _dataProductsPrice2;


  //----------------purchaseofrawmaterials-------------

  // String? get dataPurchaseofrawmaterialsItemtype => _dataPurchaseofrawmaterialsItemtype;
  int?
 get dataPurchaseofrawmaterialsQuantity => _dataPurchaseofrawmaterialsQuantity;
  int?
 get dataPurchaseofrawmaterialsPrice => _dataPurchaseofrawmaterialsPrice;
  // List? get dataPurchaseofrawmaterialsBrand => _dataPurchaseofrawmaterialsBrand;
  String?
 get dataPurchaseofrawmaterialsOwn => _dataPurchaseofrawmaterialsOwn;
  int?
 get dataPurchaseofrawmaterialsRetail => _dataPurchaseofrawmaterialsRetail;
  int?
 get dataPurchaseofrawmaterialsP2 => _dataPurchaseofrawmaterialsP2;
  int?
 get dataPurchaseofrawmaterialsWholesale => _dataPurchaseofrawmaterialsWholesale;
  int?
 get dataPurchaseofrawmaterialsP3 => _dataPurchaseofrawmaterialsP3;
  int?
 get dataPurchaseofrawmaterialsGroup => _dataPurchaseofrawmaterialsGroup;
  int?
 get dataPurchaseofrawmaterialsP4 => _dataPurchaseofrawmaterialsP4;
  int?
 get dataPurchaseofrawmaterialsSubsidy => _dataPurchaseofrawmaterialsSubsidy;
  int?
 get dataPurchaseofrawmaterialsP5 => _dataPurchaseofrawmaterialsP5;


  //--------------sales----------------------------//

  List? get dataSalesprdct2 => _dataSalesprdct2;
  int? get dataSalesquntum2 => _dataSalesquntum2;
  String? get dataSalessalesmethod => _dataSalessalesmethod;


 //-------------------livelihood------------------------
  String? get datalivelihoodincomesource => _datalivelihoodincomesource;

  int? get datalivelihoodnumbers => _datalivelihoodnumbers;

  String? get datalivelihoodcapitalsource => _datalivelihoodcapitalsource;

  int? get datalivelihoodrevenue => _datalivelihoodrevenue;


  // new

  int? get getMilkQnty => milkQnty;
  int? get getMeatQnty => meatQnty;
  int? get getEggQnty => eggQnty;
  int? get getSalesManureQnty => salesManureQnty;
  int? get getFeedQnty => feedQnty;
  int? get getMaleBuffaloCalfQnty => maleBuffaloCalfQnty;
  int? get getGrasFooderQnty => grasFooderQnty;
  int? get getTreeFooderQnty => treeFooderQnty;
  int? get getKidQnty => kidQnty;
  int? get getDayOldChickQnty => dayOldChickQnty;
  int? get getPulletsQnty => pulletsQnty;
  int? get getCalfQnty => calfQnty;
  int? get getBeiferQnty => beiferQnty;
  List<String>? get getDataSalesSalesmethod => dataSalesSalesmethod;
  List<String>? get getDataProductsPrdct => dataProductsPrdct;
  int? get getDataProductsQuantum => dataProductsQuantum;
  int? get getDataProductsPrice2 => dataProductsPrice2;
  String? get getDataLivelihoodIncomesource => dataLivelihoodIncomesource;
  int? get getDataLivelihoodNumbers => dataLivelihoodNumbers;
  String? get getDataLivelihoodCapitalsource => dataLivelihoodCapitalsource;
  int? get getDataLivelihoodRevenue => dataLivelihoodRevenue;
  List<String>? get DataPurchaseofrawmaterialsItemtype => dataPurchaseofrawmaterialsItemtype;
  List<String>? get getPulletsList => pulletsList;
  List<String>? get getManureList => manureList;
  int? get getManureQnty => manureQnty;
  List<String>? get getFodderSlipsList => fodderSlipsList;
  int? get getFodderSlipsQnty => fodderSlipsQnty;
  String? get getMaleBuffaloCalvesQnty => maleBuffaloCalvesQnty;
  List<String>? get getCalvesList => calvesList;
  int? get getCalvesQnty => calvesQnty;
  List<String>? get getHeipersList => heipersList;
  int? get getHeipersQnty => heipersQnty;
  List<String>? get getCowsList => cowsList;
  int? get getMalabariGoatsQnty => malabariGoatsQnty;
  int? get getMaterialForPoultryQnty => materialForPoultryQnty;
  int? get getEggTraysQnty => eggTraysQnty;
  int? get getPoultryFeedQnty => poultryFeedQnty;
  List<String>? get getLayerList => layerList;
  List<String>? get getCattleFeedList => cattleFeedList;
  int? get getCattleFeedQnty => cattleFeedQnty;
  List<String>? get getMilkReplacerList => milkReplacerList;
  List<String>? get getEnergyRichFeedList => energyRichFeedList;
  int? get getEnergyRichFeedQnty => energyRichFeedQnty;
  int? get getByPassProteinQnty => byPassProteinQnty;
  int? get getByPassFatQnty => byPassFatQnty;
  int? get getTmrQnty => tmrQnty;
  int? get getSilageQnty => silageQnty;
  int? get getHayQnty => hayQnty;
  int? get getUreaTreatedStrawQnty => ureaTreatedStrawQnty;
  int? get getGoatFeeDqnty => goatFeeDqnty;
  int? get getKidStarterQnty => kidStarterQnty;
  List<String>? get getModePurchaseofrawmaterials => modePurchaseofrawmaterials;
  List<String>? get getDataPurchaseofrawmaterialsBrand => dataPurchaseofrawmaterialsBrand;
  int? get getBrandQnty => brandQnty;


  //----------------livelihood-----------------
  void updateDatalivelihoodincomesource(String? value) {
    _datalivelihoodincomesource = value;
    notifyListeners();
  }

  void UpdateDtaLoandetailsTotalinvestment(int?value){
    _dataLoandetailsTotalinvestment = value;
    notifyListeners();
  }


  void updateDatalivelihoodnumbers(int? value) {
    _datalivelihoodnumbers = value;
    notifyListeners();
  }

  void updateDatalivelihoodcapitalsource(String? value) {
    _datalivelihoodcapitalsource = value;
    notifyListeners();
  }

  void updateDatalivelihoodrevenue(int? value) {
    _datalivelihoodrevenue = value;
    notifyListeners();
  }

  //------------------Sales-----------------------//

  void updateDataSalessalesmethod(String? value) {
    _dataSalessalesmethod = value;
    notifyListeners();
  }

  void updateDataSalesquntum2(int? value) {
    _dataSalesquntum2 = value;
    notifyListeners();
  }

  void updateDataSalesprdct2(List? value) {
    _dataSalesprdct2 = value;
    notifyListeners();
  }
// ---------------Products-----------------------//

  void updateDataProductsPrice2(int? value) {
    _dataProductsPrice2 = value;
    notifyListeners();
  }

  void updateDataProductsQuantum(int? value) {
    _dataProductsQuantum = value;
    notifyListeners();
  }

  void updateDataProductsPrdct(List? value) {
    _dataProductsPrdct = value;
    notifyListeners();
  }

  // void updateDataparentKey(String? value) {
  //   _parentKey = value;
  //   notifyListeners();
  // }
  //--------------------Family----------------------//

  void updateDataFamilydetailsSkill(String? value) {
    _dataFamilydetailsSkill = value;
    notifyListeners();
  }

  void updateDataFamilydetailsJob(String? value) {
    _dataFamilydetailsJob = value;
    notifyListeners();
  }

  void updateDataFamilydetailsEducation(String? value) {
    _dataFamilydetailsEducation = value;
    notifyListeners();
  }

  void updateDatadataFamilydetailsAgeoffamilymember(int? value) {
    _dataFamilydetailsAgeoffamilymember = value;
    notifyListeners();
  }

  void updateDataFamilydetailsNameoffailyfmember(String? value) {
    _dataFamilydetailsNameoffailyfmember = value;
    notifyListeners();
  }

  void updateDataFamilydetailsRelation(String? value) {
    _dataFamilydetailsRelation = value;
    notifyListeners();
  }
  //-----------------Data------------------------
  void updateDataDistrict(String? value) {
    _dataDistrict = value;
    notifyListeners();
  }

  void updateDataBlock(String? value) {
    _dataBlock = value;
    notifyListeners();
  }

  void updateDataPanchayath(String? value) {
    _dataPanchayath = value;
    notifyListeners();
  }

  void updateDataWard(int? value) {
    _dataWard = value;
    notifyListeners();
  }

  void updateDataName(String? value) {
    _dataName = value;
    notifyListeners();
  }

  void updateDataAddress(String? value) {
    _dataAddress = value;
  }

  void updateDataPhonenumber(int? value) {
    _dataPhonenumber = value;
    notifyListeners();
  }

  void updateDataClass(String? value) {
    _dataClass = value;
    notifyListeners();
  }

  void updateDataClass2(String? value) {
    _dataClass2 = value;
    notifyListeners();
  }

  void updateDataClass3(List? value) {
    _dataClass3 = value;
    notifyListeners();
  }

  void updateDataFamilyincome(String? value) {
    _dataFamilyincome = value;
    notifyListeners();
  }

  void updateDataNameofNg(String? value) {
    _dataNameofNg = value;
    notifyListeners();
  }

  void updateDataNameofNGmember(String? value) {
    _dataNameofNGmember = value;
    notifyListeners();
  }

  void updateDataRoleinNg(String? value) {
    _dataRoleinNg = value;
    notifyListeners();
  }

  void updateDataHouseownership(String? value) {
    _dataHouseownership = value;
    notifyListeners();
  }

  void updateDataLanddetailsLandarea(int? value) {
    _dataLanddetailsLandarea = value;
    notifyListeners();
  }

  void updateDataLanddetailsAgricultureland(int? value) {
    _dataLanddetailsAgricultureland = value ;
    notifyListeners();
  }

  void updateDataAnimalhusbendaryBusinesstype(List<String>? value) {
    _dataAnimalhusbendaryBusinesstype = value;
    notifyListeners();
  }

  void updateDataAnimalhusbendaryOthers0(String? value) {
    _dataAnimalhusbendaryOthers0 = value;
    notifyListeners();
  }

  void updateDataAnimalhusbendaryCdsregistration(String? value) {
    _dataAnimalhusbendaryCdsregistration = value;
    notifyListeners();
  }

  void updateDataAnimalhusbendaryRegdetailsRegnumber(String? value) {
    _dataAnimalhusbendaryRegdetailsRegnumber = value;
    notifyListeners();
  }

  void updateDataAnimalhusbendaryRegdetailsCdsunitname(String? value) {
    _dataAnimalhusbendaryRegdetailsCdsunitname = value;
    notifyListeners();
  }

  void updateDataEnterpisetype(String? value) {
    _dataEnterpisetype = value;
    notifyListeners();
  }

  void updateDataNoofgroupmembers(int? value) {
    _dataNoofgroupmembers = value;
    notifyListeners();
  }

  void updateDataYearofstartingagriculture(String? value) {
    _dataYearofstartingagriculture = value;
    notifyListeners();
  }

  void updateDataYearofstartingbussiness(String? value) {
    _dataYearofstartingbussiness = value;
    notifyListeners();
  }

  void updateDataAmountinvested(int? value) {
    _dataAmountinvested = value;
    notifyListeners();
  }

  void updateDataSourceofinvestment(List? value) {
    _dataSourceofinvestment = value;
    notifyListeners();
  }

  void updateDataSupportrecived(String? value) {
    _dataSupportrecived = value;
    notifyListeners();
  }

  void updateDataLoan(String? value) {
    _dataLoan = value;
    notifyListeners();
  }

  void updateDataTotalinvestment(int? value) {
    _dataTotalinvestment = value;
    notifyListeners();
  }

  void updateDataDateofLoanApplication(String? value) {
    _dataDateofLoanApplication = value;
    notifyListeners();
  }

  void updateDataBusinessidea(String? value) {
    _dataBusinessidea = value;
    notifyListeners();
  }

  void updateDataInfraInfrastructure(String? value) {
    _dataInfraInfrastructure = value;
    notifyListeners();
  }

  void updateDataInfraShed(String? value) {
    _dataInfraShed = value;
    notifyListeners();
  }

  void updateDataInfraWastage(String? value) {
    _dataInfraWastage = value;
    notifyListeners();
  }

  void updateDataInfraBiogas(String? value) {
    _dataInfraBiogas = value;
    notifyListeners();
  }

  void updateDataInfraEquipments(String? value) {
    _dataInfraEquipments = value;
    notifyListeners();
  }

  void updateDataInfraOthers(String? value) {
    _dataInfraOthers = value;
    notifyListeners();
  }

  void updateDataSupport(List? value) {
    _dataSupport = value;
    notifyListeners();
  }

  void updateDataOthers2(String? value) {
    _dataOthers2 = value;
    notifyListeners();
  }

  void updateDataMgnregAsupport(List? value) {
    _dataMgnregAsupport = value;
    notifyListeners();
  }

  void updateDataLanddetails1Landforgrass(String? value) {
    _dataLanddetails1Landforgrass = value;
    notifyListeners();
  }

  void updateDataLanddetails1Qtyofownland(int? value) {
    _dataLanddetails1Qtyofownland = value;
    notifyListeners();
  }

  void updateDataLanddetails1Qtyofleasedland(int? value) {
    _dataLanddetails1Qtyofleasedland = value;
    notifyListeners();
  }

  void updateDataLanddetails2Siteforworkshed(String? value) {
    _dataLanddetails2Siteforworkshed = value;
    notifyListeners();
  }

  void updateDataLanddetails2Qtyofownland(int? value) {
    _dataLanddetails2Qtyofownland = value;
    notifyListeners();
  }

  void updateDataOthers4(String? value) {
    _dataOthers4 = value;
    notifyListeners();
  }

  void updateDataTrainingsrequired(List? value) {
    _dataTrainingsrequired = value;
    notifyListeners();
  }

  void updateDataOthers3(String? value) {
    _dataOthers3 = value;
    notifyListeners();
  }

  void updateDataComments(String? value) {
    _dataComments = value;
    notifyListeners();
  }

  void updateDataNameofcrp(String? value) {
    _dataNameofcrp = value;
    notifyListeners();
  }

  void updateDataNameofrespondent(String? value) {
    _dataNameofrespondent = value;
    notifyListeners();
  }

  void updateDataDateofsurvey(String? value) {
    _dataDateofsurvey = value;
    notifyListeners();
  }

  void updateDataStarttime(int? value) {
    _dataStarttime = value;
    notifyListeners();
  }

  void updateDataMetaInstanceId(String? value) {
    _dataMetaInstanceId = value;
    notifyListeners();
  }

  // void updateKey(String? value) {
  //   _key = value;
  //   notifyListeners();
  // }

  //-----------------Purchase-------------------------
  // void updateDataPurchaseofrawmaterialsItemtype(String? value) {
  //   _dataPurchaseofrawmaterialsItemtype = value;
  //   notifyListeners();
  // }

  void updateDataPurchaseofrawmaterialsQuantity(int? value) {
    _dataPurchaseofrawmaterialsQuantity = value;
    notifyListeners();
  }

  void updateDataPurchaseofrawmaterialsPrice(int? value) {
    _dataPurchaseofrawmaterialsPrice = value;
    notifyListeners();
  }

  void updateDataPurchaseofrawmaterialsBrand(List? value) {
    _dataPurchaseofrawmaterialsBrand = value;
    notifyListeners();
  }

  void updateDataPurchaseofrawmaterialsOwn(String? value) {
    _dataPurchaseofrawmaterialsOwn = value;
    notifyListeners();
  }

  void updateDataPurchaseofrawmaterialsRetail(int? value) {
    _dataPurchaseofrawmaterialsRetail = value;
    notifyListeners();
  }

  void updateDataPurchaseofrawmaterialsP2(int? value) {
    _dataPurchaseofrawmaterialsP2 = value;
    notifyListeners();
  }

  void updateDataPurchaseofrawmaterialsWholesale(int? value) {
    _dataPurchaseofrawmaterialsWholesale = value;
    notifyListeners();
  }

  void updateDataPurchaseofrawmaterialsP3(int? value) {
    _dataPurchaseofrawmaterialsP3 = value;
    notifyListeners();
  }

  void updateDataPurchaseofrawmaterialsGroup(int? value) {
    _dataPurchaseofrawmaterialsGroup = value;
    notifyListeners();
  }

  void updateDataPurchaseofrawmaterialsP4(int? value) {
    _dataPurchaseofrawmaterialsP4 = value;
    notifyListeners();
  }

  void updateDataPurchaseofrawmaterialsSubsidy(int? value) {
    _dataPurchaseofrawmaterialsSubsidy = value;
    notifyListeners();
  }

  void updateDataPurchaseofrawmaterialsP5(int? value) {
    _dataPurchaseofrawmaterialsP5 = value;
    notifyListeners();
  }

  // newval


  void setMilkQnty(int? value) {
    milkQnty = value;
  }

  void setMeatQnty(int? value) {
    meatQnty = value;
  }

  void setEggQnty(int? value) {
    eggQnty = value;
  }

  void setSalesManureQnty(int? value) {
    salesManureQnty = value;
  }

  void setFeedQnty(int? value) {
    feedQnty = value;
  }

  void setMaleBuffaloCalfQnty(int? value) {
    maleBuffaloCalfQnty = value;
  }

  void setGrasFooderQnty(int? value) {
    grasFooderQnty = value;
  }

  void setTreeFooderQnty(int? value) {
    treeFooderQnty = value;
  }

  void setKidQnty(int? value) {
    kidQnty = value;
  }

  void setDayOldChickQnty(int? value) {
    dayOldChickQnty = value;
  }

  void setPulletsQnty(int? value) {
    pulletsQnty = value;
  }

  void setCalfQnty(int? value) {
    calfQnty = value;
  }

  void setBeiferQnty(int? value) {
    beiferQnty = value;
  }

  void setDataSalesSalesmethod(List<String>? value) {
    dataSalesSalesmethod = value;
  }

  void setDataProductsPrdct(List<String>? value) {
    dataProductsPrdct = value;
  }

  void setDataProductsQuantum(int? value) {
    dataProductsQuantum = value;
  }

  void setDataProductsPrice2(int? value) {
    dataProductsPrice2 = value;
  }

  void setDataLivelihoodIncomesource(String? value) {
    dataLivelihoodIncomesource = value;
  }

  void setDataLivelihoodNumbers(int? value) {
    dataLivelihoodNumbers = value;
  }

  void setDataLivelihoodCapitalsource(String? value) {
    dataLivelihoodCapitalsource = value;
  }

  void setDataLivelihoodRevenue(int? value) {
    dataLivelihoodRevenue = value;
  }

  void setDataPurchaseofrawmaterialsItemtype(List<String>? value) {
    dataPurchaseofrawmaterialsItemtype = value;
  }

  void setPulletsList(List<String>? value) {
    pulletsList = value;
  }

  void setManureList(List<String>? value) {
    manureList = value;
  }

  void setManureQnty(int? value) {
    manureQnty = value;
  }

  void setFodderSlipsList(List<String>? value) {
    fodderSlipsList = value;
  }

  void setFodderSlipsQnty(int? value) {
    fodderSlipsQnty = value;
  }

  void setMaleBuffaloCalvesQnty(String? value) {
    maleBuffaloCalvesQnty = value;
  }

  void setCalvesList(List<String>? value) {
    calvesList = value;
  }

  void setCalvesQnty(int? value) {
    calvesQnty = value;
  }

  void setHeipersList(List<String>? value) {
    heipersList = value;
  }

  void setHeipersQnty(int? value) {
    heipersQnty = value;
  }

  void setCowsList(List<String>? value) {
    cowsList = value;
  }

  void setMalabariGoatsQnty(int? value) {
    malabariGoatsQnty = value;
  }

  void setMaterialForPoultryQnty(int? value) {
    materialForPoultryQnty = value;
  }

  void setEggTraysQnty(int? value) {
    eggTraysQnty = value;
  }

  void setPoultryFeedQnty(int? value) {
    poultryFeedQnty = value;
  }

  void setLayerList(List<String>? value) {
    layerList = value;
  }

  void setCattleFeedList(List<String>? value) {
    cattleFeedList = value;
  }

  void setCattleFeedQnty(int? value) {
    cattleFeedQnty = value;
  }

  void setMilkReplacerList(List<String>? value) {
    milkReplacerList = value;
  }

  void setEnergyRichFeedList(List<String>? value) {
    energyRichFeedList = value;
  }

  void setEnergyRichFeedQnty(int? value) {
    energyRichFeedQnty = value;
  }

  void setByPassProteinQnty(int? value) {
    byPassProteinQnty = value;
  }

  void setByPassFatQnty(int? value) {
    byPassFatQnty = value;
  }

  void setTmrQnty(int? value) {
    tmrQnty = value;
  }

  void setSilageQnty(int? value) {
    silageQnty = value;
  }

  void setHayQnty(int? value) {
    hayQnty = value;
  }

  void setUreaTreatedStrawQnty(int? value) {
    ureaTreatedStrawQnty = value;
  }

  void setGoatFeeDqnty(int? value) {
    goatFeeDqnty = value;
  }

  void setKidStarterQnty(int? value) {
    kidStarterQnty = value;
  }

  void setModePurchaseofrawmaterials(List<String>? value) {
    modePurchaseofrawmaterials = value;
  }

  // void setDataPurchaseofrawmaterialsBrand(List<String>? value) {
  //   dataPurchaseofrawmaterialsBrand = value;
  // }

  void setBrandQnty(int? value) {
    brandQnty = value;
  }
}
