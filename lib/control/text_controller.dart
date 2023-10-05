import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

enum CheckboxOption {
  applied,
  sanctioned,
  notApplied,
}

class TextMain extends ChangeNotifier {


  void clearfamilydata (){
    _dataFamilydetailsNameoffailyfmember = '';
    _dataFamilydetailsRelation = '';
    _dataFamilydetailsAgeoffamilymember = 0;
    _dataFamilydetailsEducation = '';
    _dataFamilydetailsJob = '';
    _dataFamilydetailsSkill = '';
  }
  void clearData() {
    _dataDistrict = "";
    _dataBlock = "";
    _dataPanchayath = "";
    _dataWard = 0;
    _dataName = "";
    _dataAddress = "";
    _dataPhonenumber = 0;
    _dataClass = "";
    _dataClass2 = "";
    _dataClass3 = [];
    _dataFamilyincome = "";
    _dataNameofNg = "";
    _dataNameofNGmember = "";
    _dataRoleinNg = "";
    _dataHouseownership = "";
    _dataLanddetailsLandarea = 0;
    _dataLanddetailsAgricultureland = 0;
    _dataAnimalhusbendaryBusinesstype = [];
    _dataAnimalhusbendaryOthers0 = "";
    _dataAnimalhusbendaryCdsregistration = "";
    _dataAnimalhusbendaryRegdetailsRegnumber = "";
    _dataAnimalhusbendaryRegdetailsCdsunitname = "";
    _dataEnterpisetype = "";
    _dataNoofgroupmembers = 0;
    _dataYearofstartingagriculture = "";
    _dataYearofstartingbussiness = "";
    _dataAmountinvested = 0;
    _dataSourceofinvestment = [];
    _dataSupportrecived = "";
    _dataLoan = "";
    _dataTotalinvestment = 0;
    _dataDateofLoanApplication = "";
    _dataBusinessidea = "";
    _dataInfraInfrastructure = "";
    _dataInfraShed = "";
    _dataInfraWastage = "";
    _dataInfraBiogas = "";
    _dataInfraEquipments = "";
    _dataInfraOthers = "";
    _dataSupport = [];
    _dataOthers2 = "";
    _dataMgnregAsupport = [];
    _dataLanddetails1Landforgrass = "";
    _dataLanddetails1Qtyofownland = 0;
    _dataLanddetails1Qtyofleasedland = 0;
    _dataLanddetails2Siteforworkshed = "";
    _dataLanddetails2Qtyofownland = 0;
    _dataOthers4 = "";
    _dataTrainingsrequired = [];
    _dataOthers3 = "";
    _dataComments = "";
    _dataNameofcrp = "";
    _dataNameofrespondent = "";
    _dataDateofsurvey = "";
    _dataStarttime = "";
    _dataMetaInstanceId = "";
    _dataLoandetailsTotalinvestment = 0;
    _dataFamilydetailsNameoffailyfmember = "";
    _dataFamilydetailsRelation = "";
    _dataFamilydetailsAgeoffamilymember = 0;
    _dataFamilydetailsEducation = "";
    _dataFamilydetailsJob = "";
    _dataFamilydetailsSkill = "";
    _dataProductsPrdct = [];
    _dataProductsQuantum = 0;
    _dataProductsPrice2 = 0;
    _dataPurchaseofrawmaterialsQuantity = 0;
    _dataPurchaseofrawmaterialsPrice = 0;
    _dataPurchaseofrawmaterialsBrand = "";
    _dataPurchaseofrawmaterialsOwn = "";
    _dataPurchaseofrawmaterialsRetail = 0;
    _dataPurchaseofrawmaterialsP2 = 0;
    _dataPurchaseofrawmaterialsWholesale = 0;
    _dataPurchaseofrawmaterialsP3 = 0;
    _dataPurchaseofrawmaterialsGroup = 0;
    _dataPurchaseofrawmaterialsP4 = 0;
    _dataPurchaseofrawmaterialsSubsidy = 0;
    _dataPurchaseofrawmaterialsP5 = 0;
    _dataSalesprdct2 = [];
    _dataSalesquntum2 = 0;
    _datalivelihoodincomesource = [];
    milkQnty = 0;
    meatQnty = 0;
    eggQnty = 0;
    salesManureQnty = 0;
    feedQnty = 0;
    maleBuffaloCalfQnty = 0;
    grasFooderQnty = 0;
    treeFooderQnty = 0;
    kidQnty = 0;
    dayOldChickQnty = 0;
    pulletsQnty = 0;
    calfQnty = 0;
    beiferQnty = 0;
    dataSalesSalesmethod = [];
    // dataProductsPrdct = "";
    // dataProductsQuantum = "";
    // dataProductsPrice2 = "";
    // dataLivelihoodIncomesource = [];
    dataPurchaseofrawmaterialsItemtype = [];
    pulletsList = [];
    manureList = [];
    manureQnty = 0;
    fodderSlipsList = [];
    fodderSlipsQnty = 0;
    maleBuffaloCalvesQnty = 0;
    calvesList = [];
    calvesQnty = 0;
    heipersList = [];
    heipersQnty = 0;
    cowsList = [];
    malabariGoatsQnty = 0;
    materialForPoultryQnty = 0;
    eggTraysQnty = 0;
    poultryFeedQnty = 0;
    layerList = "";
    cattleFeedList = "";
    cattleFeedQnty = 0;
    milkReplacerList = "";
    energyRichFeedList = "";
    energyRichFeedQnty = 0;
    byPassProteinQnty = 0;
    byPassFatQnty = 0;
    tmrQnty = 0;
    silageQnty = 0;
    hayQnty = 0;
    ureaTreatedStrawQnty = 0;
    goatFeeDqnty = 0;
    kidStarterQnty = 0;
    modePurchaseofrawmaterials = [];
    dataPurchaseofrawmaterialsBrand = "";
    brandQnty = 0;
    _calvesGerseyQnty = 0;
    _calvesHfQnty = 0;
    _co4Qnty = 0;
    _co5Qnty = 0;
    _congoSignalQnty = 0;
    _cowDungQnty = 0;
    _cowsGerseyQnty = 0;
    _cowsHfQnty = 0;
    _goatManureQnty = 0;
    _guineaGrassQnty = 0;
    _heipersGerseyQnty = 0;
    _heipersHfQnty = 0;
    _milkReplacerQnty = 0;
    _napierQnty = 0;
    _paraGrassQnty = 0;
    _poultryManureQnty = 0;
    _redNapierQnty = 0;
    _superNapierQnty = 0;
    _vermyCompostQnty = 0;
    _livelihoodCowsList = [];
    _livelihoodCowsHfQnty = 0;
    _livelihoodCowsJerseyQnty = 0;
    _livelihoodCowsIndigenousQnty = 0;
    _livelihoodCalfList = [];
    _livelihoodCalfFemaleQnty = 0;
    _livelihoodCalfMaleQnty = 0;
    _livelihoodGoatList = [];
    _livelihoodGoatMalabariQnty = 0;
    _livelihoodGoatMalabariKidQnty = 0;
    _livelihoodGoatAttapadiBlackQnty = 0;
    _livelihoodGoatAttapadiBlackKidQnty = 0;
    _livelihoodGoatOthersQnty = 0;
    _livelihoodPoultryList = [];
    _livelihoodPoultryEggProductionQnty = 0;
    _livelihoodPoultryMarketingQnty = 0;
    _livelihoodManureList = [];
    _livelihoodManureDryQnty = 0;
    _livelihoodManureFreshQnty = 0;
    _livelihoodFodderList = [];
    _livelihoodFodderOwnUseQnty = 0;
    _livelihoodFodderForSaleQnty = 0;
    _livelihoodBuffaloQnty = 0;
    _livelihoodPoultryManureQnty = 0;
    _livelihoodduckqty = 0;
    // _livelihoodgoatothers = "";
    _bv380Qnty = 0;
    _gramalakshmiQnty = 0;
    _gramapriyaQnty = 0;
    _layerQnty = 0;
    _other = "";
    _otherQnty = 0;
    _addDataTreeFooderQnty = 0;
    _addDataUreaTreatedStrawQnty = 0;
    _caffStarterQnty = 0;
    _chemicalFertilizersQnty = 0;
    _fodderSeedsQnty = 0;
    _grassFooderQnty = 0;
    _growerQnty = 0;
    _ingredientsForCattleFeedQnty = 0;
    _ingredientsForPoultryFeedQnty = 0;
    _livelihoodGoatOthers = '';
    _malabarGoatKidsQnty = 0;
    _materialForPoultryCageFabricationQnty = 0;
    _totalMixedRationQnty = 0;
    _ureaTreatedMolassBlock =0;
    _PhonenumberofCRP =0;
    notifyListeners();
  }
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
  List? _dataSupport;
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
  String? _dataStarttime;
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
  String? _fam_id;

