
import 'dart:convert';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:main200623/constant/color_text.dart';
import 'package:main200623/model/add_model.dart';
import 'package:main200623/view/widgets/withoutborder.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../control/text_controller.dart';
import '../lists.dart';
import '../widgets/dropdown_container_model.dart';
import '../widgets/dropdown_nosearch.dart';
import '../widgets/elevate_click_button.dart';
import '../widgets/headings_between.dart';
import '../widgets/input_field.dart';
import 'familydata.dart';
import 'package:http/http.dart' as http;

enum CheckboxOption { applied, sanctioned, notApplied }


class PersonalPage extends StatefulWidget {
  const PersonalPage({Key? key}) : super(key: key);

  @override
  State<PersonalPage> createState() => _PersonalPageState();
}


class _PersonalPageState extends State<PersonalPage> {


  void submitForm() async {
    var providerone = Provider.of<TextMain>(context,listen: false);

    final AddData data = AddData(
      dataName: providerone.dataName,
      dataAddress: providerone.dataAddress,
      dataDistrict: providerone.dataDistrict,
      dataBlock: providerone.dataBlock,
      dataPanchayath: providerone.dataPanchayath,
      dataWard: providerone.dataWard,
      dataClass: providerone.dataClass,
      dataClass2: providerone.dataClass2,
      dataClass3: providerone.dataClass3,
      dataAmountinvested: providerone.dataAmountinvested,
      dataAnimalhusbendaryBusinesstype: providerone.dataAnimalhusbendaryBusinesstype,

      members: [
        Member(
          dataFamilydetailsAgeoffamilymember: providerone.dataFamilydetailsAgeoffamilymember,)],
    );

    final String jsonData = addDataToJson(data);

    // Save data locally using shared_preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('jsonData', jsonData);
    print(jsonData);

    // Check network connectivity
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      // No network connection available, handle accordingly
      print('No network connection available. Data saved locally.');
    } else {
      // Network connection available, proceed with data update
      print('Network connection available. Updating data...');
      updateAndClearData();
    }
  }

  void updateAndClearData() async {
    // Retrieve the locally saved data
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonData = prefs.getString('jsonData');

    // Check network connectivity
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      // No network connection available, handle accordingly
      print('No network connection available. Unable to update data.');
      return;
    }

    // Network connection available, proceed with data update

    // Update the JSON data as needed
    // ...

    // Send the updated JSON data to the server
    var response = await http.post('http://localhost:5000/api/user/insert' as Uri,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(jsonData),
    );

    // Check the response status code
    if (response.statusCode == 200) {
      // Data updated successfully
      print('Data updated successfully.');
    } else {
      // Error updating data
      print('Error updating data.');
    }

    // Clear the locally saved data
    prefs.remove('jsonData');
  }




  TextEditingController dataName = TextEditingController();
  TextEditingController dataAddress = TextEditingController();
  TextEditingController dataPhonenumber = TextEditingController();
  TextEditingController dataNameofNg = TextEditingController();
  TextEditingController dataNameofNGmember = TextEditingController();
  TextEditingController dataYearofstartingagriculture = TextEditingController();
  TextEditingController dataYearofstartingbussiness = TextEditingController();
  TextEditingController dataAmountinvested = TextEditingController();
  TextEditingController dataSupportrecived = TextEditingController();
  TextEditingController dataBusinessidea = TextEditingController();
  TextEditingController dataDistrict = TextEditingController();
  TextEditingController dataBlock = TextEditingController();
  TextEditingController dataPanchayth = TextEditingController();
  TextEditingController dataWard = TextEditingController();
  TextEditingController dataClass = TextEditingController();
  TextEditingController dataClass2 = TextEditingController();
  TextEditingController dataClass3 = TextEditingController();
  TextEditingController dataFamilyincome = TextEditingController();
  TextEditingController datalanddetailslandarea = TextEditingController();
  TextEditingController dataSupport = TextEditingController();
  TextEditingController datalanddetailsagricultureland = TextEditingController();
  TextEditingController dataInfraOthers = TextEditingController();
