import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:main200623/constant/color_text.dart';
import 'package:main200623/view/add_data/product.dart';
import 'package:main200623/view/add_data/purchaseofrawmaterials.dart';
import 'package:main200623/view/lists.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:provider/provider.dart';
import '../../control/text_controller.dart';
import '../../services/add_api.dart';
import '../widgets/elevate_click_button.dart';
import '../widgets/input_field.dart';
import 'package:http/http.dart' as http;

class LivelihoodValue extends StatefulWidget {
  const LivelihoodValue({
    Key? key,
    this.id,
  }) : super(key: key);
  final id;

  @override
  State<LivelihoodValue> createState() => _SalesState();
}

class _SalesState extends State<LivelihoodValue> {
  @override
  void initState() {
    super.initState();
    fetchlivelihood();
  }



  // TextEditingController datalivelihoodincomesource = TextEditingController();
  TextEditingController dataLivelihoodRevenue = TextEditingController();
  TextEditingController livelihoodBuffaloQnty = TextEditingController();
  TextEditingController datalivelihoodcapitalsource = TextEditingController();
  TextEditingController datalivelihoodrevenue = TextEditingController();
  TextEditingController livelihoodCowsHfQnty = TextEditingController();
  TextEditingController LivelihoodCowsIndigenousQnty = TextEditingController();
  TextEditingController livelihoodCalfFemaleQnty = TextEditingController();
  TextEditingController livelihoodCalfMaleQnty = TextEditingController();
  TextEditingController livelihoodFodderForSaleQnty = TextEditingController();
  TextEditingController livelihoodFodderOwnUseQnty = TextEditingController();
  TextEditingController lilivelihoodDuckqnty = TextEditingController();
  TextEditingController livelihoodGoatAttapadiBlackQnty = TextEditingController();
  TextEditingController livelihoodGoatAttapadiBlackKidQnty = TextEditingController();
  TextEditingController livelihoodGoatMalabariQnty = TextEditingController();
  TextEditingController livelihoodGoatMalabariKidQnty = TextEditingController();
  TextEditingController livelihoodgoatothers = TextEditingController();
  TextEditingController livelihoodGoatOthersQnty = TextEditingController();
  TextEditingController livelihoodManureDryQnty = TextEditingController();
  TextEditingController livelihoodManureFreshQnty = TextEditingController();
  TextEditingController livelihoodPoultryEggProductionQnty = TextEditingController();
  TextEditingController livelihoodPoultryMarketingQnty = TextEditingController();
  TextEditingController livelihoodPoultryManureQnty = TextEditingController();
  TextEditingController livelihoodCowsIndigenousQnty = TextEditingController();
  TextEditingController livelihoodCowsJerseyQnty = TextEditingController();

  List<String> livelihood = [];

  List<dynamic> dataLivelihoodIncomesource = [];

  List<dynamic> selectcowlist = [];

  List<dynamic> calfgenderlist = [];

  List<dynamic> fooderlist = [];

  List<dynamic> goatlistitems = [];

  List<dynamic> manuerlistselcted = [];

  List<dynamic> poultrylistselcted = [];

