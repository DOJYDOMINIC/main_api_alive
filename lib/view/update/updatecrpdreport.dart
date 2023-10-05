import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:main200623/constant/color_text.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../control/text_controller.dart';
import '../../global.dart';
import '../../model/model.dart';
import '../../services/add_api.dart';
import '../login.dart';
import '../home_page.dart';
import '../widgets/elevate_click_button.dart';
import '../widgets/input_field.dart';

class UpdateCrpDetail extends StatefulWidget {
  const UpdateCrpDetail({Key? key, this.items}) : super(key: key);

  final items;

  @override
  State<UpdateCrpDetail> createState() => _SalesState();
}

class _SalesState extends State<UpdateCrpDetail> {


  String? name_;


  Future<void> getSavedData() async {
    var providerone = Provider.of<TextMain>(context, listen: false);
    SharedPreferences prefs = await SharedPreferences.getInstance();


    String name = prefs.getString('name') ?? '';

    if(name.isNotEmpty){
      setState(() {
        name_ = name;
        providerone.updateDataNameofcrp(name_);
      });
      changeData();
    }
  }


  @override
  void initState() {
    super.initState();
    getSavedData();
    getproductData();
    // fetchDistricts();
  }

  TextEditingController dataComments = TextEditingController();
  TextEditingController datnumber_of_crp_number = TextEditingController();
  TextEditingController dataNameofcrp = TextEditingController();
  TextEditingController dataNameofrespondent = TextEditingController();

  bool isLoading = false;
  bool changedata = false;

