import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:main200623/constant/color_text.dart';
import 'package:main200623/view/login.dart';
import 'package:main200623/view/widgets/withoutborder.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:provider/provider.dart';
import '../../control/text_controller.dart';
import '../../services/add_api.dart';
import '../lists.dart';
import '../widgets/dropdown_nosearch.dart';
import '../widgets/elevate_click_button.dart';
import '../widgets/headings_between.dart';
import '../widgets/input_field.dart';
import 'package:http/http.dart' as http;
import 'updatefamilydata.dart';

enum CheckboxOption { applied, sanctioned, notApplied }

class UpdatePersonalPage extends StatefulWidget {
  const UpdatePersonalPage({Key? key, this.items}) : super(key: key);
  final items;

  @override
  State<UpdatePersonalPage> createState() => _UpdatePersonalPageState();
}

class _UpdatePersonalPageState extends State<UpdatePersonalPage> {
  String name = '';

  String? selectedDistrict;
  String? selectedBlocks;

  @override
  void initState() {
    super.initState();
    getData();
    fetchDistricts();
    // fetchBlocks(dataDistrict!);
    // fetchPanchayth(dataBlock!);
  }

  List<String> districts = []; // Declare a global list variable

  Future<void> fetchDistricts() async {
    try {
      final response = await http.get(Uri.parse('${api}user/district'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          districts =
              List<String>.from(data); // Assign fetched data to the global list
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
      final response =
          await http.get(Uri.parse('${api}user/blocks/$selectedDistrict'));
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
      final response =
          await http.get(Uri.parse('${api}user/Panchayat/$selectedBlocks'));

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

  Future<void> deleteDataonId(String dataId, String token) async {
    final apiUrl = '${api}auth/deleteUsers/$dataId';
    print(dataId);

    try {
      final response = await http.delete(
        Uri.parse(apiUrl),
        headers: {
          'Authorization': 'Bearer $token'
        }, // Pass the token in the request headers
      );

      if (response.statusCode == 200) {
        print('Data deletion successful');
      } else {
        print('Failed to delete data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error occurred during data deletion: $error');
    }
  }

  List dataSupport = [];
  List dataMgnregasupport = [];
  List dataAnimalhusbendaryBusinesstype = [];
  List dataclass3 = [];
  List dataSourceofinvestment = [];
  bool isYesSelected = false;
  String? group;

  String? dataDistrict;
  String? dataBlock;
  String? dataPanchayath;
  String? dataClass;
  String? dataClass2;
  List? dataClass3;
  String? dataFamilyincome;
  String? dataRoleinNg;
  String? dataHouseOwnership;
  String? dataEnterpisetype;
  String? dataInfraShed;
  String? dataInfraWastage;
  String? dataInfraBiogas;
  String? dataInfraEquipments;
  TextEditingController dataWard = TextEditingController();
  TextEditingController dataName = TextEditingController();
  TextEditingController dataAddress = TextEditingController();
  TextEditingController dataPhonenumber = TextEditingController();
  TextEditingController dataNameofNg = TextEditingController();
  TextEditingController dataNameofNGmember = TextEditingController();
  TextEditingController datalanddetailslandarea = TextEditingController();
  TextEditingController datalanddetailsagricultureland =
      TextEditingController();
  TextEditingController datanumberofgroupmembers = TextEditingController();
  TextEditingController dataYearofstartingagriculture = TextEditingController();
  TextEditingController dataYearofstartingbussiness = TextEditingController();
  TextEditingController dataInfraOthers = TextEditingController();
  TextEditingController dataothers2 = TextEditingController();
  TextEditingController dataSupportrecived = TextEditingController();
  TextEditingController dataAmountinvested = TextEditingController();
  TextEditingController dataAnimalhusbendaryRegdetailsRegnumber =
      TextEditingController();
  TextEditingController dataAnimalhusbendaryRegdetailsCdsunitname =
      TextEditingController();

  CheckboxOption selectedOption = CheckboxOption.notApplied;
  String totalInvestment = '';
  String dateOfLoanApplication = '';

  //  --------------------DateController---------------
  // TextEditingController datePickerController = TextEditingController();
  // TextEditingController selectedDateController = TextEditingController();
  //  ----------------------------------------------------

  onTapFunction({required BuildContext context}) async {
    var providerone = Provider.of<TextMain>(context);
    // var providerone = context.read();

    DateTime? pickedDate = await showDatePicker(
      context: context,
      lastDate: DateTime.now(),
      firstDate: DateTime(1990),
      initialDate: DateTime.now(),
    );

    if (pickedDate == null) return;
    String yearbusiness = DateFormat('dd-MM-yyyy').format(pickedDate);
    setState(() {
      dataYearofstartingbussiness.text = yearbusiness;
    });
    providerone.updateDataYearofstartingbussiness(yearbusiness);
    // print(yearbusiness);
  }

  onTapFunction2({required BuildContext context}) async {
    var providerone = Provider.of<TextMain>(context, listen: false);

    DateTime? pickedDate = await showDatePicker(
      context: context,
      lastDate: DateTime.now(),
      firstDate: DateTime(1990),
      initialDate: DateTime.now(),
    );

    if (pickedDate == null) return;
    String yearagriculture = DateFormat('dd-MM-yyyy').format(pickedDate);
    setState(() {
      dataYearofstartingagriculture.text = yearagriculture;
    });
    providerone.updateDataYearofstartingagriculture(yearagriculture);
    // print(yearagriculture);
  }

  @override
  Widget build(BuildContext context) {
    var providerone = Provider.of<TextMain>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('വ്യക്തിവിവരം '),
        centerTitle: true,
        backgroundColor: app_theam,
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Delete Confirmation'),
                    content: Text('Do you want to delete?'),
                    actions: <Widget>[
                      TextButton(
                        child: Text('Cancel'),
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the dialog
                        },
                      ),
                      TextButton(
                        child: Text('OK'),
                        onPressed: () {
                          var id = widget.items['data'][0]['_id'];
                          deleteDataonId(id, authToken!);
                          // Perform delete operation
                          // Add your delete logic here
                          Navigator.of(context).pop(); // Close the dialog
                        },
                      ),
                    ],
                  );
                },
              );
            },
            icon: Icon(Icons.delete),
          )
        ],
      ),
      body: Consumer(
        builder: (context, value, child) => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(children: [
              NoSearchDropdown(
                items: districts,
                selecteditem: dataDistrict,
                onChanged: (value) {
                  setState(() {
                    if (districts.contains(dataDistrict)) dataDistrict = value;
                    fetchBlocks(dataDistrict!);
                  });
                  providerone.updateDataDistrict(value);
                },
                item: 'ജില്ല',
              ),
              NoSearchDropdown(
                selecteditem: dataBlock,
                onChanged: (value) {
                  setState(() {
                    dataBlock = value;
                    fetchPanchayth(dataBlock!);
                  });
                  providerone.updateDataBlock(value);
                },
                item: 'ബ്ലോക്ക്',
                items: blocks,
              ),
              NoSearchDropdown(
                  selecteditem: dataPanchayath,
                  onChanged: (value) {
                    // setState(() {
                    //   selectedBlocks = value;
                    //   fetchPanchayth(selectedBlocks!);
                    // });
                    providerone.updateDataPanchayath(value);
                  },
                  items: panchaths,
                  item: 'പഞ്ചായത്ത്'),
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
                  setState(() {
                    dataName;
                  });
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
                  selecteditem: dataClass,
                  onChanged: (value) {
                    providerone.updateDataClass(value);
                  },
                  items: dataclass,
                  item: 'കുടുംബ അവസ്ഥ'),
              NoSearchDropdown(
                  selecteditem: dataClass2,
                  onChanged: (value) {
                    providerone.updateDataClass2(value);
                  },
                  items: dataclass2,
                  item: 'വിഭാഗം'),
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
                  selecteditem: dataFamilyincome,
                  onChanged: (value) {
                    providerone.updateDataFamilyincome(value);
                  },
                  items: familyincome,
                  item: 'കുടുംബ മാസവരുമാനം'),
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
                  selecteditem: dataRoleinNg,
                  onChanged: (value) {
                    providerone.updateDataRoleinNg(value);
                  },
                  items: position,
                  item: 'അയൽക്കൂട്ടത്തിലെ പദവി'),
              NoSearchDropdown(
                  selecteditem: dataHouseOwnership,
                  onChanged: (value) {
                    providerone.updateDataHouseownership(value);
                  },
                  items: house,
                  item: 'വീട് '),
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
                          providerone
                              .updateDataAnimalhusbendaryCdsregistration('Yes');
                        },
                      ),
                      CheckboxListTile(
                        title: Text('No'),
                        value: !isYesSelected,
                        onChanged: (value) {
                          setState(() {
                            isYesSelected = !value!;
                          });
                          providerone
                              .updateDataAnimalhusbendaryCdsregistration('No');
                        },
                      ),
                      if (isYesSelected) ...[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: dataAnimalhusbendaryRegdetailsRegnumber,
                            onChanged: (value) {
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
                            controller:
                                dataAnimalhusbendaryRegdetailsCdsunitname,
                            onChanged: (value) {
                              providerone
                                  .updateDataAnimalhusbendaryRegdetailsCdsunitname(
                                      value);
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
                  selecteditem: dataEnterpisetype,
                  onChanged: (value) {
                    setState(() {
                      group = value;
                    });
                    providerone.updateDataEnterpisetype(value);
                  },
                  items: enterpricetype,
                  item: 'സംരഭം തരം'),
              if (group == 'Group')
                InputField(
                    keytype: TextInputType.number,
                    hint: 'അംഗങ്ങളുടെ എണ്ണം',
                    controller: datanumberofgroupmembers,
                    onchanged: (value) {
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
                      readOnly: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'കാർഷിക ഉപജീവനം ആരംഭിച്ച വർഷം',
                      ),
                      onTap: () {
                        onTapFunction2(context: context);
                      }),
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
                      readOnly: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'കാർഷിക ഉപജീവനം ആരംഭിച്ച വർഷം',
                      ),
                      onTap: () {
                        onTapFunction(context: context);
                      }),
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
                      providerone.updateDataSourceofinvestment(value);
                    }),
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
                                providerone
                                    .updateDataDateofLoanApplication(value);
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
                        select: dataInfraShed,
                        onChanged: (value) {
                          providerone.updateDataInfraShed(value);
                        },
                        items: condition,
                        selecteditem: 'ഷെഡ് / കൂട്'),
                    DropNoBorder(
                        select: dataInfraWastage,
                        onChanged: (value) {
                          providerone.updateDataInfraWastage(value);
                        },
                        items: condition,
                        selecteditem: 'വെസ്റ്റേജ്'),
                    DropNoBorder(
                        select: dataInfraBiogas,
                        onChanged: (value) {
                          providerone.updateDataInfraBiogas(value);
                        },
                        items: condition,
                        selecteditem: 'ബയോഗ്യാസ്'),
                    DropNoBorder(
                        select: dataInfraEquipments,
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
                      providerone.updateDataAnimalhusbendaryBusinesstype(value);
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: MultiSelectFormField(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.black)),
                  title: Text(
                    'ആവശ്യമായ പിൻതുണ/സഹായം ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  dataSource: datasupprtlist,
                  textField: 'text',
                  valueField: 'value',
                  okButtonLabel: 'OK',
                  cancelButtonLabel: 'CANCEL',
                  // hintText: 'Please select one or more options',
                  initialValue: dataSupport,
                  onSaved: (value) {
                    setState(() {
                      dataSupport = value;
                    });
                    if (value == null) return;
                    providerone.updateDataSupport(value);
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              if (dataSupport.contains('Other Supports'))
                TextField(
                  controller: dataothers2,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black)),
                      labelText: 'മറ്റു പിന്തുണകൾ',
                      labelStyle: TextStyle(color: Colors.black)),
                  onChanged: (value) {
                    providerone.updateDataOthers2(value);
                  },
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
                  dataSource: datamgnregasupportlist,
                  textField: 'text',
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
                    changeData();
                    // print(widget.items['data'][0]['_id']);
                    // print(fetchBlocks(selectedDistrict!));
                    // print(blocks);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              UpdateFamilyData(items: widget.items),
                        ),);
                  },
                  text: 'Next'),
            ],),
          ),
        ),
      ),
    );
  }

  void getData() {
    // var providerone = context.read<TextMain>();

    var dataup = widget.items['data'][0];

    // providerone.updateDataBlock(dataup['data_Block'].toString());

    setState(() {
      dataDistrict = dataup['data_district'];
      dataBlock = dataup['data_Block'];
      dataPanchayath = dataup['data_Panchayath'].toString();
      dataWard.text = dataup["data_Ward"].toString();
      dataName.text = dataup["data_Name"].toString();
      dataAddress.text = dataup["data_Address"].toString();
      dataPhonenumber.text = dataup["data_Phonenumber"].toString();
      dataClass = dataup["data_Class"];
      dataClass2 = dataup["data_Class2"];
      dataClass3 = dataup["data_Class3"];
      dataFamilyincome = dataup["data_familyincome"];
      dataNameofNg.text = dataup["data_NameofNG"];
      dataNameofNGmember.text = dataup["data_NameofNGmember"];
      dataRoleinNg = dataup["data_roleinNG"];
      dataHouseOwnership = dataup["data_houseOwnership"].toString();
      datalanddetailslandarea.text =
          dataup["data_landdetails_landarea"].toString();
      datalanddetailsagricultureland.text =
          dataup['data_landdetails_agricultureland'].toString();
      dataEnterpisetype = dataup["data_enterpisetype"];
      dataYearofstartingbussiness.text =
          dataup["data_yearofstartingbussiness"].toString();
      dataYearofstartingagriculture.text =
          dataup["data_Yearofstartingagriculture"].toString();
      dataAmountinvested.text = dataup["data_amountinvested"].toString();
      dataSupportrecived.text = dataup["data_supportrecived"].toString();
      dataInfraShed = dataup["data_Infra_Shed"];
      dataInfraWastage = dataup["data_Infra_wastage"];
      dataInfraBiogas = dataup["data_Infra_biogas"];
      dataInfraEquipments = dataup["data_Infra_equipments"];
      dataInfraOthers.text = dataup["data_Infra_others"].toString();
      dataAnimalhusbendaryRegdetailsCdsunitname.text =
          dataup["data_Animalhusbendary_regdetails_cdsunitname"].toString();
      dataAnimalhusbendaryRegdetailsRegnumber.text =
          dataup["data_Animalhusbendary_regdetails_regnumber"].toString();
    });
  }

  void changeData() {
    var providerone = context.read<TextMain>();

    providerone.updateDataDistrict(dataDistrict);
    providerone.updateDataBlock(dataBlock);
    providerone.updateDataPanchayath(dataPanchayath);
    String dataWardText = dataWard.text;
    int dataward = int.parse(dataWardText);
    providerone.updateDataWard(dataward);
    providerone.updateDataName(dataName.text);
    providerone.updateDataAddress(dataAddress.text);
    String phonenumber = dataPhonenumber.text;
    int phoneNumber = int.parse(phonenumber);
    providerone.updateDataPhonenumber(phoneNumber);
    providerone.updateDataClass(dataClass);
    providerone.updateDataClass2(dataClass2);
    providerone.updateDataClass3(dataClass3);
    providerone.updateDataFamilyincome(dataFamilyincome);
    providerone.updateDataNameofNg(dataNameofNg.text);
    providerone.updateDataNameofNGmember(dataNameofNGmember.text);
    providerone.updateDataRoleinNg(dataRoleinNg);
    providerone.updateDataHouseownership(dataHouseOwnership);
    String landarea = datalanddetailslandarea.text;
    int detailslandarea = int.parse(landarea);
    providerone.updateDataLanddetailsLandarea(detailslandarea);
    String agricultureland = datalanddetailsagricultureland.text;
    int detailsagricultureland = int.parse(agricultureland);
    providerone.updateDataLanddetailsAgricultureland(detailsagricultureland);
    providerone.updateDataEnterpisetype(dataEnterpisetype);
    providerone
        .updateDataYearofstartingbussiness(dataYearofstartingbussiness.text);
    providerone.updateDataYearofstartingagriculture(
        dataYearofstartingagriculture.text);
    String invested = dataAmountinvested.text;
    int amountinvested = int.parse(invested);
    providerone.updateDataAmountinvested(amountinvested);
    providerone.updateDataSupportrecived(dataSupportrecived.text);
    providerone.updateDataInfraShed(dataInfraShed);
    providerone.updateDataInfraWastage(dataInfraWastage);
    providerone.updateDataInfraBiogas(dataInfraBiogas);
    providerone.updateDataInfraEquipments(dataInfraEquipments);
    providerone.updateDataInfraOthers(dataInfraOthers.text);
    providerone.updateDataAnimalhusbendaryRegdetailsCdsunitname(
        dataAnimalhusbendaryRegdetailsCdsunitname.text);
    providerone.updateDataAnimalhusbendaryRegdetailsRegnumber(
        dataAnimalhusbendaryRegdetailsRegnumber.text);
  }
}