List dataAnimalhusbendaryBusinesstype = [];
  List dataclass3 = [];
  List dataSourceofinvestment = [];
  bool isYesSelected = false;
  String cdsNumber = '';
  String cdsName = '';

  CheckboxOption selectedOption = CheckboxOption.notApplied;
  String totalInvestment = '';
  String dateOfLoanApplication = '';

  // --------------------DateController---------------
  TextEditingController datePickerController = TextEditingController();
  TextEditingController selectedDateController = TextEditingController();

  // ----------------------------------------------------

  onTapFunction({required BuildContext context}) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      lastDate: DateTime.now(),
      firstDate: DateTime(2015),
      initialDate: DateTime.now(),
    );


    if (pickedDate == null) return;
    String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);

    datePickerController.text = formattedDate;
  }


  onTapFunction2({required BuildContext context}) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      lastDate: DateTime.now(),
      firstDate: DateTime(2015),
      initialDate: DateTime.now(),
    );


    if (pickedDate == null) return;
    String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);

    selectedDateController.text = formattedDate;
  }

  @override
  Widget build(BuildContext context) {

    var providerone = Provider.of<TextMain>(context,listen: false);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: app_theam,
        ),
        body: Consumer(
          builder: (context, value, child) =>SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                NoSearchDropdown(
                  items: districts,
                  onChanged: (value) {
                    providerone.updateDataDistrict(value);
                  },
                  selecteditem: 'ജില്ല',
                ),
                DropdownContainerModel(
                  onChanged: (value) {
                    providerone.updateDataBlock(value);
                  },
                  hint: 'ബ്ലോക്ക്',
                  items: block,
                ),
                DropdownContainerModel(
                    onChanged: (value) {
                    }, items: panchayth, hint: 'പഞ്ചായത്ത്'),
                InputField(
                  hint: 'വാർഡ്',
                  controller: dataWard,
                  keytype: TextInputType.number,
                  onchanged: (value) {
                    int? parsedValue = int.tryParse(value);
                    providerone.updateDataWard(parsedValue);
                  },
                ),
                InputField(
                  hint: 'സംരംഭകയുടെ പേര്',
                  controller: dataName,
                  onchanged: (value) {
                      providerone.updateDataName(value);
                  },
                ),
                InputField(
                    hint: 'വിലാസം',
                    controller: dataAddress,
                    onchanged: (value) {
                      setState(() {
                        providerone.updateDataAddress(value);
                      });
                    }),
                InputField(
                    hint: 'ഫോൺ നമ്പർ',
                    controller: dataPhonenumber,
                    onchanged: (value) {
                      int? parsedValue = int.tryParse(value);
                      providerone.updateDataPhonenumber(parsedValue);
                    },
                    keytype: TextInputType.number),
                NoSearchDropdown(
                    onChanged: (value) {
                      providerone.updateDataClass(value);
                    },
                    items: dataclass,
                    selecteditem: 'കുടുംബ അവസ്ഥ'),
                NoSearchDropdown(
                    onChanged: (value) {
                      providerone.updateDataClass2(value);
                    }, items: dataclass2, selecteditem: 'വിഭാഗം'),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MultiSelectFormField(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black)),
                    title: Text(
                      'പ്രത്യേക വിഭാഗം',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    dataSource: options,
                    textField: 'text',
                    valueField: 'value',
                    okButtonLabel: 'OK',
                    cancelButtonLabel: 'CANCEL',
                    // hintText: 'Please select one or more options',
                    initialValue: dataclass3,
                    onSaved: (value) {
                      if (value == null) return;
                   providerone.updateDataClass3(value);
                    },
                  ),
                ),
                NoSearchDropdown(
                    onChanged: (value) {
                      providerone.updateDataFamilyincome(value);
                    },
                    items: familyincome,
                    selecteditem: 'കുടുംബ മാസവരുമാനം'),
                InputField(
                    hint: 'അയൽക്കൂട്ടത്തിന്റെ പേര്',
                    controller: dataNameofNg,
                    onchanged: (value) {
                      providerone.updateDataNameofNg(value);
                    }),
                InputField(
                    hint: 'അയൽക്കൂട്ട അംഗത്തിന്റെ പേര്',
                    controller: dataNameofNGmember,
                    onchanged: (value) {
                      providerone.updateDataNameofNGmember(value);
                    }),
                NoSearchDropdown(
                    onChanged: (value) {
                      providerone.updateDataRoleinNg(value);
                    },
                    items: position,
                    selecteditem: 'അയൽക്കൂട്ടത്തിലെ പദവി'),
                NoSearchDropdown(
                    onChanged: (value) {
                      providerone.updateDataHouseownership(value);
                    }, items: house, selecteditem: 'വീട് '),
                InputField(
                  hint: 'പുരയിടം ( സെന്റ്)',
                  controller: datalanddetailslandarea,
                  onchanged: (value) {
                    int? parsedValue = int.tryParse(value);
                    providerone.updateDataLanddetailsLandarea(parsedValue);
                  },
                  keytype: TextInputType.number,
                ),
                InputField(
                  hint: ' നിലം (സെന്റ്)',
                  controller: datalanddetailsagricultureland,
                  onchanged: (value) {
                    int? parsedValue = int.tryParse(value);
                    providerone.updateDataLanddetailsAgricultureland(parsedValue);
                  },
                  keytype: TextInputType.number,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MultiSelectFormField(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.black)),
                    title: Text(
                      'മൃഗ സംരക്ഷണ മേഖലയിൽ ചെയ്യുന്ന ബിസിനസ്സ് ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    dataSource: businesstype,
                    textField: 'disply',
                    valueField: 'value',
                    okButtonLabel: 'OK',
                    cancelButtonLabel: 'CANCEL',
                    // hintText: 'Please select one or more options',
                    initialValue: dataAnimalhusbendaryBusinesstype,
                    onSaved: (value) {
                          providerone.updateDataAnimalhusbendaryBusinesstype(value);
                    }
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Text(
                          'സംരംഭം CDSൽ  രജിസ്റ്റർ ചെയ്‌തിട്ടുണ്ടോ ? ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        CheckboxListTile(
                          title: Text('Yes'),
                          value: isYesSelected,
                          onChanged: (value) {
                            setState(() {
                              isYesSelected = value!;
                            });
                          },
                        ),
                        CheckboxListTile(
                          title: Text('No'),
                          value: !isYesSelected,
                          onChanged: (value) {
                            setState(() {
                              isYesSelected = !value!;
                            });
                          },
                        ),
                        if (isYesSelected) ...[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              onChanged: (value) {
                                setState(() {
                                  cdsNumber = value;
                                });
                              },
                              decoration: InputDecoration(
                                labelText: 'CDS രജിസ്റ്റർ ചെയ്‌ത നമ്പർ ',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              onChanged: (value) {
                                setState(() {
                                  cdsName = value;
                                });
                              },
                              decoration: InputDecoration(
                                labelText: 'CDS രജിസ്റ്റർ ചെയ്‌ത പേര് ',
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
                NoSearchDropdown(
                    onChanged: (value) {},
                    items: enterpricetype,
                    selecteditem: 'സംരഭം തരം'),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextField(
                      controller: datePickerController,
                      readOnly: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'കാർഷിക ഉപജീവനം ആരംഭിച്ച വർഷം',
                      ),
                      onTap: () => onTapFunction(context: context),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextField(
                      controller: selectedDateController,
                      readOnly: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'കാർഷിക ഉപജീവനം ആരംഭിച്ച വർഷം',
                      ),
                      onTap: () => onTapFunction2(context: context),
                    ),
                  ),
                ),
                InputField(
                  hint: 'ഇതുവരെ സംരംഭത്തിൽ മുടക്കിയ  തുക',
                  controller: dataAmountinvested,
                  onchanged: (value) {

                  },
                  keytype: TextInputType.number,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MultiSelectFormField(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.black)),
                    title: Text(
                      'മുടക്കുമുതൽ കണ്ടെത്തിയത് എവിടെനിന്ന് ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    dataSource: sourceofinvestment,
                    textField: 'source',
                    valueField: 'value',
                    okButtonLabel: 'OK',
                    cancelButtonLabel: 'CANCEL',
                    // hintText: 'Please select one or more options',
                    initialValue: dataSourceofinvestment,
                    onSaved: (value) {
                      if (value == null) return;

                    },
                  ),
                ),
                InputField(
                    hint: 'ലഭിച്ച പിന്തുണകൾ',
                    controller: dataSupportrecived,
                    onchanged: (value) {}),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Headings(text: 'ലോൺ'),
                      ),
                      CheckboxListTile(
                        title: Text('Applied'),
                        value: selectedOption == CheckboxOption.applied,
                        onChanged: (value) {
                          if (value ?? false) {
                            setState(() {
                              selectedOption = CheckboxOption.applied;
                            });
                            // updateDataLoan('applied');
                          }
                        },
                      ),
                      CheckboxListTile(
                        title: Text('Sanctioned'),
                        value: selectedOption == CheckboxOption.sanctioned,
                        onChanged: (value) {
                          if (value ?? false) {
                            setState(() {
                              selectedOption = CheckboxOption.sanctioned;
                            });
                            // updateDataLoan('sanctioned');
                          }
                        },
                      ),
                      CheckboxListTile(
                        title: Text('Not Applied'),
                        value: selectedOption == CheckboxOption.notApplied,
                        onChanged: (value) {
                          if (value ?? false) {
                            setState(() {
                              selectedOption = CheckboxOption.notApplied;
                            });
                            // updateDataLoan('notApplied');
                          }
                        },
                      ),
                      if (selectedOption == CheckboxOption.applied ||
                          selectedOption == CheckboxOption.sanctioned) ...[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              TextField(
                                onChanged: (value) {
                                  setState(() {
                                    totalInvestment = value;
                                  });
                                },
                                decoration: InputDecoration(
                                  labelText: 'തുക',
                                ),
                              ),
                              TextField(
                                onChanged: (value) {
                                  setState(() {
                                    dateOfLoanApplication = value;
                                  });
                                },
                                decoration: InputDecoration(
                                  labelText: 'തീയതി',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black),
                  ),
                  child: Column(
                    children: [
                      Headings(text: 'അടിസ്ഥാന സൗകര്യം '),
                      DropNoBorder(onChanged: (value){}, items:condition, selecteditem: 'ഷെഡ് / കൂട്'),
                      DropNoBorder(onChanged: (value){}, items:condition, selecteditem: 'വെസ്റ്റേജ്'),
                      DropNoBorder(onChanged: (value){}, items:condition, selecteditem: 'ബയോഗ്യാസ്'),
                      DropNoBorder(onChanged: (value){}, items:condition, selecteditem: 'ഉപകരണങ്ങൾ'),
                      InputField(hint: 'മറ്റുള്ളവ ', controller: dataInfraOthers,onchanged: (value) {},),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MultiSelectFormField(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.black)),
                    title: Text(
                      'ആവശ്യമായ പിൻതുണ/സഹായം  ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    dataSource: sourceofinvestment,
                    textField: 'source',
                    valueField: 'value',
                    okButtonLabel: 'OK',
                    cancelButtonLabel: 'CANCEL',
                    // hintText: 'Please select one or more options',
                    initialValue: dataSourceofinvestment,
                    onSaved: (value) {
                      if (value == null) return;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MultiSelectFormField(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.black)),
                    title: Text(
                      'തൊഴിലുറപ്പ് സഹായം ആവശ്യമാണോ  ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    dataSource: sourceofinvestment,
                    textField: 'source',
                    valueField: 'value',
                    okButtonLabel: 'OK',
                    cancelButtonLabel: 'CANCEL',
                    // hintText: 'Please select one or more options',
                    initialValue: dataSourceofinvestment,
                    onSaved: (value) {
                      if (value == null) return;
                    },
                  ),
                ),
                ElevateClick(ontap: (){
                  submitForm();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => FamilyData(),));
                }, text: 'Next'),
              ]),
            ),
          ),
        ));
  }
}