  void updateForm(String id) async {
    if (isLoading) return; // Prevent multiple updates

    setState(() {
      isLoading = true;
    });

    var providerone = Provider.of<TextMain>(context, listen: false);
    try {
      final AddData updateData = AddData(
        dataName: providerone.dataName,
        dataAddress: providerone.dataAddress,
        dataDistrict: providerone.dataDistrict,
        dataBlock: providerone.dataBlock,
        dataPanchayath: providerone.dataPanchayath,
        dataWard: providerone.dataWard,
        dataClass: providerone.dataClass,
        dataClass2: providerone.dataClass2,
        dataClass3: providerone.dataClass3,
            // ?.map((dynamic item) => item.toString())
            // .toList(),
        dataAmountinvested: providerone.dataAmountinvested,
        dataRoleinNg: providerone.dataRoleinNg,
        dataFamilyincome: providerone.dataFamilyincome,
        dataHouseOwnership: providerone.dataHouseownership,
        dataAnimalhusbendaryBusinesstype: providerone
            .dataAnimalhusbendaryBusinesstype,
            // ?.map((dynamic item) => item.toString())
            // .toList(),
        dataAnimalhusbendaryCdsregistration:
            providerone.dataAnimalhusbendaryCdsregistration,
        dataAnimalhusbendaryRegdetailsRegnumber:
            providerone.dataAnimalhusbendaryRegdetailsRegnumber,
        dataAnimalhusbendaryRegdetailsCdsunitname:
            providerone.dataAnimalhusbendaryRegdetailsCdsunitname,
        dataAnimalhusbendaryOthers0: providerone.dataAnimalhusbendaryOthers0,
        dataBusinessidea: providerone.dataBusinessidea,
        dataDateofsurvey: providerone.dataDateofsurvey,
        dataComments: providerone.dataComments,
        dataEnterpisetype: providerone.dataEnterpisetype,
        dataYearofstartingagriculture:
            providerone.dataYearofstartingagriculture,
        dataYearofstartingbussiness: providerone.dataYearofstartingbussiness,
        dataPhonenumber: providerone.dataPhonenumber,
        dataLoan: providerone.dataLoan,
        dataLanddetailsLandarea: providerone.dataLanddetailsLandarea,
        dataInfraShed: providerone.dataInfraShed,
        dataInfraBiogas: providerone.dataInfraBiogas,
        dataInfraEquipments: providerone.dataInfraEquipments,
        dataInfraInfrastructure: providerone.dataInfraInfrastructure,
        dataInfraOthers: providerone.dataInfraOthers,
        dataInfraWastage: providerone.dataInfraWastage,
        dataLanddetails1Landforgrass: providerone.dataLanddetails1Landforgrass,
        dataTrainingsrequired: providerone.dataTrainingsrequired,
            // ?.map((dynamic item) => item.toString())
            // .toList(),
        dataSupportrecived: providerone.dataSupportrecived,
        // dataSupport: providerone.dataSupport?.join(','),
        dataSupport: providerone.dataSupport,
            // ?.map((dynamic item) => item.toString())
            // .toList(),
        dataStarttime: providerone.dataStarttime,
        dataSourceofinvestment: providerone.dataSourceofinvestment,
            // ?.map((dynamic item) => item.toString())
            // .toList(),
        dataLanddetailsAgricultureland:
            providerone.dataLanddetailsAgricultureland,
        dataSalesPrdct2: providerone.dataSalesprdct2,
            // ?.map((dynamic item) => item.toString())
            // .toList(),
        // dataLivelihoodNumbers : providerone.datalivelihoodnumbers,
        dataNameofcrp: providerone.dataNameofcrp,
        dataNameofNg: providerone.dataNameofNg,
        // dataLivelihoodRevenue : providerone.datalivelihoodrevenue,
        dataNameofNGmember: providerone.dataNameofNGmember,
        dataMgnregAsupport: providerone.dataMgnregAsupport,
            // ?.map((dynamic item) => item.toString())
            // .toList(),
        // dataProductsQuantum : providerone.dataProductsQuantum,
        // dataProductsPrdct: providerone.dataProductsPrdct,
        dataLanddetails1Qtyofleasedland:
            providerone.dataLanddetails1Qtyofleasedland,
        dataLanddetails1Qtyofownland: providerone.dataLanddetails1Qtyofownland,
        dataLanddetails2Qtyofownland: providerone.dataLanddetails2Qtyofownland,
        dataLanddetails2Siteforworkshed:
            providerone.dataLanddetails2Siteforworkshed,
        // dataLivelihoodCapitalsource: providerone.datalivelihoodcapitalsource,
        dataLivelihoodIncomesource: providerone.datalivelihoodincomesource,
            // ?.map((dynamic item) => item.toString())
            // .toList(),
        dataLoandetailsDateofLoanApplication:
            providerone.dataDateofLoanApplication,
        dataLoandetailsTotalinvestment:
            providerone.dataLoandetailsTotalinvestment,
        dataNameofrespondent: providerone.dataNameofrespondent,
        dataNoofgroupmembers: providerone.dataNoofgroupmembers,
        dataOthers2: providerone.dataOthers2,
        dataOthers3: providerone.dataOthers3,
        dataOthers4: providerone.dataOthers4,
        // dataProductsPrice2: providerone.dataProductsPrice2,
        dataPurchaseofrawmaterialsBrand:
            providerone.dataPurchaseofrawmaterialsBrand,
        dataSalesSalesmethod: providerone.dataSalesSalesmethod,
            // ?.map((dynamic item) => item.toString())
            // .toList(),
        beiferQnty: providerone.beiferQnty,
        brandQnty: providerone.brandQnty,
        byPassFatQnty: providerone.byPassFatQnty,
        byPassProteinQnty: providerone.byPassProteinQnty,
        calfQnty: providerone.calfQnty,
        calvesList: providerone.calvesList,
            // ?.map((dynamic item) => item.toString())
            // .toList(),
        cattleFeedList: providerone.cattleFeedList,
        cattleFeedQnty: providerone.cattleFeedQnty,
        cowsList: providerone.cowsList,
            // ?.map((dynamic item) => item.toString())
            // .toList(),
        dataPurchaseofrawmaterialsItemtype: providerone
            .dataPurchaseofrawmaterialsItemtype,
            // ?.map((dynamic item) => item.toString())
            // .toList(),
        dayOldChickQnty: providerone.dayOldChickQnty,
        eggQnty: providerone.eggQnty,
        eggTraysQnty: providerone.eggTraysQnty,
        energyRichFeedList: providerone.energyRichFeedList,
        energyRichFeedQnty: providerone.energyRichFeedQnty,
        feedQnty: providerone.feedQnty,
        fodderSlipsList: providerone.fodderSlipsList,
            // ?.map((dynamic item) => item.toString())
            // .toList(),
        goatFeeDqnty: providerone.goatFeeDqnty,
        grasFooderQnty: providerone.grasFooderQnty,
        hayQnty: providerone.hayQnty,
        heipersList: providerone.heipersList,
            // ?.map((dynamic item) => item.toString())
            // .toList(),
        kidQnty: providerone.kidQnty,
        kidStarterQnty: providerone.kidStarterQnty,
        layerList: providerone.layerList,
        malabariGoatsQnty: providerone.malabariGoatsQnty,
        maleBuffaloCalfQnty: providerone.maleBuffaloCalfQnty,
        maleBuffaloCalvesQnty: providerone.maleBuffaloCalvesQnty,
        manureList: providerone.manureList,
            // ?.map((dynamic item) => item.toString())
            // .toList(),
        materialForPoultryQnty: providerone.materialForPoultryQnty,
        meatQnty: providerone.meatQnty,
        milkQnty: providerone.milkQnty,
        milkReplacerList: providerone.milkReplacerList,
        modePurchaseofrawmaterials: providerone.modePurchaseofrawmaterials,
            // ?.map((dynamic item) => item.toString())
            // .toList(),
        poultryFeedQnty: providerone.poultryFeedQnty,
        pulletsList: providerone.pulletsList,
            // ?.map((dynamic item) => item.toString())
            // .toList(),
        pulletsQnty: providerone.pulletsQnty,
        salesManureQnty: providerone.salesManureQnty,
        silageQnty: providerone.silageQnty,
        tmrQnty: providerone.tmrQnty,
        treeFooderQnty: providerone.treeFooderQnty,
        ureaTreatedStrawQnty: providerone.ureaTreatedStrawQnty,
        calvesGerseyQnty: providerone.calvesGerseyQnty,
        calvesHfQnty: providerone.calvesHfQnty,
        vermyCompostQnty: providerone.vermyCompostQnty,
        superNapierQnty: providerone.superNapierQnty,
        redNapierQnty: providerone.redNapierQnty,
        poultryManureQnty: providerone.poultryManureQnty,
        paraGrassQnty: providerone.paraGrassQnty,
        napierQnty: providerone.napierQnty,
        milkReplacerQnty: providerone.milkReplacerQnty,
        heipersHfQnty: providerone.heipersHfQnty,
        heipersGerseyQnty: providerone.heipersGerseyQnty,
        guineaGrassQnty: providerone.guineaGrassQnty,
        goatManureQnty: providerone.goatManureQnty,
        cowsHfQnty: providerone.cowsHfQnty,
        cowsGerseyQnty: providerone.cowsGerseyQnty,
        cowDungQnty: providerone.cowDungQnty,
        congoSignalQnty: providerone.congoSignalQnty,
        co5Qnty: providerone.co5Qnty,
        co4Qnty: providerone.co5Qnty,

        livelihoodBuffaloQnty: providerone.livelihoodBuffaloQnty,
        livelihoodCalfFemaleQnty: providerone.livelihoodCalfFemaleQnty,
        livelihoodCalfList: providerone.livelihoodCalfList,
        livelihoodCalfMaleQnty: providerone.livelihoodCalfMaleQnty,
        livelihoodCowsHfQnty: providerone.livelihoodCowsHfQnty,
        livelihoodCowsIndigenousQnty: providerone.livelihoodCowsIndigenousQnty,
        livelihoodCowsJerseyQnty: providerone.livelihoodCowsJerseyQnty,
        livelihoodCowsList: providerone.livelihoodCowsList,
        livelihoodFodderForSaleQnty: providerone.livelihoodFodderForSaleQnty,
        livelihoodFodderList: providerone.livelihoodFodderList,
        livelihoodFodderOwnUseQnty: providerone.livelihoodFodderOwnUseQnty,
        livelihoodGoatAttapadiBlackKidQnty:
            providerone.livelihoodGoatAttapadiBlackKidQnty,
        livelihoodGoatAttapadiBlackQnty:
            providerone.livelihoodGoatAttapadiBlackQnty,
        livelihoodGoatList: providerone.livelihoodGoatList,
        livelihoodGoatMalabariKidQnty:
            providerone.livelihoodGoatMalabariKidQnty,
        livelihoodGoatMalabariQnty: providerone.livelihoodGoatMalabariQnty,
        livelihoodGoatOthersQnty: providerone.livelihoodGoatOthersQnty,
        livelihoodManureDryQnty: providerone.livelihoodManureDryQnty,
        livelihoodManureFreshQnty: providerone.livelihoodManureFreshQnty,
        livelihoodManureList: providerone.livelihoodManureList,
        livelihoodPoultryEggProductionQnty:
            providerone.livelihoodPoultryEggProductionQnty,
        livelihoodPoultryList: providerone.livelihoodPoultryList,
        livelihoodPoultryManureQnty: providerone.livelihoodPoultryManureQnty,
        livelihoodPoultryMarketingQnty:
            providerone.livelihoodPoultryMarketingQnty,
        bv380Qnty: providerone.bv380Qnty,
        gramalakshmiQnty: providerone.gramalakshmiQnty,
        gramapriyaQnty: providerone.gramapriyaQnty,
        layerQnty: providerone.layerQnty,
        other: providerone.other,
        otherQnty: providerone.otherQnty,

        addDataTreeFooderQnty: providerone.addDataTreeFooderQnty,
        // addDataUreaTreatedStrawQnty: providerone.addDataUreaTreatedStrawQnty,
        caffStarterQnty: providerone.caffStarterQnty,
        chemicalFertilizersQnty: providerone.chemicalFertilizersQnty,
        fodderSeedsQnty: providerone.fodderSeedsQnty,
        grassFooderQnty: providerone.grassFooderQnty,
        growerQnty: providerone.growerQnty,
        ingredientsForCttleFeedQnty: providerone.ingredientsForCattleFeedQnty,
        ingredientsForPoultryFeedQnty:
            providerone.ingredientsForPoultryFeedQnty,
        livelihoodGoatOthers: providerone.livelihoodGoatOthers,
        malabariGoatKidsQnty: providerone.malabariGoatKidsQnty,
        materialForPoultryCageFabricationQnty:
            providerone.materialForPoultryCageFabricationQnty,
        totalMixedRationQnty: providerone.totalMixedRationQnty,
        ureaTreatedMolassBlock: providerone.ureaTreatedMolassBlock,
        livelihoodDUCKqnty: providerone.livelihoodduckqty,
        PhonenumberofCRP: providerone.PhonenumberofCRP,

        familyDetails: updatefamilyMembers,
      );

      // log(updateData.toJson().toString());

      final url = '$api/user/update/$id'; // Replace with your API endpoint URL
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $authToken',
        // Include the token in the headers
      };

      final jsonData = jsonEncode(updateData.toJson());
      final response = await http.put(
        Uri.parse(url),
        headers: headers,
        body: jsonData,
      );

      if (response.statusCode == 200) {
        // print(jsonEncode(response));
        log(jsonData.toString());
        print('Data submitted successfully.');

        // var providerone = Provider.of<TextMain>(context, listen: false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text('Update completed!'),
          ),
        );
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Screenone()));
      } else {
        print(id);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text('Update failed!'),
          ),
        );

        print('Failed to submit data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text('Update failed!'),
        ),
      );
      print('Error occurred while submitting data: $error');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

