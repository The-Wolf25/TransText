import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:translate_test/Models/api.dart';
import 'Bottomsheet.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

class homepage extends StatefulWidget {
  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  TextEditingController _first = TextEditingController();
  String apiKey = '5cae76f124msh6c3b210ee89ad58p199ae3jsn30a4b235c380';
  String endpoint =
      'https://google-translate1.p.rapidapi.com/language/translate/v2';
  langauage pree = langauage();

  bool sel = false;

  String _selected = '';
  String _select = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 21, 21, 21),
      appBar: AppBar(
        toolbarHeight: 69,
        titleSpacing: 3,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: Text(
            'Text Translation',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            textAlign: TextAlign.start,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: Divider(
                  height: 15,
                  color: Color.fromARGB(255, 60, 60, 60),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 55),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () async {
                        await Trans();
                        showModalBottomSheet(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(23),
                                    topRight: Radius.circular(25))),
                            context: context,
                            builder: (context) {
                              return Align(
                                alignment: Alignment.center,
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 62, 62, 62),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(23),
                                            topRight: Radius.circular(25))),
                                    height: 500,
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 30),
                                      child: ListView.separated(
                                          itemBuilder: ((context, index) {
                                            return InkWell(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20,
                                                        vertical: 10),
                                                child: Container(
                                                    alignment: Alignment.center,
                                                    height: 45,
                                                    decoration: BoxDecoration(
                                                        color: Color.fromARGB(
                                                            255, 26, 25, 25),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12)),
                                                    child: Text(
                                                      pree
                                                          .data!
                                                          .languages![index]
                                                          .language!,
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Color.fromARGB(
                                                              255,
                                                              163,
                                                              163,
                                                              163)),
                                                    )),
                                              ),
                                              onTap: () async {
                                                setState(() {
                                                  sel = true;
                                                  _select = pree
                                                      .data!
                                                      .languages![index]
                                                      .language!;
                                                  print(_select);
                                                });
                                              },
                                            );
                                          }),
                                          separatorBuilder: (context, int) {
                                            return Divider(
                                              color: Colors.transparent,
                                            );
                                          },
                                          itemCount:
                                              pree.data!.languages!.length),
                                    )),
                              );
                              Navigator.of(context).pop();
                            });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 120,
                        height: 55,
                        child: Text('$_select'),
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                    Icon(
                      Icons.compare_arrows,
                      size: 37,
                      color: Colors.grey,
                    ),
                    InkWell(
                      onTap: () => showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(23),
                                  topRight: Radius.circular(25))),
                          context: context,
                          builder: (context) {
                            return Align(
                              alignment: Alignment.center,
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 62, 62, 62),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(23),
                                          topRight: Radius.circular(25))),
                                  height: 500,
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 30),
                                    child: ListView.separated(
                                        itemBuilder: ((context, index) {
                                          return InkWell(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20,
                                                      vertical: 10),
                                              child: Container(
                                                  alignment: Alignment.center,
                                                  height: 45,
                                                  decoration: BoxDecoration(
                                                      color: Color.fromARGB(
                                                          255, 26, 25, 25),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12)),
                                                  child: Text(
                                                    pree.data!.languages![index]
                                                        .language!,
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Color.fromARGB(
                                                            255,
                                                            163,
                                                            163,
                                                            163)),
                                                  )),
                                            ),
                                            onTap: () {
                                              setState(() {
                                                _selected = pree
                                                    .data!
                                                    .languages![index]
                                                    .language!;
                                                print(_selected);
                                              });
                                            },
                                          );
                                        }),
                                        separatorBuilder: (context, int) {
                                          return Divider(
                                            color: Colors.transparent,
                                          );
                                        },
                                        itemCount:
                                            pree.data!.languages!.length),
                                  )),
                            );
                            Navigator.of(context).pop();
                          }),
                      child: Container(
                        alignment: Alignment.center,
                        width: 120,
                        height: 55,
                        child: Text('$_selected'),
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 34,
                ),
                child: Text(
                  'Translated from $_select',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 25, top: 5, bottom: 20, right: 25),
                child: TextFormField(
                  onChanged: (value) {
                    translateText(_first.text, _select);
                  },
                  controller: _first,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      fillColor: Color.fromARGB(255, 84, 84, 84),
                      filled: true,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 50, horizontal: 30),
                      hintText: 'Enter Text Here',
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 34,
                ),
                child: Text(
                  'Translated to $_selected',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      fillColor: Color.fromARGB(255, 84, 84, 84),
                      filled: true,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 50, horizontal: 30),
                      hintText: 'Enter Text Here',
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () async {
                  await translateText(_first.text, _selected);
                },
                child: Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    child: Container(
                      child: Text(
                        'Translate',
                        textAlign: TextAlign.center,
                      ),
                      alignment: Alignment.center,
                      width: 150,
                      height: 45,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 145, 145, 145),
                          borderRadius: BorderRadius.circular(16)),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );

    void showmodal(context) {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
                height: 400,
                alignment: Alignment.center,
                child: ListView.separated(
                    itemBuilder: ((context, index) {
                      return GestureDetector(
                        child: Text(
                          pree.data!.languages![index].language!,
                        ),
                        onTap: () {
                          setState(() {
                            _selected = pree.data!.languages![index].language!;
                          });
                        },
                      );
                    }),
                    separatorBuilder: (context, int) {
                      return Divider();
                    },
                    itemCount: pree.data!.languages!.length));
            Navigator.of(context).pop();
          });
    }
  }

  Future<String> translateText(
      String textToTranslate, String targetLanguage) async {
    final response = await http.post(
      Uri.parse(endpoint),
      headers: {
        'Content-Type': 'application/json',
        'x-rapidapi-key': apiKey,
      },
      body: jsonEncode({
        'q': textToTranslate,
        'target': targetLanguage,
      }),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(data['data']['translations'][0]['translatedText']);
      return data['data']['translations'][0]['translatedText'];
    } else {
      throw Exception('Failed to translate text');
    }
  }

  Future<void> Trans() async {
    var prajj = await http.get(
        Uri.parse(
            'https://google-translate1.p.rapidapi.com/language/translate/v2/languages'),
        headers: {
          'Accept-Encoding': 'application/gzip',
          'X-RapidAPI-Key':
              '5cae76f124msh6c3b210ee89ad58p199ae3jsn30a4b235c380',
          'X-RapidAPI-Host': 'google-translate1.p.rapidapi.com'
        });
    if (prajj.statusCode == 200) {
      final prajjj = jsonDecode(prajj.body);
      pree = langauage.fromJson(prajjj);
      print(pree);
    }
  }
}
