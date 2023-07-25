import 'package:flutter/material.dart';
import 'package:main200623/constant/color_text.dart';
import 'package:main200623/view/update/updateproduct.dart';
import 'package:main200623/view/update/updatepurchaseofrawmaterials.dart';
import 'package:provider/provider.dart';
import '../../control/text_controller.dart';
import '../widgets/elevate_click_button.dart';
import '../widgets/input_field.dart';

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
  }



  TextEditingController dataLivelihoodIncomesource = TextEditingController();
  TextEditingController dataLivelihoodNumbers = TextEditingController();
  TextEditingController dataLivelihoodCapitalsource = TextEditingController();
  TextEditingController dataLivelihoodRevenue = TextEditingController();

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
                InputField(
                    hint: 'ഉപജീവന തൊഴിൽ',
                    controller: dataLivelihoodIncomesource,
                    onchanged: (value) {
                      providerone.updateDatalivelihoodincomesource(value);
                    }),
                InputField(
                  keytype: TextInputType.number,
                    hint: 'എണ്ണം‌',
                    controller: dataLivelihoodNumbers,
                    onchanged: (value) {
                      int? valuee = int.tryParse(value);
                      providerone.updateDatalivelihoodnumbers(valuee);
                    }),
                InputField(
                    hint: 'മൂലധന സ്രോതസ് (സ്വന്തം/പദ്ധതി) എഴുതുക',
                    controller: dataLivelihoodCapitalsource,
                    onchanged: (value) {
                      providerone.updateDatalivelihoodcapitalsource(value);
                    }),
                InputField(
                    hint: 'പ്രീതിമാസം വരുമാനം ',
                    controller: dataLivelihoodRevenue,
                    keytype: TextInputType.number,
                    onchanged: (value) {
                      int? valuee = int.tryParse(value);
                      providerone.updateDatalivelihoodrevenue(valuee);
                    }),

                ElevateClick(
                    ontap: () {
                      changeData();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                UpdatePurchaseofrawmaterials(
                                    items: widget.items),
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
    var dataup = widget.items['livelihoods'][0];
    print(dataup);
    setState(() {
      dataLivelihoodIncomesource.text = dataup["data_livelihood_incomesource"].toString();
      dataLivelihoodNumbers.text = dataup["data_livelihood_numbers"].toString();
      dataLivelihoodCapitalsource.text = dataup["data_livelihood_capitalsource"].toString();
      dataLivelihoodRevenue.text = dataup["data_livelihood_revenue"].toString();
    });
  }

  changeData() {
    var providerone = context.read<TextMain>();

    providerone.updateDatalivelihoodincomesource(dataLivelihoodIncomesource.text);

    String livelihoodnumbers = dataLivelihoodNumbers.text;
    int dataLivelihoodNumber = int.parse(livelihoodnumbers);
    providerone.updateDatalivelihoodnumbers(dataLivelihoodNumber);

    providerone.updateDatalivelihoodcapitalsource(dataLivelihoodNumbers.text);

    String revenue = dataLivelihoodRevenue.text;
    int livelihoodrevenue = int.parse(revenue);
    providerone.updateDatalivelihoodrevenue(livelihoodrevenue);


  }
}
