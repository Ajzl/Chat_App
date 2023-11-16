import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Chats"),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [Color(0xFF58427C), Color(0xFF746CC0)],
            )),
          ),
        ),
        body: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) => Card(
            color: Color(0xFF746CC0).withOpacity(.2),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 3,
            child: InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    CircleAvatar(
                        child: Icon(CupertinoIcons.person), radius: 28),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "Last Message",
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
