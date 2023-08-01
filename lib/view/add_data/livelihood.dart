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

  TextEditingController datalivelihoodincomesource = TextEditingController();
  TextEditingController LivelihoodBuffaloQnty = TextEditingController();
  TextEditingController datalivelihoodcapitalsource = TextEditingController();
  TextEditingController datalivelihoodrevenue = TextEditingController();
  TextEditingController LivelihoodCowsHF = TextEditingController();
  TextEditingController LivelihoodCowsIndigenousQnty = TextEditingController();
  TextEditingController CalfFemaleQnty = TextEditingController();
  TextEditingController CalfMaleQnty = TextEditingController();
  TextEditingController forSaleQnty = TextEditingController();
  TextEditingController fodderOwnUseQnty = TextEditingController();
  TextEditingController duckqty = TextEditingController();
  TextEditingController attapadiblackqty = TextEditingController();
  TextEditingController attapdiblackkidqty = TextEditingController();
  TextEditingController malabariqty = TextEditingController();
  TextEditingController malabarikidqty = TextEditingController();
  TextEditingController othersitem = TextEditingController();
  TextEditingController othersqty = TextEditingController();
  TextEditingController dryqty = TextEditingController();
  TextEditingController freshqty = TextEditingController();





  List<String> livelihood = [];

  List<String> selectedOptions = [];

  List<String> selectcowlist = [];

  List<String> calfgenderlist = [];

  List<String> fooderlist = [];

  List<String> goatlistitems = [];

  List<String> manuerlistselcted = [];


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
        throw Exception('Failed to fetch districts');
      }
    } catch (e) {
      // Handle error
      print('Error fetching districts: $e');
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
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black,
                      )),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: MultiSelectDialogField(
                      items: livelihood
                          .map((item) => MultiSelectItem<String>(item, item))
                          .toList(),
                      initialValue: selectedOptions,
                      buttonText: Text('ഉപജീവനമാർഗം'),
                      title: Text(
                        'Select Options',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onConfirm: (List<String> values) {
                        setState(() {
                          selectedOptions = values;
                        });
                        print(selectedOptions);
                        providerone.updateDatalivelihoodincomesource(values); // Trigger a rebuild to update the selected options
                      },
                    ),
                  ),
                ),
                if (selectedOptions.contains('BUFFALO'))
                  InputField(
                    hint: 'BUFFALO Qty',
                    controller: LivelihoodBuffaloQnty,
                    onchanged: (value) {
                      int? valuee = int.tryParse(value);
                      providerone.updateDataLivelihoodBuffaloQnty(valuee);
                    },
                    keytype: TextInputType.number,
                  ),
                // SizedBox(height: 10),
                if(selectedOptions.contains('COW'))
                Padding(
                  padding: const EdgeInsets.only(top:10,bottom: 10 ),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.black,
                        )),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: MultiSelectDialogField(
                        items: cowlist
                            .map((item) => MultiSelectItem<String>(item, item))
                            .toList(),
                        initialValue: selectcowlist,
                        buttonText: Text('COW LIST'),
                        title: Text(
                          'Select Options',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onConfirm: (List<String> values) {
                          setState(() {
                            selectcowlist = values;
                          });
                          print(selectcowlist);
                          providerone.updateDataLivelihoodCowsList(values); // Trigger a rebuild to update the selected options
                        },
                      ),
                    ),
                  ),
                ),
                if (selectcowlist.contains('H F'))
                  InputField(
                    hint: 'H F Qty',
                    controller: LivelihoodCowsHF,
                    onchanged: (value) {
                      int? valuee = int.tryParse(value);
                      providerone.updateDataLivelihoodCowsHF(valuee);
                    },
                    keytype: TextInputType.number,
                  ),
                if (selectcowlist.contains('INDIGENOUS'))
                  InputField(
                    hint: 'INDIGENOUS Qty',
                    controller: LivelihoodBuffaloQnty,
                    onchanged: (value) {
                      int? valuee = int.tryParse(value);
                      providerone.updateDataLivelihoodCowsIndigenousQnty(valuee);
                    },
                    keytype: TextInputType.number,
                  ),
                if (selectcowlist.contains('JERSEY'))
                  InputField(
                    hint: 'JERSEY Qty',
                    controller: LivelihoodBuffaloQnty,
                    onchanged: (value) {
                      int? valuee = int.tryParse(value);
                      providerone.updateDataLivelihoodCowsJerseyQnty(valuee);
                    },
                    keytype: TextInputType.number,
                  ),
                // SizedBox(height: 10),
                if (selectedOptions.contains('CALF'))
                  Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black,
                      )),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: MultiSelectDialogField(
                      items: calfgender
                          .map((item) => MultiSelectItem<String>(item, item))
                          .toList(),
                      initialValue: calfgenderlist,
                      buttonText: Text('CALF GENDER'),
                      title: Text(
                        'Select Options',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onConfirm: (List<String> values) {
                        setState(() {
                          calfgenderlist = values;
                        });
                        print(calfgenderlist);
                        providerone.updateDataLivelihoodCalfList(values); // Trigger a rebuild to update the selected options
                      },
                    ),
                  ),
                ),
                if (calfgenderlist.contains('FEMALE'))
                  InputField(
                    hint: 'FEMALE Qty',
                    controller: CalfFemaleQnty,
                    onchanged: (value) {
                      int? valuee = int.tryParse(value);
                      providerone.updateDataLivelihoodCalfFemaleQnty(valuee);
                    },
                    keytype: TextInputType.number,
                  ),
                if (calfgenderlist.contains('MALE'))
                  InputField(
                    hint: 'MALE Qty',
                    controller: CalfMaleQnty,
                    onchanged: (value) {
                      int? valuee = int.tryParse(value);
                      providerone.updateDataLivelihoodCalfMaleQnty(valuee);
                    },
                    keytype: TextInputType.number,
                  ),
                if (selectedOptions.contains('DUCK'))
                  InputField(
                    hint: 'DUCK Qty',
                    controller: duckqty,
                    onchanged: (value) {
                      int? valuee = int.tryParse(value);
                      providerone.updateDataLivelihoodDuckqnty(valuee);
                    },
                    keytype: TextInputType.number,
                  ),
                SizedBox(height: 10),
                if (selectedOptions.contains('FODDER'))
                  Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black,
                      )),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: MultiSelectDialogField(
                      items: fooderitems
                          .map((item) => MultiSelectItem<String>(item, item))
                          .toList(),
                      initialValue: fooderlist,
                      buttonText: Text('FODDER LIST'),
                      title: Text(
                        'Select Options',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onConfirm: (List<String> values) {
                        setState(() {
                          fooderlist = values;
                        });
                        print(fooderlist);
                        providerone.updateDataLivelihoodFodderList(values); // Trigger a rebuild to update the selected options
                      },
                    ),
                  ),
                ),
                if (fooderlist.contains('FOR SALE'))
                  InputField(
                    hint: 'FOR SALE KG',
                    controller: forSaleQnty,
                    onchanged: (value) {
                      int? valuee = int.tryParse(value);
                      providerone.updateDataLivelihoodFodderForSaleQnty(valuee);
                    },
                    keytype: TextInputType.number,
                  ),
                if (fooderlist.contains('OWN USE'))
                  InputField(
                    hint: 'OWN USE KG',
                    controller: fodderOwnUseQnty,
                    onchanged: (value) {
                      int? valuee = int.tryParse(value);
                      providerone.updateDataLivelihoodFodderOwnUseQnty(valuee);
                    },
                    keytype: TextInputType.number,
                  ),
                if (selectedOptions.contains('GOAT'))
                  Padding(
                    padding: const EdgeInsets.only(top: 10,bottom: 10),
                    child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.black,
                        )),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: MultiSelectDialogField(
                        items: goatlist
                            .map((item) => MultiSelectItem<String>(item, item))
                            .toList(),
                        initialValue: goatlistitems,
                        buttonText: Text('GOAT LIST'),
                        title: Text(
                          'Select Options',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onConfirm: (List<String> values) {
                          setState(() {
                            goatlistitems = values;
                          });
                          print(goatlistitems);
                          providerone.updateDataLivelihoodGoatList(values); // Trigger a rebuild to update the selected options
                        },
                      ),
                    ),
                ),
                  ),
                if (goatlistitems.contains('ATTAPADI BLACK'))
                  InputField(
                    hint: 'ATTAPADI BLACK Qty',
                    controller: attapadiblackqty,
                    onchanged: (value) {
                      int? valuee = int.tryParse(value);
                      providerone.updateDataLivelihoodGoatAttapadiBlackQnty(valuee);
                    },
                    keytype: TextInputType.number,
                  ),
                if (goatlistitems.contains('ATTAPADI BLACK KID'))
                  InputField(
                    hint: 'ATTAPADI BLACK KID Qty',
                    controller: attapdiblackkidqty,
                    onchanged: (value) {
                      int? valuee = int.tryParse(value);
                      providerone.updateDataLivelihoodGoatAttapadiBlackKidQnty(valuee);
                    },
                    keytype: TextInputType.number,
                  ),
                if (goatlistitems.contains('MALABARI'))
                  InputField(
                    hint: 'MALABARI Qty',
                    controller: malabariqty,
                    onchanged: (value) {
                      int? valuee = int.tryParse(value);
                      providerone.updateDataLivelihoodGoatMalabariQnty(valuee);
                    },
                    keytype: TextInputType.number,
                  ),
                if (goatlistitems.contains('MALABARI KID'))
                  InputField(
                    hint: 'MALABARI KID Qty',
                    controller: malabarikidqty,
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
                        controller: othersitem,
                        onchanged: (value) {
                          providerone.updateDataLivelihoodGoatOthers(value);
                        },
                      ),
                      InputField(
                        hint: 'OTHERS Qty',
                        controller: othersqty,
                        onchanged: (value) {
                          int? valuee = int.tryParse(value);
                          providerone.updateDataLivelihoodGoatOthersQnty(valuee);
                        },
                        keytype: TextInputType.number,
                      ),
                    ],
                  ),
                if (selectedOptions.contains('MANURE'))
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.black,
                        )),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: MultiSelectDialogField(
                        items: manuritems
                            .map((item) => MultiSelectItem<String>(item, item))
                            .toList(),
                        initialValue: manuerlistselcted,
                        buttonText: Text('MANURE LIST'),
                        title: Text(
                          'Select Options',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onConfirm: (List<String> values) {
                          setState(() {
                            manuerlistselcted = values;
                          });
                          print(manuerlistselcted);
                          providerone.updateDataLivelihoodManureList(values); // Trigger a rebuild to update the selected options
                        },
                      ),
                    ),
                  ),
                if (manuerlistselcted.contains('DRY'))
                  InputField(
                    hint: 'DRY KG',
                    controller: dryqty,
                    onchanged: (value) {
                      int? valuee = int.tryParse(value);
                      providerone.updateDataLivelihoodManureDryQnty(valuee);
                    },
                    keytype: TextInputType.number,
                  ),
                if (manuerlistselcted.contains('FRESH'))
                  InputField(
                    hint: 'FRESH KG',
                    controller: freshqty,
                    onchanged: (value) {
                      int? valuee = int.tryParse(value);
                      providerone.updateDataLivelihoodManureFreshQnty(valuee);
                    },
                    keytype: TextInputType.number,
                  ),

                ElevateClick(
                    ontap: () {
                      Navigator.push(context, MaterialPageRoute(
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
