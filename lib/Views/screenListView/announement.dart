import 'package:baanda_mobile_app/constant/constant_widget.dart';
import 'package:flutter/material.dart';


class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: // declare this in your StatefulWidget
            CustomWidgets.customDropdownField(
              context: context,
              label: 'Notifications',
              fontSize: 12,
              hint: 'Select',

              items: ["tsfds", 'dfdkf', 'dfkdf'],
              suffixIcon: Icon(Icons.keyboard_arrow_down, color: Colors.black),

              selectedItem: selectedValue?.isEmpty ?? true
                  ? null
                  : selectedValue, // can be null initially
              onChanged: (value) {
                setState(() {
                  selectedValue = value; // update state when changed
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 20,

              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Icon(Icons.circle, size: 10, color: Colors.red),
                  title: Text('this is ${index + 1} Title'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