  Future<void> fetchlivelihood() async {
    try {
      final response =
          await http.get(Uri.parse('${api}report/livelihood_list'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        setState(() {
          livelihood =
              List.from(data); // Assign fetched data to the global list
          // selectedDistrict;
          // print(livelihood);
        });
      } else {
        throw Exception('Failed to fetch fetchlivelihood');
      }
    } catch (e) {
      // Handle error
      print('Error fetching fetchlivelihood: $e');
    }
  }

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
            title: Text('ഉപജീവന വിവരം '),
            centerTitle: true,
            backgroundColor: app_theam),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MultiSelectFormField(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.black)),
                      title: Text(
                        'ഉപജീവന തൊഴിൽ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      dataSource: livelihoods,
                      textField: 'text',
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
                      initialValue: dataLivelihoodIncomesource,
                      onSaved: (value) {
                        setState(() {
                          dataLivelihoodIncomesource = value;
                        });
                        providerone.updateDatalivelihoodincomesource(value);
                      }),
                ),

                // SizedBox(height: 10),
                if (dataLivelihoodIncomesource.contains('COW'))
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: MultiSelectFormField(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.black)),
                        title: Text(
                          'COW LIST',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        dataSource: cowlist,
                        textField: 'text',
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
                        initialValue: selectcowlist,
                        onSaved: (value) {
                          setState(() {
                            selectcowlist = value;
                          });
                          providerone.updateDataLivelihoodCowsList(value);
                        }),
                  ),
                if (selectcowlist.contains('H F'))
                  InputField(
                    hint: 'H F Qty',
                    controller: livelihoodCowsHfQnty,
                    onchanged: (value) {
                      int? valuee = int.tryParse(value);
                      providerone.updateDataLivelihoodCowsHF(valuee);
                    },
                    keytype: TextInputType.number,
                  ),
                if (selectcowlist.contains('INDIGENOUS'))
                  InputField(
                    hint: 'INDIGENOUS Qty',
                    controller: livelihoodCowsIndigenousQnty,
                    onchanged: (value) {
                      int? valuee = int.tryParse(value);
                      providerone.updateDataLivelihoodCowsIndigenousQnty(valuee);
                    },
                    keytype: TextInputType.number,
                  ),
                if (selectcowlist.contains('JERSEY'))
                  InputField(
                    hint: 'JERSEY Qty',
                    controller: livelihoodCowsJerseyQnty,
                    onchanged: (value) {
                      int? valuee = int.tryParse(value);
                      providerone.updateDataLivelihoodCowsJerseyQnty(valuee);
                    },
                    keytype: TextInputType.number,
                  ),
                // SizedBox(height: 10),
                if (dataLivelihoodIncomesource.contains('CALF'))
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: MultiSelectFormField(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.black)),
                        title: Text(
                          'CALF LIST',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        dataSource: calfgender,
                        textField: 'text',
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
                        initialValue: calfgenderlist,
                        onSaved: (value) {
                          setState(() {
                            calfgenderlist = value;
                          });
                          providerone.updateDataLivelihoodCalfList(value);
                        }),
                  ),
                if (calfgenderlist.contains('FEMALE'))
                  InputField(
                    hint: 'FEMALE Qty',
                    controller: livelihoodCalfFemaleQnty,
                    onchanged: (value) {
                      int? valuee = int.tryParse(value);
                      providerone.updateDataLivelihoodCalfFemaleQnty(valuee);
                    },
                    keytype: TextInputType.number,
                  ),
                if (calfgenderlist.contains('MALE'))
                  InputField(
                    hint: 'MALE Qty',
                    controller: livelihoodCalfMaleQnty,
                    onchanged: (value) {
                      int? valuee = int.tryParse(value);
                      providerone.updateDataLivelihoodCalfMaleQnty(valuee);
                    },
                    keytype: TextInputType.number,
                  ),

                SizedBox(height: 10),
                if (dataLivelihoodIncomesource.contains('FODDER'))
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: MultiSelectFormField(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.black)),
                        title: Text(
                          'FODDER LIST',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        dataSource: fooderitems,
                        textField: 'text',
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
                        initialValue: fooderlist,
                        onSaved: (value) {
                          setState(() {
                            fooderlist = value;
                          });
                          providerone.updateDataLivelihoodCalfList(value);
                        }),
                  ),
                // Container(
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(10),
                //       border: Border.all(
                //         color: Colors.black,
                //       )),
                //   child: Padding(
                //     padding: const EdgeInsets.only(top: 10),
                //     child: MultiSelectDialogField(
                //       items: fooderitems
                //           .map((item) => MultiSelectItem<String>(item, item))
                //           .toList(),
                //       initialValue: fooderlist,
                //       buttonText: Text('FODDER LIST'),
                //       title: Text(
                //         'Select Options',
                //         style: TextStyle(fontWeight: FontWeight.bold),
                //       ),
                //       onConfirm: (List<String> values) {
                //         setState(() {
                //           fooderlist = values;
                //         });
                //         providerone.updateDataLivelihoodFodderList(
                //             values); // Trigger a rebuild to update the selected options
                //       },
                //     ),
                //   ),
                // ),
                if (fooderlist.contains('FOR SALE'))
                  InputField(
                    hint: 'FOR SALE KG',
                    controller: livelihoodFodderForSaleQnty,
                    onchanged: (value) {
                      int? valuee = int.tryParse(value);
                      providerone.updateDataLivelihoodFodderForSaleQnty(valuee);
                    },
                    keytype: TextInputType.number,
                  ),
                if (fooderlist.contains('OWN USE'))
                  InputField(
                    hint: 'OWN USE KG',
                    controller: livelihoodFodderOwnUseQnty,
                    onchanged: (value) {
                      int? valuee = int.tryParse(value);
                      providerone.updateDataLivelihoodFodderOwnUseQnty(valuee);
                    },
                    keytype: TextInputType.number,
                  ),
                if (dataLivelihoodIncomesource.contains('GOAT'))
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: MultiSelectFormField(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.black)),
                        title: Text(
                          'GOAT LIST',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        dataSource: goatlist,
                        textField: 'text',
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
                        initialValue: goatlistitems,
                        onSaved: (value) {
                          setState(() {
                            goatlistitems = value;
                          });
                          providerone.updateDataLivelihoodGoatList(value);
                        }),
                  ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 10, bottom: 10),
                //   child: Container(
                //     decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(10),
                //         border: Border.all(
                //           color: Colors.black,
                //         )),
                //     child: Padding(
                //       padding: const EdgeInsets.only(top: 10),
                //       child: MultiSelectDialogField(
                //         items: goatlist
                //             .map(
                //                 (item) => MultiSelectItem<String>(item, item))
                //             .toList(),
                //         initialValue: goatlistitems,
                //         buttonText: Text('GOAT LIST'),
                //         title: Text(
                //           'Select Options',
                //           style: TextStyle(fontWeight: FontWeight.bold),
                //         ),
                //         onConfirm: (List<String> values) {
                //           setState(() {
                //             goatlistitems = values;
                //           });
                //           print(goatlistitems);
                //           providerone.updateDataLivelihoodGoatList(
                //               values); // Trigger a rebuild to update the selected options
                //         },
                //       ),
                //     ),
                //   ),
                // ),
                if (goatlistitems.contains('ATTAPADI BLACK'))
                  InputField(
                    hint: 'ATTAPADI BLACK Qty',
                    controller: livelihoodGoatAttapadiBlackQnty,
                    onchanged: (value) {
                      int? valuee = int.tryParse(value);
                      providerone.updateDataLivelihoodGoatAttapadiBlackQnty(valuee);
                    },
                    keytype: TextInputType.number,
                  ),
                if (goatlistitems.contains('ATTAPADI BLACK KID'))
                  InputField(
                    hint: 'ATTAPADI BLACK KID Qty',
                    controller: livelihoodGoatAttapadiBlackKidQnty,
                    onchanged: (value) {
                      int? valuee = int.tryParse(value);
                      providerone.updateDataLivelihoodGoatAttapadiBlackKidQnty(valuee);
                    },
                    keytype: TextInputType.number,
                  ),
                if (goatlistitems.contains('MALABARI'))
                  InputField(
                    hint: 'MALABARI Qty',
                    controller: livelihoodGoatMalabariQnty,
                    onchanged: (value) {
                      int? valuee = int.tryParse(value);
                      providerone.updateDataLivelihoodGoatMalabariQnty(valuee);
                    },
                    keytype: TextInputType.number,
                  ),
                if (goatlistitems.contains('MALABARI KID'))
                  InputField(
                    hint: 'MALABARI KID Qty',
                    controller: livelihoodGoatMalabariKidQnty,
                    onchanged: (value) {
                      int? valuee = int.tryParse(value);
                      providerone.updateDataLivelihoodGoatMalabariKidQnty(valuee);
                    },
                    keytype: TextInputType.number,
                  ),

                if (goatlistitems.contains('OTHERS'))
                  Column(
                    children: [
                      InputField(
                        hint: 'OTHERS ITEM',
                        controller: livelihoodgoatothers,
                        onchanged: (value) {
                          providerone.updateLivelihoodGoatOthers(value);
                        },
                      ),
                      InputField(
                        hint: 'OTHERS Qty',
                        controller: livelihoodGoatOthersQnty,
                        onchanged: (value) {
                          int? valuee = int.tryParse(value);
                          providerone.updateDataLivelihoodGoatOthersQnty(valuee);
                        },
                        keytype: TextInputType.number,
                      ),
                    ],
                  ),
                if (dataLivelihoodIncomesource.contains('MANURE'))
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: MultiSelectFormField(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.black)),
                        title: Text(
                          'MANURE LIST',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        dataSource: manuritems,
                        textField: 'text',
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
                        initialValue: manuerlistselcted,
                        onSaved: (value) {
                          setState(() {
                            manuerlistselcted = value;
                          });
                          providerone.updateDataLivelihoodManureList(value);
                        }),
                  ),
                // Container(
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(10),
                //       border: Border.all(
                //         color: Colors.black,
                //       )),
                //   child: Padding(
                //     padding: const EdgeInsets.only(top: 10),
                //     child: MultiSelectDialogField(
                //       items: manuritems
                //           .map((item) => MultiSelectItem<String>(item, item))
                //           .toList(),
                //       initialValue: manuerlistselcted,
                //       buttonText: Text('MANURE LIST'),
                //       title: Text(
                //         'Select Options',
                //         style: TextStyle(fontWeight: FontWeight.bold),
                //       ),
                //       onConfirm: (List<String> values) {
                //         setState(
                //               () {
                //             manuerlistselcted = values;
                //           },
                //         );
                //         print(manuerlistselcted);
                //         providerone.updateDataLivelihoodManureList(
                //             values); // Trigger a rebuild to update the selected options
                //       },
                //     ),
                //   ),
                // ),
                if (manuerlistselcted.contains('DRY'))
                  InputField(
                    hint: 'DRY KG',
                    controller: livelihoodManureDryQnty,
                    onchanged: (value) {
                      int? valuee = int.tryParse(value);
                      providerone.updateDataLivelihoodManureDryQnty(valuee);
                    },
                    keytype: TextInputType.number,
                  ),
                SizedBox(height: 10,),
                if (manuerlistselcted.contains('FRESH'))
                  InputField(
                    hint: 'FRESH KG',
                    controller: livelihoodManureFreshQnty,
                    onchanged: (value) {
                      int? valuee = int.tryParse(value);
                      providerone.updateDataLivelihoodManureFreshQnty(valuee);
                    },
                    keytype: TextInputType.number,
                  ),
                if (dataLivelihoodIncomesource.contains('POULTRY'))
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: MultiSelectFormField(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.black)),
                        title: Text(
                          'POULTRY LIST',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        dataSource: poultrylist,
                        textField: 'text',
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
                        initialValue: poultrylistselcted,
                        onSaved: (value) {
                          setState(() {
                            poultrylistselcted = value;
                          });
                          providerone.updateDataLivelihoodPoultryList(value);
                        }),
                  ),
                // Container(
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(10),
                //       border: Border.all(
                //         color: Colors.black,
                //       )),
                //   child: Padding(
                //     padding: const EdgeInsets.only(top: 10),
                //     child: MultiSelectDialogField(
                //       items: poultrylist
                //           .map((item) => MultiSelectItem<String>(item, item))
                //           .toList(),
                //       initialValue: poultrylistselcted,
                //       buttonText: Text('POULTRY LIST'),
                //       title: Text(
                //         'Select Options',
                //         style: TextStyle(fontWeight: FontWeight.bold),
                //       ),
                //       onConfirm: (List<String> values) {
                //         setState(
                //               () {
                //             poultrylistselcted = values;
                //           },
                //         );
                //         print(poultrylistselcted);
                //         providerone.updateDataLivelihoodPoultryList(
                //             values); // Trigger a rebuild to update the selected options
                //       },
                //     ),
                //   ),
                // ),
                if (poultrylistselcted.contains('EGG PRODUCTION'))
                  InputField(
                    hint: 'EGG PRODUCTION Qty',
                    controller: livelihoodPoultryEggProductionQnty,
                    onchanged: (value) {
                      int? valuee = int.tryParse(value);
                      providerone.updateDataLivelihoodPoultryEggProductionQnty(valuee);
                    },
                    keytype: TextInputType.number,
                  ),
                if (poultrylistselcted.contains('MARKETING'))
                  InputField(
                    hint: 'MARKETING Qty',
                    controller: livelihoodPoultryMarketingQnty,
                    onchanged: (value) {
                      int? valuee = int.tryParse(value);
                      providerone.updateDataLivelihoodPoultryMarketingQnty(valuee);
                    },
                    keytype: TextInputType.number,
                  ),
                if (dataLivelihoodIncomesource.contains('POULTRY MANURE'))
                  InputField(
                    hint: 'POULTRY MANURE Qty',
                    controller: livelihoodPoultryManureQnty,
                    onchanged: (value) {
                      int? valuee = int.tryParse(value);
                      providerone.updateDataLivelihoodPoultryManureQnty(valuee);
                    },
                    keytype: TextInputType.number,
                  ),
                if (dataLivelihoodIncomesource.contains('DUCK'))
                  InputField(
                    hint: 'DUCK Qty',
                    controller: lilivelihoodDuckqnty,
                    onchanged: (value) {
                      int? valuee = int.tryParse(value);
                      providerone.updateDataLivelihoodDuckqnty(valuee);
                    },
                    keytype: TextInputType.number,
                  ),
                if (dataLivelihoodIncomesource.contains('BUFFALO'))
                  InputField(
                    hint: 'BUFFALO Qty',
                    controller: livelihoodBuffaloQnty,
                    onchanged: (value) {
                      int? valuee = int.tryParse(value);
                      providerone.updateDataLivelihoodBuffaloQnty(valuee);
                    },
                    keytype: TextInputType.number,
                  ),
                ElevateClick(
                    ontap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Purchaseofrawmaterials(),
                          ));
                    },
                    text: 'Next'),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
