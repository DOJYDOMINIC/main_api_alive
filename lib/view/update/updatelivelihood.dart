import 'package:flutter/material.dart';
import 'package:main200623/constant/color_text.dart';
import 'package:main200623/view/update/updateproduct.dart';
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

    return Scaffold(
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
                  onchanged: (value) {
                    int? valuee = int.tryParse(value);
                    providerone.updateDatalivelihoodrevenue(valuee);
                  }),
              ElevateClick(
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              UpdateProduct(items: widget.items),
                        ));
                  },
                  text: 'Next'),
            ],
          ),
        ),
      ),
    );
  }

  void getproductData() {
    var providerone = context.read<TextMain>();

    var dataup = widget.items['livelihoods'][0];

    setState(() {
      // dataDistrict: dataDistrict.toString()
      dataLivelihoodIncomesource.text = dataup["data_livelihood_incomesource"].toString();
      dataLivelihoodNumbers.text = dataup["data_livelihood_numbers"].toString();
      dataLivelihoodCapitalsource.text = dataup["data_livelihood_capitalsource"].toString();
      dataLivelihoodRevenue.text = dataup["data_livelihood_revenue"].toString();
    });
  }
}
