import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:main200623/constant/color_text.dart';
import 'package:provider/provider.dart';
import '../../control/text_controller.dart';
import '../../global.dart';
import '../../model/model.dart';
import '../../services/add_api.dart';
import '../login.dart';
import '../home_page.dart';
import '../widgets/elevate_click_button.dart';
import '../widgets/input_field.dart';


class CrpDetail extends StatefulWidget {
  const CrpDetail({Key? key}) : super(key: key);

  @override
  State<CrpDetail> createState() => _SalesState();
}

class _SalesState extends State<CrpDetail> {

  TextEditingController datacomments = TextEditingController();
  TextEditingController datanameofcrp = TextEditingController();
  TextEditingController dataNameofrespondent = TextEditingController();

  void submitForm() async {
    var providerone = Provider.of<TextMain>(context, listen: false);

    final AddData data = AddData(

      dataName: providerone.dataName,
      dataAddress: providerone.dataAddress,
      dataDistrict: providerone.dataDistrict,
      dataBlock: providerone.dataBlock,
      dataPanchayath: providerone.dataPanchayath,
      dataWard: providerone.dataWard,
      dataClass: providerone.dataClass,
      dataClass2: providerone.dataClass2,
      dataClass3 : providerone.dataClass3?.map((dynamic item) => item.toString()).toList(),
      dataAmountinvested: providerone.dataAmountinvested,
      dataRoleinNg: providerone.dataRoleinNg,
      dataFamilyincome: providerone.dataFamilyincome,
      dataHouseOwnership: providerone.dataHouseownership,
      dataAnimalhusbendaryBusinesstype: providerone.dataAnimalhusbendaryBusinesstype?.map((dynamic item) => item.toString()).toList(),
      dataAnimalhusbendaryCdsregistration: providerone
          .dataAnimalhusbendaryCdsregistration,
      dataAnimalhusbendaryRegdetailsRegnumber: providerone
          .dataAnimalhusbendaryRegdetailsRegnumber,
      dataAnimalhusbendaryRegdetailsCdsunitname: providerone
          .dataAnimalhusbendaryRegdetailsCdsunitname,
      dataAnimalhusbendaryOthers0: providerone.dataAnimalhusbendaryOthers0,
      dataBusinessidea: providerone.dataBusinessidea,
      dataDateofsurvey: providerone.dataDateofsurvey,
      dataComments: providerone.dataComments,
      dataEnterpisetype: providerone.dataEnterpisetype,
      dataYearofstartingagriculture: providerone.dataYearofstartingagriculture,
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
      dataTrainingsrequired: providerone.dataTrainingsrequired?.map((dynamic item) => item.toString()).toList(),
      dataSupportrecived: providerone.dataSupportrecived,
      // dataSupport: providerone.dataSupport?.join(','),
      dataSupport: providerone.dataSupport?.map((dynamic item) => item.toString()).toList(),
      dataStarttime: providerone.dataStarttime,
      dataSourceofinvestment: providerone.dataSourceofinvestment?.map((dynamic item) => item.toString()).toList(),
      dataLanddetailsAgricultureland: providerone.dataLanddetailsAgricultureland,
      dataSalesPrdct2: providerone.dataSalesprdct2?.map((dynamic item) => item.toString()).toList(),
      dataLivelihoodNumbers: providerone.datalivelihoodnumbers,
      dataNameofcrp: providerone.dataNameofcrp,
      dataNameofNg: providerone.dataNameofNg,
      dataLivelihoodRevenue: providerone.datalivelihoodrevenue,
      dataNameofNGmember: providerone.dataNameofNGmember,
      dataMgnregAsupport: providerone.dataMgnregAsupport?.map((dynamic item) => item.toString()).toList(),
      dataProductsQuantum: providerone.dataProductsQuantum,
      dataProductsPrdct: providerone.dataProductsPrdct?.map((dynamic item) => item.toString()).toList(),
      dataLanddetails1Qtyofleasedland: providerone.dataLanddetails1Qtyofleasedland,
      dataLanddetails1Qtyofownland: providerone.dataLanddetails1Qtyofownland,
      dataLanddetails2Qtyofownland: providerone.dataLanddetails2Qtyofownland,
      dataLanddetails2Siteforworkshed: providerone
          .dataLanddetails2Siteforworkshed,
      dataLivelihoodCapitalsource: providerone.datalivelihoodcapitalsource,
      dataLivelihoodIncomesource: providerone.datalivelihoodincomesource,
      dataLoandetailsDateofLoanApplication: providerone
          .dataDateofLoanApplication,
      dataLoandetailsTotalinvestment: providerone
          .dataLoandetailsTotalinvestment,
      dataNameofrespondent: providerone.dataNameofrespondent,
      dataNoofgroupmembers: providerone.dataNoofgroupmembers,
      dataOthers2: providerone.dataOthers2,
      dataOthers3: providerone.dataOthers3,
      dataOthers4: providerone.dataOthers4,
      dataProductsPrice2: providerone.dataProductsPrice2,
      dataPurchaseofrawmaterialsBrand: providerone.dataPurchaseofrawmaterialsBrand,
      dataSalesSalesmethod: providerone.dataSalesSalesmethod?.map((dynamic item) => item.toString()).toList(),
      beiferQnty: providerone.beiferQnty,
      brandQnty: providerone.brandQnty,
      byPassFatQnty: providerone.byPassFatQnty,
      byPassProteinQnty: providerone.byPassProteinQnty,
      calfQnty: providerone.calfQnty,
      calvesList: providerone.calvesList?.map((dynamic item) => item.toString()).toList(),
      cattleFeedList: providerone.cattleFeedList,
      cattleFeedQnty: providerone.cattleFeedQnty,
      cowsList: providerone.cowsList?.map((dynamic item) => item.toString()).toList(),
      dataPurchaseofrawmaterialsItemtype: providerone.dataPurchaseofrawmaterialsItemtype?.map((dynamic item) => item.toString()).toList(),
      dayOldChickQnty: providerone.dayOldChickQnty,
      eggQnty: providerone.eggQnty,
      eggTraysQnty: providerone.eggTraysQnty,
      energyRichFeedList: providerone.energyRichFeedList,
      energyRichFeedQnty: providerone.energyRichFeedQnty,
      feedQnty: providerone.feedQnty,
      fodderSlipsList: providerone.fodderSlipsList?.map((dynamic item) => item.toString()).toList(),
      goatFeeDqnty: providerone.goatFeeDqnty,
      grasFooderQnty: providerone.grasFooderQnty,
      hayQnty: providerone.hayQnty,
      heipersList: providerone.heipersList?.map((dynamic item) => item.toString()).toList(),
      kidQnty: providerone.kidQnty,
      kidStarterQnty: providerone.kidStarterQnty,
      layerList: providerone.layerList,
      malabariGoatsQnty: providerone.malabariGoatsQnty,
      maleBuffaloCalfQnty: providerone.maleBuffaloCalfQnty,
      maleBuffaloCalvesQnty: providerone.maleBuffaloCalvesQnty,
      manureList:providerone.manureList?.map((dynamic item) => item.toString()).toList(),
      materialForPoultryQnty: providerone.materialForPoultryQnty,
      meatQnty: providerone.meatQnty,
      milkQnty: providerone.milkQnty,
      milkReplacerList: providerone.milkReplacerList,
      modePurchaseofrawmaterials: providerone.modePurchaseofrawmaterials?.map((dynamic item) => item.toString()).toList(),
      poultryFeedQnty: providerone.poultryFeedQnty,
      pulletsList: providerone.pulletsList?.map((dynamic item) => item.toString()).toList(),
      pulletsQnty: providerone.pulletsQnty,
      salesManureQnty: providerone.salesManureQnty,
      silageQnty: providerone.silageQnty,
      tmrQnty: providerone.tmrQnty,
      treeFooderQnty: providerone.treeFooderQnty,
      ureaTreatedStrawQnty: providerone.ureaTreatedStrawQnty,
      calvesGerseyQnty:providerone.calvesGerseyQnty,
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
      members: familyMembers,
      // members: [
      //   Member(
      //     dataFamilydetailsAgeoffamilymember: providerone
      //         .dataFamilydetailsAgeoffamilymember,
      //     dataFamilydetailsEducation: providerone.dataFamilydetailsEducation,
      //     dataFamilydetailsJob: providerone.dataFamilydetailsJob,
      //     dataFamilydetailsNameoffailyfmember: providerone
      //         .dataFamilydetailsNameoffailyfmember,
      //     dataFamilydetailsRelation: providerone.dataFamilydetailsRelation,
      //     dataFamilydetailsSkill: providerone.dataFamilydetailsSkill,
      //   )
      // ],
    );
    const url = '$api/user/insert'; // Replace with your API endpoint URL
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $authToken', // Include the token in the headers
    };