  //------------------product--------------
  List? _dataProductsPrdct;
  int? _dataProductsQuantum;
  int? _dataProductsPrice2;

  //-----------------Purchase-----------------
  // String? _dataPurchaseofrawmaterialsItemtype;
  int? _dataPurchaseofrawmaterialsQuantity;
  int? _dataPurchaseofrawmaterialsPrice;
  String? _dataPurchaseofrawmaterialsBrand;
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

  // String? _dataSalessalesmethod;
  //------------livelyhood------------
  List? _datalivelihoodincomesource;


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
  List? dataSalesSalesmethod;

  List? dataPurchaseofrawmaterialsItemtype;
  List? pulletsList;
  List? manureList;
  int? manureQnty;
  List? fodderSlipsList;
  int? fodderSlipsQnty;
  int? maleBuffaloCalvesQnty;
  List? calvesList;
  int? calvesQnty;
  List? heipersList;
  int? heipersQnty;
  List? cowsList;
  int? malabariGoatsQnty;
  int? materialForPoultryQnty;
  int? eggTraysQnty;
  int? poultryFeedQnty;
  String? layerList;
  String? cattleFeedList;
  int? cattleFeedQnty;
  String? milkReplacerList;
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
  List? modePurchaseofrawmaterials;
  String? dataPurchaseofrawmaterialsBrand;
  int? brandQnty;
  int? _calvesGerseyQnty;
  int? _calvesHfQnty;
  int? _co4Qnty;
  int? _co5Qnty;
  int? _congoSignalQnty;
  int? _cowDungQnty;
  int? _cowsGerseyQnty;
  int? _cowsHfQnty;
  int? _goatManureQnty;
  int? _guineaGrassQnty;
  int? _heipersGerseyQnty;
  int? _heipersHfQnty;
  int? _milkReplacerQnty;
  int? _napierQnty;
  int? _paraGrassQnty;
  int? _poultryManureQnty;
  int? _redNapierQnty;
  int? _superNapierQnty;
  int? _vermyCompostQnty;

