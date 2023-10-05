import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:note_app/Shared/linkapi.dart';
import 'package:note_app/Shared/restapi.dart';
import 'package:note_app/screens/home.dart';
import 'package:note_app/screens/login.dart';
import '../Shared/customfeild.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

// v2 (Geraftaar 1985) , v (Shaan 1980) , Coolie 1983
class _SignUpState extends State<SignUp> {
  GlobalKey<FormState> formstate = GlobalKey();
  restapi _rest = restapi();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController username = TextEditingController();

  signUp() async {
    var response = await _rest.posttrequest(linkSignUp, {
      "username": username.text,
      "pass": password.text,
      "email": email.text
    });
    if (response['status'] == "success") {
      Navigator.of(context).pushNamedAndRemoveUntil("home", (route) => false);
    } else {
      print("SignUp failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/images/1.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Sign Up ",
                style: GoogleFonts.nunito(
                  color: Color.fromARGB(255, 73, 53, 40),
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 5,
                ),
              ),
            ),
          ),
          Form(
              key: formstate,
              child: Column(
                children: [
                  CustomTextForm(
                    mycontroller: username,
                    hint: "username",
                    hinticon: Icon(Icons.person_2_outlined),
                  ),
                  CustomTextForm(
                    mycontroller: email,
                    hint: "email",
                    hinticon: Icon(Icons.person),
                  ),
                  CustomTextForm(
                    mycontroller: password,
                    hint: "password",
                    hinticon: Icon(Icons.lock),
                  ),
                ],
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              //Wrap with Material
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22.0)),
              elevation: 18.0,

              clipBehavior: Clip.antiAlias,
              child: MaterialButton(
                onPressed: () async {
                  await signUp();
                },
                minWidth: MediaQuery.of(context).size.width *
                    0.6, // Replace with your desired width
                height: 60.0,
                textColor: Colors.white,
                color: Color.fromARGB(255, 73, 53, 40),
                hoverColor: Color.fromARGB(255, 243, 236, 228),
                padding: EdgeInsets.all(10),

                child: Text(
                  "Sign up",
                  style: GoogleFonts.nunito(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed("login");
                },
                child: Text("Or log in",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold))),
          ),
        ]),
      ),
    );
  }
}
