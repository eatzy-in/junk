import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyScrollBarWidget extends StatefulWidget {
  const MyScrollBarWidget({Key? key}) : super(key: key);

  @override
  State<MyScrollBarWidget> createState() => _MyScrollBarWidgetState();
}

class _MyScrollBarWidgetState extends State<MyScrollBarWidget> {
  static final List<String> iconList = [
    "https://firebasestorage.googleapis.com/v0/b/marcaa-e31c9.appspot.com/o/Service%2Fsalon.png?alt=media&token=cbba4324-c4e2-4c91-b7c4-939f4f6ae029",
    "https://firebasestorage.googleapis.com/v0/b/marcaa-e31c9.appspot.com/o/Service%2Fswimming-1.png?alt=media&token=fabca8a9-f42e-4465-b858-bc8ed2c09126",
    "https://firebasestorage.googleapis.com/v0/b/marcaa-e31c9.appspot.com/o/Service%2Fterrance.png?alt=media&token=fe9fc306-5ef6-4b32-aa6a-8f80823bec1a",
    "https://firebasestorage.googleapis.com/v0/b/marcaa-e31c9.appspot.com/o/Service%2Fcups.png?alt=media&token=8ee7d238-5f1d-4474-a7f8-f6224ef2dd7b"
  ];
  static final List<String> serviceName = [
    "Salon and Spa",
    "Swimming",
    "Terrance Food Court"
  ];

  List<Widget> serviceList = iconList
      .map((e) => Container(
          margin: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
          height: 10,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.7),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(e),
              Container(child: new Text("Service"))
            ],
          ),
          padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0)))
      .toList();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
            pinned: true,
            expandedHeight: 100.0,
            backgroundColor: Colors.blueGrey,
            flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage("https://firebasestorage.googleapis."
                          "com/v0/b/marcaa-e31c9.appspot.com/o/Service%2FLobby."
                          "jpeg?alt=media&token=b00b56e4-821a-496d-bb7e"
                          "-4bdc53437931"),
                    ),
                  ),
                ),
                title: new Text("Our Services"))),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              crossAxisSpacing: 2.0,
              mainAxisSpacing: 2.0),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return serviceList[index];
            },
            childCount: 4,
          ),
        ),
        SliverFixedExtentList(
          itemExtent: 50.0,
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 9)],
                child: Text('List Item $index'),
              );
            },
          ),
        ),
      ],
    );
  }
}
