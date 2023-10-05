import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:main200623/constant/color_text.dart';
import 'package:main200623/view/add_data/sales.dart';
import 'package:main200623/view/update/updatesales.dart';
import 'package:main200623/view/widgets/dropdown_nosearch.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../control/text_controller.dart';
import '../../services/add_api.dart';
import '../lists.dart';
import '../widgets/elevate_click_button.dart';
import '../widgets/input_field.dart';
import 'package:http/http.dart' as http;

class UpdatePurchaseofrawmaterials extends StatefulWidget {
  const UpdatePurchaseofrawmaterials({
    Key? key,
    this.items,
  }) : super(key: key);
  final items;

  @override
  State<UpdatePurchaseofrawmaterials> createState() =>
      _UpdatePurchaseofrawmaterials();
}

class _UpdatePurchaseofrawmaterials
    extends State<UpdatePurchaseofrawmaterials> {
  @override
  void initState() {
    super.initState();
    getproductData();
    getSavedData();
  }

  List rawmaterial = [];
  List pulletsList = [];
  List manureselected = [];
  List fodderslipselected = [];
  List calveslist = [];
  List heipers = [];
  List cowslist = [];

  String? brandselected;
  String layerList = '';
  String cattleFeedList = '';
  String? milkReplacerList;
  String? selectedmilckreplacer;
  String? energyRichFeedList;

  // TextEditingController ingredientsForCattleFeedQntyn = TextEditingController();
  TextEditingController addDataTreeFooderQnty = TextEditingController();

  // TextEditingController addDataUreaTreatedStrawQnty = TextEditingController();
  TextEditingController calfStarterQnty = TextEditingController();
  TextEditingController chemicalFertilizersQnty = TextEditingController();
  TextEditingController fodderSeedsQnty = TextEditingController();
  TextEditingController grassFooderQnty = TextEditingController();
  TextEditingController growerQnty = TextEditingController();
  TextEditingController ingredientsForCattleFeedQnty = TextEditingController();
  TextEditingController ingredientsForPoultryFeedQnty = TextEditingController();
  TextEditingController livelihoodGoatOthers = TextEditingController();
  TextEditingController malabariGoatKidsQnty = TextEditingController();
  TextEditingController materialForPoultryCageFabricationQnty =
  TextEditingController();
  TextEditingController totalMixedRationQnty = TextEditingController();
  TextEditingController ureaTreatedMolassBlock = TextEditingController();
  TextEditingController dataPurchaseofrawmaterialsItemtype =
  TextEditingController();
  TextEditingController dataPurchaseofrawmaterialsBrand =
  TextEditingController();
  TextEditingController cowdungqnty = TextEditingController();
  TextEditingController goatmanureqnty = TextEditingController();
  TextEditingController poultrymanureqnty = TextEditingController();
  TextEditingController vermycompostqnty = TextEditingController();
  TextEditingController napierqty = TextEditingController();
  TextEditingController energyRichFeedQnty = TextEditingController();
  TextEditingController cattleFeedQnty = TextEditingController();
  TextEditingController co4qty = TextEditingController();
  TextEditingController co5qty = TextEditingController();
  TextEditingController redNapierQnty = TextEditingController();
  TextEditingController superNapierQnty = TextEditingController();
  TextEditingController guineaGrassQnty = TextEditingController();
  TextEditingController paraGrassQnty = TextEditingController();
  TextEditingController congoSignalQnty = TextEditingController();
  TextEditingController maleBuffaloCalvesQnty = TextEditingController();
  TextEditingController calvesHfQnty = TextEditingController();
  TextEditingController calvesGerseyQnty = TextEditingController();
  TextEditingController heipersHfQnty = TextEditingController();
  TextEditingController heipersGerseyQnty = TextEditingController();
  TextEditingController cowsHfQnty = TextEditingController();
  TextEditingController cowsGerseyQnty = TextEditingController();
  TextEditingController malabariGoatsQnty = TextEditingController();
  TextEditingController materialForPoultryQnty = TextEditingController();
  TextEditingController eggTraysQnty = TextEditingController();
  TextEditingController poultryFeedQnty = TextEditingController();
  TextEditingController brandqty = TextEditingController();
  TextEditingController layerqty = TextEditingController();
  TextEditingController milkReplacerQnty = TextEditingController();
  TextEditingController byPassProteinQnty = TextEditingController();
  TextEditingController byPassFatQnty = TextEditingController();
  TextEditingController tmrQnty = TextEditingController();
  TextEditingController silageQnty = TextEditingController();
  TextEditingController hayQnty = TextEditingController();
  TextEditingController ureaTreatedStrawQnty = TextEditingController();
  TextEditingController goatFeeDqnty = TextEditingController();
  TextEditingController kidStarterQnty = TextEditingController();
  TextEditingController bv380qty = TextEditingController();
  TextEditingController gramalakshmiqty = TextEditingController();
  TextEditingController gramapriyaqty = TextEditingController();
  TextEditingController pulletother = TextEditingController();
  TextEditingController pulletotherqty = TextEditingController();

  Future<void> getSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();


    String name = prefs.getString('authToken') ?? '';

    if(name.isNotEmpty){

      changeData();
    }
  }


  @override
  Widget build(BuildContext context) {
    var providerone = Provider.of<TextMain>(context, listen: false);

    return GestureDetector(
      onTap: () {
        if (!FocusScope
            .of(context)
            .hasPrimaryFocus) {
          FocusScope.of(context).unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('അസംസ്‌കൃത വസ്തുക്കൾ\nവാങ്ങുന്നരീതി'),
          backgroundColor: app_theam,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Headings(text: 'അസംസ്‌കൃത വസ്തുക്കൾ വാങ്ങുന്നരീതി'),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MultiSelectFormField(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    title: Text(
                      'ഇനം',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    dataSource: rawmaterials,
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
                    initialValue: rawmaterial,
                    onSaved: (value) {
                      setState(() {
                        rawmaterial = value;
                      });
                      if (value == null) return;
                      providerone.updateDataDataPurchaseofrawmaterialsItemtype(value);
                    },
                  ),
                ),
                if (rawmaterial != null &&
                    rawmaterial.contains('INGREDIENTS FOR CTTLE FEED'))
                  InputField(
                      hint: 'INGREDIENTS FOR CTTLE FEED (Qty)',
                      keytype: TextInputType.number,
                      controller: ingredientsForCattleFeedQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateIngredientsForCattleFeedQnty(valuee);
                      }),
                if (rawmaterial != null &&
                    rawmaterial.contains('INGREDIENTS FOR POULTRY FEED'))
                  InputField(
                      hint: 'INGREDIENTS FOR POULTRY FEED (Qty)',
                      keytype: TextInputType.number,
                      controller: ingredientsForPoultryFeedQnty,
                      onchanged: (value) {
                        setState(() {
                          int? valuee = int.tryParse(value);
                          providerone.updateIngredientsForPoultryFeedQnty(valuee);
                        });
                      }),

                if (rawmaterial != null &&
                    rawmaterial.contains('CHEMICAL FERTILIZERS'))
                  InputField(
                      hint: 'CHEMICAL FERTILIZERS (Qty)',
                      keytype: TextInputType.number,
                      controller: chemicalFertilizersQnty,
                      onchanged: (value) {
                        providerone.updateChemicalFertilizersQnty(
                            int.tryParse(value));
                      }),
                if (rawmaterial != null &&
                    rawmaterial.contains('FODDER SEEDS'))
                  InputField(
                      hint: 'FODDER SEEDS (Qty)',
                      keytype: TextInputType.number,
                      controller: fodderSeedsQnty,
                      onchanged: (value) {
                        providerone.updateFodderSeedsQnty(int.tryParse(value));
                      }),
                if (rawmaterial != null &&
                    rawmaterial.contains('GRASS FOODER'))
                  InputField(
                      hint: 'GRASS FOODER (Qty)',
                      keytype: TextInputType.number,
                      controller: grassFooderQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateGrassFooderQnty(valuee);
                      }),
                if (rawmaterial != null &&
                    rawmaterial.contains('TREE FOODER'))
                  InputField(
                      hint: 'TREE FOODER (Qty)',
                      keytype: TextInputType.number,
                      controller: addDataTreeFooderQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataTreeFooderQnty(valuee);
                      }),
                if (rawmaterial != null &&
                    rawmaterial.contains('MALABARI GOAT-KIDS'))
                  InputField(
                      hint: 'MALABARI GOAT-KIDS (Qty)',
                      keytype: TextInputType.number,
                      controller: malabariGoatKidsQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateMalabarGoatKidsQnty(valuee);
                      }),
                if (rawmaterial != null &&
                    rawmaterial.contains('GROWER'))
                  InputField(
                      hint: 'GROWER (Kg)',
                      keytype: TextInputType.number,
                      controller: growerQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateGrowerQnty(valuee);
                      }),
                if (rawmaterial != null &&
                    rawmaterial.contains('CALF STARTER'))
                  InputField(
                      hint: 'CALF STARTER (Qty)',
                      keytype: TextInputType.number,
                      controller: calfStarterQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateCaffStarterQnty(valuee);
                      }),
                if (rawmaterial != null &&
                    rawmaterial.contains('BYPASS PROTEIN'))
                  InputField(
                      hint: 'BYPASS PROTEIN (Kg)',
                      keytype: TextInputType.number,
                      controller: byPassProteinQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataByPassProteinQnty(valuee);
                      }),
                if (rawmaterial != null &&
                    rawmaterial.contains('BYPASS FAT'))
                  InputField(
                      hint: 'BYPASS FAT (Kg)',
                      keytype: TextInputType.number,
                      controller: byPassFatQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataByPassFatQnty(valuee);
                      }),
                if (rawmaterial != null &&
                    rawmaterial.contains('TOTAL MIXED RATION'))
                  InputField(
                      hint: 'TOTAL MIXED RATION (Kg)',
                      keytype: TextInputType.number,
                      controller: totalMixedRationQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateTotalMixedRationQnty(valuee);
                      }),
                if (rawmaterial != null &&
                    rawmaterial.contains('UREA MOLASS BLOCK'))
                  InputField(
                      hint: 'UREA MOLASS BLOCK (Kg)',
                      keytype: TextInputType.number,
                      controller: ureaTreatedMolassBlock,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateTotalMixedRationQnty(valuee);
                      }),
                if (rawmaterial != null &&
                    rawmaterial.contains('UREA TREATED STRAW'))
                  InputField(
                      hint: 'UREA TREATED STRAW (Kg)',
                      keytype: TextInputType.number,
                      controller: ureaTreatedStrawQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataUreaTreatedStrawQnty(valuee);
                      }),
                if (rawmaterial != null &&
                    rawmaterial.contains('MALE BUFFALO'))
                  InputField(
                      hint: 'MALE BUFFALO CALVES (Qty)',
                      keytype: TextInputType.number,
                      controller: maleBuffaloCalvesQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataMaleBuffaloCalvesQnty(valuee);
                      }),
                if (rawmaterial != null &&
                    rawmaterial.contains('MALABARI GOATS'))
                  InputField(
                      hint: 'MALABARI GOATS (Qty)',
                      keytype: TextInputType.number,
                      controller: malabariGoatsQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataMalabariGoatsQnty(valuee);
                      }),
                if (rawmaterial != null &&
                    rawmaterial
                        .contains('MATERIAL FOR POULTRY CAGE FABRICATION'))
                  InputField(
                      hint: 'MATERIAL FOR POULTRY CAGE FABRICATION (Qty)',
                      keytype: TextInputType.number,
                      controller: materialForPoultryQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateMaterialForPoultryCageFabricationQnty(
                            valuee);
                      }),
                if (rawmaterial != null && rawmaterial.contains('EGG TRAYS'))
                  InputField(
                      hint: 'EGG TRAYS (Qty)',
                      keytype: TextInputType.number,
                      controller: eggTraysQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataEggQnty(valuee);
                      }),
                if (rawmaterial != null &&
                    rawmaterial!.contains('POULTRY FEED'))
                  InputField(
                      hint: 'POULTRY FEED (Kg)',
                      keytype: TextInputType.number,
                      controller: poultryFeedQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataPoultryFeedQnty(valuee);
                      }),
                if (rawmaterial != null && rawmaterial.contains('SILAGE'))
                  InputField(
                      hint: 'SILAGE (Kg)',
                      keytype: TextInputType.number,
                      controller: silageQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataSilageQnty(valuee);
                      }),

                if (rawmaterial != null && rawmaterial.contains('HAY'))
                  InputField(
                      hint: 'HAY (Kg)',
                      keytype: TextInputType.number,
                      controller: hayQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataHayQnty(valuee);
                      }),

                if (rawmaterial != null && rawmaterial.contains('GOAT FEED'))
                  InputField(
                      hint: 'GOAT FEED (Kg)',
                      keytype: TextInputType.number,
                      controller: goatFeeDqnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataGoatFeeDqnty(valuee);
                      }),
                if (rawmaterial != null &&
                    rawmaterial.contains('KID STARTER'))
                  InputField(
                      hint: 'KID STARTER (Kg)',
                      keytype: TextInputType.number,
                      controller: kidStarterQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataKidStarterQnty(valuee);
                      }),
                if (rawmaterial != null && rawmaterial.contains('TMR'))
                  InputField(
                      hint: 'TMR (Kg)',
                      keytype: TextInputType.number,
                      controller: tmrQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataTmrQnty(valuee);
                      }),

                if (rawmaterial != null && rawmaterial.contains('LAYER'))
                  NoSearchDropdown(
                    onChanged: (value) {
                      setState(() {
                        layerList = value;
                      });
                      providerone.updateDataLayerList(value);
                    },
                    items: layeritems,
                    item: 'LAYER',
                  ),
                if (layerList != null &&
                    layerList.isNotEmpty)
                  InputField(
                      hint: 'LAYER(Qty)',
                      keytype: TextInputType.number,
                      controller: layerqty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataLayerqty(valuee);
                      }),

                if (rawmaterial != null &&
                    rawmaterial.contains('CATTLE FEED'))
                  NoSearchDropdown(
                    onChanged: (value) {
                      setState(() {
                        cattleFeedList = value;
                      });
                      providerone.updateDataCattleFeedList(value);
                    },
                    items: cattlefeed,
                    item: 'CATTLE FEED (Kg)',
                  ),
                if (cattleFeedList != null &&
                    cattleFeedList!.isNotEmpty)
                  InputField(
                      hint: 'CATTLE  FEED (Qty)',
                      keytype: TextInputType.number,
                      controller: cattleFeedQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataCattleFeedQnty(valuee);
                      }),
                if (rawmaterial != null &&
                    rawmaterial.contains('MILK REPLACER'))
                  NoSearchDropdown(
                    onChanged: (value) {
                      setState(() {
                        milkReplacerList = value;
                      });
                      providerone.updateDataMilkReplacerList(value);
                    },
                    items: milkreplacer,
                    item: 'MILK REPLACER',
                  ),
                if (rawmaterial != null &&
                    rawmaterial.contains('MILK REPLACER'))
                  InputField(
                      hint: 'MILK REPLACER (5 Kg)',
                      keytype: TextInputType.number,
                      controller: milkReplacerQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataMilkReplacerQnty(valuee);
                      }),
                if (rawmaterial != null &&
                    rawmaterial.contains('ENERGY RICH FEED'))
                  NoSearchDropdown(
                    onChanged: (value) {
                      setState(() {
                        energyRichFeedList = value;
                      });
                      providerone.updateDataEnergyRichFeedList(value);
                    },
                    items: enrgyrichfeed,
                    item: 'ENERGY RICH FEED',
                  ),
                if (energyRichFeedList != null)
                  InputField(
                      hint: 'ENERGY RICH FEED (Kg)',
                      keytype: TextInputType.number,
                      controller: energyRichFeedQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataEnergyRichFeedQnty(valuee);
                      }),
                // if (rawmaterial = null &&
                //     rawmaterial!.contains('BY PASS PROTEIN'))
                //   InputField(
                //       hint: 'BY PASS PROTEIN QTY',
                //       keytype: TextInputType.number,
                //       controller: bypassprotine,
                //       onchanged: (value) {
                //         int? valuee = int.tryParse(value);
                //         providerone.updateDataByPassProteinQnty(valuee);
                //       }),
                //

                if (rawmaterial != null && rawmaterial.contains('CALVES'))
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: MultiSelectFormField(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      title: Text(
                        'CALVES',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      dataSource: calves,
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
                      initialValue: calveslist,
                      onSaved: (value) {
                        setState(() {
                          calveslist = value;
                        });
                        if (value == null) return;
                        providerone.updateDataCalvesList(value);
                      },
                    ),
                  ),
                if (calveslist.contains('CALVES-H F'))
                  InputField(
                      hint: 'H F (Qty)',
                      keytype: TextInputType.number,
                      controller: calvesHfQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataCalvesHfQnty(valuee);
                      }),
                if (calveslist != null && calveslist.contains('CALVES-GERSEY'))
                  InputField(
                      hint: 'GERSEY (Qty)',
                      keytype: TextInputType.number,
                      controller: calvesGerseyQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataCalvesGerseyQnty(valuee);
                      }),
                if (rawmaterial != null && rawmaterial.contains('HEIFERS'))
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: MultiSelectFormField(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      title: Text(
                        'HEIFERS',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      dataSource: heifers,
                      textField: 'text',
                      valueField: 'value',
                      okButtonLabel: 'OK',
                      cancelButtonLabel: 'CANCEL',
                      // hintText: 'Please select one or more options',
                      initialValue: heipers,
                      onSaved: (value) {
                        setState(() {
                          heipers = value;
                        });
                        if (value == null) return;
                        providerone.updateDataHeipersList(value);
                      },
                    ),
                  ),
                if (heipers!.contains('HEIFERS-H F'))
                  InputField(
                      hint: 'H F (Qty)',
                      keytype: TextInputType.number,
                      controller: heipersHfQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataHeipersHfQnty(valuee);
                      }),
                if (heipers.contains('HEIFERS-GERSEY'))
                  InputField(
                      hint: 'GERSEY (Qty)',
                      keytype: TextInputType.number,
                      controller: heipersGerseyQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataHeipersGerseyQnty(valuee);
                      }),

                if (rawmaterial != null && rawmaterial.contains('COWS'))
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: MultiSelectFormField(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      title: Text(
                        'COWS',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      dataSource: cows,
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
                      initialValue: cowslist,
                      onSaved: (value) {
                        setState(() {
                          cowslist = value;
                        });
                        if (value == null) return;
                        providerone.updateDataCowsList(value);
                      },
                    ),
                  ),
                if (cowslist != null && cowslist.contains('COWS-H F'))
                  InputField(
                    hint: 'H F (Qty)',
                    keytype: TextInputType.number,
                    controller: cowsHfQnty,
                    onchanged: (value) {
                      int? valuee = int.tryParse(value);
                      providerone.updateDataCowsHfQnty(valuee);
                    },
                  ),
                if (cowslist != null && cowslist.contains('COWS-GERSEY'))
                  InputField(
                      hint: 'GERSEY (Qty)',
                      keytype: TextInputType.number,
                      controller: cowsGerseyQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataCowsGerseyQnty(valuee);
                      }),

                if (rawmaterial != null &&
                    rawmaterial.contains(
                        'PULLETS')) // Conditional statement starts here
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: MultiSelectFormField(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      title: Text(
                        'PULLET',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      dataSource: pullets,
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
                      initialValue: pulletsList,
                      onSaved: (value) {
                        setState(() {
                          pulletsList = value;
                        });
                        if (value == null) return;
                        providerone.updateDataPulletsList(value);
                      },
                    ),
                  ),
                if (pulletsList.contains('BV380'))
                  InputField(
                      hint: 'BV380 (Qty)',
                      keytype: TextInputType.number,
                      controller: bv380qty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDatabv380Qnty(valuee);
                      }),
                if (pulletsList.contains('GRAMALAKSHMI'))
                  InputField(
                      hint: 'GRAMALAKSHMI (Qty)',
                      keytype: TextInputType.number,
                      controller: gramalakshmiqty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDatagramalakshmiQnty(valuee);
                      }),
                if (pulletsList.contains('GRAMAPRIYA'))
                  InputField(
                      hint: 'GRAMAPRIYA (Qty)',
                      keytype: TextInputType.number,
                      controller: gramapriyaqty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDatagramapriyaQnty(valuee);
                      }),
                if (pulletsList.contains('OTHER'))
                  InputField(
                      hint: 'OTHER',
                      keytype: TextInputType.number,
                      controller: pulletother,
                      onchanged: (value) {
                        providerone.updateDataothers(value);
                      }),
                if (pulletsList.contains('OTHER'))
                  InputField(
                      hint: 'OTHER (Qty)',
                      keytype: TextInputType.number,
                      controller: gramapriyaqty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataPulletsQnty(valuee);
                      }),
                if (rawmaterial != null && rawmaterial.contains('MANURE'))
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: MultiSelectFormField(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      title: Text(
                        'MANURE',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      dataSource: manure,
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
                      initialValue: manureselected,
                      onSaved: (value) {
                        setState(() {
                          manureselected = value;
                        });
                        if (value == null) return;
                        providerone.updateDataManureList(value);
                      },
                    ),
                  ),

                if (manureselected != null &&
                    manureselected.contains('COW DUNG'))
                  InputField(
                      hint: 'COW DUNG (Qty)',
                      keytype: TextInputType.number,
                      controller: cowdungqnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataCowDungQnty(valuee);
                      }),
                if (manureselected != null &&
                    manureselected.contains('GOAT MANURE'))
                  InputField(
                      hint: 'GOAT MANURE (Qty)',
                      keytype: TextInputType.number,
                      controller: goatmanureqnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataGoatManureQnty(valuee);
                      }),
                if (manureselected != null &&
                    manureselected.contains('POULTRY MANURE'))
                  InputField(
                      hint: 'POULTRY MANURE (Qty)',
                      keytype: TextInputType.number,
                      controller: poultrymanureqnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataPoultryManureQnty(valuee);
                      }),
                if (manureselected != null &&
                    manureselected.contains('VERMY COMPOST'))
                  InputField(
                      hint: 'VERMY COMPOST (Qty)',
                      keytype: TextInputType.number,
                      controller: vermycompostqnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataVermyCompostQnty(valuee);
                      }),
                if (rawmaterial != null &&
                    rawmaterial.contains('FODDER SLIPS'))
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: MultiSelectFormField(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      title: Text(
                        'FODDER SLIPS',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      dataSource: fodderslip,
                      textField: 'text',
                      valueField: 'value',
                      okButtonLabel: 'OK',
                      cancelButtonLabel: 'CANCEL',
                      // hintText: 'Please select one or more options',
                      initialValue: fodderslipselected,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is required.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          fodderslipselected = value;
                        });
                        if (value == null) return;
                        providerone.updateDataFodderSlipsList(value);
                      },
                    ),
                  ),
                if (fodderslipselected != null &&
                    fodderslipselected.contains('NAPIER'))
                  InputField(
                      hint: 'NAPIER (Qty)',
                      keytype: TextInputType.number,
                      controller: napierqty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataNapierQnty(valuee);
                      }),
                if (fodderslipselected != null &&
                    fodderslipselected.contains('CO4'))
                  InputField(
                      hint: 'CO4 (Qty)',
                      keytype: TextInputType.number,
                      controller: co4qty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataCo4Qnty(valuee);
                      }),
                if (fodderslipselected != null &&
                    fodderslipselected.contains('CO5'))
                  InputField(
                      hint: 'CO5 (Qty)',
                      keytype: TextInputType.number,
                      controller: co5qty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataCo5Qnty(valuee);
                      }),
                if (fodderslipselected != null &&
                    fodderslipselected.contains('RED NAPIER'))
                  InputField(
                      hint: 'RED NAPIER (Qty)',
                      keytype: TextInputType.number,
                      controller: redNapierQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataRedNapierQnty(valuee);
                      }),
                if (fodderslipselected != null &&
                    fodderslipselected.contains('SUPER NAPIER'))
                  InputField(
                      hint: 'SUPER NAPIER (Qty)',
                      keytype: TextInputType.number,
                      controller: superNapierQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataSuperNapierQnty(valuee);
                      }),
                if (fodderslipselected != null &&
                    fodderslipselected.contains('GUINEA GRASS'))
                  InputField(
                      hint: 'GUINEA GRASS (Qty)',
                      keytype: TextInputType.number,
                      controller: guineaGrassQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataGuineaGrassQnty(valuee);
                      }),
                if (fodderslipselected != null &&
                    fodderslipselected.contains('PARA GRASS'))
                  InputField(
                      hint: 'PARA GRASS (Qty)',
                      keytype: TextInputType.number,
                      controller: paraGrassQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataParaGrassQnty(valuee);
                      }),
                if (fodderslipselected != null &&
                    fodderslipselected.contains('CONGO SIGNAL'))
                  InputField(
                      hint: 'CONGO SIGNAL (Qty)',
                      keytype: TextInputType.number,
                      controller: congoSignalQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataCongoSignalQnty(valuee);
                      }),
                ElevateClick(
                    ontap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                UpdateSalesData(items: widget.items),
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

  void getproductData() {
    try {
      // var providerone = context.read<TextMain>();

      var dataup = widget.items['purchaseOfRawMaterials'][0];
      setState(() {
        rawmaterial = dataup["data_purchaseofrawmaterials_itemtype"];
        ingredientsForPoultryFeedQnty.text = dataup["INGREDIENTS_FOR_POULTRY_FEED_qnty"];
        ingredientsForCattleFeedQnty.text = dataup["INGREDIENTS_FOR_CTTLE_FEED_qnty"];
        pulletsList = dataup["PULLETS_List"];
        manureselected = dataup["MANURE_List"];
        fodderslipselected = dataup["FODDER_SLIPS_List"];
        calveslist = dataup["CALVES_List"];
        heipers = dataup["HEIPERS_List"];
        cowslist = dataup["COWS_List"];
        // modePurchaseofrawmaterials = dataup["Mode_purchaseofrawmaterials"];
        cowdungqnty.text= dataup["COW_DUNG_qnty"];
        goatmanureqnty.text = dataup["GOAT_MANURE_qnty"];
        poultrymanureqnty.text = dataup["POULTRY_MANURE_qnty"];
        vermycompostqnty.text = dataup["VERMY_COMPOST_qnty"];
        napierqty.text = dataup["NAPIER_qnty"];
        co4qty.text = dataup["CO4_qnty"];
        co5qty.text = dataup["CO5_qnty"];
        redNapierQnty.text = dataup["RED_NAPIER_qnty"];
        superNapierQnty.text = dataup["SUPER_NAPIER_qnty"];
        guineaGrassQnty.text = dataup["GUINEA_GRASS_qnty"];
        paraGrassQnty.text = dataup["PARA_GRASS_qnty"];
        congoSignalQnty.text = dataup["CONGO_SIGNAL_qnty"];
        maleBuffaloCalvesQnty.text = dataup["MALE_BUFFALO_CALVES_qnty"];
        calvesHfQnty.text = dataup["CALVES_HF_qnty"];
        calvesGerseyQnty.text = dataup["CALVES_GERSEY_qnty"];
        heipersHfQnty.text = dataup["HEIPERS_HF_qnty"];
        heipersGerseyQnty.text = dataup["HEIPERS_GERSEY_qnty"];
        cowsHfQnty.text = dataup["COWS_HF_qnty"];
        cowsGerseyQnty.text = dataup["COWS_GERSEY_qnty"];
        malabariGoatsQnty.text = dataup["MALABARI_GOATS_qnty"];
        materialForPoultryQnty.text = dataup["MATERIAL_FOR_POULTRY_qnty"];
        eggTraysQnty.text = dataup["EGG_TRAYS_qnty"];
        poultryFeedQnty.text = dataup["POULTRY_FEED_qnty"];
        layerList = dataup["LAYER_List"];
        cattleFeedList = dataup["CATTLE_FEED_List"];
        cattleFeedQnty.text = dataup["CATTLE_FEED_qnty"];
        milkReplacerList = dataup["MILK_REPLACER_List"];
        milkReplacerQnty.text = dataup["MILK_REPLACER_qnty"];
        energyRichFeedList = dataup["ENERGY_RICH_FEED_List"];
        energyRichFeedQnty.text = dataup["ENERGY_RICH_FEED_qnty"];
        byPassProteinQnty.text = dataup["BY_PASS_PROTEIN_qnty"];
        byPassFatQnty.text = dataup["BY_PASS_FAT_qnty"];
        tmrQnty.text = dataup["TMR_qnty"];
        silageQnty.text = dataup["SILAGE_qnty"];
        hayQnty.text = dataup["HAY_qnty"];
        ureaTreatedStrawQnty.text = dataup["Urea_treated_Straw_qnty"];
        goatFeeDqnty.text = dataup["GOAT_FEEDqnty"];
        kidStarterQnty.text = dataup["KID_STARTER_qnty"];
        dataPurchaseofrawmaterialsBrand.text =
        dataup["data_purchaseofrawmaterials_brand"];
        // brandQnty  = dataup["BRAND_qnty"];
      });
    } catch (e) {
      // Handle error
      print('Error retrieving purchase data: $e');
      // Perform any necessary error handling or display a message to the user
    }
  }

  // //
  changeData() {
    var providerone = context.read<TextMain>();


    providerone.updateDataDataPurchaseofrawmaterialsItemtype(rawmaterial);
    providerone.updateDataManureList(manureselected);
    providerone.updateDataFodderSlipsList(fodderslipselected);
    providerone.updateDataCalvesList(calveslist);
    providerone.updateDataHeipersList(heipers);
    providerone.updateDataCowsList(cowslist);
    //
    providerone.updateDataMalabariGoatsQnty(
        int.tryParse(malabariGoatsQnty.text));

    providerone.updateDataMaterialForPoultryQnty(
        int.tryParse(materialForPoultryQnty.text));

    providerone.updateDataEggQnty(int.tryParse(eggTraysQnty.text));

    providerone.updateDataPoultryFeedQnty(int.tryParse(poultryFeedQnty.text));

    providerone.updateDataCalvesList(calveslist);

    providerone.updateDataCalvesHfQnty(int.tryParse(calvesHfQnty.text));

    providerone.updateDataCalvesGerseyQnty(int.tryParse(calvesGerseyQnty.text));

    providerone.updateDataHeipersList(heipers);

    providerone.updateDataHeipersHfQnty(int.tryParse(heipersHfQnty.text));

    providerone.updateDataHeipersGerseyQnty(
        int.tryParse(heipersGerseyQnty.text));

    providerone.updateDataCowsList(cowslist);

    providerone.updateDataCowsHfQnty(int.tryParse(cowsHfQnty.text));

    providerone.updateDataCowsGerseyQnty(int.tryParse(cowsGerseyQnty.text));

    providerone.updateDataPulletsList(pulletsList);
    providerone.updateDataManureList(manureselected);

    providerone.updateDataCowDungQnty(int.tryParse(cowdungqnty.text));

    providerone.updateDataGoatManureQnty(int.tryParse(goatmanureqnty.text));

    providerone.updateDataPoultryManureQnty(
        int.tryParse(poultrymanureqnty.text));

    providerone.updateDataVermyCompostQnty(int.tryParse(vermycompostqnty.text));

    providerone.updateDataFodderSlipsList(fodderslipselected);

    providerone.updateDataNapierQnty(int.tryParse(napierqty.text));

    providerone.updateDataCo4Qnty(int.tryParse(co4qty.text));

    providerone.updateDataCo5Qnty(int.tryParse(co5qty.text));

    providerone.updateDataRedNapierQnty(int.tryParse(redNapierQnty.text));

    providerone.updateDataSuperNapierQnty(int.tryParse(superNapierQnty.text));

    providerone.updateDataGuineaGrassQnty(int.tryParse(guineaGrassQnty.text));

    providerone.updateDataParaGrassQnty(int.tryParse(paraGrassQnty.text));

    providerone.updateDataCongoSignalQnty(int.tryParse(congoSignalQnty.text));

    providerone.updateDataPurchaseofrawmaterialsBrand(brandselected);
    //
    // providerone.updateDataBrandQnty(int.tryParse(brandQnty.text));

    providerone.updateDataLayerList(layerList);
    providerone.updateDataCattleFeedList(cattleFeedList);

    providerone.updateDataCattleFeedQnty(int.tryParse(cattleFeedQnty.text));

    providerone.updateDataMilkReplacerList(milkReplacerList);

    providerone.updateDataMilkReplacerQnty(int.tryParse(milkReplacerQnty.text));

    providerone.updateDataEnergyRichFeedList(energyRichFeedList);

    providerone.updateDataEnergyRichFeedQnty(
        int.tryParse(energyRichFeedQnty.text));

    providerone.updateDataByPassProteinQnty(
        int.tryParse(byPassProteinQnty.text));

    providerone.updateDataByPassFatQnty(int.tryParse(byPassFatQnty.text));

    providerone.updateDataTmrQnty(int.tryParse(tmrQnty.text));

    providerone.updateDataSilageQnty(int.tryParse(silageQnty.text));

    providerone.updateDataHayQnty(int.tryParse(hayQnty.text));

    providerone.updateDataUreaTreatedStrawQnty(int.tryParse(ureaTreatedStrawQnty.text));

    providerone.updateDataGoatFeeDqnty(int.tryParse(goatFeeDqnty.text));

    providerone.updateDataKidStarterQnty(int.tryParse(kidStarterQnty.text));
  }
}
