import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:main200623/constant/color_text.dart';
import 'package:provider/provider.dart';
import '../../control/text_controller.dart';
import '../../model/add_model.dart';
import '../../services/add_api.dart';
import '../login.dart';
import '../screenone.dart';
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
      dataAnimalhusbendaryBusinesstype: providerone
          .dataAnimalhusbendaryBusinesstype?.map((dynamic item) => item.toString()).toList(),
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
      dataTrainingsrequired: providerone.dataTrainingsrequired,
      dataSupportrecived: providerone.dataSupportrecived,
      dataSupport: providerone.dataSupport?.join(','),
      dataStarttime: providerone.dataStarttime,
      dataSourceofinvestment: providerone.dataSourceofinvestment,
      dataSalesSalesmethod: providerone.dataSalessalesmethod,
      dataLanddetailsAgricultureland: providerone
          .dataLanddetailsAgricultureland,
      dataSalesPrdct2: providerone.dataSalesprdct2,
      dataSalesQuntum2: providerone.dataSalesquntum2,
      dataLivelihoodNumbers: providerone.datalivelihoodnumbers,
      dataNameofcrp: providerone.dataNameofcrp,
      dataNameofNg: providerone.dataNameofNg,
      dataLivelihoodRevenue: providerone.datalivelihoodrevenue,
      dataNameofNGmember: providerone.dataNameofNGmember,
      dataMgnregAsupport: providerone.dataMgnregAsupport?.map((dynamic item) => item.toString()).toList(),
      dataProductsQuantum: providerone.dataProductsQuantum,
      dataProductsPrdct: providerone.dataProductsPrdct,
      dataLanddetails1Qtyofleasedland: providerone
          .dataLanddetails1Qtyofleasedland,
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
      dataPurchaseofrawmaterialsBrand: providerone
          .dataPurchaseofrawmaterialsBrand,
      dataPurchaseofrawmaterialsGroup: providerone
          .dataPurchaseofrawmaterialsGroup,
      dataPurchaseofrawmaterialsOwn: providerone.dataPurchaseofrawmaterialsOwn,
      dataPurchaseofrawmaterialsP2: providerone.dataPurchaseofrawmaterialsP2,
      dataPurchaseofrawmaterialsP3: providerone.dataPurchaseofrawmaterialsP3,
      dataPurchaseofrawmaterialsP4: providerone.dataPurchaseofrawmaterialsP4,
      dataPurchaseofrawmaterialsP5: providerone.dataPurchaseofrawmaterialsP5,
      dataPurchaseofrawmaterialsPrice: providerone
          .dataPurchaseofrawmaterialsPrice,
      dataPurchaseofrawmaterialsQuantity: providerone
          .dataPurchaseofrawmaterialsQuantity,
      dataPurchaseofrawmaterialsRetail: providerone
          .dataPurchaseofrawmaterialsRetail,
      dataPurchaseofrawmaterialsSubsidy: providerone
          .dataPurchaseofrawmaterialsSubsidy,
      dataPurchaseofrawmaterialsWholesale: providerone
          .dataPurchaseofrawmaterialsWholesale,

      members: [
        Member(
          dataFamilydetailsAgeoffamilymember: providerone
              .dataFamilydetailsAgeoffamilymember,
          dataFamilydetailsEducation: providerone.dataFamilydetailsEducation,
          dataFamilydetailsJob: providerone.dataFamilydetailsJob,
          dataFamilydetailsNameoffailyfmember: providerone
              .dataFamilydetailsNameoffailyfmember,
          dataFamilydetailsRelation: providerone.dataFamilydetailsRelation,
          dataFamilydetailsSkill: providerone.dataFamilydetailsSkill,
        )
      ],
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
        print(jsonData);
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
