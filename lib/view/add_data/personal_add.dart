import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:main200623/constant/color_text.dart';
import 'package:main200623/view/widgets/withoutborder.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:provider/provider.dart';
import '../../control/text_controller.dart';
import '../lists.dart';
import '../widgets/dropdown_nosearch.dart';
import '../widgets/elevate_click_button.dart';
import '../widgets/headings_between.dart';
import '../widgets/input_field.dart';
import 'package:http/http.dart' as http;
import 'familydata.dart';


enum CheckboxOption { applied, sanctioned, notApplied }


class PersonalPage extends StatefulWidget {
  const PersonalPage({Key? key}) : super(key: key);

  @override
  State<PersonalPage> createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {

  String name = '';

  String? selectedDistrict;
  String? selectedBlocks;

  @override
  void initState() {
    super.initState();
    fetchDistricts();
  }


  List<String> districts = []; // Declare a global list variable

  Future<void> fetchDistricts() async {
    try {
      final response = await http.get(Uri.parse('http://192.168.1.43:5000/api/user/district'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          districts = List<String>.from(data); // Assign fetched data to the global list
          // selectedDistrict;
          // print(selectedDistrict);
        });
      } else {
        throw Exception('Failed to fetch districts');
      }
    } catch (e) {
      // Handle error
      print('Error fetching districts: $e');
    }
  }

  List<String> blocks = [];