  List? _livelihoodCowsList;
  int? _livelihoodCowsHfQnty;
  int? _livelihoodCowsJerseyQnty;
  int? _livelihoodCowsIndigenousQnty;
  List? _livelihoodCalfList;
  int? _livelihoodCalfFemaleQnty;
  int? _livelihoodCalfMaleQnty;
  List? _livelihoodGoatList;
  int? _livelihoodGoatMalabariQnty;
  int? _livelihoodGoatMalabariKidQnty;
  int? _livelihoodGoatAttapadiBlackQnty;
  int? _livelihoodGoatAttapadiBlackKidQnty;
  int? _livelihoodGoatOthersQnty;
  List? _livelihoodPoultryList;
  int? _livelihoodPoultryEggProductionQnty;
  int? _livelihoodPoultryMarketingQnty;
  List? _livelihoodManureList;
  int? _livelihoodManureDryQnty;
  int? _livelihoodManureFreshQnty;
  List? _livelihoodFodderList;
  int? _livelihoodFodderOwnUseQnty;
  int? _livelihoodFodderForSaleQnty;
  int? _livelihoodBuffaloQnty;
  int? _livelihoodPoultryManureQnty;
  int? _livelihoodduckqty;
  // String? _livelihoodgoatothers;

// List? _dataPurchaseofrawmaterialsItemtype;
// List? _pulletsList;
  int? _bv380Qnty;
  int? _gramalakshmiQnty;
  int? _gramapriyaQnty;
  int? _layerQnty;
  String? _other;
  int? _otherQnty;

  // int? addDataTreeFooderQnty;
  // int? addDataUreaTreatedStrawQnty;
  // int? caffStarterQnty;
  // int? chemicalFertilizersQnty;
  // int? fodderSeedsQnty;
  // int? grassFooderQnty;
  // int? growerQnty;
  // int? ingredientsForCattleFeedQnty;
  // int? ingredientsForPoultryFeedQnty;
  // int? livelihoodGoatOthers;
  // int? malabariGoatKidsQnty;
  // int? materialForPoultryCageFabricationQnty;
  // int? totalMixedRationQnty;
  //
  // int? get addDataTreeFooderQnty => _addDataTreeFooderQnty;
  // // int? get addDataUreaTreatedStrawQnty => _addDataUreaTreatedStrawQnty;
  // int? get caffStarterQnty => _caffStarterQnty;
  // int? get chemicalFertilizersQnty => _chemicalFertilizersQnty;
  // int? get fodderSeedsQnty => _fodderSeedsQnty;
  // int? get grassFooderQnty => _grassFooderQnty;
  // int? get growerQnty => _growerQnty;
  // int? get ingredientsForCattleFeedQnty => _ingredientsForCattleFeedQnty;
  // int? get ingredientsForPoultryFeedQnty => _ingredientsForPoultryFeedQnty;
  // // int? get livelihoodGoatOthers => _livelihoodGoatOthers;
  // // int? get malabariGoatKidsQnty => _malabariGoatKidsQnty;
  // int? get materialForPoultryCageFabricationQnty => _materialForPoultryCageFabricationQnty;
  // int? get totalMixedRationQnty => _totalMixedRationQnty;

  int? _addDataTreeFooderQnty;
  int? get addDataTreeFooderQnty => _addDataTreeFooderQnty;
  void updateAddDataTreeFooderQnty(int? value) {
    _addDataTreeFooderQnty = value;
    notifyListeners();
  }

  int? _addDataUreaTreatedStrawQnty;
  int? get addDataUreaTreatedStrawQnty => _addDataUreaTreatedStrawQnty;
  void updateAddDataUreaTreatedStrawQnty(int? value) {
    _addDataUreaTreatedStrawQnty = value;
    notifyListeners();
  }

  int? _caffStarterQnty;
  int? get caffStarterQnty => _caffStarterQnty;
  void updateCaffStarterQnty(int? value) {
    _caffStarterQnty = value;
    notifyListeners();
  }

  int? _chemicalFertilizersQnty;
  int? get chemicalFertilizersQnty => _chemicalFertilizersQnty;
  void updateChemicalFertilizersQnty(int? value) {
    _chemicalFertilizersQnty = value;
    notifyListeners();
  }

