import 'package:flutter/material.dart';
import 'package:fyp_project_v2/models/news.dart';
import 'package:intl/intl.dart';

class PostFooter extends StatelessWidget {
  const PostFooter({
    required dynamic viewmodel,
    required News news,
    required int difference,
    required this.formattedDate,
  })   : _news = news,
        _viewmodel = viewmodel,
        _difference = difference;

  final News _news;
  final dynamic _viewmodel;
  final int _difference;
  final String formattedDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () => _viewmodel.react1 = !_viewmodel.react1,
                    icon: (_viewmodel.react1)
                        ? Image.asset("asset/react/hand.png")
                        : Image.asset("asset/react/hand-1.png")),
                IconButton(
                    onPressed: () => _viewmodel.react2 = !_viewmodel.react2,
                    icon: (_viewmodel.react2)
                        ? Image.asset("asset/react/send.png")
                        : Image.asset("asset/react/send-1.png")),
                IconButton(
                    onPressed: () => _viewmodel.react3 = !_viewmodel.react3,
                    icon: (_viewmodel.react3)
                        ? Image.asset("asset/react/talking.png")
                        : Image.asset("asset/react/talking-1.png")),
              ],
            ),
            (_news.status == "Pending")
                ? IconButton(
                    onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              duration: const Duration(milliseconds: 500),
                              content: Text("Waiting for the verification!")),
                        ),
                    icon: Image.asset("asset/react/wait.png"))
                : (_news.status == "Fake News!!!")
                    ? IconButton(
                        onPressed: () =>
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  duration: const Duration(milliseconds: 500),
                                  content: Text("Oh no! It is a fake news.")),
                            ),
                        icon: Image.asset("asset/react/fake.png"))
                    : IconButton(
                        onPressed: () =>
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  duration: const Duration(milliseconds: 500),
                                  content:
                                      Text("Great! It is a reliable news.")),
                            ),
                        icon: Image.asset("asset/react/real.png"))
          ],
        ),
        SizedBox(height: 10.0),
        Padding(
          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
          child: Text("1023 likes | 1003 comments",
              style: TextStyle(
                  color: Colors.grey[800],
                  fontFamily: "Acme",
                  fontWeight: FontWeight.bold)),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
          child: Text(
            _news.description,
            textAlign: TextAlign.justify,
            style: TextStyle(color: Colors.grey[800], fontFamily: "Acme"),
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
          child: Text(
            (_difference > 7)
                ? "${DateFormat('MMMMd').format(_news.publishDateTime)} at ${DateFormat('Hm').format(_news.publishDateTime)} • ${_news.location}":
                 "$_difference day(s) ago",
            style: TextStyle(fontSize: 10.0, color: Colors.blueGrey[500], fontFamily: "Acme"),
          ),
        ),
      ],
    );
  }
}
