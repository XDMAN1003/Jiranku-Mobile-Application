import 'package:flutter/material.dart';

class AuthoritiesBody extends StatelessWidget {
  const AuthoritiesBody({Key? key}) : super(key: key);

  void _settingModalBottomSheet(context, {phoneNumber, fbURL, address}) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.phone),
                    title: new Text('Call'),
                    onTap: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          duration: const Duration(milliseconds: 1500),
                          content: Text(
                              "Redirecting to Phone. Call ${phoneNumber}")));
                    }),
                new ListTile(
                    leading: new Icon(Icons.place),
                    title: new Text('Location'),
                    onTap: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          duration: const Duration(milliseconds: 500),
                          content: Text(
                              "Redirecting to Map. Location found: ${address}")));
                    }),
                new ListTile(
                    leading: new Icon(Icons.facebook_rounded),
                    title: new Text('Facebook'),
                    onTap: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          duration: const Duration(milliseconds: 500),
                          content:
                              Text("Redirecting to Facebook. Call ${fbURL}")));
                    }),
              ],
            ),
          );
        });
  }

  dynamic _showAlertBox(context, {type, link}) => showDialog<String>(
        context: context,
        builder: (BuildContext context) => Dialog(
          child: Stack(
              clipBehavior: Clip.none,
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
                  width: MediaQuery.of(context).size.width - 10.0,
                  height: MediaQuery.of(context).size.height / 5,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 10.0,
                        padding: EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0))),
                        child: Row(
                          children: [
                            (type == "FB")
                                ? Icon(
                                    Icons.facebook_outlined,
                                    color: Colors.blue,
                                  )
                                : (type == "HP")
                                    ? Icon(
                                        Icons.phone,
                                        color: Colors.green,
                                      )
                                    : Icon(
                                        Icons.place,
                                        color: Colors.red,
                                      ),
                            Expanded(
                              flex: 3,
                              child: Text(
                                "$link",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: "Vol",
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.maxFinite,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                            child: Text("OK")),
                      )
                    ],
                  ),
                ),
                Positioned(
                    top: -70.0,
                    child: CircleAvatar(
                      backgroundImage: AssetImage("asset/loading.gif"),
                      radius: 60.0,
                    )),
              ]),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        GovCard(context,
            title: "CRSM 双溪大年志工团",
            phone: "Hotline: 019-4097771",
            shortAddress: "Taman Pekan Baru",
            link: "@CRSM.SP",
            address: "No.23, Jln Zamrud 2, Tmn Pekan Baru",
            image: "CRSM.jpg"),
        GovCard(context,
            title: "PPKSSP 大年治安队",
            phone: "Hotline: 010-3818931",
            shortAddress: "Pekan Lama",
            link: "@PKS.SungaiPetani",
            address: "LOT 71107, Kampung Tebu, Pekan Lama",
            image: "PKS.jpg"),
        GovCard(context,
            title: "MPSPK",
            phone: "Hotline: 04-429 666",
            shortAddress: "Menara MPSPK",
            link: "@CRSM.SP",
            address: "Menara MPSPK, Jalan Patani",
            image: "MPSPK.png"),
        GovCard(context,
            title: "Hosp Sultan Abd Halim",
            phone: "Hotline: 04-4457333",
            shortAddress: "Bandar Amanjaya",
            link: "@FKPHSAH",
            address: "225, Bandar Amanjaya",
            image: "hosp.png"),
        GovCard(context,
            title: "LHDN Sg Petani",
            phone: "Hotline: 04-4456000",
            shortAddress: "Bandar Amanjaya",
            link: "@LHDN-Sg-Petani",
            address: "225, Bandar Amanjaya",
            image: "LHDN.png"),
        GovCard(context,
            title: "UTC Sg Petani",
            phone: "Hotline: 04-4216391",
            shortAddress: "Jln Kuala Ketil",
            link: "@utcsungaipetani",
            address: "Jalan Kuala Ketil",
            image: "UTC.jpg"),
        GovCard(context,
            title: "JPJ Sg Petani",
            phone: "Hotline: 04-421 8104",
            shortAddress: "Jln Kuala Ketil",
            link: "@JPJ-Sg-Petani",
            address: "Jalan Kuala Ketil",
            image: "jpj.png"),
        GovCard(context,
            title: "PPD Sg Petani",
            phone: "Hotline: 04-421 2370",
            shortAddress: "Jalan Badlishah",
            link: "@PPD-Sg-Petani",
            address: "Jalan Badlishah",
            image: "ppd.jpg"),
      ],
    );
  }

  Card GovCard(BuildContext context,
      {title, phone, address, shortAddress, link, image}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage("asset/gov/$image"),
            backgroundColor: Colors.white,
          ),
          title: Text(
            '$title',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$address",
                style: TextStyle(fontSize: 12.0),
              ),
              SizedBox(
                height: 2,
              ),
              Text("$phone", style: TextStyle(fontSize: 12.0))
            ],
          ),
          trailing: IconButton(
              onPressed: () => _settingModalBottomSheet(context,
                  phoneNumber: "$phone",
                  address: "$shortAddress",
                  fbURL: "$link"),
              icon: Icon(Icons.more_vert_rounded)),
        ),
      ),
    );
  }
}
