import 'package:connext/utility/toast_messages.dart';
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
  TextEditingController servicePriceController = TextEditingController();
  DatabaseReference? serviceKey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Text(
              'Add a service',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  // service
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Service Name',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.deepOrange)),
                      SizedBox(
                        width: 60,
                      ),
                      DropdownButton<String>(
                        value: dropdownValueSN,
                        icon: const Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: const TextStyle(
                            color: Colors.black54, fontWeight: FontWeight.bold),
                        underline: Container(
                          height: 2,
                          color: Colors.black54,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Category',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.deepOrange)),
                      SizedBox(
                        width: 90,
                      ),
                      DropdownButton<String>(
                        value: dropdownValueCategory,
                        icon: const Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: const TextStyle(
                            color: Colors.black54, fontWeight: FontWeight.bold),
                        underline: Container(
                          height: 2,
                          color: Colors.black54,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Sub=Category',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.deepOrange)),
                      SizedBox(
                        width: 60,
                      ),
                      DropdownButton<String>(
                        value: dropdownValueSC,
                        icon: const Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: const TextStyle(
                            color: Colors.black54, fontWeight: FontWeight.bold),
                        underline: Container(
                          height: 2,
                          color: Colors.black54,
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
                  // service price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Service Price',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.deepOrange)),
                      Container(
                        width: 100,
                        height: 50,
                        decoration: BoxDecoration(),
                        child: TextField(
                            cursorColor: Colors.deepOrange,
                            controller: servicePriceController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              children: [
                Text('Discription',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange)),
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
              height: 10,
            ),
            Column(
              children: [
                Text('Add Image',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange)),
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
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(300, 50),
                    maximumSize: const Size(300, 50),
                    backgroundColor: Colors.deepOrange),
                onPressed: () {
                  print(dropdownValueSN);
                  print(dropdownValueCategory);
                  print(dropdownValueSC);
                  print(discription.text);

                  postService();
                },
                child: Text(
                  'Post Service',
                  style: TextStyle(
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ))
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
      'service_price': servicePriceController.text.trim(),
      'posted_by': student!.id
    };

    await serviceKey!.set(serviceDataMap);
  }
}
