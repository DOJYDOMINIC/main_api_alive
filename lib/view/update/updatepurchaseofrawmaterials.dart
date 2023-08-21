import 'package:flutter/material.dart';
import 'package:main200623/constant/color_text.dart';
import 'package:main200623/view/add_data/sales.dart';
import 'package:main200623/view/update/updatesales.dart';
import 'package:main200623/view/widgets/dropdown_nosearch.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:provider/provider.dart';
import '../../control/text_controller.dart';
import '../lists.dart';
import '../widgets/elevate_click_button.dart';
import '../widgets/input_field.dart';

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
    // getproductData();
    // changeData();
  }

  List? rawmaterial = [];
  List? pulletsselected = [];
  List? manureselected = [];
  List? fodderslipselected = [];
  List? calveslist = [];
  List? heipers = [];
  List? cowslist = [];

  String? brandselected;
  String? layerselected;
  String? cattlefeedlist;
  String? selectmilkreplacer;
  String? selectedmilckreplacer;
  String? energyrichfeed;

  TextEditingController ingredientsForCattleFeedQntyn = TextEditingController();
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
  TextEditingController napier = TextEditingController();
  TextEditingController milmaqty = TextEditingController();
  TextEditingController cattlefeedqty = TextEditingController();
  TextEditingController co4 = TextEditingController();
  TextEditingController co5 = TextEditingController();
  TextEditingController rednapier = TextEditingController();
  TextEditingController supernapier = TextEditingController();
  TextEditingController guineagrass = TextEditingController();
  TextEditingController paragrass = TextEditingController();
  TextEditingController congosignal = TextEditingController();
  TextEditingController malebefallocalvesqty = TextEditingController();
  TextEditingController clhf = TextEditingController();
  TextEditingController clgersey = TextEditingController();
  TextEditingController he_hf = TextEditingController();
  TextEditingController he_gersey = TextEditingController();
  TextEditingController cw_hf = TextEditingController();
  TextEditingController cw_gersey = TextEditingController();
  TextEditingController malabarigoats = TextEditingController();
  TextEditingController materialforpoltry = TextEditingController();
  TextEditingController eggsqty = TextEditingController();
  TextEditingController pol_feed_qty = TextEditingController();
  TextEditingController brandqty = TextEditingController();
  TextEditingController layerqty = TextEditingController();
  TextEditingController selectedmilkreplacer = TextEditingController();
  TextEditingController bypassprotine = TextEditingController();
  TextEditingController byPassFatQnty = TextEditingController();
  TextEditingController tmr = TextEditingController();
  TextEditingController silage = TextEditingController();
  TextEditingController hay = TextEditingController();
  TextEditingController ureaTreatedStrawQnty = TextEditingController();
  TextEditingController goatfeed = TextEditingController();
  TextEditingController kidstarter = TextEditingController();
  TextEditingController bv380qty = TextEditingController();
  TextEditingController gramalakshmiqty = TextEditingController();
  TextEditingController gramapriyaqty = TextEditingController();
  TextEditingController pulletother = TextEditingController();
  TextEditingController pulletotherqty = TextEditingController();







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
                      providerone
                          .updateDataDataPurchaseofrawmaterialsItemtype(value);
                    },
                  ),
                ),
                if (rawmaterial != null &&
                    rawmaterial!.contains('INGREDIENTS FOR CTTLE FEED'))
                  InputField(
                      hint: 'INGREDIENTS FOR CTTLE FEED (Qty)',
                      keytype: TextInputType.number,
                      controller: ingredientsForCattleFeedQntyn,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateIngredientsForCattleFeedQnty(valuee);
                      }),
                if (rawmaterial != null &&
                    rawmaterial!.contains('INGREDIENTS FOR POULTRY FEED'))
                  InputField(
                      hint: 'INGREDIENTS FOR POULTRY FEED (Qty)',
                      keytype: TextInputType.number,
                      controller: ingredientsForPoultryFeedQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateIngredientsForCattleFeedQnty(valuee);
                      }),

                if (rawmaterial != null &&
                    rawmaterial!.contains('CHEMICAL FERTILIZERS'))
                  InputField(
                      hint: 'CHEMICAL FERTILIZERS (Qty)',
                      keytype: TextInputType.number,
                      controller: chemicalFertilizersQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateChemicalFertilizersQnty(valuee);
                      }),
                if (rawmaterial != null &&
                    rawmaterial!.contains('FODDER SEEDS'))
                  InputField(
                      hint: 'FODDER SEEDS (Qty)',
                      keytype: TextInputType.number,
                      controller:fodderSeedsQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateFodderSeedsQnty(valuee);
                      }),
                if (rawmaterial != null &&
                    rawmaterial!.contains('GRASS FOODER'))
                  InputField(
                      hint: 'GRASS FOODER (Qty)',
                      keytype: TextInputType.number,
                      controller:grassFooderQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateGrassFooderQnty(valuee);
                      }),
                if (rawmaterial != null &&
                    rawmaterial!.contains('TREE FOODER'))
                  InputField(
                      hint: 'TREE FOODER (Qty)',
                      keytype: TextInputType.number,
                      controller:addDataTreeFooderQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataTreeFooderQnty(valuee);
                      }),
                if (rawmaterial != null &&
                    rawmaterial!.contains('MALABARI GOAT-KIDS'))
                  InputField(
                      hint: 'MALABARI GOAT-KIDS (Qty)',
                      keytype: TextInputType.number,
                      controller:malabariGoatKidsQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateMalabarGoatKidsQnty(valuee);
                      }),
                if (rawmaterial != null &&
                    rawmaterial!.contains('GROWER'))
                  InputField(
                      hint: 'GROWER (Kg)',
                      keytype: TextInputType.number,
                      controller:growerQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateGrowerQnty(valuee);
                      }),
                if (rawmaterial != null &&
                    rawmaterial!.contains('CALF STARTER'))
                  InputField(
                      hint: 'CALF STARTER (Qty)',
                      keytype: TextInputType.number,
                      controller:calfStarterQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateCaffStarterQnty(valuee);
                      }),
                if (rawmaterial != null &&
                    rawmaterial!.contains('BYPASS PROTEIN'))
                  InputField(
                      hint: 'BYPASS PROTEIN (Kg)',
                      keytype: TextInputType.number,
                      controller:bypassprotine,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataByPassProteinQnty(valuee);
                      }),
                if (rawmaterial != null &&
                    rawmaterial!.contains('BYPASS FAT'))
                  InputField(
                      hint: 'BYPASS FAT (Kg)',
                      keytype: TextInputType.number,
                      controller:byPassFatQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataByPassFatQnty(valuee);
                      }),
                if (rawmaterial != null &&
                    rawmaterial!.contains('TOTAL MIXED RATION'))
                  InputField(
                      hint: 'TOTAL MIXED RATION (Kg)',
                      keytype: TextInputType.number,
                      controller:totalMixedRationQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateTotalMixedRationQnty(valuee);
                      }),
                if (rawmaterial != null &&
                    rawmaterial!.contains('UREA MOLASS BLOCK'))
                  InputField(
                      hint: 'UREA MOLASS BLOCK (Kg)',
                      keytype: TextInputType.number,
                      controller:ureaTreatedMolassBlock,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateTotalMixedRationQnty(valuee);
                      }),
                if (rawmaterial != null &&
                    rawmaterial!.contains('UREA TREATED STRAW'))
                  InputField(
                      hint: 'UREA TREATED STRAW (Kg)',
                      keytype: TextInputType.number,
                      controller: ureaTreatedStrawQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataUreaTreatedStrawQnty(valuee);
                      }),
                if (rawmaterial != null &&
                    rawmaterial!.contains('MALE BUFFALO'))
                  InputField(
                      hint: 'MALE BUFFALO CALVES (Qty)',
                      keytype: TextInputType.number,
                      controller: malebefallocalvesqty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataMaleBuffaloCalvesQnty(valuee);
                      }),
                if (rawmaterial != null &&
                    rawmaterial!.contains('MALABARI GOATS'))
                  InputField(
                      hint: 'MALABARI GOATS (Qty)',
                      keytype: TextInputType.number,
                      controller: malabarigoats,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataMalabariGoatsQnty(valuee);
                      }),
                if (rawmaterial != null &&
                    rawmaterial!
                        .contains('MATERIAL FOR POULTRY CAGE FABRICATION'))
                  InputField(
                      hint: 'MATERIAL FOR POULTRY CAGE FABRICATION (Qty)',
                      keytype: TextInputType.number,
                      controller: materialforpoltry,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateMaterialForPoultryCageFabricationQnty(valuee);
                      }),
                if (rawmaterial != null && rawmaterial!.contains('EGG TRAYS'))
                  InputField(
                      hint: 'EGG TRAYS (Qty)',
                      keytype: TextInputType.number,
                      controller: eggsqty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataEggQnty(valuee);
                      }),
                if (rawmaterial != null &&
                    rawmaterial!.contains('POULTRY FEED'))
                  InputField(
                      hint: 'POULTRY FEED (Kg)',
                      keytype: TextInputType.number,
                      controller: pol_feed_qty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataPoultryFeedQnty(valuee);
                      }),
                if (rawmaterial != null && rawmaterial!.contains('SILAGE'))
                  InputField(
                      hint: 'SILAGE (Kg)',
                      keytype: TextInputType.number,
                      controller: silage,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataSilageQnty(valuee);
                      }),

                if (rawmaterial != null && rawmaterial!.contains('HAY'))
                  InputField(
                      hint: 'HAY (Kg)',
                      keytype: TextInputType.number,
                      controller: hay,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataHayQnty(valuee);
                      }),

                if (rawmaterial != null && rawmaterial!.contains('GOAT FEED'))
                  InputField(
                      hint: 'GOAT FEED (Kg)',
                      keytype: TextInputType.number,
                      controller: goatfeed,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataGoatFeeDqnty(valuee);
                      }),
                if (rawmaterial != null &&
                    rawmaterial!.contains('KID STARTER'))
                  InputField(
                      hint: 'KID STARTER (Kg)',
                      keytype: TextInputType.number,
                      controller: kidstarter,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataKidStarterQnty(valuee);
                      }),
                if (rawmaterial != null && rawmaterial!.contains('TMR'))
                  InputField(
                      hint: 'TMR (Kg)',
                      keytype: TextInputType.number,
                      controller: tmr,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataTmrQnty(valuee);
                      }),

                if (rawmaterial != null && rawmaterial!.contains('LAYER'))
                  NoSearchDropdown(
                    onChanged: (value) {
                      setState(() {
                        layerselected = value;
                      });
                      providerone.updateDataLayerList(value);
                    },
                    items: layeritems,
                    item: 'LAYER',
                  ),
                if (layerselected != null &&
                    layerselected!.isNotEmpty)
                  InputField(
                      hint: 'LAYER(Qty)',
                      keytype: TextInputType.number,
                      controller: layerqty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataLayerqty(valuee);
                      }),

                if (rawmaterial != null &&
                    rawmaterial!.contains('CATTLE FEED'))
                  NoSearchDropdown(
                    onChanged: (value) {
                      setState(() {
                        cattlefeedlist = value;
                      });
                      providerone.updateDataCattleFeedList(value);
                    },
                    items: cattlefeed,
                    item: 'CATTLE FEED (Kg)',
                  ),
                if (cattlefeedlist != null &&
                    cattlefeedlist!.isNotEmpty)
                  InputField(
                      hint: 'CATTLE  FEED (Qty)',
                      keytype: TextInputType.number,
                      controller: cattlefeedqty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataCattleFeedQnty(valuee);
                      }),
                if (rawmaterial != null &&
                    rawmaterial!.contains('MILK REPLACER'))
                  NoSearchDropdown(
                    onChanged: (value) {
                      setState(() {
                        selectmilkreplacer = value;
                      });
                      providerone.updateDataMilkReplacerList(value);
                    },
                    items: milkreplacer,
                    item: 'MILK REPLACER',
                  ),
                if (rawmaterial != null &&
                    rawmaterial!.contains('MILK REPLACER'))
                  InputField(
                      hint: 'MILK REPLACER (5 Kg)',
                      keytype: TextInputType.number,
                      controller: selectedmilkreplacer,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataMilkReplacerQnty(valuee);
                      }),
                if (rawmaterial != null &&
                    rawmaterial!.contains('ENERGY RICH FEED'))
                  NoSearchDropdown(
                    onChanged: (value) {
                      setState(() {
                        energyrichfeed = value;
                      });
                      providerone.updateDataEnergyRichFeedList(value);
                    },
                    items: enrgyrichfeed,
                    item: 'ENERGY RICH FEED',
                  ),
                if (energyrichfeed != null)
                  InputField(
                      hint: 'ENERGY RICH FEED (Kg)',
                      keytype: TextInputType.number,
                      controller: milmaqty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataEnergyRichFeedQnty(valuee);
                      }),
                // if (rawmaterial != null &&
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

                if (rawmaterial != null && rawmaterial!.contains('CALVES'))
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
                if (calveslist!.contains('CALVES-H F'))
                  InputField(
                      hint: 'H F (Qty)',
                      keytype: TextInputType.number,
                      controller: clhf,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataCalvesHfQnty(valuee);
                      }),
                if (calveslist != null && calveslist!.contains('CALVES-GERSEY'))
                  InputField(
                      hint: 'GERSEY (Qty)',
                      keytype: TextInputType.number,
                      controller: clgersey,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataCalvesGerseyQnty(valuee);
                      }),
                if (rawmaterial != null && rawmaterial!.contains('HEIFERS'))
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
                      controller: he_hf,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataHeipersHfQnty(valuee);
                      }),
                if (heipers!.contains('HEIFERS-GERSEY'))
                  InputField(
                      hint: 'GERSEY (Qty)',
                      keytype: TextInputType.number,
                      controller: he_gersey,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataHeipersGerseyQnty(valuee);
                      }),

                if (rawmaterial != null && rawmaterial!.contains('COWS'))
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
                if (cowslist != null && cowslist!.contains('COWS-H F'))
                  InputField(
                    hint: 'H F (Qty)',
                    keytype: TextInputType.number,
                    controller: cw_hf,
                    onchanged: (value) {
                      int? valuee = int.tryParse(value);
                      providerone.updateDataCowsHfQnty(valuee);
                    },
                  ),
                if (cowslist != null && cowslist!.contains('COWS-GERSEY'))
                  InputField(
                      hint: 'GERSEY (Qty)',
                      keytype: TextInputType.number,
                      controller: cw_gersey,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataCowsGerseyQnty(valuee);
                      }),

                if (rawmaterial != null &&
                    rawmaterial!.contains(
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
                      initialValue: pulletsselected,
                      onSaved: (value) {
                        setState(() {
                          pulletsselected = value;
                        });
                        if (value == null) return;
                        providerone.updateDataPulletsList(value);
                      },
                    ),
                  ),
                if (pulletsselected!.contains('BV380'))
                  InputField(
                      hint: 'BV380 (Qty)',
                      keytype: TextInputType.number,
                      controller: bv380qty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDatabv380Qnty(valuee);
                      }),
                if (pulletsselected!.contains('GRAMALAKSHMI'))
                  InputField(
                      hint: 'GRAMALAKSHMI (Qty)',
                      keytype: TextInputType.number,
                      controller: gramalakshmiqty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDatagramalakshmiQnty(valuee);
                      }),
                if (pulletsselected!.contains('GRAMAPRIYA'))
                  InputField(
                      hint: 'GRAMAPRIYA (Qty)',
                      keytype: TextInputType.number,
                      controller: gramapriyaqty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDatagramapriyaQnty(valuee);
                      }),
                if (pulletsselected!.contains('OTHER'))
                  InputField(
                      hint: 'OTHER',
                      keytype: TextInputType.number,
                      controller: pulletother,
                      onchanged: (value) {
                        providerone.updateDataothers(value);
                      }),
                if (pulletsselected!.contains('OTHER'))
                  InputField(
                      hint: 'OTHER (Qty)',
                      keytype: TextInputType.number,
                      controller: gramapriyaqty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataPulletsQnty(valuee);
                      }),
                if (rawmaterial != null && rawmaterial!.contains('MANURE'))
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
                    manureselected!.contains('COW DUNG'))
                  InputField(
                      hint: 'COW DUNG (Qty)',
                      keytype: TextInputType.number,
                      controller: cowdungqnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataCowDungQnty(valuee);
                      }),
                if (manureselected != null &&
                    manureselected!.contains('GOAT MANURE'))
                  InputField(
                      hint: 'GOAT MANURE (Qty)',
                      keytype: TextInputType.number,
                      controller: goatmanureqnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataGoatManureQnty(valuee);
                      }),
                if (manureselected != null &&
                    manureselected!.contains('POULTRY MANURE'))
                  InputField(
                      hint: 'POULTRY MANURE (Qty)',
                      keytype: TextInputType.number,
                      controller: poultrymanureqnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataPoultryManureQnty(valuee);
                      }),
                if (manureselected != null &&
                    manureselected!.contains('VERMY COMPOST'))
                  InputField(
                      hint: 'VERMY COMPOST (Qty)',
                      keytype: TextInputType.number,
                      controller: vermycompostqnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataVermyCompostQnty(valuee);
                      }),
                if (rawmaterial != null &&
                    rawmaterial!.contains('FODDER SLIPS'))
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
                    fodderslipselected!.contains('NAPIER'))
                  InputField(
                      hint: 'NAPIER (Qty)',
                      keytype: TextInputType.number,
                      controller: napier,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataNapierQnty(valuee);
                      }),
                if (fodderslipselected != null &&
                    fodderslipselected!.contains('CO4'))
                  InputField(
                      hint: 'CO4 (Qty)',
                      keytype: TextInputType.number,
                      controller: co4,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataCo4Qnty(valuee);
                      }),
                if (fodderslipselected != null &&
                    fodderslipselected!.contains('CO5'))
                  InputField(
                      hint: 'CO5 (Qty)',
                      keytype: TextInputType.number,
                      controller: co5,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataCo5Qnty(valuee);
                      }),
                if (fodderslipselected != null &&
                    fodderslipselected!.contains('RED NAPIER'))
                  InputField(
                      hint: 'RED NAPIER (Qty)',
                      keytype: TextInputType.number,
                      controller: rednapier,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataRedNapierQnty(valuee);
                      }),
                if (fodderslipselected != null &&
                    fodderslipselected!.contains('SUPER NAPIER'))
                  InputField(
                      hint: 'SUPER NAPIER (Qty)',
                      keytype: TextInputType.number,
                      controller: supernapier,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataSuperNapierQnty(valuee);
                      }),
                if (fodderslipselected != null &&
                    fodderslipselected!.contains('GUINEA GRASS'))
                  InputField(
                      hint: 'GUINEA GRASS (Qty)',
                      keytype: TextInputType.number,
                      controller: guineagrass,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataGuineaGrassQnty(valuee);
                      }),
                if (fodderslipselected != null &&
                    fodderslipselected!.contains('PARA GRASS'))
                  InputField(
                      hint: 'PARA GRASS (Qty)',
                      keytype: TextInputType.number,
                      controller: paragrass,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataParaGrassQnty(valuee);
                      }),
                if (fodderslipselected != null &&
                    fodderslipselected!.contains('CONGO SIGNAL'))
                  InputField(
                      hint: 'CONGO SIGNAL (Qty)',
                      keytype: TextInputType.number,
                      controller: congosignal,
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
                    text: 'Next')
              ],
            ),
          ),
        ),
      ),
    );
  }

  // void getproductData() {
  //   try {
  //     // var providerone = context.read<TextMain>();
  //
  //     var dataup = widget.items['products'][0];
  //     setState(() {
  //       rawmaterial = dataup["data_purchaseofrawmaterials_itemtype"];
  //       pulletsList = dataup["PULLETS_List"];
  //       manureList=dataup["MANURE_List"];
  //       fodderSlipsList =dataup["FODDER_SLIPS_List"];
  //       calvesList =dataup["CALVES_List"];
  //       heipersList=dataup["HEIPERS_List"];
  //       cowsList=dataup["COWS_List"];
  //       // modePurchaseofrawmaterials .text =dataup["Mode_purchaseofrawmaterials"];
  //
  //       cowDungQnty = dataup["COW_DUNG_qnty"];
  //       goatManureQnty = dataup["GOAT_MANURE_qnty"];
  //       poultryManureQnty  = dataup["POULTRY_MANURE_qnty"];
  //       vermyCompostQnty  = dataup["VERMY_COMPOST_qnty"];
  //       napierQnty  = dataup["NAPIER_qnty"];
  //       co4Qnty  = dataup["CO4_qnty"];
  //       co5Qnty  = dataup["CO5_qnty"];
  //       redNapierQnty  = dataup["RED_NAPIER_qnty"];
  //       superNapierQnty  = dataup["SUPER_NAPIER_qnty"];
  //       guineaGrassQnty  = dataup["GUINEA_GRASS_qnty"];
  //       paraGrassQnty  = dataup["PARA_GRASS_qnty"];
  //       congoSignalQnty = dataup["CONGO_SIGNAL_qnty"];
  //       maleBuffaloCalvesQnty = dataup["MALE_BUFFALO_CALVES_qnty"];
  //       calvesHfQnty = dataup["CALVES_HF_qnty"];
  //       calvesGerseyQnty = dataup["CALVES_GERSEY_qnty"];
  //       heipersHfQnty  = dataup["HEIPERS_HF_qnty"];
  //       heipersGerseyQnty  = dataup["HEIPERS_GERSEY_qnty"];
  //       cowsHfQnty  = dataup["COWS_HF_qnty"];
  //       cowsGerseyQnty = dataup["COWS_GERSEY_qnty"];
  //       malabariGoatsQnty = dataup["MALABARI_GOATS_qnty"];
  //       materialForPoultryQnty = dataup["MATERIAL_FOR_POULTRY_qnty"];
  //       eggTraysQnty= dataup["EGG_TRAYS_qnty"];
  //       poultryFeedQnty = dataup["POULTRY_FEED_qnty"];
  //       layerList = dataup["LAYER_List"];
  //       cattleFeedList = dataup["CATTLE_FEED_List"];
  //       cattleFeedQnty = dataup["CATTLE_FEED_qnty"];
  //       milkReplacerList = dataup["MILK_REPLACER_List"];
  //       milkReplacerQnty  = dataup["MILK_REPLACER_qnty"];
  //       energyRichFeedList = dataup["ENERGY_RICH_FEED_List"];
  //       energyRichFeedQnty  = dataup["ENERGY_RICH_FEED_qnty"];
  //       byPassProteinQnty  = dataup["BY_PASS_PROTEIN_qnty"];
  //       byPassFatQnty  = dataup["BY_PASS_FAT_qnty"];
  //       tmrQnty  = dataup["TMR_qnty"];
  //       silageQnty  = dataup["SILAGE_qnty"];
  //       hayQnty  = dataup["HAY_qnty"];
  //       ureaTreatedStrawQnty  = dataup["Urea_treated_Straw_qnty"];
  //       goatFeeDqnty  = dataup["GOAT_FEEDqnty"];
  //       kidStarterQnty  = dataup["KID_STARTER_qnty"];
  //       dataPurchaseofrawmaterialsBrand  = dataup["data_purchaseofrawmaterials_brand"];
  //       brandQnty  = dataup["BRAND_qnty"];
  //     });
  //   } catch (e) {
  //     // Handle error
  //     print('Error retrieving purchase data: $e');
  //     // Perform any necessary error handling or display a message to the user
  //   }
  // }
  //
  // //
  // changeData() {
  //   var providerone = Provider.of<TextMain>(context);

    // providerone.updateDataDataPurchaseofrawmaterialsItemtype(dataPurchaseofrawmaterialsItemtype);
    // //
    //   int? a = int.tryParse(malabariGoatsQnty.text);
    //   providerone.updateDataMalabariGoatsQnty(a);
    //
    //   int? b = int.tryParse(materialForPoultryQnty.text);
    //   providerone.updateDataMaterialForPoultryQnty(b);
    //
    //   int? c = int.tryParse(eggTraysQnty.text);
    //   providerone.updateDataEggQnty(c);
    //
    //   int? d = int.tryParse(poultryFeedQnty.text);
    //   providerone.updateDataPoultryFeedQnty(d);
    //
    //   providerone.updateDataCalvesList(calvesList);
    //
    //   int? e = int.tryParse(calvesHfQnty.text);
    //   providerone.updateDataCalvesHfQnty(e);
    //
    //   int? f = int.tryParse(calvesGerseyQnty.text);
    //   providerone.updateDataCalvesGerseyQnty(f);
    //
    //   providerone.updateDataHeipersList(heipersList);
    //
    //   int? g = int.tryParse(heipersHfQnty.text);
    //   providerone.updateDataHeipersHfQnty(g);
    //
    //   int? h = int.tryParse(heipersGerseyQnty.text);
    //   providerone.updateDataHeipersGerseyQnty(h);
    //
    //   providerone.updateDataCowsList(cowsList);
    //
    //   int? i = int.tryParse(cowsHfQnty.text);
    //   providerone.updateDataCowsHfQnty(i);
    //
    //   int? j = int.tryParse(cowsGerseyQnty.text);
    //   providerone.updateDataCowsGerseyQnty(j);
    //
    //   providerone.updateDataPulletsList(pulletsList);
    //   providerone.updateDataManureList(manureList);
    //
    //   int? k = int.tryParse(cowDungQnty.text);
    //   providerone.updateDataCowDungQnty(k);
    //
    //   int? l = int.tryParse(goatManureQnty.text);
    //   providerone.updateDataGoatManureQnty(l);
    //
    //   int? m = int.tryParse(poultryManureQnty.text);
    //   providerone.updateDataPoultryManureQnty(m);
    //
    //   int? n = int.tryParse(vermyCompostQnty.text);
    //   providerone.updateDataVermyCompostQnty(n);
    //
    //   providerone.updateDataFodderSlipsList(fodderSlipsList);
    //
    //   int? o = int.tryParse(napierQnty.text);
    //   providerone.updateDataNapierQnty(o);
    //
    //   int? p = int.tryParse(co4Qnty.text);
    //   providerone.updateDataCo4Qnty(p);
    //
    //   int? q = int.tryParse(co5Qnty.text);
    //   providerone.updateDataCo5Qnty(q);
    //
    //   int? r = int.tryParse(redNapierQnty.text);
    //   providerone.updateDataRedNapierQnty(r);
    //
    //   int? s = int.tryParse(superNapierQnty.text);
    //   providerone.updateDataSuperNapierQnty(s);
    //
    //   int? t = int.tryParse(guineaGrassQnty.text);
    //   providerone.updateDataGuineaGrassQnty(t);
    //
    //   int? u = int.tryParse(paraGrassQnty.text);
    //   providerone.updateDataParaGrassQnty(u);
    //
    //   int?  v = int.tryParse(congoSignalQnty.text);
    //   providerone.updateDataCongoSignalQnty(v);
    //
    //   providerone.updateDataPurchaseofrawmaterialsBrand(brandselected);
    //
    //   int?  w = int.tryParse(brandQnty.text);
    //   providerone.updateDataBrandQnty(w);
    //
    //   providerone.updateDataLayerList(layerList);
    //   providerone.updateDataCattleFeedList(cattleFeedList);
    //
    //   int?  x = int.tryParse(cattleFeedQnty.text);
    //   providerone.updateDataCattleFeedQnty(x);
    //
    //   providerone.updateDataMilkReplacerList(milkReplacerList);
    //
    //   int?  y = int.tryParse(milkReplacerQnty.text);
    //   providerone.updateDataMilkReplacerQnty(y);
    //
    //   providerone.updateDataEnergyRichFeedList(energyRichFeedList);
    //
    //   int?  z = int.tryParse(energyRichFeedQnty.text);
    //   providerone.updateDataEnergyRichFeedQnty(z);
    //
    //   int?  aa = int.tryParse(byPassProteinQnty.text);
    //   providerone.updateDataByPassProteinQnty(aa);
    //
    //   int?  bb = int.tryParse(byPassFatQnty.text);
    //   providerone.updateDataByPassFatQnty(bb);
    //
    //   int?  cc = int.tryParse(tmrQnty.text);
    //   providerone.updateDataTmrQnty(cc);
    //
    //   int?  dd = int.tryParse(silageQnty.text);
    //   providerone.updateDataSilageQnty(dd);
    //
    //   int?  ee = int.tryParse(hayQnty.text);
    //   providerone.updateDataHayQnty(ee);
    //
    //   int?  ff = int.tryParse(ureaTreatedStrawQnty.text);
    //   providerone.updateDataUreaTreatedStrawQnty(ff);
    //
    //   int?  gg = int.tryParse(goatFeeDqnty.text);
    //   providerone.updateDataGoatFeeDqnty(gg);
    //
    //   int? hh = int.tryParse(kidStarterQnty.text);
    //   providerone.updateDataKidStarterQnty(hh);
  // }
}
