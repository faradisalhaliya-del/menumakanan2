import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MenuMakanan(),
  ));
}

class MenuMakanan extends StatefulWidget {
  @override
  State<MenuMakanan> createState() => MenuMakananState();
}

class MenuMakananState extends State<MenuMakanan> {
  List<String> menu = ["Soto", "Rawon"];
  List<int> harga = [10000, 15000];
  List<String> gambar = ["assets/soto.jpg", "assets/rawon.jpg"];

  List<TextEditingController> porsi = [
    TextEditingController(text: "1"),
    TextEditingController(text: "1"),
  ];

  int get total {
    int hasil = 0;

    for (int i = 0; i < menu.length; i++) {
      int jumlah = int.tryParse(porsi[i].text) ?? 0;
      hasil += jumlah * harga[i];
    }

    return hasil;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu Makanan"),
        backgroundColor: Colors.pink[200],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Table(
                border: TableBorder.all(),
                children: [
                  TableRow(
                    decoration: BoxDecoration(
                      color: Colors.pink[100],
                    ),
                    children: [
                      Text("No"),
                      Text("Gambar"),
                      Text("Menu"),
                      Text("Harga"),
                      Text("Porsi"),
                    ],
                  ),
                  for (int i = 0; i < menu.length; i++)
                    TableRow(
                      children: [
                        Text("${i + 1}"),
                        Image.asset(
                          gambar[i],
                          height: 70,
                        ),
                        Text(menu[i]),
                        Text("Rp ${harga[i]}"),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: TextField(
                            controller: porsi[i],
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              setState(() {});
                            },
                            decoration: InputDecoration(
                              hintText: "Porsi",
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                "Total Harga: Rp $total",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink[400],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
