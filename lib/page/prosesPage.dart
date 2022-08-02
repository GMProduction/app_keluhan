import 'package:card_swiper/card_swiper.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keluhan/genosLib/component/JustHelper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../genosLib/component/card/genCard.dart';
import '../genosLib/component/etc/genDimen.dart';
import '../genosLib/component/etc/genRow.dart';
import '../genosLib/component/etc/genShadow.dart';
import '../genosLib/component/page/genPage.dart';
import '../genosLib/component/request.dart';
import '../genosLib/genColor.dart';
import '../genosLib/genText.dart';
import 'menuNavbar.dart';

class ProsesPage extends StatefulWidget {
  const ProsesPage({Key? key}) : super(key: key);

  @override
  State<ProsesPage> createState() => _ProsesPageState();
}

class _ProsesPageState extends State<ProsesPage> {
  final req = new GenRequest();
  var dataKeluhan;
  bool isLoaded = false;

  @override
  Widget build(BuildContext context) {
    if (!isLoaded) {
      isLoaded = true;
      getDataKeluhan();
    }

    return GenPage(
      appbar: Container(
        width: double.infinity,
        child: Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 80,
                    margin: EdgeInsets.only(left: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Aplikasi Keluhan",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      logout(context);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Icon(Icons.logout),
                    ),
                  )
                ]),
          ],
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              RowSpaceBetween(
                chilidLeft: GenText(
                  "Keluhan yang kamu ajukan",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                childRight: InkWell(
                    onTap: () {
                      //PINDAH KE HALAMAN LIHAT SEMUA ARTIKEL
                    },
                    child: GenText(
                      "",
                      style: TextStyle(color: GenColor.primaryColor),
                    )),
              ),
              SizedBox(
                height: GenDimen.afterTitle,
              ),
              Column(
                  children: dataKeluhan == null
                      ? [Center(child: CircularProgressIndicator())]
                      : dataKeluhan["payload"].map<Widget>((e) {
                          return GenCardArtikel(
                            // ontap: (){Navigator.pushNamed(context, "detail");}                    ,
                            judul: formatTanggalFromString(e["tanggal"]!),
                            isi: e["deskripsi"],
                            harga: e["status"],
                            gambar: e['gambar'] != null
                                ? ip + e["gambar"].toString()
                                : 'https://bodybigsize.com/wp-content/uploads/2020/02/noimage-8.png',
                          );
                        }).toList()),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getDataKeluhan() async {
    dataKeluhan = await req.getApi("keluhan");

    print("DATA $dataKeluhan");

    setState(() {});
  }

  void logout(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove("token");
    Navigator.popAndPushNamed(context, "login");
  }
}
