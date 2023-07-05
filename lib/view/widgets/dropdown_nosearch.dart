import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class NoSearchDropdown extends StatelessWidget {
  NoSearchDropdown({
    required this.onChanged,
    required this.items,
    required this.selecteditem,
  });

  final List<String> items;
  final ValueChanged onChanged;
  final String? selecteditem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: DropdownSearch<String>(
          popupProps: PopupProps<String>.menu(
            showSelectedItems: true,
            // disabledItemFn: (String s) => s.startsWith('I'),
          ),
          items: items,
          onChanged: onChanged,
          // selectedItem: selecteditem,
          dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.black)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.black)),
            labelText: '${selecteditem}',
            labelStyle: TextStyle(color: Colors.grey),
          ))),
    );
  }
}
