import 'package:card_swiper/card_swiper.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../genosLib/component/card/genCard.dart';
import '../genosLib/component/etc/genDimen.dart';
import '../genosLib/component/etc/genRow.dart';
import '../genosLib/component/etc/genShadow.dart';
import '../genosLib/component/page/genPage.dart';
import '../genosLib/component/request.dart';
import '../genosLib/genColor.dart';
import '../genosLib/genText.dart';
import 'menuNavbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Container(
                  width: 100,
                  height: 100,
                  child: Center(
                      child: InkWell(
                          onTap: () {
                            // Navigator.of(context).pop();
                          },
                          child: Image.asset(
                            "assets/icons/menu_icon.png",
                            color: Colors.black87,
                          )))),
              Container(
                  width: 80,
                  height: 80,
                  child: Center(
                      child: InkWell(
                          onTap: () {
                            // Navigator.of(context).pop();
                          },
                          child: CircleAvatar(
                            radius: 20.0,
                            child: Image.network(
                                "https://cdn0.iconfinder.com/data/icons/google-material-design-3-0/48/ic_account_circle_48px-512.png"),
                            backgroundColor: Colors.transparent,
                          )))),
              // GenText(
              //   "QR Code",
              //   style: TextStyle(color: Colors.black87, fontSize: 35),
              // )
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
                children: [
                  GenCardArtikel(
                    ontap: (){Navigator.pushNamed(context, "detail");}                    ,
                    judul: "Kantin Terlalu Rame",
                    isi: "Kantin di siang hari terlalu rame",
                    harga: "pending",
                    gambar:
                    "https://goukm.id/wp-content/uploads/2016/07/jualan-kantin-sekolah-goukm-696x393.jpg",
                  ),
                  GenCardArtikel(
                    ontap: (){Navigator.pushNamed(context, "detail");},
                    judul: "Kursi Rusak",
                    isi: "Kursi rusak di ruang praktik komputer",
                    harga: "Selesai",
                    gambar:
                    "https://assets-a1.kompasiana.com/items/album/2015/11/12/img-20151110-161648-5643c5308923bd3905dbe277.jpg",
                  ),

                ],
              ),
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
    print("length" + dataKeluhan.length.toString());

    setState(() {});
  }
}
