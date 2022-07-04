import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  final String token;
  const HomeScreen({Key? key, required this.token}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;
  var res = [];
  TextEditingController c1 = TextEditingController();
  TextEditingController c2 = TextEditingController();
  TextEditingController c3 = TextEditingController();

  void getData() async {
    res = [
      {
        "order_id": "001",
        "Name": "Dhairya",
        "Address": "Plot 381",
        "Mobile_number": "9558",
        "From_name": "krishna",
        "From_address": "plot no. 456",
        "Status": "Picked",
        "start_latitude": "72.002323",
        "start_longitude": "25.014540",
        "end_latitude": "73.05645"
      },
      {
        "order_id": "002",
        "Name": "Ekta",
        "Address": "Plot 356",
        "Mobile_number": "9558",
        "From_name": "krishna",
        "From_address": "plot no. 456",
        "Status": "Picked",
        "start_latitude": "72.002323",
        "start_longitude": "25.014540",
        "end_latitude": "73.05645"
      }
    ];
    c1.text = res[0]["Name"];
    c2.text = res[0]["Address"];
    c3.text = res[0]["Mobile_number"];
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const SizedBox(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(color: Colors.amber),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height / 2,
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.amber, width: 4)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(),
                          const Padding(
                            padding: EdgeInsets.only(left: 16, top: 16),
                            child: Text(
                              "Current Task",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, top: 16),
                            child: TextField(
                              controller: c1,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey[100],
                                  label: const Text("Name"),
                                  labelStyle:
                                      TextStyle(color: Colors.grey[600]),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, top: 16),
                            child: TextField(
                              controller: c2,
                              decoration: InputDecoration(
                                  filled: true,
                                  suffixIcon: const Icon(Icons.map),
                                  fillColor: Colors.grey[100],
                                  label: const Text("Address"),
                                  labelStyle:
                                      TextStyle(color: Colors.grey[600]),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, top: 16),
                            child: TextField(
                              controller: c3,
                              decoration: InputDecoration(
                                  filled: true,
                                  suffixIcon: const Icon(Icons.call),
                                  fillColor: Colors.grey[100],
                                  label: const Text("Mobile number"),
                                  labelStyle:
                                      TextStyle(color: Colors.grey[600]),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    "From: ${res[0]["From_address"]}",
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                SizedBox(
                                  width: 80,
                                  height: 30,
                                  child: RawMaterialButton(
                                    onPressed: () {},
                                    fillColor: Colors.amber,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: const Text(
                                      "Status",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Spacer()
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 16, top: 16),
                    child: Text(
                      "Upcoming Task",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  res[1]["From_address"],
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Icon(Icons.arrow_downward),
                                Text(
                                  res[1]["Address"],
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 80,
                              height: 30,
                              child: RawMaterialButton(
                                onPressed: () {},
                                fillColor: Colors.amber,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Text(
                                  "Status",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