  Future<void> fetchBlocks(String selectedDistrict) async {

    try {
      final response = await http.get(Uri.parse('http://192.168.1.43:5000/api/user/blocks/$selectedDistrict'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          blocks = List<String>.from(data);
          print(blocks);
        });
      } else {
        throw Exception('Failed to fetch blocks');
      }
    } catch (e) {
      // Handle error
      print('Error fetching blocks: $e');
    }
  }

  List<String> panchaths = [];

  Future<void> fetchPanchayth(String selectedBlocks) async {

    try {
      final response = await http.get(Uri.parse('http://192.168.1.43:5000/api/user/Panchayat/$selectedBlocks'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          panchaths = List<String>.from(data);
          print(panchaths);
        });
      } else {
        throw Exception('Failed to fetch blocks');
      }
    } catch (e) {
      // Handle error
      print('Error fetching blocks: $e');
    }
  }

  String? valueItem;
  List<String> listItem = [];
  String? newval;
  List<String> newvalitem = [];
  String? panchaythvalue;
  List<String> panchaythvaluelist = [];

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
  TextEditingController datalanddetailsagricultureland = TextEditingController();
  TextEditingController dataInfraOthers = TextEditingController();
  TextEditingController dataLanddetails1Landforgrass = TextEditingController();
  TextEditingController datanumberofgroupmembers = TextEditingController();
  List dataSupport = [];
  List dataMgnregasupport = [];
  List dataAnimalhusbendaryBusinesstype = [];
  List dataclass3 = [];
  List dataSourceofinvestment = [];
  bool isYesSelected = false;
  String cdsNumber = '';
  String cdsName = '';

  CheckboxOption selectedOption = CheckboxOption.notApplied;
  String totalInvestment = '';
  String dateOfLoanApplication = '';

  // // --------------------DateController---------------
  // TextEditingController datePickerController = TextEditingController();
  // TextEditingController selectedDateController = TextEditingController();
  //
  // // ----------------------------------------------------

  onTapFunction({required BuildContext context}) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      lastDate: DateTime.now(),
      firstDate: DateTime(2015),
      initialDate: DateTime.now(),
    );

    if (pickedDate == null) return;
    String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
    dataYearofstartingbussiness.text = formattedDate;
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
    dataYearofstartingagriculture.text = formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    var providerone = Provider.of<TextMain>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: app_theam,
        ),
        body: Consumer(
          builder: (context, value, child) => SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(children: [
                NoSearchDropdown(
                  items: districts,
                    onChanged: (value) {
                      setState(() {
                        selectedDistrict = value;
                        fetchBlocks(selectedDistrict!);
                      });
                      providerone.updateDataDistrict(value);
                      },
                  selecteditem: 'ജില്ല',
                ),

                NoSearchDropdown(
                  onChanged: (value) {
                    setState(() {
                      selectedBlocks = value;
                      fetchPanchayth(selectedBlocks!);
                    });
                    providerone.updateDataBlock(value);
                  },
                  selecteditem: 'ബ്ലോക്ക്',
                  items: blocks,
                ),
                NoSearchDropdown(
                    onChanged: (value) {
                      providerone.updateDataPanchayath(value);
                    },
                    items: panchaths,
                    selecteditem: 'പഞ്ചായത്ത്'),
                InputField(
                  hint: 'വാർഡ്',
                  controller: dataWard,
                  keytype: TextInputType.number,
                  onchanged: (value) {
                    int? valuee = int.tryParse(value);
                    providerone.updateDataWard(valuee);
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
                    },
                    items: dataclass2,
                    selecteditem: 'വിഭാഗം'),
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
                      print(value);
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
                    },
                    items: house,
                    selecteditem: 'വീട് '),
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
                      }),
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
                            providerone.updateDataAnimalhusbendaryCdsregistration('Yes');
                          },
                        ),
                        CheckboxListTile(
                          title: Text('No'),
                          value: !isYesSelected,
                          onChanged: (value) {
                            setState(() {
                              isYesSelected = !value!;

                            });
                            providerone.updateDataAnimalhusbendaryCdsregistration('No');
                          },
                        ),
                        if (isYesSelected) ...[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              onChanged: (value) {
                                // setState(() {
                                //   cdsNumber = value;
                                // });
                                providerone
                                    .updateDataAnimalhusbendaryRegdetailsRegnumber(
                                        value);
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
                                providerone.updateDataAnimalhusbendaryRegdetailsCdsunitname(value);
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
                    onChanged: (value) {
                      providerone.updateDataEnterpisetype(value);
                    },
                    items: enterpricetype,
                    selecteditem: 'സംരഭം തരം'),
                InputField(keytype: TextInputType.number,
                    hint: 'no of Group members', controller: datanumberofgroupmembers, onchanged: (value){
                  providerone.updateDataNoofgroupmembers(value);
                }),

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
                      controller: dataYearofstartingagriculture,
                      onChanged: (value){
                        providerone.updateDataYearofstartingagriculture(value);
                      },
                      readOnly: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'കാർഷിക ഉപജീവനം ആരംഭിച്ച വർഷം',
                      ),
                      onTap: () {
                        onTapFunction(context: context);
                      }
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
                      controller: dataYearofstartingbussiness,
                      onChanged: (value){
                        providerone.updateDataYearofstartingbussiness(value);
                      },
                      readOnly: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'കാർഷിക ഉപജീവനം ആരംഭിച്ച വർഷം',
                      ),
                      onTap: () {
                        onTapFunction2(context: context);
                      }
                    ),
                  ),
                ),
                InputField(
                  hint: 'ഇതുവരെ സംരംഭത്തിൽ മുടക്കിയ  തുക',
                  controller: dataAmountinvested,
                  onchanged: (value) {
                    int? valuee = int.tryParse(value);
                    providerone.updateDataAmountinvested(valuee);
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
                      providerone.updateDataSourceofinvestment(value);}
                  ),
                ),
                InputField(
                    hint: 'ലഭിച്ച പിന്തുണകൾ',
                    controller: dataSupportrecived,
                    onchanged: (value) {
                      providerone.updateDataSupportrecived(value);
                    }),
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
                            providerone.updateDataLoan('Applied');
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
                            providerone.updateDataLoan('Sanctioned');
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
                            providerone.updateDataLoan('Not Applied');

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
                                  int? valuee = int.tryParse(value);
                                  providerone.updateDataTotalinvestment(valuee);
                                },
                                decoration: InputDecoration(
                                  labelText: 'തുക',
                                ),
                              ),
                              TextField(
                                onChanged: (value) {
                                  providerone.updateDataDateofLoanApplication(value);},
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
                      Headings(text: 'അടിസ്ഥാന സൗകര്യം '),
                      DropNoBorder(
                          onChanged: (value) {
                            providerone.updateDataInfraShed(value);
                          },
                          items: condition,
                          selecteditem: 'ഷെഡ് / കൂട്'),
                      DropNoBorder(
                          onChanged: (value) {
                            providerone.updateDataInfraWastage(value);
                          },
                          items: condition,
                          selecteditem: 'വെസ്റ്റേജ്'),
                      DropNoBorder(
                          onChanged: (value) {
                            providerone.updateDataInfraBiogas(value);
                          },
                          items: condition,
                          selecteditem: 'ബയോഗ്യാസ്'),
                      DropNoBorder(
                          onChanged: (value) {
                            providerone.updateDataInfraEquipments(value);
                          },
                          items: condition,
                          selecteditem: 'ഉപകരണങ്ങൾ'),
                      InputField(
                        hint: 'മറ്റുള്ളവ ',
                        controller: dataInfraOthers,
                        onchanged: (value) {
                          providerone.updateDataInfraOthers(value);
                        },
                      ),
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
                        providerone
                            .updateDataAnimalhusbendaryBusinesstype(value);
                      }),
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
                    initialValue: dataSupport,
                    onSaved: (value) {
                      if (value == null) return;
                      providerone.updateDataSupport(value);
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
                    initialValue: dataMgnregasupport,
                    onSaved: (value) {
                      if (value == null) return;
                      providerone.updateDataMgnregAsupport(value);
                    },
                  ),
                ),
                ElevateClick(
                    ontap: () {
                      // print(selectedDistrict);
                      // print(fetchBlocks(selectedDistrict!));
                      // print(blocks);

                      Navigator.push(context, MaterialPageRoute(builder: (context) => FamilyData(),));
                    },
                    text: 'Next'),
              ]),
            ),
          ),
        ));
  }
}
