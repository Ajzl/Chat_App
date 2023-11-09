import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({Key? key}) : super(key: key);

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  var _firebase = FirebaseMessaging.instance;
  TextEditingController username = TextEditingController();
  TextEditingController pswrd = TextEditingController();
@override
  void initState() {
    // TODO: implement initState
  init();
    super.initState();
  }

  init()async{
    var token=await _firebase.getToken();
    print("token : $token");
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      // backgroundColor: Colors.blueGrey,
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white12,
          child: Stack(children: [
            Container(
                child: ClipPath(
                  clipper: MyCustomClipper(),
                  child: Container(
                    height: height / 1,
//                width: width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFFA594F9), Color(0xFF7A7ADB)],
                        begin: Alignment.bottomRight,
                        end: Alignment.topLeft,
                      ),
                    ),
                  ),
                )),
            Container(
              child: ClipPath(
                clipper: MyCustomClipper2(),
                child: Container(
                  height: height / 1,
//                width: width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFFA594F9), Color(0xFF6247AA)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
//        decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xFF79096b),Color(0xFF00d4ff)],)),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 180),
                width: MediaQuery.of(context).size.width * .85,
                height: MediaQuery.of(context).size.height * .5,
                decoration: BoxDecoration(
                    color: Colors.black12.withOpacity(.15),
                    backgroundBlendMode: BlendMode.luminosity,
                    borderRadius: BorderRadius.circular(18)),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 70, 20, 0),
                  child: Column(
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          letterSpacing: 3,
                        ),
                      ),
                      SizedBox(
                        height: 45,
                      ),
                      Container(
                        height: 60,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 5,
                          child: TextFormField(
                            controller: username,
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "UserName",
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(25.0),
                                  ),
                                ),
                                hintStyle: TextStyle(color: Color(0xFFC5C5C5))),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 60,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 5,
                          child: TextFormField(
                            controller: pswrd,
                            obscureText: true,
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Password",
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(25.0),
                                  ),
                                ),
                                hintStyle: TextStyle(color: Color(0xFFC5C5C5))),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0,top: 18),
                            child: Container(
                              height: 45,
                              width: 140,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                gradient: LinearGradient(
                                  colors: [Color(0xFF58427C), Color(0xFF746CC0)],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              ),
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(
                                          Colors.transparent),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(14)))),
                                  onPressed: () async {
                                    // final SharedPreferences prefs = await SharedPreferences.getInstance();
                                    // FirebaseAuth.instance.signInWithEmailAndPassword(email: username.text, password: pswrd.text).then((value) =>
                                    // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Home_Page())));
                                    // username.text=="Ajsal" && pswrd.text=="aju"? :print("Failed");
                                  },
                                  child: Text("LOGIN",style: TextStyle(fontSize: 16,letterSpacing: 2),)),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                bottom: 180,
                left: 15,
                child: Row(
                  children: [
                    Text(
                      "Don't Have an Account?",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "SignUp",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ))
          ]),
        ),
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final width = size.width;
    final height = size.height;
    final heightoffset = height * 0.2;

    Path path = Path();
    path.lineTo(0, height - heightoffset);
    path.quadraticBezierTo(
        width * 0.25, height / 1.15, width * 0.5, height - heightoffset);
    path.quadraticBezierTo(width * 0.75, height - (heightoffset * 1.2), width,
        height - heightoffset);
    path.lineTo(width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}

class MyCustomClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final width = size.width;
    final height = size.height;
    final heightoffset = height * 0.2;

    Path path = Path();
    path.lineTo(0, height - heightoffset);
    path.quadraticBezierTo(
        width * 0.25, height / 1.15, width * 0.5, height - heightoffset);
    path.quadraticBezierTo(width * 0.75, height - (heightoffset * 1.4), width,
        height - heightoffset * 1.4);
    path.lineTo(width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
