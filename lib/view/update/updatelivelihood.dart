import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:main200623/constant/color_text.dart';
import 'package:main200623/view/update/updatepurchaseofrawmaterials.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:provider/provider.dart';
import '../../control/text_controller.dart';
import '../../services/add_api.dart';
import '../lists.dart';
import '../widgets/elevate_click_button.dart';
import '../widgets/input_field.dart';
import 'package:http/http.dart' as http;

class UpdateLivelihoodValue extends StatefulWidget {
  const UpdateLivelihoodValue({
    Key? key,
    this.items,
  }) : super(key: key);

  final items;


  @override
  State<UpdateLivelihoodValue> createState() => _SalesState();
}

class _SalesState extends State<UpdateLivelihoodValue> {


  @override
  void initState() {
    super.initState();
    // getproductData();
    fetchlivelihood();
  }



  TextEditingController dataLivelihoodIncomesource = TextEditingController();
  TextEditingController dataLivelihoodNumbers = TextEditingController();
  TextEditingController dataLivelihoodCapitalsource = TextEditingController();
  TextEditingController dataLivelihoodRevenue = TextEditingController();
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
  TextEditingController eggproduction = TextEditingController();
  TextEditingController marketing = TextEditingController();
  TextEditingController poultrymanueritem = TextEditingController();
  TextEditingController indigenousqty = TextEditingController();
  TextEditingController jerseyqty = TextEditingController();

  List<String> livelihood = [];

  List<String> selectedOptions = [];
  List<String> selected_Options = [];


  List<String> selectcowlist = [];

  List<String> calfgenderlist = [];

  List<String> fooderlist = [];

  List<String> goatlistitems = [];

  List<String> manuerlistselcted = [];

