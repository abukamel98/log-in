import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool? isCorrectUser;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Mohammad Alamleh",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.teal,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: isCorrectUser == true
                ? state(isCorrectUser)
                : isCorrectUser == false
                    ? state(isCorrectUser)
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTextFiled(
                              controller: emailController,
                              hintText: "mail@mail.com",
                              labelText: "Email",
                              isPasswordFiled: false),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextFiled(
                            controller: passwordController,
                            hintText: "*****",
                            labelText: "Password",
                            isPasswordFiled: true,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 50,
                            width: 150,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.teal),
                                onPressed: () async {
                                  if (emailController.text ==
                                          "tariq@gmail.com" &&
                                      passwordController.text == "112233") {
                                    setState(() {
                                      isCorrectUser = true;
                                    });
                                    await Future.delayed(Duration(seconds: 4));
                                    setState(() {
                                      isCorrectUser = null;
                                    });
                                  }else{
                                    setState(() {
                                      isCorrectUser = false;
                                    });
                                    await Future.delayed(Duration(seconds: 4));
                                    setState(() {
                                      isCorrectUser = null;
                                    });
                                  }
                                },
                                child: const Text(
                                  "Sign in",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )),
                          )
                        ],
                      ),
          ),
        ),
      ),
    );
  }
}

class CustomTextFiled extends StatefulWidget {
  final String hintText;
  final String labelText;
  final bool isPasswordFiled;
  final TextEditingController controller;

  CustomTextFiled(
      {required this.hintText,
      required this.labelText,
      required this.isPasswordFiled,
      required this.controller});

  @override
  State<CustomTextFiled> createState() =>
      _CustomTextFiledState();
}

class _CustomTextFiledState extends State<CustomTextFiled> {
  bool eye = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isPasswordFiled && !eye,
      controller: widget.controller,
      decoration: InputDecoration(
          suffixIcon: widget.isPasswordFiled
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      eye = !eye;
                    });
                  },
                  icon: Icon(
                    eye ? Icons.visibility : Icons.visibility_off,
                    color: Colors.teal,
                  ),
                )
              : null,
          floatingLabelStyle: TextStyle(color: Colors.teal, fontSize: 22),
          labelText: widget.labelText,
          labelStyle: TextStyle(fontSize: 20, color: Colors.grey),
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 2),
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.teal, width: 3))),
    );
  }
}

Widget? state(bool? isCorrectUser) {
  if (isCorrectUser == true || isCorrectUser == false) {
    return Container(
      width: 250,
      height: 250,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            isCorrectUser == true
                ? Icons.check_circle_outline
                : Icons.cancel_outlined,
            color: isCorrectUser == true ? Colors.teal : Colors.red,
            size: 100,
          ),
          SizedBox(
            height: 20,
          ),
          isCorrectUser == true
              ? const Text(
                  "Welcome 😊",
                  style: TextStyle(color: Colors.teal, fontSize: 25),
                )
              : const Text(
                  "Try Again 😭",
                  style: TextStyle(color: Colors.red, fontSize: 25),
                )
        ],
      ),
    );
  } else {
    return null;
  }
}
