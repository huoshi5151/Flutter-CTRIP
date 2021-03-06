import 'package:demo/widgets/my_webview.dart';
import 'package:flutter/material.dart';

class LocalNav extends StatelessWidget {
  final List<_LocalNavModel> localNavList = [
    _LocalNavModel(
        icon: 'images/ln_ticket.png',
        url: 'https://m.ctrip.com/html5/ticket/',
        title: '景点·玩乐'),
    _LocalNavModel(
        icon: 'images/ln_weekend.png',
        url: 'https://m.ctrip.com/html5/ticket/',
        title: '周边游'),
    _LocalNavModel(
        icon: 'images/ln_food.png',
        url: 'https://m.ctrip.com/html5/ticket/',
        title: '美食林'),
    _LocalNavModel(
        icon: 'images/ln_oneday.png',
        url: 'https://m.ctrip.com/html5/ticket/',
        title: '一日游'),
    _LocalNavModel(
        icon: 'images/ln_guide.png',
        url: 'https://m.ctrip.com/html5/ticket/',
        title: '当地攻略')
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Color.fromARGB(255, 238, 238, 238),
                  offset: Offset(0, 3))
            ]),
        child: _items(context));
  }

  Widget _items(BuildContext context) {
    List<Widget> items = [];
    localNavList.forEach((model) {
      items.add(_item(context, model));
    });
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, children: items);
  }

  Widget _item(BuildContext context, _LocalNavModel model) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return MyWebview(url: model.url, title: model.title);
        }));
      },
      child: Column(
        children: <Widget>[
          Image.asset(
            model.icon,
            width: 26,
            height: 26,
          ),
          Padding(
            padding: EdgeInsets.only(top: 6),
            child: Text(
              model.title,
              style: TextStyle(fontSize: 10),
            ),
          )
        ],
      ),
    );
  }
}

class _LocalNavModel {
  final String icon;
  final String title;
  final String url;

  _LocalNavModel({this.icon, this.title, this.url});
}