//   void updateForm(String id) async {
//     if (isLoading) return; // Prevent multiple updates
//
//     setState(() {
//       isLoading = true;
//     });
//
//     var providerone = Provider.of<TextMain>(context, listen: false);
//     final AddData updateData =AddData(
//             dataName: providerone.dataName,
//             dataAddress: providerone.dataAddress,
//             dataDistrict: providerone.dataDistrict,
//             dataBlock: providerone.dataBlock,
//             dataPanchayath: providerone.dataPanchayath,
//             dataWard: providerone.dataWard,
//             dataClass: providerone.dataClass,
//             dataClass2: providerone.dataClass2,
//             dataClass3: providerone.dataClass3
//                 ?.map((dynamic item) => item.toString())
//                 .toList(),
//             dataAmountinvested: providerone.dataAmountinvested,
//             dataRoleinNg: providerone.dataRoleinNg,
//             dataFamilyincome: providerone.dataFamilyincome,
//             dataHouseOwnership: providerone.dataHouseownership,
//             dataAnimalhusbendaryBusinesstype: providerone
//                 .dataAnimalhusbendaryBusinesstype
//                 ?.map((dynamic item) => item.toString())
//                 .toList(),
//             dataAnimalhusbendaryCdsregistration:
//                 providerone.dataAnimalhusbendaryCdsregistration,
//             dataAnimalhusbendaryRegdetailsRegnumber:
//                 providerone.dataAnimalhusbendaryRegdetailsRegnumber,
//             dataAnimalhusbendaryRegdetailsCdsunitname:
//                 providerone.dataAnimalhusbendaryRegdetailsCdsunitname,
//             dataAnimalhusbendaryOthers0: providerone.dataAnimalhusbendaryOthers0,
//             dataBusinessidea: providerone.dataBusinessidea,
//             dataDateofsurvey: providerone.dataDateofsurvey,
//             dataComments: providerone.dataComments,
//             dataEnterpisetype: providerone.dataEnterpisetype,
//             dataYearofstartingagriculture:
//                 providerone.dataYearofstartingagriculture,
//             dataYearofstartingbussiness: providerone.dataYearofstartingbussiness,
//             dataPhonenumber: providerone.dataPhonenumber,
//             dataLoan: providerone.dataLoan,
//             dataLanddetailsLandarea: providerone.dataLanddetailsLandarea,
//             dataInfraShed: providerone.dataInfraShed,
//             dataInfraBiogas: providerone.dataInfraBiogas,
//             dataInfraEquipments: providerone.dataInfraEquipments,
//             dataInfraInfrastructure: providerone.dataInfraInfrastructure,
//             dataInfraOthers: providerone.dataInfraOthers,
//             dataInfraWastage: providerone.dataInfraWastage,
//             dataLanddetails1Landforgrass: providerone.dataLanddetails1Landforgrass,
//             dataTrainingsrequired: providerone.dataTrainingsrequired
//                 ?.map((dynamic item) => item.toString())
//                 .toList(),
//             dataSupportrecived: providerone.dataSupportrecived,
//             // dataSupport: providerone.dataSupport?.join(','),
//             dataSupport: providerone.dataSupport
//                 ?.map((dynamic item) => item.toString())
//                 .toList(),
//             dataStarttime: providerone.dataStarttime,
//             dataSourceofinvestment: providerone.dataSourceofinvestment
//                 ?.map((dynamic item) => item.toString())
//                 .toList(),
//             dataLanddetailsAgricultureland:
//                 providerone.dataLanddetailsAgricultureland,
//             dataSalesPrdct2: providerone.dataSalesprdct2
//                 ?.map((dynamic item) => item.toString())
//                 .toList(),
//             // dataLivelihoodNumbers : providerone.datalivelihoodnumbers,
//             dataNameofcrp: providerone.dataNameofcrp,
//             dataNameofNg: providerone.dataNameofNg,
//             // dataLivelihoodRevenue : providerone.datalivelihoodrevenue,
//             dataNameofNGmember: providerone.dataNameofNGmember,
//             dataMgnregAsupport: providerone.dataMgnregAsupport
//                 ?.map((dynamic item) => item.toString())
//                 .toList(),
//             // dataProductsQuantum : providerone.dataProductsQuantum,
//             // dataProductsPrdct: providerone.dataProductsPrdct,
//             dataLanddetails1Qtyofleasedland:
//                 providerone.dataLanddetails1Qtyofleasedland,
//             dataLanddetails1Qtyofownland: providerone.dataLanddetails1Qtyofownland,
//             dataLanddetails2Qtyofownland: providerone.dataLanddetails2Qtyofownland,
//             dataLanddetails2Siteforworkshed:
//                 providerone.dataLanddetails2Siteforworkshed,
//             // dataLivelihoodCapitalsource: providerone.datalivelihoodcapitalsource,
//             dataLivelihoodIncomesource: providerone.datalivelihoodincomesource
//                 ?.map((dynamic item) => item.toString())
//                 .toList(),
//             dataLoandetailsDateofLoanApplication:
//                 providerone.dataDateofLoanApplication,
//             dataLoandetailsTotalinvestment:
//                 providerone.dataLoandetailsTotalinvestment,
//             dataNameofrespondent: providerone.dataNameofrespondent,
//             dataNoofgroupmembers: providerone.dataNoofgroupmembers,
//             dataOthers2: providerone.dataOthers2,
//             dataOthers3: providerone.dataOthers3,
//             dataOthers4: providerone.dataOthers4,
//             // dataProductsPrice2: providerone.dataProductsPrice2,
//             dataPurchaseofrawmaterialsBrand:
//                 providerone.dataPurchaseofrawmaterialsBrand,
//             dataSalesSalesmethod: providerone.dataSalesSalesmethod
//                 ?.map((dynamic item) => item.toString())
//                 .toList(),
//             beiferQnty: providerone.beiferQnty,
//             brandQnty: providerone.brandQnty,
//             byPassFatQnty: providerone.byPassFatQnty,
//             byPassProteinQnty: providerone.byPassProteinQnty,
//             calfQnty: providerone.calfQnty,
//             calvesList: providerone.calvesList
//                 ?.map((dynamic item) => item.toString())
//                 .toList(),
//             cattleFeedList: providerone.cattleFeedList,
//             cattleFeedQnty: providerone.cattleFeedQnty,
//             cowsList: providerone.cowsList
//                 ?.map((dynamic item) => item.toString())
//                 .toList(),
//             dataPurchaseofrawmaterialsItemtype: providerone
//                 .dataPurchaseofrawmaterialsItemtype
//                 ?.map((dynamic item) => item.toString())
//                 .toList(),
//             dayOldChickQnty: providerone.dayOldChickQnty,
//             eggQnty: providerone.eggQnty,
//             eggTraysQnty: providerone.eggTraysQnty,
//             energyRichFeedList: providerone.energyRichFeedList,
//             energyRichFeedQnty: providerone.energyRichFeedQnty,
//             feedQnty: providerone.feedQnty,
//             fodderSlipsList: providerone.fodderSlipsList
//                 ?.map((dynamic item) => item.toString())
//                 .toList(),
//             goatFeeDqnty: providerone.goatFeeDqnty,
//             grasFooderQnty: providerone.grasFooderQnty,
//             hayQnty: providerone.hayQnty,
//             heipersList: providerone.heipersList
//                 ?.map((dynamic item) => item.toString())
//                 .toList(),
//             kidQnty: providerone.kidQnty,
//             kidStarterQnty: providerone.kidStarterQnty,
//             layerList: providerone.layerList,
//             malabariGoatsQnty: providerone.malabariGoatsQnty,
//             maleBuffaloCalfQnty: providerone.maleBuffaloCalfQnty,
//             maleBuffaloCalvesQnty: providerone.maleBuffaloCalvesQnty,
//             manureList: providerone.manureList
//                 ?.map((dynamic item) => item.toString())
//                 .toList(),
//             materialForPoultryQnty: providerone.materialForPoultryQnty,
//             meatQnty: providerone.meatQnty,
//             milkQnty: providerone.milkQnty,
//             milkReplacerList: providerone.milkReplacerList,
//             modePurchaseofrawmaterials: providerone.modePurchaseofrawmaterials
//                 ?.map((dynamic item) => item.toString())
//                 .toList(),
//             poultryFeedQnty: providerone.poultryFeedQnty,
//             pulletsList: providerone.pulletsList
//                 ?.map((dynamic item) => item.toString())
//                 .toList(),
//             pulletsQnty: providerone.pulletsQnty,
//             salesManureQnty: providerone.salesManureQnty,
//             silageQnty: providerone.silageQnty,
//             tmrQnty: providerone.tmrQnty,
//             treeFooderQnty: providerone.treeFooderQnty,
//             ureaTreatedStrawQnty: providerone.ureaTreatedStrawQnty,
//             calvesGerseyQnty: providerone.calvesGerseyQnty,
//             calvesHfQnty: providerone.calvesHfQnty,
//             vermyCompostQnty: providerone.vermyCompostQnty,
//             superNapierQnty: providerone.superNapierQnty,
//             redNapierQnty: providerone.redNapierQnty,
//             poultryManureQnty: providerone.poultryManureQnty,
//             paraGrassQnty: providerone.paraGrassQnty,
//             napierQnty: providerone.napierQnty,
//             milkReplacerQnty: providerone.milkReplacerQnty,
//             heipersHfQnty: providerone.heipersHfQnty,
//             heipersGerseyQnty: providerone.heipersGerseyQnty,
//             guineaGrassQnty: providerone.guineaGrassQnty,
//             goatManureQnty: providerone.goatManureQnty,
//             cowsHfQnty: providerone.cowsHfQnty,
//             cowsGerseyQnty: providerone.cowsGerseyQnty,
//             cowDungQnty: providerone.cowDungQnty,
//             congoSignalQnty: providerone.congoSignalQnty,
//             co5Qnty: providerone.co5Qnty,
//             co4Qnty: providerone.co5Qnty,
//
//             livelihoodBuffaloQnty: providerone.livelihoodBuffaloQnty,
//             livelihoodCalfFemaleQnty: providerone.livelihoodCalfFemaleQnty,
//             livelihoodCalfList: providerone.livelihoodCalfList,
//             livelihoodCalfMaleQnty: providerone.livelihoodCalfMaleQnty,
//             livelihoodCowsHfQnty: providerone.livelihoodCowsHfQnty,
//             livelihoodCowsIndigenousQnty: providerone.livelihoodCowsIndigenousQnty,
//             livelihoodCowsJerseyQnty: providerone.livelihoodCowsJerseyQnty,
//             livelihoodCowsList: providerone.livelihoodCowsList,
//             livelihoodFodderForSaleQnty: providerone.livelihoodFodderForSaleQnty,
//             livelihoodFodderList: providerone.livelihoodFodderList,
//             livelihoodFodderOwnUseQnty: providerone.livelihoodFodderOwnUseQnty,
//             livelihoodGoatAttapadiBlackKidQnty:
//                 providerone.livelihoodGoatAttapadiBlackKidQnty,
//             livelihoodGoatAttapadiBlackQnty:
//                 providerone.livelihoodGoatAttapadiBlackQnty,
//             livelihoodGoatList: providerone.livelihoodGoatList,
//             livelihoodGoatMalabariKidQnty:
//                 providerone.livelihoodGoatMalabariKidQnty,
//             livelihoodGoatMalabariQnty: providerone.livelihoodGoatMalabariQnty,
//             livelihoodGoatOthersQnty: providerone.livelihoodGoatOthersQnty,
//             livelihoodManureDryQnty: providerone.livelihoodManureDryQnty,
//             livelihoodManureFreshQnty: providerone.livelihoodManureFreshQnty,
//             livelihoodManureList: providerone.livelihoodManureList,
//             livelihoodPoultryEggProductionQnty:
//                 providerone.livelihoodPoultryEggProductionQnty,
//             livelihoodPoultryList: providerone.livelihoodPoultryList,
//             livelihoodPoultryManureQnty: providerone.livelihoodPoultryManureQnty,
//             livelihoodPoultryMarketingQnty:
//                 providerone.livelihoodPoultryMarketingQnty,
//             bv380Qnty: providerone.bv380Qnty,
//             gramalakshmiQnty: providerone.gramalakshmiQnty,
//             gramapriyaQnty: providerone.gramapriyaQnty,
//             layerQnty: providerone.layerQnty,
//             other: providerone.other,
//             otherQnty: providerone.otherQnty,
//
//             addDataTreeFooderQnty: providerone.addDataTreeFooderQnty,
//             // addDataUreaTreatedStrawQnty: providerone.addDataUreaTreatedStrawQnty,
//             caffStarterQnty: providerone.caffStarterQnty,
//             chemicalFertilizersQnty: providerone.chemicalFertilizersQnty,
//             fodderSeedsQnty: providerone.fodderSeedsQnty,
//             grassFooderQnty: providerone.grassFooderQnty,
//             growerQnty: providerone.growerQnty,
//             ingredientsForCttleFeedQnty: providerone.ingredientsForCattleFeedQnty,
//             ingredientsForPoultryFeedQnty:
//                 providerone.ingredientsForPoultryFeedQnty,
//             livelihoodGoatOthers: providerone.livelihoodGoatOthers,
//             malabariGoatKidsQnty: providerone.malabariGoatKidsQnty,
//             materialForPoultryCageFabricationQnty:
//                 providerone.materialForPoultryCageFabricationQnty,
//             totalMixedRationQnty: providerone.totalMixedRationQnty,
//             ureaTreatedMolassBlock: providerone.ureaTreatedMolassBlock,
//             livelihoodDUCKqnty: providerone.livelihoodduckqty,
//             PhonenumberofCRP: providerone.PhonenumberofCRP,
//
//             familyDetails: updatefamilyMembers); // ... Create your AddData object as before ...
//
//     final boxid = await Hive.openBox('id_box');
//     final box = await Hive.openBox('offline_data');
//
//     try {
//       if (await Connectivity().checkConnectivity() == ConnectivityResult.none) {
//         // Save data to Hive when there's no network
//         await boxid.put(1,id);
//         await box.put(1,updateData);
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             backgroundColor: Colors.yellow,
//             content: Text('Data saved offline.'),
//           ),
//         );
//       } else {
//         final url = '$api/user/update/$id';
//         final headers = {
//           'Content-Type': 'application/json',
//           'Authorization': 'Bearer $authToken',
//         };
//
//         final jsonData = jsonEncode(updateData.toJson());
//
//         final response = await http.put(
//           Uri.parse(url),
//           headers: headers,
//           body: jsonData,
//         );
//
//         if (response.statusCode == 200) {
//           log(updateData.toString());
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               backgroundColor: Colors.green,
//               content: Text('Update completed!'),
//             ),
//           );
//           Navigator.pushReplacement(
//               context, MaterialPageRoute(builder: (context) => Screenone()));
//         } else {
//           print(id);
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               backgroundColor: Colors.red,
//               content: Text('Update failed!'),
//             ),
//           );
//           print('Failed to submit data. Status code: ${response.statusCode}');
//         }
//       }
//     } catch (error) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           backgroundColor: Colors.red,
//           content: Text('Update failed!'),
//         ),
//       );
//       print('Error occurred while submitting data: $error');
//     } finally {
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }
//
// // Function to sync data from Hive when network becomes available
//   Future<void> syncDataFromHive() async {
//     final box = await Hive.openBox('offline_data');
//     final boxid = await Hive.openBox('id_box');
//
//       final jsonData = box.get(1);
//     final id = boxid.get(1);
//
//       final url = '$api/user/update/$id';
//
//       final headers = {
//         'Content-Type': 'application/json',
//         'Authorization': 'Bearer $authToken',
//       };
//
//       final response = await http.put(
//         Uri.parse(url),
//         headers: headers,
//         body: jsonData,
//       );
//
//       if (response.statusCode == 200) {
//         box.deleteAt(1);
//         boxid.deleteAt(1);
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             backgroundColor: Colors.blue,
//             content: Text('Update Completed!'),
//           ),
//         );
//         // box.delete(key); // Delete synced data from Hive
//     }
//   }

  @override
  Widget build(BuildContext context) {
    var providerone = Provider.of<TextMain>(context, listen: false);

    return GestureDetector(
      onTap: () {
        if (!FocusScope.of(context).hasPrimaryFocus) {
          FocusScope.of(context).unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('സി.ആർ.പിയുടെ\nനിർദേശങ്ങൾ'),
          backgroundColor: app_theam,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                            color: Colors.black)),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Text('$name_',style: TextStyle(fontSize: 15),),
                        ],
                      ),
                    )),
                SizedBox(height: 10,),
                // Text(DocumentId),
                // InputField(
                //     hint: 'CRP യുടെ പേര് ',
                //     controller: dataNameofcrp,
                //     onchanged: (value) {
                //       providerone.updateDataNameofcrp(value);
                //     }),
                InputField(
                  hint: 'CRP യുടെ ഫോൺ നമ്പർ ',
                  controller: datnumber_of_crp_number,
                  onchanged: (value) {
                    int? valuee = int.tryParse(value);
                    providerone.updatPhonenumberofCRP(valuee);
                  },
                  keytype: TextInputType.number,
                ),
                InputField(
                    hint: 'CRP യുടെ അഭിപ്രായങ്ങൾ രേഖപ്പെടുത്താം',
                    controller: dataComments,
                    onchanged: (value) {
                      providerone.updateDataComments(value);
                    }),
                InputField(
                    hint: 'വിവരം നൽകിയ വ്യക്തിയുടെ പേര് ',
                    controller: dataNameofrespondent,
                    onchanged: (value) {
                      providerone.updateDataNameofrespondent(value);
                    }),
                SizedBox(
                  height: 20,
                ),
                Center(
                    child: isLoading
                        ? CircularProgressIndicator()
                        : ElevateClick(
                            ontap: () {
                              var id = widget.items['data'][0]['_id'];
                              print(id);
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  // print(data);
                                  return AlertDialog(
                                    title: Text('Submit Data'),
                                    content: Text(
                                        'Are you sure you want to submit?'),
                                    actions: [
                                      TextButton(
                                          child: Text('OK'),
                                          onPressed: () {
                                            updateForm(id);
                                            Navigator.of(context).pop();
                                          }),
                                      TextButton(
                                        child: Text('Back'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            text: 'Submit',
                          )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void getproductData() {

    var dataup = widget.items['data'][0];

    dataComments.text = dataup["data_comments"];
    // dataNameofcrp.text = dataup["data_nameofcrp"];
    dataNameofrespondent.text = dataup["data_Nameofrespondent"];
    datnumber_of_crp_number.text  = dataup['Phonenumber_ofCRP'].toString();
    // });
  }

  changeData() {
    var providerone = context.read<TextMain>();
    // providerone.updateDataNameofcrp(dataNameofcrp.text);
    providerone.updateDataComments(dataComments.text);
    providerone.updateDataNameofrespondent(dataNameofrespondent.text);

    if(datnumber_of_crp_number.text == 'null'){
      datnumber_of_crp_number.text == '0';
      providerone.updatPhonenumberofCRP(int.tryParse(datnumber_of_crp_number.text));
    }else{
      providerone.updatPhonenumberofCRP(int.tryParse(datnumber_of_crp_number.text));
    }
  }
}
