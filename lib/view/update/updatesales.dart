
import 'package:flutter/material.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constant/color_text.dart';
import '../../control/text_controller.dart';
import '../../services/add_api.dart';
import '../lists.dart';
import '../widgets/elevate_click_button.dart';
import '../widgets/input_field.dart';
import 'updatecrpdreport.dart';
import 'package:http/http.dart' as http;

class UpdateSalesData extends StatefulWidget {
  const UpdateSalesData({Key? key, this.items,}) : super(key: key);

  final items;

  @override
  State<UpdateSalesData> createState() => _SalesState();
}

class _SalesState extends State<UpdateSalesData> {

  @override
  void initState() {
    super.initState();
    getsaleData();
    getSavedData();
  }

  Future<void> getSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();


    String name = prefs.getString('authToken') ?? '';

    if(name.isNotEmpty){

      changeData();
    }
  }

  // List? productavilable;

  String? selectedproduceproduct;
  List? productavilable;
  List? modeofmarkrting;


  TextEditingController milkqty = TextEditingController();
  TextEditingController meatqty = TextEditingController();
  TextEditingController eggqty = TextEditingController();
  TextEditingController manuerqty = TextEditingController();
  TextEditingController feedqty = TextEditingController();
  TextEditingController malebeffeloqty = TextEditingController();
  TextEditingController grassfooderqty = TextEditingController();
  TextEditingController treefooderqty = TextEditingController();
  TextEditingController kidqty = TextEditingController();
  TextEditingController daychickqty = TextEditingController();
  TextEditingController pulletsqty = TextEditingController();
  TextEditingController calfqty = TextEditingController();
  TextEditingController beiferqty = TextEditingController();
  // TextEditingController dataSalesprdct2 = TextEditingController();
  // TextEditingController dataSalesquntum2 = TextEditingController();
  // TextEditingController dataSalessalesmethod = TextEditingController();



  @override
  Widget build(BuildContext context) {
    var providerone = Provider.of<TextMain>(context,listen: false);

    return GestureDetector(
      onTap: () {
        if (!FocusScope.of(context).hasPrimaryFocus) {
          FocusScope.of(context).unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('വിൽക്കുന്ന രീതി') ,
          centerTitle: true,
          backgroundColor: app_theam,),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                // Text(DocumentId),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MultiSelectFormField(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.black)),
                    title: Text(
                      'PRODUCE-PRODUCTION/ MAKING IT AVAILABLE',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    dataSource: produceproductavilable,
                    textField: 'text',
                    valueField: 'value',
                    okButtonLabel: 'OK',
                    cancelButtonLabel: 'CANCEL',
                    // hintText: 'Please select one or more options',
                    initialValue: productavilable,
                    onSaved: (value) {
                        productavilable  = value;
                      if (value == null) return;
                      providerone.updateDataSalesprdct2(value);
                    },
                  ),
                ),
                if(productavilable != null && productavilable!.contains('MILK') && milkqty != 0)
                  InputField(
                      hint: 'MILK QTY',
                      keytype: TextInputType.number,
                      controller: milkqty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataMilkQnty(valuee);
                      }),
                if(productavilable != null && productavilable!.contains('MEAT'))
                  InputField(
                      hint: 'MEAT QTY',
                      keytype: TextInputType.number,
                      controller: meatqty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataMeatQnty(valuee);
                      }),
                if(productavilable != null && productavilable!.contains('EGG'))
                  InputField(
                      hint: 'EGG QTY/KG',
                      keytype: TextInputType.number,
                      controller: eggqty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataEggQnty(valuee);
                      }),
                if(productavilable != null && productavilable!.contains('MANURE'))
                  InputField(
                      hint: 'MANURE QTY',
                      keytype: TextInputType.number,
                      controller: manuerqty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataSalesManureQnty(valuee);
                      }),
                if(productavilable != null && productavilable!.contains('FEED'))
                  InputField(
                      hint: 'FEED QTY',
                      keytype: TextInputType.number,
                      controller: feedqty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataFeedQnty(valuee);
                      }),
                if(productavilable != null && productavilable!.contains('MALE BUFFALO'))
                  InputField(
                      hint: 'MALE BUFFALO CALF QTY',
                      keytype: TextInputType.number,
                      controller: malebeffeloqty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataMaleBuffaloCalfQnty(valuee);
                      }),
                if(productavilable != null && productavilable!.contains('GRASS FOODER'))
                  InputField(
                      hint: 'GRASS FOODER QTY',
                      keytype: TextInputType.number,
                      controller: grassfooderqty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataGrasFooderQnty(valuee);
                      }),
                if(productavilable != null && productavilable!.contains('TREE FOODER'))
                  InputField(
                      hint: 'TREE FOODER QTY',
                      keytype: TextInputType.number,
                      controller: treefooderqty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataTreeFooderQnty(valuee);
                      }),
                if(productavilable != null && productavilable!.contains('KID'))
                  InputField(
                      hint: 'KID QTY',
                      keytype: TextInputType.number,
                      controller: kidqty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataKidQnty(valuee);
                      }),
                if(productavilable != null && productavilable!.contains('DAY OLD CHICK'))
                  InputField(
                      hint: 'DAY OLD CHICK QTY',
                      keytype: TextInputType.number,
                      controller: daychickqty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataDayOldChickQnty(valuee);
                      }),
                if(productavilable != null && productavilable!.contains('PULLETS'))
                  InputField(
                      hint: 'PULLETS QTY',
                      keytype: TextInputType.number,
                      controller: pulletsqty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataPulletsQnty(valuee);
                      }),
                if(productavilable != null && productavilable!.contains('CALF'))
                  InputField(
                      hint: 'CALF QTY',
                      keytype: TextInputType.number,
                      controller: calfqty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataCalfQnty(valuee);
                      }),
                if(productavilable != null && productavilable!.contains('BEIFER'))
                  InputField(
                      hint: 'BEIFER QTY',
                      keytype: TextInputType.number,
                      controller: beiferqty,
                      onchanged: (value) {
                        int? valuee = int.tryParse(value);
                        providerone.updateDataBeiferQnty(valuee);
                      }),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MultiSelectFormField(
                    hintWidget: Text(''),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.black)),
                    title: Text(
                      'MODE OF MARKETING',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    dataSource: mode_of_marketing,
                    textField: 'text',
                    valueField: 'value',
                    okButtonLabel: 'OK',
                    cancelButtonLabel: 'CANCEL',
                    initialValue: modeofmarkrting,
                    onSaved: (value) {
                        modeofmarkrting  = value;
                      if (value == null) return;
                      providerone.updateDataDataSalesSalesmethod(value);
                    },
                  ),
                ),
                ElevateClick(
                    ontap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateCrpDetail(items: widget.items),));
                }, text:'Next'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void getsaleData() {
    try {
      var dataup = widget.items['sales'][0];
        productavilable = dataup["data_Sales_prdct2"];
        modeofmarkrting = dataup ["data_Sales_salesmethod"];

        milkqty.text= dataup["MILK_qnty"].toString();
        meatqty.text= dataup["MEAT_qnty"].toString();
        eggqty.text= dataup["EGG_qnty"].toString();
        manuerqty.text= dataup["Sales_MANURE_qnty"].toString();
        feedqty.text= dataup["FEED_qnty"].toString();
        malebeffeloqty .text= dataup["male_buffalo_calf_qnty"].toString();
        grassfooderqty .text= dataup["Gras_fooder_qnty"].toString();
        treefooderqty .text= dataup["tree_fooder_qnty"].toString();
        kidqty.text= dataup["kid_qnty"].toString();
        daychickqty.text= dataup["day_old_chick_qnty"].toString();
        pulletsqty.text= dataup["pullets_qnty"].toString();
        calfqty.text= dataup["calf_qnty"].toString();
        beiferqty.text= dataup["beifer_qnty"].toString();

    } catch (e) {
      // Handle error
      print('Error retrieving sale data: $e');
      // Perform any necessary error handling or display a message to the user
    }
  }

  void changeData() {
   // var providerone = Provider.of<TextMain>(context);
    var providerone = context.read<TextMain>();
    providerone.updateDataSalesprdct2(productavilable);
    providerone.updateDataDataSalesSalesmethod(modeofmarkrting);
    providerone.updateDataMilkQnty(int.tryParse(milkqty.text));
    providerone.updateDataMeatQnty(int.tryParse(meatqty.text));
    providerone.updateDataEggQnty(int.tryParse(eggqty.text));
    providerone.updateDataSalesManureQnty(int.tryParse(manuerqty.text));
    providerone.updateDataFeedQnty(int.tryParse(feedqty.text));
    providerone.updateDataMaleBuffaloCalfQnty(int.tryParse(malebeffeloqty.text));
    providerone.updateGrassFooderQnty(int.tryParse(grassfooderqty.text));
    providerone.updateDataTreeFooderQnty(int.tryParse(treefooderqty.text));
    providerone.updateDataKidQnty(int.tryParse(kidqty.text));
    providerone.updateDataDayOldChickQnty(int.tryParse(daychickqty.text));
    providerone.updateDataPulletsQnty(int.tryParse(pulletsqty.text));
    providerone.updateDataCalfQnty(int.tryParse(calfqty.text));
    providerone.updateDataBeiferQnty(int.tryParse(beiferqty.text));

  }

}