  int? _fodderSeedsQnty;
  int? get fodderSeedsQnty => _fodderSeedsQnty;
  void updateFodderSeedsQnty(int? value) {
    _fodderSeedsQnty = value;
    notifyListeners();
  }

  int? _grassFooderQnty;
  int? get grassFooderQnty => _grassFooderQnty;
  void updateGrassFooderQnty(int? value) {
    _grassFooderQnty = value;
    notifyListeners();
  }

  int? _growerQnty;
  int? get growerQnty => _growerQnty;
  void updateGrowerQnty(int? value) {
    _growerQnty = value;
    notifyListeners();
  }
  int? _ureaTreatedMolassBlock;
  int? get ureaTreatedMolassBlock => _ureaTreatedMolassBlock;
  void updateureaTreatedMolassBlock(int? value) {
    _ureaTreatedMolassBlock = value;
    notifyListeners();
  }

  int? _PhonenumberofCRP;
  int? get PhonenumberofCRP => _PhonenumberofCRP;
  void updatPhonenumberofCRP(int? value) {
    _PhonenumberofCRP = value;
    notifyListeners();
  }


  int? _ingredientsForCattleFeedQnty;
  int? get ingredientsForCattleFeedQnty => _ingredientsForCattleFeedQnty;
  void updateIngredientsForCattleFeedQnty(int? value) {
    _ingredientsForCattleFeedQnty = value;
    notifyListeners();
  }

  int? _ingredientsForPoultryFeedQnty;
  int? get ingredientsForPoultryFeedQnty => _ingredientsForPoultryFeedQnty;
  void updateIngredientsForPoultryFeedQnty(int? value) {
    _ingredientsForPoultryFeedQnty = value;
    notifyListeners();
  }

  String? _livelihoodGoatOthers;
  String? get livelihoodGoatOthers => _livelihoodGoatOthers;
  void updateLivelihoodGoatOthers(String? value) {
    _livelihoodGoatOthers = value;
    notifyListeners();
  }

  int? _malabarGoatKidsQnty;
  int? get malabariGoatKidsQnty => _malabarGoatKidsQnty;
  void updateMalabarGoatKidsQnty(int? value) {
    _malabarGoatKidsQnty = value;
    notifyListeners();
  }

  int? _materialForPoultryCageFabricationQnty;
  int? get materialForPoultryCageFabricationQnty => _materialForPoultryCageFabricationQnty;
  void updateMaterialForPoultryCageFabricationQnty(int? value) {
    _materialForPoultryCageFabricationQnty = value;
    notifyListeners();
  }

  int? _totalMixedRationQnty;
  int? get totalMixedRationQnty => _totalMixedRationQnty;

  void updateTotalMixedRationQnty(int? value) {
    _totalMixedRationQnty = value;
    notifyListeners();
  }



// Getter property for livelihoodCowsList
  List? get livelihoodCowsList => _livelihoodCowsList;

  // Getter properties for other properties...
  int? get livelihoodCowsHfQnty => _livelihoodCowsHfQnty;

  int? get layerQnty => _layerQnty;

  int? get livelihoodCowsJerseyQnty => _livelihoodCowsJerseyQnty;

  int? get livelihoodCowsIndigenousQnty => _livelihoodCowsIndigenousQnty;

  List? get livelihoodCalfList => _livelihoodCalfList;

  int? get livelihoodCalfFemaleQnty => _livelihoodCalfFemaleQnty;

  int? get livelihoodCalfMaleQnty => _livelihoodCalfMaleQnty;

  List? get livelihoodGoatList => _livelihoodGoatList;

  int? get livelihoodGoatMalabariQnty => _livelihoodGoatMalabariQnty;

  int? get livelihoodGoatMalabariKidQnty => _livelihoodGoatMalabariKidQnty;

  int? get livelihoodGoatAttapadiBlackQnty => _livelihoodGoatAttapadiBlackQnty;

  int? get livelihoodGoatAttapadiBlackKidQnty =>
      _livelihoodGoatAttapadiBlackKidQnty;

  int? get livelihoodGoatOthersQnty => _livelihoodGoatOthersQnty;

  List? get livelihoodPoultryList => _livelihoodPoultryList;

  int? get livelihoodPoultryEggProductionQnty =>
      _livelihoodPoultryEggProductionQnty;

  int? get livelihoodPoultryMarketingQnty => _livelihoodPoultryMarketingQnty;

  List? get livelihoodManureList => _livelihoodManureList;

  int? get livelihoodManureDryQnty => _livelihoodManureDryQnty;

  int? get livelihoodManureFreshQnty => _livelihoodManureFreshQnty;

  List? get livelihoodFodderList => _livelihoodFodderList;

  int? get livelihoodFodderOwnUseQnty => _livelihoodFodderOwnUseQnty;

  int? get livelihoodFodderForSaleQnty => _livelihoodFodderForSaleQnty;

