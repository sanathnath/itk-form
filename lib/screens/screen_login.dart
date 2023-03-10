import 'package:flutter/material.dart';
import 'package:itk_astra_login/Widgets/WidgetOtp.dart';
import 'package:itk_astra_login/screens/screen_registration.dart';
import 'package:email_validator/email_validator.dart';


class ScreenLogin extends StatefulWidget {
  const ScreenLogin({Key? key}) : super(key: key);

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final _emailController = TextEditingController();
  bool _isOtpSend = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                        "Login",
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        letterSpacing: 3,
                      ),
                    ),
                    SizedBox(height: 30,),
                  ],
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return "email is required";
                          }else if(!EmailValidator.validate(value)){
                            return "enter a valid email";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            isDense: true,
                            label: Text("Email"),
                            hintText: "enter registered email",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15))),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      _isOtpSend ? WidgetOtp() : SizedBox(),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: login,
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            minimumSize: Size(double.infinity, 40)),
                        child: Text("Get OTP"),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Create new account?"),
                          TextButton(
                            onPressed: () {
                              goToRegister(context);
                            },
                            style: TextButton.styleFrom(
                                primary: Colors.blueAccent,
                                textStyle:
                                    TextStyle(decoration: TextDecoration.underline)),
                            child: Text("register"),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void login() {
    if(!_formKey.currentState!.validate()){
      return;
    }
    final email = _emailController.text;
    setState((){
      _isOtpSend = true;
    });

    print('Email: $email');
  }

  void goToRegister(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => ScreenRegister()));
  }
}
