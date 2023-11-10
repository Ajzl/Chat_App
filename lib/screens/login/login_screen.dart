import 'package:chatapp/screens/provider/login_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../home_screen/home_screen.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({Key? key}) : super(key: key);

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

bool isSignUp = false;

class _Login_ScreenState extends State<Login_Screen> {
  var _firebase = FirebaseMessaging.instance;
  TextEditingController username = TextEditingController();
  TextEditingController pswrd = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confpassword = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _signUpFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    init();
    super.initState();
  }

  init() async {
    var token = await _firebase.getToken();
    print("token : $token");
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final loginProvider = Provider.of<Login_Provider>(context);
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
                decoration: const BoxDecoration(
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
                  decoration: const BoxDecoration(
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
            loginProvider.isSignUp
                ? Center(
                    child: Form(
                      key: _signUpFormKey,
                      child: Container(
                        margin: EdgeInsets.only(top: height / 8),
                        width: MediaQuery.of(context).size.width * .90,
                        // height: MediaQuery.of(context).size.height * .5,
                        decoration: BoxDecoration(
                            color: Colors.black12.withOpacity(.15),
                            backgroundBlendMode: BlendMode.luminosity,
                            borderRadius: BorderRadius.circular(18)),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
                          child: Column(
                            children: [
                              const Text(
                                "SignUp",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  letterSpacing: 3,
                                ),
                              ),
                              SizedBox(
                                height: height * .04,
                              ),
                              Container(
                                height: 65,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  elevation: 5,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 4, left: 3, right: 3, bottom: 1),
                                    child: TextFormField(
                                      validator: (val) {
                                        if (val == null || val.isEmpty) {
                                          return "First Name is mandatory";
                                        }
                                        return null;
                                      },
                                      controller: firstName,
                                      decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true,
                                          labelText: "FirstName",
                                          labelStyle: const TextStyle(),
                                          // label: Text("Username"),
                                          floatingLabelAlignment:
                                              FloatingLabelAlignment.start,
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                  color: Color(0xFF6247AA))),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                  color: Color(0xFF6247AA))),
                                          border: const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10.0),
                                            ),
                                          ),
                                          hintStyle: const TextStyle(
                                              color: Color(0xFFC5C5C5))),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height * .02,
                              ),
                              Container(
                                height: 62,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  elevation: 5,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 4, left: 3, right: 3, bottom: 1),
                                    child: TextFormField(
                                      validator: (val) {
                                        if (val == null || val.isEmpty) {
                                          return "Last Name is mandatory";
                                        }
                                        return null;
                                      },
                                      controller: lastName,
                                      decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true,
                                          labelText: "LastName",
                                          labelStyle: const TextStyle(),
                                          // label: Text("Username"),
                                          floatingLabelAlignment:
                                              FloatingLabelAlignment.start,
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                  color: Color(0xFF6247AA))),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                  color: Color(0xFF6247AA))),
                                          border: const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10.0),
                                            ),
                                          ),
                                          hintStyle: const TextStyle(
                                              color: Color(0xFFC5C5C5))),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height * .02,
                              ),
                              Container(
                                height: 62,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  elevation: 5,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 4, left: 3, right: 3, bottom: 1),
                                    child: TextFormField(
                                      validator: (val) {
                                        if (val == null || val.isEmpty) {
                                          return "Email is mandatory";
                                        } else if (!(val!
                                            .contains("@gmail.com"))) {
                                          return "Enter Valid Email";
                                        }
                                        return null;
                                      },
                                      controller: email,
                                      decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true,
                                          labelText: "Email",
                                          labelStyle: const TextStyle(),
                                          // label: Text("Username"),
                                          floatingLabelAlignment:
                                              FloatingLabelAlignment.start,
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                  color: Color(0xFF6247AA))),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                  color: Color(0xFF6247AA))),
                                          border: const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10.0),
                                            ),
                                          ),
                                          hintStyle: const TextStyle(
                                              color: Color(0xFFC5C5C5))),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height * .02,
                              ),
                              Container(
                                height: 60,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  elevation: 5,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 4, left: 3, right: 3, bottom: 1),
                                    child: TextFormField(
                                      validator: (val) {
                                        if (val == null || val.isEmpty) {
                                          return "Password is mandatory";
                                        }
                                        return null;
                                      },
                                      controller: password,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true,
                                          labelText: "Password",
                                          labelStyle: const TextStyle(),
                                          // label: Text("Username"),
                                          floatingLabelAlignment:
                                              FloatingLabelAlignment.start,
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                  color: Color(0xFF6247AA))),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                  color: Color(0xFF6247AA))),
                                          border: const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10.0),
                                            ),
                                          ),
                                          hintStyle: const TextStyle(
                                              color: Color(0xFFC5C5C5))),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height * .02,
                              ),
                              Container(
                                height: 60,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  elevation: 5,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 4, left: 3, right: 3, bottom: 1),
                                    child: TextFormField(
                                      validator: (val) {
                                        if (val == null || val.isEmpty) {
                                          return "Confirm Password is mandatory";
                                        }
                                        return null;
                                      },
                                      controller: confpassword,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true,
                                          labelText: "Confirm Password",
                                          labelStyle: const TextStyle(),
                                          // label: Text("Username"),
                                          floatingLabelAlignment:
                                              FloatingLabelAlignment.start,
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                  color: Color(0xFF6247AA))),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                  color: Color(0xFF6247AA))),
                                          border: const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10.0),
                                            ),
                                          ),
                                          hintStyle: const TextStyle(
                                              color: Color(0xFFC5C5C5))),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height * .02,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 10.0, top: 18, bottom: 30),
                                    child: Container(
                                      height: 45,
                                      width: 140,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14),
                                        gradient: const LinearGradient(
                                          colors: [
                                            Color(0xFF58427C),
                                            Color(0xFF746CC0)
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                      ),
                                      child: ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.transparent),
                                              shape: MaterialStateProperty.all(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              14)))),
                                          onPressed: () async {
                                            // final SharedPreferences prefs = await SharedPreferences.getInstance();
                                            if (_signUpFormKey.currentState!
                                                .validate())
                                              try {
                                                FirebaseAuth.instance
                                                    .createUserWithEmailAndPassword(
                                                        email: email.text,
                                                        password:
                                                            password.text);
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const Home_Screen()));
                                              } catch (e) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                        content: Text("$e")));
                                              }
                                          },
                                          child: const Text(
                                            "SignUp",
                                            style: TextStyle(
                                                fontSize: 16, letterSpacing: 2),
                                          )),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                : Center(
                    child: Form(
                      key: _formKey,
                      child: Container(
                        margin: const EdgeInsets.only(top: 180),
                        width: MediaQuery.of(context).size.width * .90,
                        height: MediaQuery.of(context).size.height * .465,
                        decoration: BoxDecoration(
                            color: Colors.black12.withOpacity(.15),
                            backgroundBlendMode: BlendMode.luminosity,
                            borderRadius: BorderRadius.circular(18)),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
                          child: Column(
                            children: [
                              const Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  letterSpacing: 3,
                                ),
                              ),
                              SizedBox(
                                height: height * .04,
                              ),
                              Container(
                                height: 65,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  elevation: 5,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 3, left: 3, right: 3, bottom: 1),
                                    child: TextFormField(
                                      controller: username,
                                      validator: (val) {
                                        if (!(val!.contains("@gmail.com"))) {
                                          return "Enter Valid Email";
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true,
                                          labelText: "Username",
                                          labelStyle: const TextStyle(),
                                          // label: Text("Username"),
                                          floatingLabelAlignment:
                                              FloatingLabelAlignment.start,
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                  color: Color(0xFF6247AA))),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                  color: Color(0xFF6247AA))),
                                          border: const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10.0),
                                            ),
                                          ),
                                          hintStyle: const TextStyle(
                                              color: Color(0xFFC5C5C5))),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height * .015,
                              ),
                              Container(
                                height: 65,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  elevation: 5,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 4, left: 3, right: 3, bottom: 1),
                                    child: TextFormField(
                                      obscureText: true,
                                      controller: pswrd,
                                      validator: (val) {
                                        if (val == null || val.isEmpty) {
                                          return "Please Enter Password";
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true,
                                          labelText: "Password",
                                          labelStyle: const TextStyle(),
                                          // label: Text("Username"),
                                          floatingLabelAlignment:
                                              FloatingLabelAlignment.start,
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                  color: Color(0xFF6247AA))),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                  color: Color(0xFF6247AA))),
                                          border: const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10.0),
                                            ),
                                          ),
                                          hintStyle: const TextStyle(
                                              color: Color(0xFFC5C5C5))),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height * .015,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 10.0, top: 18),
                                    child: Container(
                                      height: 45,
                                      width: 140,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14),
                                        gradient: const LinearGradient(
                                          colors: [
                                            Color(0xFF58427C),
                                            Color(0xFF746CC0)
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                      ),
                                      child: ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.transparent),
                                              shape: MaterialStateProperty.all(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              14)))),
                                          onPressed: () async {
                                            // final SharedPreferences prefs = await SharedPreferences.getInstance();
                                            if (_formKey.currentState!
                                                .validate())
                                              try {
                                                await FirebaseAuth.instance
                                                    .signInWithEmailAndPassword(
                                                        email: username.text,
                                                        password: pswrd.text);
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const Home_Screen()));
                                              } catch (e) {
                                                if (e
                                                    .toString()
                                                    .contains("INVALID_LOGIN"))
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(SnackBar(
                                                    content: Text(
                                                        "User Doesnot Exist"),
                                                    behavior: SnackBarBehavior
                                                        .floating,
                                                  ));
                                              }

                                            // username.text=="Ajsal" && pswrd.text=="aju"? :print("Failed");
                                          },
                                          child: const Text(
                                            "LOGIN",
                                            style: TextStyle(
                                                fontSize: 16, letterSpacing: 2),
                                          )),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
            Positioned(
                bottom: loginProvider.isSignUp ? height * .05 : height * .2,
                left: 15,
                child: Row(
                  children: [
                    Text(
                      loginProvider.isSignUp
                          ? "Already Have Account?"
                          : "Don't Have an Account?",
                      style: TextStyle(
                          color: loginProvider.isSignUp
                              ? const Color(0xFF7A7ADB)
                              : Colors.white,
                          fontSize: 14),
                    ),
                    TextButton(
                      onPressed: () {
                        Provider.of<Login_Provider>(context, listen: false)
                            .loginSwitch();
                      },
                      child: Text(
                        loginProvider.isSignUp ? "Login" : "SignUp",
                        style: TextStyle(
                            color: loginProvider.isSignUp
                                ? const Color(0xFF7A7ADB)
                                : Colors.white,
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
