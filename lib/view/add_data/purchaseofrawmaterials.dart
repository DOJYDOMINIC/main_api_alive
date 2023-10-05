import 'package:flutter/material.dart';
import 'package:main200623/constant/color_text.dart';
import 'package:main200623/view/add_data/sales.dart';
import 'package:main200623/view/widgets/dropdown_nosearch.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:provider/provider.dart';
import '../../control/text_controller.dart';
import '../lists.dart';
import '../widgets/elevate_click_button.dart';
import '../widgets/input_field.dart';

class Purchaseofrawmaterials extends StatefulWidget {
  const Purchaseofrawmaterials({
    Key? key,
  }) : super(key: key);

  @override
  State<Purchaseofrawmaterials> createState() => _PurchaseofrawmaterialsState();
}

class _PurchaseofrawmaterialsState extends State<Purchaseofrawmaterials> {
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
  TextEditingController materialForPoultryCageFabricationQnty = TextEditingController();
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
          title: Text('അസംസ്‌കൃത വസ്തുക്കൾ\nവാങ്ങുന്നരീതി'),
          backgroundColor: app_theam,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: _formKey,
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
                  if (rawmaterial != null && rawmaterial!.contains('INGREDIENTS FOR CATTLE FEED'))
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
                          providerone.updateIngredientsForPoultryFeedQnty(int.parse(value));
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
                  // if(rawmaterial != null && rawmaterial!.contains('BRAND'))
                  ElevateClick(
                      ontap: () {
                        // if (_formKey.currentState!.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SalesData(),
                              ));
                        // }
                      },
                      text: 'Next'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
