import 'package:flutter/material.dart';

class MeetingForm extends StatefulWidget {
  @override
  _MeetingFormState createState() => _MeetingFormState();
}

class _MeetingFormState extends State<MeetingForm> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color.fromARGB(255, 88, 88, 88),
      ),
      child: const Column(
        children: [
          SizedBox(
            width: 300,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Institution name: ',
                hintStyle: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 177, 174, 174),
                  ),
                ),
              ),
            ),
          ),
          // SizedBox(height: 10),
          SizedBox(
            width: 300,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'School principals name: ',
                hintStyle: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 300,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Number: ',
                hintStyle: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 177, 174, 174),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 300,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Mail: ',
                hintStyle: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 177, 174, 174),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}