import 'package:baanda_mobile_app/constant/constant_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Grievence extends StatefulWidget {
  const Grievence({super.key});

  @override
  State<Grievence> createState() => _GrievenceState();
}

class _GrievenceState extends State<Grievence> {
  Map<String, dynamic> grievence = {
    "Name": "Gargi Mishra",
    "Gender": "Female",
    "Email": "gargi@gmail.com",
    "Phone": "+91 1234567890",
    "Program": "M.Sc in Science",
  };

  // ✅ Return a List<Widget>
  List<Widget> details() {
    return grievence.entries.map((e) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                e.key,
                style: GoogleFonts.openSans(
                  fontSize: 14,
                  color: Color(0xFF333333),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Text(": "),
            Expanded(
              flex: 3,
              child: Text(
                e.value.toString(),
                style: GoogleFonts.openSans(
                  fontSize: 14,
                  color: Color(0xFF333333),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Grievance")),
      body: ListView(
        padding: const EdgeInsets.all(16),

        children: [
          Container(
            padding: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height * 0.24,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.white,
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your Details",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                ...details(), // ✅],),)
              ],
            ),
          ),
          SizedBox(height: 7),
          Text(
            "Please select the category of your grievance",
            style: GoogleFonts.openSans(
              fontSize: 16,
              color: Color(0xFF333333),
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10),
          CustomWidgets.customDropdownField(
            context: context,
            hint: "Select",
            items: ["a", 'b', 'c'],
            selectedItem: selectedItem,
            onChanged: (value) {
              setState(() {
                selectedItem = value;
              });
            },
          ),
          SizedBox(height: 10),
          CustomWidgets.customTextFeild(
            context: context,
            maxLines: 5,
            borderRad: 6,
            hintfontSize: 14,
            hintColor: Colors.grey.shade400,
            hint: '''Please describe your complain in less than
150 word.''',
          ),
          SizedBox(height: 40),
          CustomWidgets.customButton(
            context: context,
            buttonName: 'Proceed',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            height: 60,
            btnColor: Colors.amber,
            radius: 6
          ),
        ],
      ),
    );
  }
}