  int? get livelihoodBuffaloQnty => _livelihoodBuffaloQnty;

  int? get livelihoodPoultryManureQnty => _livelihoodPoultryManureQnty;

  int? get livelihoodduckqty => _livelihoodduckqty;

  // String? get livelihoodgoatothers => _livelihoodgoatothers;

  int? get bv380Qnty => _bv380Qnty;

  int? get gramalakshmiQnty => _gramalakshmiQnty;

  int? get gramapriyaQnty => _gramapriyaQnty;

  String? get other => _other;

  int? get otherQnty => _otherQnty;

  int? get calvesGerseyQnty => _calvesGerseyQnty;

  int? get calvesHfQnty => _calvesHfQnty;

  int? get co4Qnty => _co4Qnty;

  int? get co5Qnty => _co5Qnty;

  int? get congoSignalQnty => _congoSignalQnty;

  int? get cowDungQnty => _cowDungQnty;

  int? get cowsGerseyQnty => _cowsGerseyQnty;

  int? get cowsHfQnty => _cowsHfQnty;

  int? get goatManureQnty => _goatManureQnty;

  int? get guineaGrassQnty => _guineaGrassQnty;

  int? get heipersGerseyQnty => _heipersGerseyQnty;

  int? get heipersHfQnty => _heipersHfQnty;

  int? get milkReplacerQnty => _milkReplacerQnty;

  int? get napierQnty => _napierQnty;

  int? get paraGrassQnty => _paraGrassQnty;

  int? get poultryManureQnty => _poultryManureQnty;

  int? get redNapierQnty => _redNapierQnty;

  int? get superNapierQnty => _superNapierQnty;

  int? get vermyCompostQnty => _vermyCompostQnty;

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

  String? get dataAnimalhusbendaryCdsregistration =>
      _dataAnimalhusbendaryCdsregistration;

  String? get dataAnimalhusbendaryRegdetailsRegnumber =>
      _dataAnimalhusbendaryRegdetailsRegnumber;

  String? get dataAnimalhusbendaryRegdetailsCdsunitname =>
      _dataAnimalhusbendaryRegdetailsCdsunitname;

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

  int? get dataLanddetails1Qtyofleasedland => _dataLanddetails1Qtyofleasedland;

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

  String? get dataStarttime => _dataStarttime;

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

  List? get dataProductsPrdct => _dataProductsPrdct;

  int? get dataProductsQuantum => _dataProductsQuantum;

  int? get dataProductsPrice2 => _dataProductsPrice2;

  //----------------purchaseofrawmaterials-------------

  // String? get dataPurchaseofrawmaterialsItemtype => _dataPurchaseofrawmaterialsItemtype;
  int? get dataPurchaseofrawmaterialsQuantity =>
      _dataPurchaseofrawmaterialsQuantity;

  int? get dataPurchaseofrawmaterialsPrice => _dataPurchaseofrawmaterialsPrice;

  // List? get dataPurchaseofrawmaterialsBrand => _dataPurchaseofrawmaterialsBrand;
  String? get dataPurchaseofrawmaterialsOwn => _dataPurchaseofrawmaterialsOwn;

  int? get dataPurchaseofrawmaterialsRetail =>
      _dataPurchaseofrawmaterialsRetail;

  int? get dataPurchaseofrawmaterialsP2 => _dataPurchaseofrawmaterialsP2;

  int? get dataPurchaseofrawmaterialsWholesale =>
      _dataPurchaseofrawmaterialsWholesale;

  int? get dataPurchaseofrawmaterialsP3 => _dataPurchaseofrawmaterialsP3;

  int? get dataPurchaseofrawmaterialsGroup => _dataPurchaseofrawmaterialsGroup;

  int? get dataPurchaseofrawmaterialsP4 => _dataPurchaseofrawmaterialsP4;

  int? get dataPurchaseofrawmaterialsSubsidy =>
      _dataPurchaseofrawmaterialsSubsidy;

  int? get dataPurchaseofrawmaterialsP5 => _dataPurchaseofrawmaterialsP5;

  //--------------sales----------------------------//

  List? get dataSalesprdct2 => _dataSalesprdct2;

  int? get dataSalesquntum2 => _dataSalesquntum2;


  //-------------------livelihood------------------------
  List? get datalivelihoodincomesource => _datalivelihoodincomesource;

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

  List? get getDataSalesSalesmethod => dataSalesSalesmethod;

  List? get DataPurchaseofrawmaterialsItemtype =>
      dataPurchaseofrawmaterialsItemtype;

  List? get getPulletsList => pulletsList;

  List? get getManureList => manureList;

  int? get getManureQnty => manureQnty;

  List? get getFodderSlipsList => fodderSlipsList;

  int? get getFodderSlipsQnty => fodderSlipsQnty;

  int? get getMaleBuffaloCalvesQnty => maleBuffaloCalvesQnty;

  List? get getCalvesList => calvesList;

  int? get getCalvesQnty => calvesQnty;

  List? get getHeipersList => heipersList;

  int? get getHeipersQnty => heipersQnty;

