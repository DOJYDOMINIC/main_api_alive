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
    Key? key, this.items,
  }) : super(key: key);
final items;
  @override
  State<UpdatePurchaseofrawmaterials> createState() => _UpdatePurchaseofrawmaterials();
}

class _UpdatePurchaseofrawmaterials extends State<UpdatePurchaseofrawmaterials> {
  List? rawmaterial;
  List? pulletsselected;
  List? manureselected;
  List? fodderslipselected;
  List? calveslist;
  List? heipers;
  List? cowslist;
  String? brandselected;
  String? layerselected;
  String? cattlefeedlist;
  String? selectmilkreplacer;
  String? selectedmilckreplacer;
  String? energyrichfeed;

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
  TextEditingController pol_feed = TextEditingController();
  TextEditingController brandqty = TextEditingController();
  TextEditingController layerqty = TextEditingController();
  TextEditingController selectedmilkreplacer = TextEditingController();
  TextEditingController bypassprotine = TextEditingController();
  TextEditingController bypassfat = TextEditingController();
  TextEditingController tmr = TextEditingController();
  TextEditingController silage = TextEditingController();
  TextEditingController hay = TextEditingController();
  TextEditingController ureatreated = TextEditingController();
  TextEditingController goatfeed = TextEditingController();
  TextEditingController kidstarter = TextEditingController();



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
                    rawmaterial == 'MALE BUFFALO CALVES')
                  InputField(
                      hint: 'MALE BUFFALO CALVES QTY',
                      keytype: TextInputType.number,
                      controller: malebefallocalvesqty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataMaleBuffaloCalvesQnty(valuee);
                      }),
                if (rawmaterial != null &&
                    rawmaterial == 'MALABARI GOATS')
                  InputField(
                      hint: 'MALABARI GOATS',
                      keytype: TextInputType.number,
                      controller: malabarigoats,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataMalabariGoatsQnty(valuee);
                      }),
                if (rawmaterial != null &&
                    rawmaterial == 'MATERIAL FOR POULTRY CAGE FABRICATION')
                  InputField(
                      hint: 'MATERIAL FOR POULTRY QTY',
                      keytype: TextInputType.number,
                      controller: materialforpoltry,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataMaterialForPoultryQnty(valuee);
                      }),
                if (rawmaterial != null && rawmaterial == 'EGG TRAYS')
                  InputField(
                      hint: 'EGG TRAYS QTY',
                      keytype: TextInputType.number,
                      controller: eggsqty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataEggQnty(valuee);
                      }),
                if (rawmaterial != null && rawmaterial == 'POULTRY FEED')
                  InputField(
                      hint: 'POULTRY FEED QTY',
                      keytype: TextInputType.number,
                      controller: malabarigoats,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataPoultryFeedQnty(valuee);
                      }),
                if (rawmaterial != null && rawmaterial == 'CALVES')
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
                      dataSource: hfg,
                      textField: 'text',
                      valueField: 'value',
                      okButtonLabel: 'OK',
                      cancelButtonLabel: 'CANCEL',
                      // hintText: 'Please select one or more options',
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
                if (calveslist != null && calveslist == 'H F')
                  InputField(
                      hint: 'H F QTY',
                      keytype: TextInputType.number,
                      controller: clhf,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataCalvesHfQnty(valuee);
                      }),
                if (calveslist != null && calveslist!.contains('GERSEY'))
                  InputField(
                      hint: 'GERSEY QTY',
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
                      dataSource: hfg,
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
                if (heipers != null && heipers!.contains('H F'))
                  InputField(
                      hint: 'H F QTY',
                      keytype: TextInputType.number,
                      controller: he_hf,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataHeipersHfQnty(valuee);
                      }),
                if (heipers != null && heipers!.contains('GERSEY'))
                  InputField(
                      hint: 'GERSEY QTY',
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
                      dataSource: hfg,
                      textField: 'text',
                      valueField: 'value',
                      okButtonLabel: 'OK',
                      cancelButtonLabel: 'CANCEL',
                      // hintText: 'Please select one or more options',
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
                if (cowslist != null && cowslist!.contains('H F'))
                  InputField(
                      hint: 'H F QTY',
                      keytype: TextInputType.number,
                      controller: cw_hf,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataCowsHfQnty(valuee);
                      }),
                if (cowslist != null && cowslist!.contains('GERSEY'))
                  InputField(
                      hint: 'GERSEY QTY',
                      keytype: TextInputType.number,
                      controller: cw_gersey,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataCowsGerseyQnty(valuee);
                      }),

                if (rawmaterial != null &&
                    rawmaterial!
                        .contains('PULLETS')) // Conditional statement starts here
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
                      hint: 'COW DUNG qty',
                      keytype: TextInputType.number,
                      controller: cowdungqnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataCowDungQnty(valuee);
                      }),
                if (manureselected != null &&
                    manureselected!.contains('GOAT MANURE'))
                  InputField(
                      hint: 'GOAT MANURE QTY',
                      keytype: TextInputType.number,
                      controller: goatmanureqnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataGoatManureQnty(valuee);
                      }),
                if (manureselected != null &&
                    manureselected!.contains('POULTRY MANURE'))
                  InputField(
                      hint: 'POULTRY MANURE QTY',
                      keytype: TextInputType.number,
                      controller: poultrymanureqnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataPoultryManureQnty(valuee);
                      }),
                if (manureselected != null &&
                    manureselected!.contains('VERMY COMPOST'))
                  InputField(
                      hint: 'VERMY COMPOST QTY',
                      keytype: TextInputType.number,
                      controller: vermycompostqnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataVermyCompostQnty(valuee);
                      }),
                if (rawmaterial != null && rawmaterial!.contains('FODDER SLIPS'))
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
                      hint: 'NAPIER QTY',
                      keytype: TextInputType.number,
                      controller: napier,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataNapierQnty(valuee);
                      }),
                if (fodderslipselected != null &&
                    fodderslipselected!.contains('CO4'))
                  InputField(
                      hint: 'CO4 QTY',
                      keytype: TextInputType.number,
                      controller: co4,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataCo4Qnty(valuee);
                      }),
                if (fodderslipselected != null &&
                    fodderslipselected!.contains('CO5'))
                  InputField(
                      hint: 'CO5 QTY',
                      keytype: TextInputType.number,
                      controller: co5,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataCo5Qnty(valuee);
                      }),
                if (fodderslipselected != null &&
                    fodderslipselected!.contains('RED NAPIER'))
                  InputField(
                      hint: 'RED NAPIER QTY',
                      keytype: TextInputType.number,
                      controller: rednapier,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataRedNapierQnty(valuee);
                      }),
                if (fodderslipselected != null &&
                    fodderslipselected!.contains('SUPER NAPIER'))
                  InputField(
                      hint: 'SUPER NAPIER QTY',
                      keytype: TextInputType.number,
                      controller: supernapier,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataSuperNapierQnty(valuee);
                      }),
                if (fodderslipselected != null &&
                    fodderslipselected!.contains('GUINEA GRASS'))
                  InputField(
                      hint: 'GUINEA GRASS QTY',
                      keytype: TextInputType.number,
                      controller: guineagrass,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataGuineaGrassQnty(valuee);
                      }),
                if (fodderslipselected != null &&
                    fodderslipselected!.contains('PARA GRASS'))
                  InputField(
                      hint: 'PARA GRASS QTY',
                      keytype: TextInputType.number,
                      controller: paragrass,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataParaGrassQnty(valuee);
                      }),
                if (fodderslipselected != null &&
                    fodderslipselected!.contains('CONGO SIGNAL'))
                  InputField(
                      hint: 'CONGO SIGNAL QTY',
                      keytype: TextInputType.number,
                      controller: congosignal,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataCongoSignalQnty(valuee);
                      }),
                // if(rawmaterial != null && rawmaterial!.contains('BRAND'))
                NoSearchDropdown(
                  onChanged: (value) {
                    setState(() {
                      brandselected = value;
                    });
                    providerone.updateDataPurchaseofrawmaterialsBrand(value);
                  },
                  items: branditem,
                  item: 'BRAND',
                ),

                // if(brandselected != null && brandselected == 'VHC')
                InputField(
                    hint: 'BRAND ITEM QTY/KG',
                    keytype: TextInputType.number,
                    controller: brandqty,
                    onchanged: (value) {
                      int? valuee = int.tryParse(value);
                      providerone.updateDataBrandQnty(valuee);
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
                if (rawmaterial != null && rawmaterial!.contains('CATTLE  FEED'))
                  NoSearchDropdown(
                    onChanged: (value) {
                      setState(() {
                        cattlefeedlist = value;
                      });
                      providerone.updateDataCattleFeedList(value);
                    },
                    items: cattlefeed,
                    item: 'CATTLE  FEED',
                  ),
                if (rawmaterial != null && rawmaterial!.contains('CATTLE  FEED'))
                  InputField(
                      hint: 'CATTLE  FEED QTY/KG',
                      keytype: TextInputType.number,
                      controller: cattlefeedqty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataCattleFeedQnty(valuee);
                      }),
                if (rawmaterial != null && rawmaterial!.contains('MILK REPLACER'))
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
                if (rawmaterial != null && rawmaterial!.contains('MILK REPLACER'))
                  InputField(
                      hint: 'MILK REPLACER QTY (5 KG)',
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
                      hint: 'QTY/KG',
                      keytype: TextInputType.number,
                      controller: milmaqty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataEnergyRichFeedQnty(valuee);
                      }),
                if (rawmaterial != null && rawmaterial!.contains('BY PASS PROTEIN'))
                  InputField(
                      hint: 'BY PASS PROTEIN QTY',
                      keytype: TextInputType.number,
                      controller: bypassprotine,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataByPassProteinQnty(valuee);
                      }),
                if (rawmaterial != null && rawmaterial!.contains('BY PASS FAT'))
                  InputField(
                      hint: 'BY PASS FAT QTY',
                      keytype: TextInputType.number,
                      controller: bypassfat,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataByPassFatQnty(valuee);
                      }),
                if (rawmaterial != null && rawmaterial!.contains('TMR'))
                  InputField(
                      hint: 'TMR QTY',
                      keytype: TextInputType.number,
                      controller: tmr,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataTmrQnty(valuee);
                      }),
                if (rawmaterial != null && rawmaterial!.contains('SILAGE'))
                  InputField(
                      hint: 'SILAGE QTY',
                      keytype: TextInputType.number,
                      controller: silage,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataSilageQnty(valuee);
                      }),

                if (rawmaterial != null && rawmaterial!.contains('HAY'))
                  InputField(
                      hint: 'HAY QTY',
                      keytype: TextInputType.number,
                      controller: hay,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataHayQnty(valuee);
                      }),
                if (rawmaterial != null && rawmaterial!.contains('UREA TREATED STRAW'))
                  InputField(
                      hint: 'UREA TREATED STRAW QTY',
                      keytype: TextInputType.number,
                      controller: ureatreated,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataUreaTreatedStrawQnty(valuee);
                      }),
                if (rawmaterial != null && rawmaterial!.contains('GOAT FEED'))
                  InputField(
                      hint: 'GOAT FEED QTY',
                      keytype: TextInputType.number,
                      controller: goatfeed,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataGoatFeeDqnty(valuee);
                      }),
                if (rawmaterial != null && rawmaterial!.contains('KID STARTER'))
                  InputField(
                      hint: 'KID STARTER QTY',
                      keytype: TextInputType.number,
                      controller: kidstarter,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataKidStarterQnty(valuee);
                      }),

                ElevateClick(
                    ontap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateSalesData(items: widget.items),));
                    },
                    text: 'Next')
              ],
            ),
          ),
        ),
      ),
    );
  }

}
