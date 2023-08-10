import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:main200623/constant/color_text.dart';
import 'package:main200623/view/update/updatepurchaseofrawmaterials.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
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
    getproductData();
    // fetchlivelihood();
  }

  // TextEditingController addDataTreeFooderQnty = TextEditingController();
  // TextEditingController addDataUreaTreatedStrawQnty = TextEditingController();
  // TextEditingController caffStarterQnty = TextEditingController();
  // TextEditingController chemicalFertilizersQnty = TextEditingController();
  // TextEditingController fodderSeedsQnty = TextEditingController();
  // TextEditingController grassFooderQnty = TextEditingController();
  // TextEditingController growerQnty = TextEditingController();
  // TextEditingController ingredientsForCattleFeedQnty = TextEditingController();
  // TextEditingController ingredientsForPoultryFeedQnty = TextEditingController();
  // TextEditingController livelihoodGoatOthers = TextEditingController();
  // TextEditingController malabariGoatKidsQnty = TextEditingController();
  // TextEditingController materialForPoultryCageFabricationQnty = TextEditingController();
  // TextEditingController totalMixedRationQnty = TextEditingController();


  TextEditingController dataLivelihoodRevenue = TextEditingController();
  TextEditingController livelihoodBuffaloQnty = TextEditingController();
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

  // List<String> livelihood = [];

  List<dynamic> dataLivelihoodIncomesource = [];

  List<dynamic> selectcowlist = [];

  List<dynamic> calfgenderlist = [];

  List<dynamic> fooderlist = [];

  List<dynamic> goatlistitems = [];

  List<dynamic> manuerlistselcted = [];

  List<dynamic> poultrylistselcted = [];

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
                      // initialValue: dataLivelihoodIncomesource,
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
    setState(() {

      dataLivelihoodIncomesource = dataup["data_livelihood_incomesource"];

      dataLivelihoodIncomesource = dataup["data_livelihood_incomesource"];
      selectcowlist = dataup["livelihood_cows_list"];
      calfgenderlist = dataup["livelihood_calf_list"];
      goatlistitems = dataup["livelihood_goat_list"];
      poultrylistselcted = dataup["livelihood_poultry_list"];
      manuerlistselcted = dataup["livelihood_manure_list"];
      fooderlist = dataup["livelihood_fodder_list"];

      livelihoodCowsHfQnty.text = dataup["livelihood_cows_HF_qnty"].toString();
      livelihoodCowsJerseyQnty.text =dataup["livelihood_cows_JERSEY_qnty"].toString();
      livelihoodCowsIndigenousQnty.text =dataup["livelihood_cows_INDIGENOUS_qnty"].toString();
      livelihoodCalfFemaleQnty.text =dataup["livelihood_calf_FEMALE_qnty"].toString();
      livelihoodCalfMaleQnty.text =dataup["livelihood_calf_MALE_qnty"].toString();
      livelihoodGoatMalabariQnty.text =dataup["livelihood_goat_MALABARI_qnty"].toString();
      livelihoodGoatMalabariKidQnty.text =dataup["livelihood_goat_MALABARI_KID_qnty"].toString();
      livelihoodGoatAttapadiBlackQnty.text =dataup["livelihood_goat_ATTAPADI_BLACK_qnty"].toString();
      livelihoodGoatAttapadiBlackKidQnty.text =dataup["livelihood_goat_ATTAPADI_BLACK_KID_qnty"].toString();
      livelihoodGoatOthersQnty.text =dataup["livelihood_goat_OTHERS_qnty"].toString();
      livelihoodPoultryEggProductionQnty.text =dataup["livelihood_poultry_EGG_PRODUCTION_qnty"].toString();
      livelihoodPoultryMarketingQnty.text =dataup["livelihood_poultry_MARKETING_qnty"].toString();
      livelihoodManureDryQnty.text =dataup["livelihood_manure_DRY_qnty"].toString();
      livelihoodManureFreshQnty.text =dataup["livelihood_manure_FRESH_qnty"].toString();
      livelihoodFodderOwnUseQnty.text =dataup["livelihood_fodder_OWN_USE_qnty"].toString();
      livelihoodFodderForSaleQnty.text =dataup["livelihood_fodder_FOR_SALE_qnty"].toString();
      livelihoodBuffaloQnty.text =dataup["livelihood_BUFFALO_qnty"].toString();
      livelihoodPoultryManureQnty.text =dataup["livelihood_POULTRY_MANURE_qnty"].toString();
      lilivelihoodDuckqnty.text =dataup['livelihood_DUCK_qnty'].toString();
      livelihoodgoatothers.text =dataup['livelihood_goat_OTHERS'].toString();


    });
  }

  changeData() {
    var providerone = Provider.of<TextMain>(context,listen: false);

    providerone.updateDatalivelihoodincomesource(dataLivelihoodIncomesource);
    providerone.updateDataLivelihoodCowsList(selectcowlist);
    providerone.updateDataLivelihoodCalfList(calfgenderlist);
    providerone.updateDataLivelihoodGoatList(goatlistitems);
    providerone.updateDataLivelihoodPoultryList(poultrylistselcted);
    providerone.updateDataManureList(manuerlistselcted);
    providerone.updateDataLivelihoodFodderList(fooderlist);

    // providerone.updateDataLivelihoodCalfList(livelihoodCowsHfQnty.text);
    // providerone.updateDataLivelihoodGoatList(goatlistitems);
    // providerone.updateDataLivelihoodCalfList(int.parse(livelihoodCowsHfQnty.text));
    // providerone.updateDataLivelihoodCalfList(int.parse(livelihoodCowsHfQnty.text));
    if(livelihoodCowsHfQnty.text == null || livelihoodCowsHfQnty.text == 'null' ){
      livelihoodCowsHfQnty.text = "0";
      providerone.updateDataLivelihoodCowsHF(int.parse(livelihoodCowsHfQnty.text));}else{
      providerone.updateDataLivelihoodCowsHF(int.parse(livelihoodCowsHfQnty.text));
    }
    if(livelihoodCowsIndigenousQnty.text == null || livelihoodCowsIndigenousQnty.text == 'null' ){
      livelihoodCowsIndigenousQnty.text = "0";
      providerone.updateDataLivelihoodCowsIndigenousQnty(int.parse(livelihoodCowsIndigenousQnty.text));}else{
      providerone.updateDataLivelihoodCowsIndigenousQnty(int.parse(livelihoodCowsIndigenousQnty.text));
    }

    if(livelihoodCowsJerseyQnty.text == null || livelihoodCowsJerseyQnty.text == 'null' ){
      livelihoodCowsJerseyQnty.text = "0";
      providerone.updateDataLivelihoodCowsJerseyQnty(int.parse(livelihoodCowsJerseyQnty.text));}else{
      providerone.updateDataLivelihoodCowsJerseyQnty(int.parse(livelihoodCowsJerseyQnty.text));
    }

    if(livelihoodCalfFemaleQnty.text == null || livelihoodCalfFemaleQnty.text == 'null' ){
      livelihoodCalfFemaleQnty.text = "0";
      providerone.updateDataLivelihoodCalfFemaleQnty(int.parse(livelihoodCalfFemaleQnty.text));}else{
      providerone.updateDataLivelihoodCalfFemaleQnty(int.parse(livelihoodCalfFemaleQnty.text));
    }
    if(livelihoodCalfMaleQnty.text == null || livelihoodCalfMaleQnty.text == 'null' ){
      livelihoodCalfMaleQnty.text = "0";
      providerone.updateDataLivelihoodCalfMaleQnty(int.parse(livelihoodCalfMaleQnty.text));}else{
      providerone.updateDataLivelihoodCalfMaleQnty(int.parse(livelihoodCalfMaleQnty.text));
    }
    if(livelihoodFodderForSaleQnty.text == null || livelihoodFodderForSaleQnty.text == 'null' ){
      livelihoodFodderForSaleQnty.text = "0";
      providerone.updateDataLivelihoodFodderForSaleQnty(int.parse(livelihoodFodderForSaleQnty.text));}else{
      providerone.updateDataLivelihoodFodderForSaleQnty(int.parse(livelihoodFodderForSaleQnty.text));
    }
    if(livelihoodFodderOwnUseQnty.text == null || livelihoodFodderOwnUseQnty.text == 'null' ){
      livelihoodFodderOwnUseQnty.text = "0";
      providerone.updateDataLivelihoodFodderOwnUseQnty(int.parse(livelihoodFodderOwnUseQnty.text));}else{
      providerone.updateDataLivelihoodFodderOwnUseQnty(int.parse(livelihoodFodderOwnUseQnty.text));
    }
    if(livelihoodGoatAttapadiBlackQnty.text == null || livelihoodGoatAttapadiBlackQnty.text == 'null' ){
      livelihoodGoatAttapadiBlackQnty.text = "0";
      providerone.updateDataLivelihoodGoatAttapadiBlackQnty(int.parse(livelihoodGoatAttapadiBlackQnty.text));}else{
      providerone.updateDataLivelihoodGoatAttapadiBlackQnty(int.parse(livelihoodGoatAttapadiBlackQnty.text));
    }
    if(livelihoodGoatAttapadiBlackKidQnty.text == null || livelihoodGoatAttapadiBlackKidQnty.text == 'null' ){
      livelihoodGoatAttapadiBlackKidQnty.text = "0";
      providerone.updateDataLivelihoodGoatAttapadiBlackKidQnty(int.parse(livelihoodGoatAttapadiBlackKidQnty.text));}else{
      providerone.updateDataLivelihoodGoatAttapadiBlackKidQnty(int.parse(livelihoodGoatAttapadiBlackKidQnty.text));
    }
    if(livelihoodGoatMalabariQnty.text == null || livelihoodGoatMalabariQnty.text == 'null' ){
      livelihoodGoatMalabariQnty.text = "0";
      providerone.updateDataLivelihoodGoatMalabariQnty(int.parse(livelihoodGoatMalabariQnty.text));}else{
      providerone.updateDataLivelihoodGoatMalabariQnty(int.parse(livelihoodGoatMalabariQnty.text));
    }
    if(livelihoodGoatMalabariKidQnty.text == null || livelihoodGoatMalabariKidQnty.text == 'null' ){
      livelihoodGoatMalabariKidQnty.text = "0";
      providerone.updateDataLivelihoodGoatMalabariKidQnty(int.parse(livelihoodGoatMalabariKidQnty.text));}else{
      providerone.updateDataLivelihoodGoatMalabariKidQnty(int.parse(livelihoodGoatMalabariKidQnty.text));
    }
    if(livelihoodGoatOthersQnty.text == null || livelihoodGoatOthersQnty.text == 'null' ){
      livelihoodGoatOthersQnty.text = "0";
      providerone.updateDataLivelihoodGoatOthersQnty(int.parse(livelihoodGoatOthersQnty.text));}else{
      providerone.updateDataLivelihoodGoatOthersQnty(int.parse(livelihoodGoatOthersQnty.text));
    }
    if(livelihoodManureDryQnty.text == null || livelihoodManureDryQnty.text == 'null' ){
      livelihoodManureDryQnty.text = "0";
      providerone.updateDataLivelihoodManureDryQnty(int.parse(livelihoodManureDryQnty.text));}else{
      providerone.updateDataLivelihoodManureDryQnty(int.parse(livelihoodManureDryQnty.text));
    }
    if(livelihoodManureFreshQnty.text == null || livelihoodManureFreshQnty.text == 'null' ){
      livelihoodManureFreshQnty.text = "0";
      providerone.updateDataLivelihoodManureFreshQnty(int.parse(livelihoodManureFreshQnty.text));}else{
      providerone.updateDataLivelihoodManureFreshQnty(int.parse(livelihoodManureFreshQnty.text));
    }
    if(livelihoodPoultryEggProductionQnty.text == null || livelihoodPoultryEggProductionQnty.text == 'null' ){
      livelihoodPoultryEggProductionQnty.text = "0";
      providerone.updateDataLivelihoodPoultryEggProductionQnty(int.parse(livelihoodPoultryEggProductionQnty.text));}else{
      providerone.updateDataLivelihoodPoultryEggProductionQnty(int.parse(livelihoodPoultryEggProductionQnty.text));
    }
    if(livelihoodPoultryManureQnty.text == null || livelihoodPoultryManureQnty.text == 'null' ){
      livelihoodPoultryManureQnty.text = "0";
      providerone.updateDataPoultryManureQnty(int.parse(livelihoodPoultryManureQnty.text));}else{
      providerone.updateDataPoultryManureQnty(int.parse(livelihoodPoultryManureQnty.text));
    }
    if(lilivelihoodDuckqnty.text == null || lilivelihoodDuckqnty.text == 'null' ){
      lilivelihoodDuckqnty.text = "0";
      providerone.updateDataLivelihoodDuckqnty(int.parse(lilivelihoodDuckqnty.text));}else{
      providerone.updateDataLivelihoodDuckqnty(int.parse(lilivelihoodDuckqnty.text));
    }
    if(livelihoodBuffaloQnty.text == null || livelihoodBuffaloQnty.text == 'null' ){
      livelihoodBuffaloQnty.text = "0";
      providerone.updateDataLivelihoodBuffaloQnty(int.parse(livelihoodBuffaloQnty.text));}else{
      providerone.updateDataLivelihoodBuffaloQnty(int.parse(livelihoodBuffaloQnty.text));
    }
    if(livelihoodPoultryMarketingQnty.text == null || livelihoodPoultryMarketingQnty.text == 'null' ){
      livelihoodPoultryMarketingQnty.text = "0";
      providerone.updateDataLivelihoodPoultryMarketingQnty(int.parse(livelihoodPoultryMarketingQnty.text));}else{
      providerone.updateDataLivelihoodPoultryMarketingQnty(int.parse(livelihoodPoultryMarketingQnty.text));
    }
    // if(livelihoodGoatOthersQnty.text == null || livelihoodGoatOthersQnty.text == 'null' ){
    //   livelihoodGoatOthersQnty.text = "0";
    //   providerone.updateDataLivelihoodGoatOthersQnty(int.parse(livelihoodGoatOthersQnty.text));}else{
    //   providerone.updateDataLivelihoodGoatOthersQnty(int.parse(livelihoodGoatOthersQnty.text));
    // }

      providerone.updateLivelihoodGoatOthers(livelihoodgoatothers.text);

    // providerone.updateDataLivelihoodBuffaloQnty(int.parse(livelihoodBuffaloQnty.text));
    // providerone.updateDataLivelihoodDuckqnty(int.parse(lilivelihoodDuckqnty.text));

  }
}