  List? get getCowsList => cowsList;

  int? get getMalabariGoatsQnty => malabariGoatsQnty;

  int? get getMaterialForPoultryQnty => materialForPoultryQnty;

  int? get getEggTraysQnty => eggTraysQnty;

  int? get getPoultryFeedQnty => poultryFeedQnty;

  String? get getLayerList => layerList;

  String? get getCattleFeedList => cattleFeedList;

  int? get getCattleFeedQnty => cattleFeedQnty;

  String? get getMilkReplacerList => milkReplacerList;

  String? get getEnergyRichFeedList => energyRichFeedList;

  int? get getEnergyRichFeedQnty => energyRichFeedQnty;

  int? get getByPassProteinQnty => byPassProteinQnty;

  int? get getByPassFatQnty => byPassFatQnty;

  int? get getTmrQnty => tmrQnty;

  int? get getSilageQnty => silageQnty;

  int? get getHayQnty => hayQnty;

  int? get getUreaTreatedStrawQnty => ureaTreatedStrawQnty;

  int? get getGoatFeeDqnty => goatFeeDqnty;

  int? get getKidStarterQnty => kidStarterQnty;

  List? get getModePurchaseofrawmaterials => modePurchaseofrawmaterials;

  String? get getDataPurchaseofrawmaterialsBrand =>
      dataPurchaseofrawmaterialsBrand;

  int? get getBrandQnty => brandQnty;

  String?  get fam_id => _fam_id;
  //----------------livelihood-----------------
  void updateDatalivelihoodincomesource(List? value) {
    _datalivelihoodincomesource = value;
    notifyListeners();
  }

  void UpdateDtaLoandetailsTotalinvestment(int? value) {
    _dataLoandetailsTotalinvestment = value;
    notifyListeners();
  }

  //------------------Sales-----------------------//

  // void updateDataSalessalesmethod(String? value) {
  //   _dataSalessalesmethod = value;
  //   notifyListeners();
  // }

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

  void updateDataFamilymemberid(String? value) {
    _fam_id = value;
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
    _dataLanddetailsAgricultureland = value;
    notifyListeners();
  }

