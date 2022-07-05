import 'package:flutter/material.dart';
import 'package:flutter_trials2/pages/home.dart';
import 'package:flutter_trials2/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        myroutes.login: ((context) => LoginPage()),
        myroutes.home: ((context) => HomePage()),
      },
      theme: ThemeData(
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      home: LoginPage()));
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/Computer login-rafiki.png",
              fit: BoxFit.cover,
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Text(
                'Welcome $name',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              child: Column(children: [
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  scrollPadding: EdgeInsets.only(left: 15, right: 15),
                  decoration: InputDecoration(
                      hintText: "Enter Username", labelText: "Username"),
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  scrollPadding: EdgeInsets.only(left: 15, right: 15),
                  decoration: InputDecoration(
                      hintText: "Enter Password", labelText: "Password"),
                  obscureText: true,
                ),
              ]),
            ),
            const SizedBox(
              height: 15,
            ),
            Material(
              borderRadius: BorderRadius.circular(changed ? 50 : 10),
              color: Colors.blue,
              child: InkWell(
                
                onTap: () async {
                  setState(() {
                    changed = true;
                  });
                  await Future.delayed(Duration(seconds: 1));
                  Navigator.pushNamed(context, myroutes.home);
                },
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  height: 50,
                  width: changed ? 50 : 150,
                  child: Center(
                    child: changed
                        ? Icon(
                            Icons.done,
                            color: Colors.white,
                          )
                        : Text(
                            'LOGIN !',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: GoogleFonts.lato().fontFamily,
                            ),
                          ),
                  ),
                ),
              ),
            )
            //    SizedBox(
            //      child: ElevatedButton(
            //
            //        onPressed: (() => Navigator.pushNamed(context, myroutes.home)),
            //        style: ElevatedButton.styleFrom(
            //          primary: Colors.blue,
            //          onPrimary: Colors.white,
            //          shape: RoundedRectangleBorder(
            //            borderRadius: BorderRadius.circular(20.0),
            //          ),
            //          minimumSize: Size(200, 50),
            //        ),
            //        child: Text('Login !'),
            //      ),
            //    )
          ],
        ),
      ),
    );
  }
}
