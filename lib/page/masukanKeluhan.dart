
import 'dart:io';

import 'package:card_swiper/card_swiper.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:keluhan/genosLib/component/padding/commonPadding.dart';
import 'package:keluhan/genosLib/component/textfiled/TextField.dart';
import 'package:image_picker/image_picker.dart';

import '../genosLib/component/button/genButton.dart';
import '../genosLib/component/card/genCard.dart';
import '../genosLib/component/etc/genDimen.dart';
import '../genosLib/component/etc/genRow.dart';
import '../genosLib/component/etc/genShadow.dart';
import '../genosLib/component/page/genPage.dart';
import '../genosLib/genColor.dart';
import '../genosLib/genText.dart';

class MasukanKeluhan extends StatefulWidget {
  const MasukanKeluhan({Key? key}) : super(key: key);

  @override
  State<MasukanKeluhan> createState() => _MasukanKeluhanState();
}

class _MasukanKeluhanState extends State<MasukanKeluhan> {

  XFile? _image;
  final _picker = ImagePicker();

  Future<XFile?> pickImage() async {
    final _picker = ImagePicker();

    final XFile? pickedFile =
    await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      print('PickedFile: ${pickedFile.toString()}');
      setState(() {
        _image = XFile(pickedFile.path); // Exception occurred here
      });
    } else {
      print('PickedFile: is null');
    }

    if (_image != null) {
      return _image!;
    }
    return null;
  }

  Future<void> getLostData() async {
    final LostDataResponse response = await _picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.files != null) {
      // for (final XFile file in response.files) {
      //   // _handleFile(file);
      // }
    } else {
      // _handleError(response.exception);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GenPage(
      appbar: Container(
        width: double.infinity,
        child: Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                        height: 50,
                        width: 50,
                        child: Center(
                            child: Icon(
                          Icons.chevron_left,
                          size: 30,
                        ))),
                  ),
                  Container(
                      // height: 80,
                      child: InkWell(
                          onTap: () {
                            // Navigator.of(context).pop();
                          },
                          child: GenText(
                            "Masukan Keluhan",
                            style: TextStyle(fontSize: 20),
                          ))),
                  // GenText(
                  //   "QR Code",
                  //   style: TextStyle(color: Colors.black87, fontSize: 35),
                  // )
                ]),
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonPadding(
                      child: Row(
                        children: [
                          FloatingActionButton(
                            mini: true,
                            child: Icon(Icons.camera_alt),
                            onPressed: () {
                              pickImage();
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GenText(
                            "Masukan Foto Keluhan",
                            style: TextStyle(color: Colors.black45),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    _image == null
                        ? Container(
                      width: 0,
                      height: 0,
                    )
                        : Image.file(
                      File(_image!.path),
                      width: 150,
                      fit: BoxFit.fitWidth,
                    ),
                    CommonPadding(
                      child: TextLoginField(
                        label: "Keterangan",
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [



                  GenButton(
                    text: "Submit",
                    ontap: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
