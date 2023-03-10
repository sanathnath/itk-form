import 'package:flutter/material.dart';
import 'package:itk_astra_login/screens/screen_login.dart';
import 'package:email_validator/email_validator.dart';

class ScreenRegister extends StatefulWidget {
  ScreenRegister({Key? key}) : super(key: key);

  @override
  State<ScreenRegister> createState() => _ScreenRegisterState();
}

class _ScreenRegisterState extends State<ScreenRegister> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();

  final _emailController = TextEditingController();

  final _addressController = TextEditingController();

  final _phoneNumberController = TextEditingController();

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
                      "Register",
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        letterSpacing: 3,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nameController,
                        validator: (value){

                          if(value == null || value.isEmpty){
                            return "name is required";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          isDense: true,
                          label: Text("name"),
                          hintText: "enter your name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return "email is required";
                          }else if(!EmailValidator.validate(value)){
                            return "enter a valid email";
                          }
                          return null;
                        },
                        controller: _emailController,
                        decoration: InputDecoration(
                            isDense: true,
                            label: Text("Email"),
                            hintText: "enter your email",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.streetAddress,
                        controller: _addressController,
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return "address is required";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            isDense: true,
                            label: Text("address"),
                            hintText: "enter your address",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        controller: _phoneNumberController,
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return "phone number is required";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            isDense: true,
                            label: Text("phone number"),
                            hintText: "enter your phone number",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: register,
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            minimumSize: Size(double.infinity, 40)),
                        child: Text("Register"),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have account?"),
                          TextButton(
                            onPressed: () {
                              goToLogin(context);
                            },
                            style: TextButton.styleFrom(
                                primary: Colors.blueAccent,
                                textStyle: TextStyle(
                                    decoration: TextDecoration.underline)),
                            child: Text("Login"),
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

  void register() {
    if(!_formKey.currentState!.validate()){
      return;
    }

    final _name = _nameController.text;
    final _email = _emailController.text;
    final _address = _addressController.text;
    final _phoneNumber = _phoneNumberController.text;

    print('Name: $_name');
    print('Email: $_email');
    print('Address: $_address');
    print('Phone number: $_phoneNumber');
  }

  void goToLogin(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => ScreenLogin()));
  }
}
