import 'package:flutter/material.dart';

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
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const Text(": "),
            Expanded(flex: 3, child: Text(e.value.toString())),
          ],
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Grievance")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.23,
            color: Colors.white,
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
        ],
      ),
    );
  }
}
