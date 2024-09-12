import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app/Shared/linkapi.dart';
import 'package:note_app/Shared/restapi.dart';
import 'package:note_app/main.dart';
import 'package:note_app/screens/signup.dart';
import '../Shared/customfeild.dart';
import '../Shared/valid.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

// v2 (Geraftaar 1985) , v (Shaan 1980) , Coolie 1983
class _LoginState extends State<Login> {
  GlobalKey<FormState> formstate = GlobalKey();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  restapi _rest = restapi();
  bool loading = false;
  login() async {
    if (formstate.currentState!.validate()) {
      loading = true;
      setState(() {});
      var response = await _rest.posttrequest(
          linklogin, {"pass": password.text, "email": email.text});

      if (response['status'] == "success") {
        sharedPrefe.setString("id", response['data']['id'].toString());
        sharedPrefe.setString("username", response['data']['username']);
        sharedPrefe.setString("email", response['data']['email']);

        Navigator.of(context).pushNamedAndRemoveUntil("home", (route) => false);
      } else {
        loading = false;
        setState(() {});
        AwesomeDialog(
            context: context,
            title: "Error",
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("email or password seemed to be incorrect"),
            ))
          ..show();
      }
    } else {
      //showMyDialog(context , "Unsuccessful regesteration","signup");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: loading == true
            ? Center(child: CircularProgressIndicator())
            : Column(children: [
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
                      "Log In ",
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
                          valid: (val) {
                            return validInput(val!, 10, 40);
                          },
                          mycontroller: email,
                          hint: "email",
                          hinticon: Icon(Icons.person),
                        ),
                        CustomTextForm(
                          valid: (val) {
                            return validInput(val!, 5, 10);
                          },
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
                        await login();
                        print(loading);
                      },
                      minWidth: MediaQuery.of(context).size.width *
                          0.6, // Replace with your desired width
                      height: 60.0,
                      textColor: Colors.white,
                      color: Color.fromARGB(255, 73, 53, 40),
                      hoverColor: Color.fromARGB(255, 243, 236, 228),
                      padding: EdgeInsets.all(10),

                      child: Text(
                        "Log in",
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
                    child: Text(
                      "Or sign up",
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed("signup");
                      //     MaterialPageRoute(builder: (context) => const SignUp()),
                    },
                  ),
                ),
              ]),
      ),
    );
  }
}
