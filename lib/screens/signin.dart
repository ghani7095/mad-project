import 'package:flutter/material.dart';
import 'package:tokd/signup/signupone.dart';
import 'package:tokd/widgets/widgets.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    ThemeData currentTheme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: currentTheme.scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: currentTheme.secondaryHeaderColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: currentTheme.splashColor,
          ),
          onPressed: () {
            Navigator.of(context)
                .pop(); // Navigate back when the back button is pressed
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: upperContainer(size, currentTheme),
            ),
            Expanded(
              flex: 3,
              child: Stack(
                children: [
                  Container(
                    height: size.height * 0.68,
                    width: size.width,
                    color: currentTheme.primaryColor,
                  ),
                  Container(
                    height: size.height * 0.02,
                    width: size.width,
                    color: currentTheme.secondaryHeaderColor,
                  ),
                  Container(
                    height: size.height * 0.68,
                    width: size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      color: currentTheme.primaryColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: size.width * 0.8,
                          height: size.height * 0.08,
                          child: CustomTextField(
                            hintText: "Email",
                            imagePath: 'assets/images/usericonss.png',
                            borderColor: currentTheme.hintColor,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        SizedBox(
                          width: size.width * 0.8,
                          height: size.height * 0.08,
                          child: TextFormField(
                            obscureText: !_passwordVisible,
                            style: TextStyle(
                              color: currentTheme.primaryColor,
                            ),
                            decoration: InputDecoration(
                              hintText: "Password",
                              hintStyle:
                                  TextStyle(color: currentTheme.hintColor),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  color: currentTheme.hintColor,
                                  'assets/images/passwordicon.png',
                                  height: 20,
                                  width: 20,
                                ),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _passwordVisible
                                      ? Icons.visibility_rounded
                                      : Icons.visibility_off_rounded,
                                  color: currentTheme.hintColor,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                borderSide:
                                    BorderSide(color: currentTheme.hintColor),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                borderSide:
                                    BorderSide(color: currentTheme.hintColor),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                borderSide: BorderSide(color: Colors.red),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Password cannot be empty';
                              }
                              return null;
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 40, top: 10),
                              child: Text(
                                "Forget password?",
                                style: TextStyle(
                                    color: currentTheme
                                        .appBarTheme.backgroundColor),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        TextButtonWidget(
                          size: size,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpOne()),
                            );
                          },
                          buttonText: "Sign In",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget upperContainer(Size size, ThemeData currentTheme) {
    return Container(
      color: currentTheme.secondaryHeaderColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              SizedBox(
                width: size.width * 0.05,
              ),
              Text("Sign In",
                  style: currentTheme.textTheme.headline1!.copyWith(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: currentTheme.splashColor,
                  )),
            ],
          ),
          SizedBox(
            height: size.height * 0.002,
          ),
          Row(
            children: [
              SizedBox(
                width: size.width * 0.05,
              ),
              Text(
                "Sign In To Access Your Account",
                style: currentTheme.textTheme.headline1!.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: currentTheme.splashColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
