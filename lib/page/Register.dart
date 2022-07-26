import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:keluhan/genosLib/component/genToast.dart';
import 'package:keluhan/genosLib/component/radiobutton/genRadioMini.dart';
import 'package:keluhan/genosLib/database/genPreferrence.dart';
import 'package:keluhan/genosLib/genText.dart';

import '../genosLib/component/request.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final req = new GenRequest();
  var dataLogin, dataKelas;
  bool loaded = false;

  var idKelas = 0;
  var nama, no_hp, alamat, username, password;
  @override
  Widget build(BuildContext context) {
    if (!loaded) {
      print("GET KELAS");
      getKelas();
      loaded = true;
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blue,
                Colors.blue,
              ],
              begin: Alignment.topLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 36.0, horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Daftar",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 42.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "Masukan data yang diperlukan",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GenText("kelas"),
                          dataKelas == null
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : GenRadioGroupMini(
                                  ontap: (val) {
                                    setState(() {
                                      print("val nya : "+val.toString());
                                      idKelas = val["id"];
                                    });
                                  },
                                  id: 'id',
                                  initValue: idKelas,
                                  listData: dataKelas,
                                  title: "nama"),
                          TextField(
                            onChanged: (val){nama = val;},
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xFFE7EDEB),
                              hintText: "Nama",
                              prefixIcon: Icon(
                                Icons.drive_file_rename_outline,
                                color: Colors.grey[600],
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          TextField(
                            onChanged: (val){no_hp = val;},
                            keyboardType: TextInputType.phone ,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xFFE7EDEB),
                              hintText: "No Hp",
                              prefixIcon: Icon(
                                Icons.phone,
                                color: Colors.grey[600],
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          TextField(
                            onChanged: (val){alamat = val;},
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xFFE7EDEB),
                              hintText: "Alamat",
                              prefixIcon: Icon(
                                Icons.map_outlined,
                                color: Colors.grey[600],
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          TextField(
                            onChanged: (val){username = val;},
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xFFE7EDEB),
                              hintText: "Username",
                              prefixIcon: Icon(
                                Icons.account_box,
                                color: Colors.grey[600],
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          TextField(
                            onChanged: (val){password = val;},
                            obscureText: true,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xFFE7EDEB),
                              hintText: "password",
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.grey[600],
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.end,
                          //   children: [
                          //     Text(
                          //       "Forget password",
                          //       textAlign: TextAlign.end,
                          //       style: TextStyle(
                          //         color: Colors.blue[800],
                          //         decoration: TextDecoration.underline,
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          SizedBox(
                            height: 50.0,
                          ),
                          Container(
                            width: double.infinity,
                            child: RaisedButton(
                              onPressed: () {
                                Register();
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              color: Colors.blue[600],
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 18.0),
                                child: Text(
                                  "Daftar",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 80.0,
                          ),
                          Text("Sudah Punya akun ? Login sekarang")
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void Register() async {
    if(idKelas != null && nama != null && no_hp != null && alamat != null && username != null && password != null){
    dataLogin = await req
        .postFormWoAuth("register",
        {"kelas": idKelas,
          "nama": nama,
          "no_hp": no_hp,
          "alamat": alamat,
          "username": username,
          "password": password,
        });

      setPrefferenceToken(dataLogin["payload"]["access_token"]);

      Navigator.popAndPushNamed(context, "home");
    }else{
      toastShow("Cek lagi inputanmu", context, Colors.black);
    }

    print("DATA $dataLogin");
    print("length" + dataLogin.length.toString());
  }

  void getKelas() async {
    dataKelas = await req.getApiPublic("kelas");
    var tempData = [];
    for (var i = 0; i < dataKelas["payload"].length; i++) {
      if (i == 0) {
        idKelas = dataKelas["payload"][i]["id"];
      }
      var data = {
        "id": dataKelas["payload"][i]["id"],
        "nama": dataKelas["payload"][i]["progdi"]["nama"] +
            " " +
            dataKelas["payload"][i]["nama"]
      };
      tempData.add(data);
    }

    dataKelas = tempData;

    setState(() {});
    print("log DATA $dataKelas");
    print("length" + dataKelas.length.toString());
  }
}