  List<String> poultrylistselcted = [];

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
                // Text(DocumentId),
                // InputField(
                //     hint: 'ഉപജീവന തൊഴിൽ',
                //     controller: dataLivelihoodIncomesource,
                //     onchanged: (value) {
                //       providerone.updateDatalivelihoodincomesource(value);
                //     }),
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
                      initialValue: selected_Options,
                      buttonText: Text('ഉപജീവനമാർഗം'),
                      title: Text(
                        'Select Options',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onConfirm: (List<String> values) {
                        setState(() {
                          selectedOptions = values;
                          print(widget.items['livelihoods'][0]["data_livelihood_incomesource"]);
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
                if (selectedOptions.contains('COW'))
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
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
                              .map(
                                  (item) => MultiSelectItem<String>(item, item))
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
                            providerone.updateDataLivelihoodCowsList(
                                values); // Trigger a rebuild to update the selected options
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
                    controller: indigenousqty,
                    onchanged: (value) {
                      int? valuee = int.tryParse(value);
                      providerone
                          .updateDataLivelihoodCowsIndigenousQnty(valuee);
                    },
                    keytype: TextInputType.number,
                  ),
                if (selectcowlist.contains('JERSEY'))
                  InputField(
                    hint: 'JERSEY Qty',
                    controller: jerseyqty,
                    onchanged: (value) {
                      int? valuee = int.tryParse(value);
                      providerone.updateDataLivelihoodCowsJerseyQnty(valuee);
                    },
                    keytype: TextInputType.number,
                  ),
                // SizedBox(height: 10),
                if (selectedOptions.contains('CALF'))
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
                            providerone.updateDataLivelihoodCalfList(
                                values); // Trigger a rebuild to update the selected options
                          },
                        ),
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
                          providerone.updateDataLivelihoodFodderList(
                              values); // Trigger a rebuild to update the selected options
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
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
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
                              .map(
                                  (item) => MultiSelectItem<String>(item, item))
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
                            providerone.updateDataLivelihoodGoatList(
                                values); // Trigger a rebuild to update the selected options
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
                      providerone
                          .updateDataLivelihoodGoatAttapadiBlackQnty(valuee);
                    },
                    keytype: TextInputType.number,
                  ),
                if (goatlistitems.contains('ATTAPADI BLACK KID'))
                  InputField(
                    hint: 'ATTAPADI BLACK KID Qty',
                    controller: attapdiblackkidqty,
                    onchanged: (value) {
                      int? valuee = int.tryParse(value);
                      providerone
                          .updateDataLivelihoodGoatAttapadiBlackKidQnty(valuee);
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
                      providerone
                          .updateDataLivelihoodGoatMalabariKidQnty(valuee);
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
                          providerone
                              .updateDataLivelihoodGoatOthersQnty(valuee);
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
                          setState(
                                () {
                              manuerlistselcted = values;
                            },
                          );
                          print(manuerlistselcted);
                          providerone.updateDataLivelihoodManureList(
                              values); // Trigger a rebuild to update the selected options
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
                SizedBox(height: 10,),
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
                if (selectedOptions.contains('POULTRY'))
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.black,
                        )),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: MultiSelectDialogField(
                        items: poultrylist
                            .map((item) => MultiSelectItem<String>(item, item))
                            .toList(),
                        initialValue: poultrylistselcted,
                        buttonText: Text('POULTRY LIST'),
                        title: Text(
                          'Select Options',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onConfirm: (List<String> values) {
                          setState(
                                () {
                              poultrylistselcted = values;
                            },
                          );
                          print(poultrylistselcted);
                          providerone.updateDataLivelihoodPoultryList(
                              values); // Trigger a rebuild to update the selected options
                        },
                      ),
                    ),
                  ),
                if (poultrylistselcted.contains('EGG PRODUCTION'))
                  InputField(
                    hint: 'EGG PRODUCTION Qty',
                    controller: eggproduction,
                    onchanged: (value) {
                      int? valuee = int.tryParse(value);
                      providerone
                          .updateDataLivelihoodPoultryEggProductionQnty(valuee);
                    },
                    keytype: TextInputType.number,
                  ),
                if (poultrylistselcted.contains('MARKETING'))
                  InputField(
                    hint: 'MARKETING Qty',
                    controller: marketing,
                    onchanged: (value) {
                      int? valuee = int.tryParse(value);
                      providerone
                          .updateDataLivelihoodPoultryMarketingQnty(valuee);
                    },
                    keytype: TextInputType.number,
                  ),
                if (selectedOptions.contains('POULTRY MANURE'))
                  InputField(
                    hint: 'POULTRY MANURE Qty',
                    controller: poultrymanueritem,
                    onchanged: (value) {
                      int? valuee = int.tryParse(value);
                      providerone.updateDataLivelihoodPoultryManureQnty(valuee);
                    },
                    keytype: TextInputType.number,
                  ),

                ElevateClick(
                    ontap: () {
                      changeData();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                UpdatePurchaseofrawmaterials(items: widget.items),
                          ));
                    }, text: 'Next'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void getproductData() {
    var dataup = widget.items['livelihoods'][0];
    print(dataup);
    setState(() {
      selected_Options = dataup["data_livelihood_incomesource"];
      selectcowlist = dataup["livelihood_cows_list"];
      // livelihoodCowsHfQnty = dataup["livelihood_cows_HF_qnty"];
      // livelihoodCowsJerseyQnty = dataup["livelihood_cows_JERSEY_qnty"];
      // livelihoodCowsIndigenousQnty = dataup["livelihood_cows_INDIGENOUS_qnty"];
      // livelihoodCalfList = dataup["livelihood_calf_list"];
      // livelihoodCalfFemaleQnty = dataup["livelihood_calf_FEMALE_qnty"];
      // livelihoodCalfMaleQnty = dataup["livelihood_calf_MALE_qnty"];
      // livelihoodGoatList = dataup["livelihood_goat_list"];
      // livelihoodGoatMalabariQnty = dataup["livelihood_goat_MALABARI_qnty"];
      // livelihoodGoatMalabariKidQnty = dataup["livelihood_goat_MALABARI_KID_qnty"];
      // livelihoodGoatAttapadiBlackQnty = dataup["livelihood_goat_ATTAPADI_BLACK_qnty"];
      // livelihoodGoatAttapadiBlackKidQnty = dataup["livelihood_goat_ATTAPADI_BLACK_KID_qnty"];
      // livelihoodGoatOthersQnty = dataup["livelihood_goat_OTHERS_qnty"];
      // livelihoodPoultryList = dataup["livelihood_poultry_list"];
      // livelihoodPoultryEggProductionQnty = dataup["livelihood_poultry_EGG_PRODUCTION_qnty"];
      // livelihoodPoultryMarketingQnty = dataup["livelihood_poultry_MARKETING_qnty"];
      // livelihoodManureList = dataup["livelihood_manure_list"];
      // livelihoodManureDryQnty = dataup["livelihood_manure_DRY_qnty"];
      // livelihoodManureFreshQnty = dataup["livelihood_manure_FRESH_qnty"];
      // livelihoodFodderList = dataup["livelihood_fodder_list"];
      // livelihoodFodderOwnUseQnty = dataup["livelihood_fodder_OWN_USE_qnty"];
      // livelihoodFodderForSaleQnty = dataup["livelihood_fodder_FOR_SALE_qnty"];
      // livelihoodBuffaloQnty = dataup["livelihood_BUFFALO_qnty"];
      // livelihoodPoultryManureQnty = dataup["livelihood_POULTRY_MANURE_qnty"];
      // lilivelihoodDuckqnty = dataup['livelihood_DUCK_qnty'];
      // livelihoodgoatothers = dataup['livelihood_goat_OTHERS'];

    });
  }

  changeData() {
    var providerone = context.read<TextMain>();

  }
}
