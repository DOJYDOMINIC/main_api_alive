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
      child: Container(
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black),
          ),
          child: DropdownSearch<String>(
            popupProps: PopupProps<String>.menu(
              showSelectedItems: true,
              // disabledItemFn: (String s) => s.startsWith('I'),
            ),
            items: items,
            onChanged: onChanged,
            selectedItem: selecteditem,
            dropdownDecoratorProps: DropDownDecoratorProps(dropdownSearchDecoration:InputDecoration(
                enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
                border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)))),
          )
      ),
    );
  }
}
