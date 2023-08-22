import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:main200623/constant/color_text.dart';
import 'package:main200623/view/widgets/withoutborder.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    fetchDistricts();
    getData();
    Register();
    getSavedData();
  }

  Register() {
    if (dataAnimalhusbendaryRegdetailsRegnumber.text.isNotEmpty) {
      isYesSelected = true;
    }
  }

  List<String> districts = []; // Declare a global list variable

  Future<void> fetchDistricts() async {
    try {
      final response = await http.get(Uri.parse('${api}user/district'));

      if (response.statusCode == 200) {
        changeData();
        final data = json.decode(response.body);
        setState(() {
          districts =
              List<String>.from(data); // Assign fetched data to the global list
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
          // print(blocks);
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
          // print(panchaths);
        });
      } else {
        throw Exception('Failed to fetch blocks');
      }
    } catch (e) {
      // Handle error
      print('Error fetching blocks: $e');
    }
  }

  List dataSupport = [];
  List dataTrainingsrequired = [];
  List dataMgnregAsupport = [];
  List dataAnimalhusbendaryBusinesstype = [];
  List dataclass3 = [];

  // List sourceofinvestment = [];
  List dataSourceofinvestment = [];
  List traningrequaredlist = [];
  bool isYesSelected = false;
  String? group;

  // List? Class3;
  List animalhusbendaryBusinesstype = [];
  List? _sourceofinvestment;
  List? _support;
  List _dataTrainingsrequired = [];

  // List? _mgnregasupport;
  String? dataLanddetails1Landforgras;

  String? id;
  String? dataDistrict;
  String? dataBlock;
  String? dataPanchayath;
  String? dataClass;
  String? dataWard;
  String? dataClass2;
  List dataClass3 = [];
  String? dataFamilyincome;
  String? dataRoleinNg;
  String? dataHouseOwnership;
  String? dataEnterpisetype;
  String? dataInfraShed;
  String? dataInfraWastage;
  String? dataInfraBiogas;
  String? dataInfraEquipments;
  String? panchayth_;
  String? district_;
  String? block_;

  String? dataAnimalhusbendarycdsregistration;

  // TextEditingController dataWard = TextEditingController();
  TextEditingController dataName = TextEditingController();
  TextEditingController dataAddress = TextEditingController();
  TextEditingController dataPhonenumber = TextEditingController();
  TextEditingController dataNameofNg = TextEditingController();
  TextEditingController dataNameofNGmember = TextEditingController();
  TextEditingController datalanddetailslandarea = TextEditingController();
  TextEditingController dataAnimalhusbendaryothers0 = TextEditingController();
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
  TextEditingController dataloandetailstotalinvestment =
      TextEditingController();
  TextEditingController dataLanddetails1Qtyofownland = TextEditingController();
  TextEditingController dataLanddetails1Qtyofleasedland =
      TextEditingController();
  String? dataLanddetails1Landforgrass;
  CheckboxOption selectedOption = CheckboxOption.notApplied;
  String dateOfLoanApplication = '';

  //  --------------------DateController---------------
  // TextEditingController datePickerController = TextEditingController();
  // TextEditingController selectedDateController = TextEditingController();
  //  ----------------------------------------------------

  onTapFunction({required BuildContext context}) async {
    var providerone = Provider.of<TextMain>(context, listen: false);

    DateTime? pickedDate = await showDatePicker(
      context: context,
      lastDate: DateTime.now(),
      firstDate: DateTime(1990),
      initialDate: DateTime.now(),
    );

    if (pickedDate == null) return;
    String value = DateFormat('dd-MM-yyyy').format(pickedDate);
    setState(() {
      dataYearofstartingbussiness.text = value;
    });
    providerone.updateDataYearofstartingbussiness(value);
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
    String value = DateFormat('dd-MM-yyyy').format(pickedDate);
    setState(() {
      dataYearofstartingagriculture.text = value;
    });
    providerone.updateDataYearofstartingagriculture(value);
  }

  // String? dateofLoanApplication;

  TextEditingController dateofLoanApplication = TextEditingController();

  onTapFunction3({required BuildContext context}) async {
    var providerone = Provider.of<TextMain>(context, listen: false);

    DateTime? pickedDate = await showDatePicker(
      context: context,
      lastDate: DateTime.now(),
      firstDate: DateTime(1990),
      initialDate: DateTime.now(),
    );

    if (pickedDate == null) return;
    String value = DateFormat('dd-MM-yyyy').format(pickedDate);
    setState(() {
      dateofLoanApplication.text = value;
    });
    providerone.updateDataDateofLoanApplication(value);
    // print(yearagriculture);
  }

  Future<void> getSavedData() async {
    var providerone = Provider.of<TextMain>(context, listen: false);
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String district = prefs.getString('district') ?? '';
    String block = prefs.getString('block') ?? '';
    String panchayath = prefs.getString('panchayath') ?? '';

    if(panchayath != null || panchayath.isNotEmpty){
      setState(() {
        panchayth_ = panchayath;
        block_ = block;
        district_ = district;
      });

      providerone.updateDataDistrict(district_);
      providerone.updateDataBlock(block_);
      providerone.updateDataPanchayath(panchayth_);

    }
  }


  final _formKey = GlobalKey<FormState>();

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
          title: Text('വ്യക്തിവിവരം '),
          centerTitle: true,
          backgroundColor: app_theam,
        ),
        body: Consumer(
          builder: (context, value, child) => SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Form(
                // key: _formKey,
                child: Column(
                  children: [
                    // NoSearchDropdown(
                    //   items: districts,
                    //   selecteditem: dataDistrict,
                    //   onChanged: (value) {
                    //     setState(() {
                    //       dataDistrict = value;
                    //       fetchBlocks(dataDistrict!);
                    //     });
                    //     // print(id);
                    //     // });
                    //     providerone.updateDataDistrict(value);
                    //   },
                    //   item: 'ജില്ല',
                    // ),
                    // NoSearchDropdown(
                    //   selecteditem: dataBlock,
                    //   onChanged: (value) {
                    //     setState(() {
                    //       dataBlock = value;
                    //       fetchPanchayth(dataBlock!);
                    //     });
                    //
                    //     providerone.updateDataBlock(value);
                    //   },
                    //   item: 'ബ്ലോക്ക്',
                    //   items: blocks,
                    // ),
                    // NoSearchDropdown(
                    //     selecteditem: dataPanchayath,
                    //     onChanged: (value) {
                    //       // setState(() {
                    //       //   selectedBlocks = value;
                    //       //   fetchPanchayth(selectedBlocks!);
                    //       // });
                    //       providerone.updateDataPanchayath(value);
                    //     },
                    //     items: panchaths,
                    //     item: 'പഞ്ചായത്ത്'),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: Colors.black)),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Text('$district_',style: TextStyle(fontSize: 15),),
                            ],
                          ),
                        )),
                    SizedBox(height: 10,),

                    Container(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(color: Colors.black)),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Text('$block_',style: TextStyle(fontSize: 15),),
                            ],
                          ),
                        )),
                    SizedBox(height: 10,),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(color: Colors.black)),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Text('$panchayth_',style: TextStyle(fontSize: 15),),
                            ],
                          ),
                        )),

                    NoSearchDropdown(
                      selecteditem: dataWard,
                        onChanged: (value) {
                          int? valuee = int.tryParse(value);
                          providerone.updateDataWard(valuee);
                        },
                        items: ward,
                        item: 'വാർഡ്'),
                    InputField(
                      hint: 'സംരംഭകയുടെ പേര്',
                      controller: dataName,
                      onchanged: (value) {
                        // setState(() {
                        //   dataName;
                        // });
                        providerone.updateDataName(value);
                      },
                    ),
                    InputField(
                        hint: 'വിലാസം',
                        controller: dataAddress,
                        onchanged: (value) {
                          // setState(() {
                          providerone.updateDataAddress(value);
                          // });
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
                        items: dataclassadd,
                        item: 'കുടുംബ അവസ്ഥ'),
                    NoSearchDropdown(
                        selecteditem: dataClass2,
                        onChanged: (value) {
                          print(dataClass3);
                          print(dataSourceofinvestment);
                          print(dataAnimalhusbendaryBusinesstype);
                          print(dataMgnregAsupport);
                          print(dataSupport);
                          print(_dataTrainingsrequired);
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
                        initialValue:
                            options.contains(dataClass3) ? dataClass3 : [],
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This field is required';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          if (value == null) return;
                          // setState(() {
                          //   dataClass3 = value;
                          // });
                          providerone.updateDataClass3(value);
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
                          print(animalhusbendaryBusinesstype);
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
                        providerone
                            .updateDataLanddetailsAgricultureland(parsedValue);
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This field is required.';
                            }
                            return null;
                          },
                          initialValue: animalhusbendaryBusinesstype
                                      .isNotEmpty &&
                                  businesstype
                                      .contains(animalhusbendaryBusinesstype)
                              ? animalhusbendaryBusinesstype
                              : [],
                          onSaved: (value) {
                            providerone
                                .updateDataAnimalhusbendaryBusinesstype(value);
                          }),
                    ),
                    NoSearchDropdown(
                        selecteditem: dataLanddetails1Landforgrass,
                        onChanged: (value) {
                          dataLanddetails1Landforgras = value;
                          providerone.updateDataLanddetails1Landforgrass(value);
                        },
                        items: Landforgrass,
                        item: 'കൃഷിസ്ഥലം'),
                    if (dataLanddetails1Landforgras == 'OWN')
                      InputField(
                        hint: 'സ്വന്തം പുരയിടം ( സെന്റ്)',
                        controller: dataLanddetails1Qtyofownland,
                        onchanged: (value) {
                          int? parsedValue = int.tryParse(value);
                          providerone
                              .updateDataLanddetailsLandarea(parsedValue);
                        },
                        keytype: TextInputType.number,
                      ),
                    if (dataLanddetails1Landforgras == 'LEASED')
                      InputField(
                        hint: 'പാട്ടത്തിന് പുരയിടം ( സെന്റ്)',
                        controller: dataLanddetails1Qtyofleasedland,
                        onchanged: (value) {
                          int? parsedValue = int.tryParse(value);
                          providerone
                              .updateDataLanddetailsLandarea(parsedValue);
                        },
                        keytype: TextInputType.number,
                      ),
                    SizedBox(
                      height: 10,
                    ),
                    if (dataAnimalhusbendaryBusinesstype.contains('Others'))
                      InputField(
                          hint: 'മറ്റുള്ളവ',
                          controller: dataAnimalhusbendaryothers0,
                          onchanged: (value) {
                            providerone
                                .updateDataAnimalhusbendaryOthers0(value);
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
                                  if (!value) {
                                    dataAnimalhusbendaryRegdetailsRegnumber
                                        .clear();
                                  }
                                  providerone
                                      .updateDataAnimalhusbendaryCdsregistration(
                                          value ? 'Yes' : 'No');
                                });
                              },
                            ),
                            CheckboxListTile(
                              title: Text('No'),
                              value: !isYesSelected,
                              onChanged: (value) {
                                setState(() {
                                  isYesSelected = !value!;
                                  providerone
                                      .updateDataAnimalhusbendaryCdsregistration(
                                          value ? 'No' : 'Yes');
                                });
                              },
                            ),
                            if (isYesSelected ||
                                dataAnimalhusbendaryRegdetailsRegnumber
                                    .text.isNotEmpty) ...[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  controller:
                                      dataAnimalhusbendaryRegdetailsRegnumber,
                                  onChanged: (value) {
                                    if (int.tryParse(value) != null) {
                                      setState(() {
                                        isYesSelected = true;
                                      });
                                    } else {
                                      setState(() {
                                        isYesSelected = false;
                                      });
                                    }
                                    providerone
                                        .updateDataAnimalhusbendaryRegdetailsRegnumber(
                                            value);
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'CDS രജിസ്റ്റർ ചെയ്‌ത നമ്പർ',
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
                              labelText: 'കാർഷിക ഉപജീവനം ആരംഭിച്ച വർഷം',
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
                              labelText: 'ബിസിനസ് ആരംഭിച്ച വർഷം',
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
                          validator: (value) {
                            if (value == null) {
                              return 'This field is required.';
                            }
                            return null;
                          },
                          initialValue: dataSourceofinvestment.isNotEmpty &&
                                  sourceofinvestment
                                      .contains(dataSourceofinvestment)
                              ? dataSourceofinvestment
                              : [],
                          onSaved: (value) {
                            setState(() {
                              // dataSourceofinvestment = value;
                            });
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
                                    controller: dataloandetailstotalinvestment,
                                    onChanged: (value) {
                                      int? valuee = int.tryParse(value);
                                      providerone
                                          .updateDataTotalinvestment(valuee);
                                    },
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      labelText: 'തുക',
                                    ),
                                  ),
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: TextField(
                                          controller: dateofLoanApplication,
                                          readOnly: true,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            labelText: 'തീയതി',
                                          ),
                                          onTap: () {
                                            onTapFunction3(context: context);
                                          }),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  // TextField(
                                  //   onChanged: (value) {
                                  //     providerone
                                  //         .updateDataDateofLoanApplication(value);
                                  //   },
                                  //   decoration: InputDecoration(
                                  //     labelText: 'തീയതി',
                                  //   ),
                                  // ),
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
                                print(_dataTrainingsrequired);
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
                          'ആവശ്യമായ പിൻതുണ/സഹായം ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        dataSource: datasupprtlistss,
                        textField: 'text',
                        valueField: 'value',
                        okButtonLabel: 'OK',
                        cancelButtonLabel: 'CANCEL',
                        // hintText: 'Please select one or more options',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This field is required.';
                          }
                          return null;
                        },
                        initialValue: dataSupport.isNotEmpty &&
                                dataSupport.contains(datasupprtlistss)
                            ? dataSupport
                            : [],
                        onSaved: (value) {
                          try {
                            setState(() {
                              dataSupport = value;
                            });
                            providerone.updateDataSupport(value);
                          } catch (e) {
                            // dataSupport.clear();
                            // Handle any exceptions that might occur during the onSaved process
                            print("Error datasupport: $e");
                            // You can show an error message to the user here if needed
                          }
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
                    SizedBox(height: 10),
                    Container(
                      // width: MediaQuery.of(context).size.width * .8,
                      child: MultiSelectFormField(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Colors.black)),
                          title: Text(
                            'പരിശീലനം വേണ്ട മേഖല ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          dataSource: traingrequared,
                          textField: 'text',
                          valueField: 'value',
                          okButtonLabel: 'OK',
                          cancelButtonLabel: 'CANCEL',
                          // hintText: 'Please select one or more options',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This field is required.';
                            }
                            return null;
                          },
                          initialValue: _dataTrainingsrequired.isNotEmpty &&
                                  traingrequared
                                      .contains(_dataTrainingsrequired)
                              ? _dataTrainingsrequired
                              : [],
                          onSaved: (value) {
                            try {
                              providerone.updateDataTrainingsrequired(value);
                            } catch (e) {
                              // dataSupport.clear();
                              // Handle any exceptions that might occur during the onSaved process
                              print("Error dataTrainingsrequired: $e");
                              // You can show an error message to the user here if needed
                            }
                            // setState(() {
                            //   traninglist = value;
                            //   traning = traninglist!.join(',');
                            // });
                          }),
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This field is required.';
                          }
                          return '';
                        },
                        initialValue: dataMgnregAsupport.isNotEmpty &&
                                datamgnregasupportlist
                                    .contains(dataMgnregAsupport.toList())
                            ? dataMgnregAsupport
                            : [],
                        onSaved: (value) {
                          providerone.updateDataMgnregAsupport(value);
                        },
                      ),
                    ),
                    ElevateClick(
                        ontap: () {
                          // changeData();
                          setState(() {
                            // if (_formKey.currentState!.validate()) {

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UpdateFamilyData(
                                  items: widget.items,
                                ),
                              ),
                            );
                          }
                              // }
                              );
                        },
                        text: 'Next'),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void getData() {
    // var providerone = context.read<TextMain>();

    var dataup = widget.items['data'][0];

    // providerone.updateDataBlock(dataup['data_Block'].toString());

    dataClass3 = dataup["data_Class3"];
    animalhusbendaryBusinesstype = dataup["data_Animalhusbendary_businesstype"];

    dataSourceofinvestment = dataup["data_Sourceofinvestment"];
    dataMgnregAsupport = dataup["data_MGNREGAsupport"];
    dataSupport = dataup["data_support"];
    _dataTrainingsrequired = dataup["data_Trainingsrequired"];

    dataDistrict = dataup['data_district'];
    dataBlock = dataup['data_Block'];
    dataPanchayath = dataup['data_Panchayath'];
    dataWard = dataup["data_Ward"].toString();
    dataName.text = dataup["data_Name"].toString();
    dataAddress.text = dataup["data_Address"].toString();
    dataPhonenumber.text = dataup["data_Phonenumber"].toString();
    dataClass = dataup["data_Class"];
    dataClass2 = dataup["data_Class2"];
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
    dataAnimalhusbendarycdsregistration =
        dataup['data_Animalhusbendary_cdsregistration'];

    dataAnimalhusbendaryothers0.text =
        dataup['data_Animalhusbendary_others0'].toString();
    datanumberofgroupmembers.text = dataup['data_noofgroupmembers'].toString();
    dataloandetailstotalinvestment.text =
        dataup['data_loandetails_totalinvestment'].toString();
    dateofLoanApplication.text =
        dataup['data_loandetails_DateofLoanApplication'].toString();
    dataothers2.text = dataup['data_others2'].toString();
    dataLanddetails1Landforgrass = dataup['data_landdetails1_landforgrass'];
    dataLanddetails1Qtyofownland.text =
        dataup['data_landdetails1_qtyofownland'].toString();
    dataLanddetails1Qtyofleasedland.text =
        dataup['data_landdetails1_qtyofleasedland'].toString();
  }

  void changeData() {
    var providerone = context.read<TextMain>();
    providerone
        .updateDataAnimalhusbendaryBusinesstype(animalhusbendaryBusinesstype);
    providerone.updateDataSourceofinvestment(dataSourceofinvestment);
    providerone.updateDataMgnregAsupport(dataMgnregAsupport);
    providerone.updateDataSupport(dataSupport);

    providerone.updateDataTrainingsrequired(_dataTrainingsrequired);
    providerone.updateDataClass3(dataClass3);

    providerone.updateDataDistrict(dataDistrict);
    providerone.updateDataBlock(dataBlock);
    providerone.updateDataPanchayath(dataPanchayath);

    if (dataWard == 'null') {
      dataWard == 0;
      providerone.updateDataWard(int.tryParse(dataWard.toString()));
    } else {
      providerone.updateDataWard(int.tryParse(dataWard.toString()));
    }

    providerone.updateDataName(dataName.text);
    providerone.updateDataAddress(dataAddress.text);

    if (dataPhonenumber.text == 'null') {
      dataPhonenumber.text == '0';
      providerone.updateDataPhonenumber(int.tryParse(dataPhonenumber.text));

    } else {
      providerone.updateDataPhonenumber(int.tryParse(dataPhonenumber.text));
    }

    providerone.updateDataClass(dataClass);
    providerone.updateDataClass2(dataClass2);
    providerone.updateDataFamilyincome(dataFamilyincome);
    providerone.updateDataNameofNg(dataNameofNg.text);
    providerone.updateDataNameofNg(dataNameofNg.text);
    providerone.updateDataNameofNGmember(dataNameofNGmember.text);
    providerone.updateDataRoleinNg(dataRoleinNg);
    providerone.updateDataHouseownership(dataHouseOwnership);

    if (datalanddetailslandarea.text == 'null') {
      datalanddetailslandarea.text == "0";
      providerone
          .updateDataLanddetailsLandarea(int.tryParse(datalanddetailslandarea.text));
    } else {
      providerone
          .updateDataLanddetailsLandarea(int.tryParse(datalanddetailslandarea.text));
    }

    if (datalanddetailsagricultureland.text == 'null') {
      datalanddetailsagricultureland.text == "0";
      providerone.updateDataLanddetailsAgricultureland(
          int.tryParse(datalanddetailsagricultureland.text));
    } else {
      providerone.updateDataLanddetailsAgricultureland(
          int.tryParse(datalanddetailsagricultureland.text));
    }

    providerone.updateDataEnterpisetype(dataEnterpisetype);
    providerone
        .updateDataYearofstartingbussiness(dataYearofstartingbussiness.text);
    providerone.updateDataYearofstartingagriculture(
        dataYearofstartingagriculture.text);

    if (dataAmountinvested.text == 'null') {
      dataAmountinvested.text == "0";
      providerone.updateDataAmountinvested(int.tryParse(dataAmountinvested.text));
    } else {
      providerone.updateDataAmountinvested(int.tryParse(dataAmountinvested.text));
    }
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
    providerone
        .updateDataAnimalhusbendaryOthers0(dataAnimalhusbendaryothers0.text);

    if (datanumberofgroupmembers.text == 'null') {
      datanumberofgroupmembers.text == "0";
      providerone
          .updateDataNoofgroupmembers(int.tryParse(datanumberofgroupmembers.text));
    } else {
      providerone
          .updateDataNoofgroupmembers(int.tryParse(datanumberofgroupmembers.text));
    }

    if (dataloandetailstotalinvestment.text == 'null') {
      dataloandetailstotalinvestment.text == "0";
      providerone.UpdateDtaLoandetailsTotalinvestment(int.tryParse(dataloandetailstotalinvestment.text));
    } else {
      providerone.UpdateDtaLoandetailsTotalinvestment(int.tryParse(dataloandetailstotalinvestment.text));
    }

    if (dataLanddetails1Qtyofownland.text == 'null') {
      dataLanddetails1Qtyofownland.text == "0";
      providerone.updateDataLanddetails1Qtyofownland(
          int.tryParse(dataLanddetails1Qtyofownland.text));
    } else {
      providerone.updateDataLanddetails1Qtyofownland(
          int.tryParse(dataLanddetails1Qtyofownland.text));
    }

    if (dataLanddetails1Qtyofleasedland.text == 'null') {
      dataLanddetails1Qtyofleasedland.text == "0";
      providerone.updateDataLanddetails1Qtyofleasedland(
          int.tryParse(dataLanddetails1Qtyofleasedland.text));
    } else {
      providerone.updateDataLanddetails1Qtyofleasedland(
          int.tryParse(dataLanddetails1Qtyofleasedland.text));
    }
    DateTime currentDate = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(currentDate);
    providerone.updateDataDateofsurvey(formattedDate);
    DateTime currentTime = DateTime.now();
    String formattedTime =
        "${currentTime.hour}:${currentTime.minute}:${currentTime.second}";
    providerone.updateDataStarttime(formattedTime);
  }
}
