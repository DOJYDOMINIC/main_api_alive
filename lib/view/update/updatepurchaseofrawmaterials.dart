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

  @override
  void initState() {
    super.initState();
    getproductData();
    // changeData();
  }

  List? dataPurchaseofrawmaterialsItemtype;
  List? pulletsList;
  List? manureList;
  List? fodderSlipsList;
  List? calvesList;
  List? heipersList;
  List? cowsList;
  String? brandselected;
  String? layerList;
  String? cattleFeedList;
  String? milkReplacerList;
  String? selectedmilckreplacer;
  String? energyRichFeedList;

  TextEditingController dataPurchaseofrawmaterialsBrand = TextEditingController();
  TextEditingController cowDungQnty = TextEditingController();
  TextEditingController goatManureQnty = TextEditingController();
  TextEditingController poultryManureQnty = TextEditingController();
  TextEditingController vermyCompostQnty = TextEditingController();
  // TextEditingController napier = TextEditingController();
  TextEditingController energyRichFeedQnty = TextEditingController();
  TextEditingController cattleFeedQnty = TextEditingController();
  TextEditingController co4Qnty = TextEditingController();
  TextEditingController co5Qnty = TextEditingController();
  TextEditingController napierQnty = TextEditingController();
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
  TextEditingController brandQnty = TextEditingController();
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
TextEditingController BV380qty = TextEditingController();
TextEditingController GRAMALAKSHMIqty = TextEditingController();
TextEditingController GRAMAPRIYAqty = TextEditingController();
TextEditingController otheriteem = TextEditingController();
TextEditingController OTHERqty =TextEditingController();

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
                    initialValue: dataPurchaseofrawmaterialsItemtype,
                    onSaved: (value) {
                      setState(() {
                        dataPurchaseofrawmaterialsItemtype = value;
                      });
                      if (value == null) return;
                      providerone.updateDataDataPurchaseofrawmaterialsItemtype(value);
                    },
                  ),
                ),

                if (dataPurchaseofrawmaterialsItemtype != null &&
                    dataPurchaseofrawmaterialsItemtype!.contains( 'MALE BUFFALO CALVES'))
                  InputField(
                      hint: 'MALE BUFFALO CALVES QTY',
                      keytype: TextInputType.number,
                      controller: maleBuffaloCalvesQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataMaleBuffaloCalvesQnty(valuee);
                      }),
                if (dataPurchaseofrawmaterialsItemtype != null &&
                    dataPurchaseofrawmaterialsItemtype!.contains( 'MALABARI GOATS'))
                  InputField(
                      hint: 'MALABARI GOATS',
                      keytype: TextInputType.number,
                      controller: malabariGoatsQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataMalabariGoatsQnty(valuee);
                      }),
                if (dataPurchaseofrawmaterialsItemtype != null && dataPurchaseofrawmaterialsItemtype!.contains('MATERIAL FOR POULTRY CAGE FABRICATION'))
                  InputField(
                      hint: 'MATERIAL FOR POULTRY QTY',
                      keytype: TextInputType.number,
                      controller: materialForPoultryQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataMaterialForPoultryQnty(valuee);
                      }),
                if (dataPurchaseofrawmaterialsItemtype != null && dataPurchaseofrawmaterialsItemtype!.contains ('EGG TRAYS'))
                  InputField(
                      hint: 'EGG TRAYS QTY',
                      keytype: TextInputType.number,
                      controller: eggTraysQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataEggQnty(valuee);
                      }),
                if (dataPurchaseofrawmaterialsItemtype != null && dataPurchaseofrawmaterialsItemtype!.contains('POULTRY FEED'))
                  InputField(
                      hint: 'POULTRY FEED QTY',
                      keytype: TextInputType.number,
                      controller: poultryFeedQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataPoultryFeedQnty(valuee);
                      }),
                if (dataPurchaseofrawmaterialsItemtype != null && dataPurchaseofrawmaterialsItemtype!.contains('CALVES'))
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
                      initialValue: calvesList,
                      onSaved: (value) {
                        setState(() {
                          calvesList = value;
                        });
                        if (value == null) return;
                        providerone.updateDataCalvesList(value);
                      },
                    ),
                  ),
                if (calvesList != null && calvesList!.contains('H F'))
                  InputField(
                      hint: 'H F QTY',
                      keytype: TextInputType.number,
                      controller: calvesHfQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataCalvesHfQnty(valuee);
                      }),
                if (calvesList != null && calvesList!.contains('GERSEY'))
                  InputField(
                      hint: 'GERSEY QTY',
                      keytype: TextInputType.number,
                      controller: calvesGerseyQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataCalvesGerseyQnty(valuee);
                      }),
                if (dataPurchaseofrawmaterialsItemtype != null && dataPurchaseofrawmaterialsItemtype!.contains('HEIFERS'))
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
                      initialValue: heipersList,
                      onSaved: (value) {
                        setState(() {
                          heipersList = value;
                        });
                        if (value == null) return;
                        providerone.updateDataHeipersList(value);
                      },
                    ),
                  ),
                if (heipersList != null && heipersList!.contains('H F'))
                  InputField(
                      hint: 'H F QTY',
                      keytype: TextInputType.number,
                      controller: heipersHfQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataHeipersHfQnty(valuee);
                      }),
                if (heipersList != null && heipersList!.contains('GERSEY'))
                  InputField(
                      hint: 'GERSEY QTY',
                      keytype: TextInputType.number,
                      controller: heipersGerseyQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataHeipersGerseyQnty(valuee);
                      }),

                if (dataPurchaseofrawmaterialsItemtype != null && dataPurchaseofrawmaterialsItemtype!.contains('COWS'))
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
                      initialValue: cowsList,
                      onSaved: (value) {
                        setState(() {
                          cowsList = value;
                        });
                        if (value == null) return;
                        providerone.updateDataCowsList(value);
                      },
                    ),
                  ),
                if (cowsList != null && cowsList!.contains('H F'))
                  InputField(
                      hint: 'H F QTY',
                      keytype: TextInputType.number,
                      controller: cowsHfQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataCowsHfQnty(valuee);
                      }),
                if (cowsList != null && cowsList!.contains('GERSEY'))
                  InputField(
                      hint: 'GERSEY QTY',
                      keytype: TextInputType.number,
                      controller: cowsGerseyQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataCowsGerseyQnty(valuee);
                      }),

                if (dataPurchaseofrawmaterialsItemtype != null &&
                    dataPurchaseofrawmaterialsItemtype!
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
                if (pulletsList != null &&
                    pulletsList!.contains('BV380'))
                  InputField(
                      hint: 'BV380 qty',
                      keytype: TextInputType.number,
                      controller: BV380qty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        // providerone.updateDataCowDungQnty(valuee);
                      }),
                if (pulletsList != null &&
                    pulletsList!.contains('GRAMALAKSHMI'))
                  InputField(
                      hint: 'GRAMALAKSHMI qty',
                      keytype: TextInputType.number,
                      controller: GRAMALAKSHMIqty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        // providerone.updateDataCowDungQnty(valuee);
                      }),
                if (pulletsList != null &&
                    pulletsList!.contains('GRAMAPRIYA'))
                  InputField(
                      hint: 'GRAMAPRIYA qty',
                      keytype: TextInputType.number,
                      controller: GRAMAPRIYAqty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        // providerone.updateDataCowDungQnty(valuee);
                      }),
                if (pulletsList != null &&
                    pulletsList!.contains('OTHER'))
                  Column(
                    children: [
                      InputField(
                          hint: 'OTHER ITEM',
                          keytype: TextInputType.number,
                          controller: otheriteem,
                          onchanged: (value) {
                            // providerone.updateDataCowDungQnty(valuee);
                          }),
                        InputField(
                            hint: 'OTHER qty',
                            keytype: TextInputType.number,
                            controller: OTHERqty,
                            onchanged: (value) {
                              int? valuee = int.tryParse(value);
                              // providerone.updateDataCowDungQnty(valuee);
                            }),
                    ],
                  ),
                if (dataPurchaseofrawmaterialsItemtype != null && dataPurchaseofrawmaterialsItemtype!.contains('MANURE'))
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
                      initialValue: manureList,
                      onSaved: (value) {
                        setState(() {
                          manureList = value;
                        });
                        if (value == null) return;
                        providerone.updateDataManureList(value);
                      },
                    ),
                  ),
                if (manureList != null &&
                    manureList!.contains('COW DUNG'))
                  InputField(
                      hint: 'COW DUNG qty',
                      keytype: TextInputType.number,
                      controller: cowDungQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataCowDungQnty(valuee);
                      }),
                if (manureList != null &&
                    manureList!.contains('GOAT MANURE'))
                  InputField(
                      hint: 'GOAT MANURE QTY',
                      keytype: TextInputType.number,
                      controller: goatManureQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataGoatManureQnty(valuee);
                      }),
                if (manureList != null &&
                    manureList!.contains('POULTRY MANURE'))
                  InputField(
                      hint: 'POULTRY MANURE QTY',
                      keytype: TextInputType.number,
                      controller: poultryManureQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataPoultryManureQnty(valuee);
                      }),
                if (manureList != null &&
                    manureList!.contains('VERMY COMPOST'))
                  InputField(
                      hint: 'VERMY COMPOST QTY',
                      keytype: TextInputType.number,
                      controller: vermyCompostQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataVermyCompostQnty(valuee);
                      }),
                if (dataPurchaseofrawmaterialsItemtype != null && dataPurchaseofrawmaterialsItemtype!.contains('FODDER SLIPS'))
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
                      initialValue: fodderSlipsList,
                      onSaved: (value) {
                        setState(() {
                          fodderSlipsList = value;
                        });
                        if (value == null) return;
                        providerone.updateDataFodderSlipsList(value);
                      },
                    ),
                  ),
                if (fodderSlipsList != null &&
                    fodderSlipsList!.contains('NAPIER'))
                  InputField(
                      hint: 'NAPIER QTY',
                      keytype: TextInputType.number,
                      controller: napierQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataNapierQnty(valuee);
                      }),
                if (fodderSlipsList != null &&
                    fodderSlipsList!.contains('CO4'))
                  InputField(
                      hint: 'CO4 QTY',
                      keytype: TextInputType.number,
                      controller: co4Qnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataCo4Qnty(valuee);
                      }),
                if (fodderSlipsList != null &&
                    fodderSlipsList!.contains('CO5'))
                  InputField(
                      hint: 'CO5 QTY',
                      keytype: TextInputType.number,
                      controller: co5Qnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataCo5Qnty(valuee);
                      }),
                if (fodderSlipsList != null &&
                    fodderSlipsList!.contains('RED NAPIER'))
                  InputField(
                      hint: 'RED NAPIER QTY',
                      keytype: TextInputType.number,
                      controller: redNapierQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataRedNapierQnty(valuee);
                      }),
                if (fodderSlipsList != null &&
                    fodderSlipsList!.contains('SUPER NAPIER'))
                  InputField(
                      hint: 'SUPER NAPIER QTY',
                      keytype: TextInputType.number,
                      controller: superNapierQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataSuperNapierQnty(valuee);
                      }),
                if (fodderSlipsList != null &&
                    fodderSlipsList!.contains('GUINEA GRASS'))
                  InputField(
                      hint: 'GUINEA GRASS QTY',
                      keytype: TextInputType.number,
                      controller: guineaGrassQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataGuineaGrassQnty(valuee);
                      }),
                if (fodderSlipsList != null &&
                    fodderSlipsList!.contains('PARA GRASS'))
                  InputField(
                      hint: 'PARA GRASS QTY',
                      keytype: TextInputType.number,
                      controller: paraGrassQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataParaGrassQnty(valuee);
                      }),
                if (fodderSlipsList != null &&
                    fodderSlipsList!.contains('CONGO SIGNAL'))
                  InputField(
                      hint: 'CONGO SIGNAL QTY',
                      keytype: TextInputType.number,
                      controller: congoSignalQnty,
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
                    controller: brandQnty,
                    onchanged: (value) {
                      int? valuee = int.tryParse(value);
                      providerone.updateDataBrandQnty(valuee);
                    }),
                if (dataPurchaseofrawmaterialsItemtype != null && dataPurchaseofrawmaterialsItemtype!.contains('LAYER'))
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
                if (dataPurchaseofrawmaterialsItemtype != null && dataPurchaseofrawmaterialsItemtype!.contains('CATTLE  FEED'))
                  NoSearchDropdown(
                    onChanged: (value) {
                      setState(() {
                        cattleFeedList = value;
                      });
                      providerone.updateDataCattleFeedList(value);
                    },
                    items: cattlefeed,
                    item: 'CATTLE  FEED',
                  ),
                if (dataPurchaseofrawmaterialsItemtype != null && dataPurchaseofrawmaterialsItemtype!.contains('CATTLE  FEED'))
                  InputField(
                      hint: 'CATTLE  FEED QTY/KG',
                      keytype: TextInputType.number,
                      controller: cattleFeedQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataCattleFeedQnty(valuee);
                      }),
                if (dataPurchaseofrawmaterialsItemtype != null && dataPurchaseofrawmaterialsItemtype!.contains('MILK REPLACER'))
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
                if (dataPurchaseofrawmaterialsItemtype != null && dataPurchaseofrawmaterialsItemtype!.contains('MILK REPLACER'))
                  InputField(
                      hint: 'MILK REPLACER QTY (5 KG)',
                      keytype: TextInputType.number,
                      controller: milkReplacerQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataMilkReplacerQnty(valuee);
                      }),
                if (dataPurchaseofrawmaterialsItemtype != null &&
                    dataPurchaseofrawmaterialsItemtype!.contains('ENERGY RICH FEED'))
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
                      hint: 'QTY/KG',
                      keytype: TextInputType.number,
                      controller: energyRichFeedQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataEnergyRichFeedQnty(valuee);
                      }),
                if (dataPurchaseofrawmaterialsItemtype != null && dataPurchaseofrawmaterialsItemtype!.contains('BY PASS PROTEIN'))
                  InputField(
                      hint: 'BY PASS PROTEIN QTY',
                      keytype: TextInputType.number,
                      controller: byPassProteinQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataByPassProteinQnty(valuee);
                      }),
                if (dataPurchaseofrawmaterialsItemtype != null && dataPurchaseofrawmaterialsItemtype!.contains('BY PASS FAT'))
                  InputField(
                      hint: 'BY PASS FAT QTY',
                      keytype: TextInputType.number,
                      controller: byPassFatQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataByPassFatQnty(valuee);
                      }),
                if (dataPurchaseofrawmaterialsItemtype != null && dataPurchaseofrawmaterialsItemtype!.contains('TMR'))
                  InputField(
                      hint: 'TMR QTY',
                      keytype: TextInputType.number,
                      controller: tmrQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataTmrQnty(valuee);
                      }),
                if (dataPurchaseofrawmaterialsItemtype != null && dataPurchaseofrawmaterialsItemtype!.contains('SILAGE'))
                  InputField(
                      hint: 'SILAGE QTY',
                      keytype: TextInputType.number,
                      controller: silageQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataSilageQnty(valuee);
                      }),

                if (dataPurchaseofrawmaterialsItemtype != null && dataPurchaseofrawmaterialsItemtype!.contains('HAY'))
                  InputField(
                      hint: 'HAY QTY',
                      keytype: TextInputType.number,
                      controller: hayQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataHayQnty(valuee);
                      }),
                if (dataPurchaseofrawmaterialsItemtype != null && dataPurchaseofrawmaterialsItemtype!.contains('UREA TREATED STRAW'))
                  InputField(
                      hint: 'UREA TREATED STRAW QTY',
                      keytype: TextInputType.number,
                      controller: ureaTreatedStrawQnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataUreaTreatedStrawQnty(valuee);
                      }),
                if (dataPurchaseofrawmaterialsItemtype != null && dataPurchaseofrawmaterialsItemtype!.contains('GOAT FEED'))
                  InputField(
                      hint: 'GOAT FEED QTY',
                      keytype: TextInputType.number,
                      controller: goatFeeDqnty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataGoatFeeDqnty(valuee);
                      }),
                if (dataPurchaseofrawmaterialsItemtype != null && dataPurchaseofrawmaterialsItemtype!.contains('KID STARTER'))
                  InputField(
                      hint: 'KID STARTER QTY',
                      keytype: TextInputType.number,
                      controller: kidStarterQnty,
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
  void getproductData() {
    try {

      // var providerone = context.read<TextMain>();

      var dataup = widget.items['products'][0];
      print(dataup);
      setState(() {
        dataPurchaseofrawmaterialsItemtype = List<String>.from(dataup["data_purchaseofrawmaterials_itemtype"].map((x) => x));
        pulletsList = List<String>.from(dataup["PULLETS_List"].map((x) => x));
        manureList= List<String>.from(dataup["MANURE_List"].map((x) => x));
        fodderSlipsList = List<String>.from(dataup["FODDER_SLIPS_List"].map((x) => x));
        calvesList = List<String>.from(dataup["CALVES_List"].map((x) => x));
        heipersList= List<String>.from(dataup["HEIPERS_List"].map((x) => x));
        cowsList= List<String>.from(dataup["COWS_List"].map((x) => x));
        // modePurchaseofrawmaterials .text = List<String>.from(dataup["Mode_purchaseofrawmaterials"].map((x) .text => x));

        cowDungQnty = dataup["COW_DUNG_qnty"];
        goatManureQnty = dataup["GOAT_MANURE_qnty"];
        poultryManureQnty  = dataup["POULTRY_MANURE_qnty"];
        vermyCompostQnty  = dataup["VERMY_COMPOST_qnty"];
        napierQnty  = dataup["NAPIER_qnty"];
        co4Qnty  = dataup["CO4_qnty"];
        co5Qnty  = dataup["CO5_qnty"];
        redNapierQnty  = dataup["RED_NAPIER_qnty"];
        superNapierQnty  = dataup["SUPER_NAPIER_qnty"];
        guineaGrassQnty  = dataup["GUINEA_GRASS_qnty"];
        paraGrassQnty  = dataup["PARA_GRASS_qnty"];
        congoSignalQnty = dataup["CONGO_SIGNAL_qnty"];
        maleBuffaloCalvesQnty = dataup["MALE_BUFFALO_CALVES_qnty"];
        calvesHfQnty = dataup["CALVES_HF_qnty"];
        calvesGerseyQnty = dataup["CALVES_GERSEY_qnty"];
        heipersHfQnty  = dataup["HEIPERS_HF_qnty"];
        heipersGerseyQnty  = dataup["HEIPERS_GERSEY_qnty"];
        cowsHfQnty  = dataup["COWS_HF_qnty"];
        cowsGerseyQnty = dataup["COWS_GERSEY_qnty"];
        malabariGoatsQnty = dataup["MALABARI_GOATS_qnty"];
        materialForPoultryQnty = dataup["MATERIAL_FOR_POULTRY_qnty"];
        eggTraysQnty= dataup["EGG_TRAYS_qnty"];
        poultryFeedQnty = dataup["POULTRY_FEED_qnty"];
        layerList = dataup["LAYER_List"];
        cattleFeedList = dataup["CATTLE_FEED_List"];
        cattleFeedQnty = dataup["CATTLE_FEED_qnty"];
        milkReplacerList = dataup["MILK_REPLACER_List"];
        milkReplacerQnty  = dataup["MILK_REPLACER_qnty"];
        energyRichFeedList = dataup["ENERGY_RICH_FEED_List"];
        energyRichFeedQnty  = dataup["ENERGY_RICH_FEED_qnty"];
        byPassProteinQnty  = dataup["BY_PASS_PROTEIN_qnty"];
        byPassFatQnty  = dataup["BY_PASS_FAT_qnty"];
        tmrQnty  = dataup["TMR_qnty"];
        silageQnty  = dataup["SILAGE_qnty"];
        hayQnty  = dataup["HAY_qnty"];
        ureaTreatedStrawQnty  = dataup["UREA_TREATED_STRAW_qnty"];
        goatFeeDqnty  = dataup["GOAT_FEEDqnty"];
        kidStarterQnty  = dataup["KID_STARTER_qnty"];
        dataPurchaseofrawmaterialsBrand  = dataup["data_purchaseofrawmaterials_brand"];
        brandQnty  = dataup["BRAND_qnty"];

      });
    } catch (e) {
      // Handle error
      print('Error retrieving product data: $e');
      // Perform any necessary error handling or display a message to the user
    }
  }
  //
  // changeData() {
  //   var providerone = context.read<TextMain>();
  //   providerone.updateDataDataPurchaseofrawmaterialsItemtype(dataPurchaseofrawmaterialsItemtype);
  //
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
  //   providerone.updateDataPurchaseofrawmaterialsBrand(dataPurchaseofrawmaterialsBrand.text);
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