  void updateDataAnimalhusbendaryBusinesstype(List? value) {
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

  void updateDataStarttime(String? value) {
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

  void updateDataPurchaseofrawmaterialsBrand(String? value) {
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

  void updateDataMilkQnty(int? value) {
    milkQnty = value;
    notifyListeners();
  }

  void updateDataMeatQnty(int? value) {
    meatQnty = value;
    notifyListeners();
  }

  void updateDataEggQnty(int? value) {
    eggQnty = value;
    notifyListeners();
  }

  void updateDataSalesManureQnty(int? value) {
    salesManureQnty = value;
    notifyListeners();
  }

  void updateDataFeedQnty(int? value) {
    feedQnty = value;
    notifyListeners();
  }

  void updateDataMaleBuffaloCalfQnty(int? value) {
    maleBuffaloCalfQnty = value;
    notifyListeners();
  }

  void updateDataGrasFooderQnty(int? value) {
    grasFooderQnty = value;
    notifyListeners();
  }

  void updateDataTreeFooderQnty(int? value) {
    treeFooderQnty = value;
    notifyListeners();
  }

  void updateDataKidQnty(int? value) {
    kidQnty = value;
    notifyListeners();
  }

  void updateDataDayOldChickQnty(int? value) {
    dayOldChickQnty = value;
    notifyListeners();
  }

  void updateDataPulletsQnty(int? value) {
    pulletsQnty = value;
    notifyListeners();
  }

  void updateDataCalfQnty(int? value) {
    calfQnty = value;
    notifyListeners();
  }

  void updateDataBeiferQnty(int? value) {
    beiferQnty = value;
    notifyListeners();
  }

  void updateDataDataSalesSalesmethod(List? value) {
    dataSalesSalesmethod = value;
    notifyListeners();
  }

  void updateDataDataProductsPrdct(List? value) {
    _dataProductsPrdct = value;
    notifyListeners();
  }

  void updateDataDataProductsQuantum(int? value) {
    _dataProductsQuantum = value;
    notifyListeners();
  }

  void updateDataDataProductsPrice2(int? value) {
    _dataProductsPrice2 = value;
    notifyListeners();
  }

  // void updateDataDataLivelihoodIncomesource(List? value) {
  //   dataLivelihoodIncomesource = value;
  //   notifyListeners();
  // }

  void updateDataDataPurchaseofrawmaterialsItemtype(List? value) {
    dataPurchaseofrawmaterialsItemtype = value;
    notifyListeners();
  }

  void updateDataPulletsList(List? value) {
    pulletsList = value;
    notifyListeners();
  }

  void updateDataManureList(List? value) {
    manureList = value;
    notifyListeners();
  }

  void updateDataManureQnty(int? value) {
    manureQnty = value;
    notifyListeners();
  }

  void updateDataFodderSlipsList(List? value) {
    fodderSlipsList = value;
    notifyListeners();
  }

  void updateDataFodderSlipsQnty(int? value) {
    fodderSlipsQnty = value;
    notifyListeners();
  }

  void updateDataMaleBuffaloCalvesQnty(int? value) {
    maleBuffaloCalvesQnty = value;
    notifyListeners();
  }

  void updateDataCalvesList(List? value) {
    calvesList = value;
    notifyListeners();
  }

  void updateDataCalvesQnty(int? value) {
    calvesQnty = value;
    notifyListeners();
  }

  void updateDataHeipersList(List? value) {
    heipersList = value;
    notifyListeners();
  }

  void updateDataHeipersQnty(int? value) {
    heipersQnty = value;
    notifyListeners();
  }

  void updateDataCowsList(List? value) {
    cowsList = value;
    notifyListeners();
  }

  void updateDataMalabariGoatsQnty(int? value) {
    malabariGoatsQnty = value;
    notifyListeners();
  }

  void updateDataMaterialForPoultryQnty(int? value) {
    materialForPoultryQnty = value;
    notifyListeners();
  }

  void updateDataEggTraysQnty(int? value) {
    eggTraysQnty = value;
    notifyListeners();
  }

  void updateDataPoultryFeedQnty(int? value) {
    poultryFeedQnty = value;
    notifyListeners();
  }

  void updateDataLayerList(String? value) {
    layerList = value;
    notifyListeners();
  }
  void updateDataLayerqty(int? value) {
    _layerQnty = value;
    notifyListeners();
  }

  void updateDataCattleFeedList(String? value) {
    cattleFeedList = value;
    notifyListeners();
  }

  void updateDataCattleFeedQnty(int? value) {
    cattleFeedQnty = value;
    notifyListeners();
  }

  void updateDataMilkReplacerList(String? value) {
    milkReplacerList = value;
    notifyListeners();
  }

  void updateDataEnergyRichFeedList(String? value) {
    energyRichFeedList = value;
    notifyListeners();
  }

  void updateDataEnergyRichFeedQnty(int? value) {
    energyRichFeedQnty = value;
    notifyListeners();
  }

  void updateDataByPassProteinQnty(int? value) {
    byPassProteinQnty = value;
    notifyListeners();
  }

  void updateDataByPassFatQnty(int? value) {
    byPassFatQnty = value;
    notifyListeners();
  }

  void updateDataTmrQnty(int? value) {
    tmrQnty = value;
    notifyListeners();
  }

  void updateDataSilageQnty(int? value) {
    silageQnty = value;
    notifyListeners();
  }

  void updateDataHayQnty(int? value) {
    hayQnty = value;
    notifyListeners();
  }

  void updateDataUreaTreatedStrawQnty(int? value) {
    ureaTreatedStrawQnty = value;
    notifyListeners();
  }

  void updateDataGoatFeeDqnty(int? value) {
    goatFeeDqnty = value;
    notifyListeners();
  }

  void updateDataKidStarterQnty(int? value) {
    kidStarterQnty = value;
    notifyListeners();
  }

  void updateDataModePurchaseofrawmaterials(List? value) {
    modePurchaseofrawmaterials = value;
    notifyListeners();
  }

  // void updateDataDataPurchaseofrawmaterialsBrand(List? value) {
  //   dataPurchaseofrawmaterialsBrand = value;
  // }

  void updateDataBrandQnty(int? value) {
    brandQnty = value;
    notifyListeners();
  }

  void updateDataCalvesGerseyQnty(int? value) {
    _calvesGerseyQnty = value;
    notifyListeners();
  }

  void updateDataCalvesHfQnty(int? value) {
    _calvesHfQnty = value;
    notifyListeners();
  }

  void updateDataCo4Qnty(int? value) {
    _co4Qnty = value;
    notifyListeners();
  }

  void updateDataCo5Qnty(int? value) {
    _co5Qnty = value;
    notifyListeners();
  }

  void updateDataCongoSignalQnty(int? value) {
    _congoSignalQnty = value;
    notifyListeners();
  }

  void updateDataCowDungQnty(int? value) {
    _cowDungQnty = value;
    notifyListeners();
  }

  void updateDataCowsGerseyQnty(int? value) {
    _cowsGerseyQnty = value;
    notifyListeners();
  }

  void updateDataCowsHfQnty(int? value) {
    _cowsHfQnty = value;
    notifyListeners();
  }

  void updateDataGoatManureQnty(int? value) {
    _goatManureQnty = value;
    notifyListeners();
  }

  void updateDataGuineaGrassQnty(int? value) {
    _guineaGrassQnty = value;
    notifyListeners();
  }

  void updateDataHeipersGerseyQnty(int? value) {
    _heipersGerseyQnty = value;
    notifyListeners();
  }

  void updateDataHeipersHfQnty(int? value) {
    _heipersHfQnty = value;
    notifyListeners();
  }

  void updateDataMilkReplacerQnty(int? value) {
    _milkReplacerQnty = value;
    notifyListeners();
  }

  void updateDataNapierQnty(int? value) {
    _napierQnty = value;
    notifyListeners();
  }

  void updateDataParaGrassQnty(int? value) {
    _paraGrassQnty = value;
    notifyListeners();
  }

  void updateDataPoultryManureQnty(int? value) {
    _poultryManureQnty = value;
    notifyListeners();
  }

  void updateDataRedNapierQnty(int? value) {
    _redNapierQnty = value;
    notifyListeners();
  }

  void updateDataSuperNapierQnty(int? value) {
    _superNapierQnty = value;
    notifyListeners();
  }

  void updateDataVermyCompostQnty(int? value) {
    _vermyCompostQnty = value;
    notifyListeners();
  }

  void updateDataLivelihoodCowsList(List? value) {
    _livelihoodCowsList = value;
    notifyListeners();
  }

  void updateDataLivelihoodCowsHF(int? value) {
    _livelihoodCowsHfQnty = value;
    notifyListeners();
  }

  void updateDataLivelihoodCowsJerseyQnty(int? value) {
    _livelihoodCowsJerseyQnty = value;
    notifyListeners();
  }

  void updateDataLivelihoodDuckqnty(int? value) {
    _livelihoodduckqty = value;
    notifyListeners();
  }

  void updateDataLivelihoodCowsIndigenousQnty(int? value) {
    _livelihoodCowsIndigenousQnty = value;
    notifyListeners();
  }

  void updateDataLivelihoodCalfList(List? value) {
    _livelihoodCalfList = value;
    notifyListeners();
  }

  void updateDataLivelihoodCalfFemaleQnty(int? value) {
    _livelihoodCalfFemaleQnty = value;
    notifyListeners();
  }

  void updateDataLivelihoodCalfMaleQnty(int? value) {
    _livelihoodCalfMaleQnty = value;
    notifyListeners();
  }

  void updateDataLivelihoodGoatList(List? value) {
    _livelihoodGoatList = value;
    notifyListeners();
  }

  void updateDataLivelihoodGoatMalabariQnty(int? value) {
    _livelihoodGoatMalabariQnty = value;
    notifyListeners();
  }

  void updateDataLivelihoodGoatMalabariKidQnty(int? value) {
    _livelihoodGoatMalabariKidQnty = value;
    notifyListeners();
  }

  void updateDataLivelihoodGoatAttapadiBlackQnty(int? value) {
    _livelihoodGoatAttapadiBlackQnty = value;
    notifyListeners();
  }

  void updateDataLivelihoodGoatAttapadiBlackKidQnty(int? value) {
    _livelihoodGoatAttapadiBlackKidQnty = value;
    notifyListeners();
  }

  // void updateDataLivelihoodGoatOthers(String? value) {
  //   _livelihoodgoatothers = value;
  //   notifyListeners();
  // }

  void updateDataLivelihoodGoatOthersQnty(int? value) {
    _livelihoodGoatOthersQnty = value;
    notifyListeners();
  }

  void updateDataLivelihoodPoultryList(List? value) {
    _livelihoodPoultryList = value;
    notifyListeners();
  }

  void updateDataLivelihoodPoultryEggProductionQnty(int? value) {
    _livelihoodPoultryEggProductionQnty = value;
    notifyListeners();
  }

  void updateDataLivelihoodPoultryMarketingQnty(int? value) {
    _livelihoodPoultryMarketingQnty = value;
    notifyListeners();
  }

  void updateDataLivelihoodManureList(List? value) {
    _livelihoodManureList = value;
    notifyListeners();
  }

  void updateDataLivelihoodManureDryQnty(int? value) {
    _livelihoodManureDryQnty = value;
    notifyListeners();
  }

  void updateDataLivelihoodManureFreshQnty(int? value) {
    _livelihoodManureFreshQnty = value;
    notifyListeners();
  }

  void updateDataLivelihoodFodderList(List? value) {
    _livelihoodFodderList = value;
    notifyListeners();
  }

  void updateDataLivelihoodFodderOwnUseQnty(int? value) {
    _livelihoodFodderOwnUseQnty = value;
    notifyListeners();
  }

  void updateDataLivelihoodFodderForSaleQnty(int? value) {
    _livelihoodFodderForSaleQnty = value;
    notifyListeners();
  }

  void updateDataLivelihoodBuffaloQnty(int? value) {
    _livelihoodBuffaloQnty = value;
    notifyListeners();
  }

  void updateDataLivelihoodPoultryManureQnty(int? value) {
    _livelihoodPoultryManureQnty = value;
    notifyListeners();
  }

  void updateDatabv380Qnty(int? value) {
    _bv380Qnty = value;
    notifyListeners();
  }

  void updateDatagramalakshmiQnty(int? value) {
    _gramalakshmiQnty = value;
    notifyListeners();
  }

  void updateDatagramapriyaQnty(int? value) {
    _gramapriyaQnty = value;
    notifyListeners();
  }

  void updateDataothers(String? value) {
    _other = value;
    notifyListeners();
  }

  void updateDataotherQnty(int? value) {
    _otherQnty = value;
    notifyListeners();
  }


}
