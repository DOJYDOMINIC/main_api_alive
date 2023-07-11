import 'package:flutter/material.dart';
import 'package:main200623/constant/color_text.dart';
import 'package:main200623/view/add_data/sales.dart';
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


  List? rawmaterial;
  List? pulletsselected;
  List? manureselected;
  List? fodderslipselected;


  TextEditingController dataPurchaseofrawmaterialsItemtype = TextEditingController();
  TextEditingController dataPurchaseofrawmaterialsBrand = TextEditingController();
  TextEditingController cowdungqnty = TextEditingController();
  TextEditingController goatmanureqnty = TextEditingController();
  TextEditingController poultrymanureqnty = TextEditingController();
  TextEditingController vermycompostqnty = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var providerone = Provider.of<TextMain>(context, listen: false);

    return Scaffold(
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
                    providerone.updateDataDataPurchaseofrawmaterialsItemtype(value);
                  },
                ),
              ),
              if (rawmaterial != null && rawmaterial!.contains('PULLETS')) // Conditional statement starts here
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

                if(rawmaterial != null && rawmaterial!.contains('MANURE'))
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
                        providerone.updateDataPulletsList(value);
                      },
                    ),
                  ),
              if(manureselected != null && manureselected!.contains('COW DUNG'))
                InputField(
                    hint: 'COW DUNG qty',
                    controller: cowdungqnty,
                    onchanged: (value) {
                      providerone.updateDataCowDungQnty(value);
                    }),
              if(manureselected != null && manureselected!.contains('GOAT MANURE'))
                InputField(
                    hint: 'GOAT MANURE QTY',
                    controller: goatmanureqnty,
                    onchanged: (value) {
                      providerone.updateDataGoatManureQnty(value);
                    }),
              if(manureselected != null && manureselected!.contains('POULTRY MANURE'))
                InputField(
                    hint: 'POULTRY MANURE QTY',
                    controller: poultrymanureqnty,
                    onchanged: (value) {
                      providerone.updateDataPoultryManureQnty(value);
                    }),
              if(manureselected != null && manureselected!.contains('VERMY COMPOST'))
                InputField(
                    hint: 'VERMY COMPOST QTY',
                    controller: vermycompostqnty,
                    onchanged: (value) {
                      providerone.updateDataVermyCompostQnty(value);
                    }),
              if(rawmaterial != null && rawmaterial!.contains('FODDER SLIPS'))
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
                      providerone.updateDataPulletsList(value);
                    },
                  ),
                ),
              if(fodderslipselected != null && fodderslipselected!.contains('NAPIER'))
                InputField(
                    hint: 'NAPIER QTY',
                    controller: goatmanureqnty,
                    onchanged: (value) {
                      providerone.updateDataNapierQnty(value);
                    }),
              if(fodderslipselected != null && fodderslipselected!.contains('CO4'))
                InputField(
                    hint: 'CO4 QTY',
                    controller: poultrymanureqnty,
                    onchanged: (value) {
                      providerone.updateDataCo4Qnty(value);
                    }),
              if(fodderslipselected != null && fodderslipselected!.contains('CO5'))
                InputField(
                    hint: 'CO5 QTY',
                    controller: vermycompostqnty,
                    onchanged: (value) {
                      providerone.updateDataCo5Qnty(value);
                    }),

              //
              // Text(DocumentId),
              ElevateClick(
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SalesData(),
                        ));
                  },
                  text: 'Next'),
            ],
          ),
        ),
      ),
    );
  }
}
