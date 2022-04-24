import 'package:flutter/material.dart';

class AuthoritiesBody extends StatelessWidget {
  const AuthoritiesBody({Key? key}) : super(key: key);

  void _settingModalBottomSheet(context, {phoneNumber}) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.music_note),
                    title: new Text('Call'),
                    onTap: () => {}),
                new ListTile(
                    leading: new Icon(Icons.music_note),
                    title: new Text('Location'),
                    onTap: () => {}),
                new ListTile(
                  leading: new Icon(Icons.facebook_rounded),
                  title: new Text('Facebook'),
                  onTap: () => _showAlertBox(context, title: "Facebook"),
                ),
              ],
            ),
          );
        });
  }

  dynamic _showAlertBox(context, {title, subtitle}) => showDialog<String>(
        context: context,
        builder: (BuildContext context) => Dialog(
          child: Stack(
              overflow: Overflow.visible,
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
                        decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                        child: Text("www.google.com"),
                      ),
                      SizedBox(
                        height: 15.0,
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
                      radius: 70.0,
                    )),
              ]),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("asset/gov/CRSM.jpg"),
                backgroundColor: Colors.amber,
              ),
              title: Text(
                'CRSM 双溪大年志工团',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "No.23, Jln Zamrud 2, Tmn Pekan Baru",
                    style: TextStyle(fontSize: 12.0),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text("Hotline: 019-4097771", style: TextStyle(fontSize: 12.0))
                ],
              ),
              trailing: IconButton(
                  onPressed: () => _settingModalBottomSheet(context),
                  icon: Icon(Icons.more_vert_rounded)),
            ),
          ),
        ),
      ],
    );
  }
}