    final jsonData = jsonEncode(data.toJson());

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonData,
      );
      if (response.statusCode == 201) {
        // Data submitted successfully
        log(jsonData);
        print('..........................');
        log(response.body);
        print('Data submitted successfully.');
      } else {
        print('Failed to submit data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error occurred while submitting data: $error');
    }
  }
  @override
  Widget build(BuildContext context) {
    var providerone = Provider.of<TextMain>(context,listen: false);

    return Scaffold(
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
              // Text(DocumentId),
              InputField(
                  hint: 'CRP യുടെ പേര് ',
                  controller: datanameofcrp,
                  onchanged: (value) {
                    providerone.updateDataNameofcrp(value);
                  }),

              InputField(
                  hint: 'CRP യുടെ അഭിപ്രായങ്ങൾ രേഖപ്പെടുത്താം',
                  controller: datacomments,
                  onchanged: (value) {
                    providerone.updateDataComments(value);

                  }),
              InputField(
                  hint: 'വിവരം നൽകിയ വ്യക്തിയുടെ പേര് ',
                  controller: dataNameofrespondent,
                  onchanged: (value) {
                    providerone.updateDataNameofrespondent(value);

                  }),
              ElevateClick(
                ontap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      // print(data);
                      return AlertDialog(
                        title: Text('Submit Data'),
                        content: Text('Are you sure you want to submit?'),
                        actions: [
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              submitForm();

                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Screenone(),));
                            },
                          ),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
