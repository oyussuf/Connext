import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AddService extends StatefulWidget {
  const AddService({Key? key}) : super(key: key);

  @override
  State<AddService> createState() => _AddServiceState();
}

class _AddServiceState extends State<AddService> {
  String dropdownValueSN = 'Beauty';
  String dropdownValueCategory = 'Hair';
  String dropdownValueSC = 'Coloring';
  TextEditingController discription = TextEditingController();
  DatabaseReference? serviceKey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            Text('Add a service'),
            SizedBox(
              height: 20,
            ),
            // service
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Service Name'),
                SizedBox(
                  width: 60,
                ),
                DropdownButton<String>(
                  value: dropdownValueSN,
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValueSN = newValue!;
                    });
                  },
                  items: <String>['Beauty']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            // category
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Category'),
                SizedBox(
                  width: 90,
                ),
                DropdownButton<String>(
                  value: dropdownValueCategory,
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValueCategory = newValue!;
                    });
                  },
                  items: <String>[
                    'Hair',
                    'MakeUp',
                    'Nails',
                    'Lashes',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            // sub-category
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Sub=Category'),
                SizedBox(
                  width: 60,
                ),
                DropdownButton<String>(
                  value: dropdownValueSC,
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValueSC = newValue!;
                    });
                  },
                  items: <String>[
                    'Coloring',
                    'Haircuts',
                    'Locs',
                    'Protective Styles',
                    'Wings'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(
              height: 60,
            ),
            Column(
              children: [
                Text('Discription'),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: 120,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 2)),
                    child: TextField(
                      controller: discription,
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.newline,
                      decoration: InputDecoration(border: InputBorder.none),
                      minLines: 1,
                      maxLines: 5,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Text('Add Image'),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.deepOrange.shade200,
                    border:
                        Border.all(width: 2, color: Colors.deepOrange.shade200),
                  ),
                  width: 100,
                  height: 100,
                  child: GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.add,
                      size: 60,
                    ),
                  ),
                ),
              ],
            ),

            ElevatedButton(
                onPressed: () {
                  print(dropdownValueSN);
                  print(dropdownValueCategory);
                  print(dropdownValueSC);
                  print(discription.text);

                  postService();
                },
                child: Text('Post'))
          ],
        ),
      ),
    );
  }

  Future postService() async {
    serviceKey = await FirebaseDatabase.instance.ref().child("Services").push();

    Map serviceDataMap = {
      'service_name': dropdownValueSN,
      'category': dropdownValueSN,
      'sub-category': dropdownValueSC,
      'description': discription.text.trim(),
    };

    await serviceKey!.set(serviceDataMap);
  }
}
