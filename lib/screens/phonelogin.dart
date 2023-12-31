import 'package:flutter/material.dart';
import 'package:tokd/widgets/widgets.dart';

class LoginWithPhone extends StatefulWidget {
  const LoginWithPhone({super.key});

  @override
  State<LoginWithPhone> createState() => _LoginWithPhoneState();
}

class _LoginWithPhoneState extends State<LoginWithPhone> {
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
      body: Column(
        children: [
          Expanded(
            child: UpperContainer(
              size: size,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20, bottom: 30),
                    child: Text(
                      "Log in With Phone",
                      style: currentTheme.textTheme.headline1!.copyWith(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: currentTheme.splashColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: currentTheme.primaryColor,
              height: size.height * 0.8,
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
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: size.width * 0.8,
                            height: size.height * 0.09,
                            child: Form(
                              child: CustomTextField(
                                // controller: _emailController,
                                hintStyle:
                                    currentTheme.textTheme.subtitle1!.copyWith(
                                  color: currentTheme.hintColor,
                                ),
                                hintText: "Phone",
                                imagePath: 'assets/images/phoneiconss.png',
                                borderColor: currentTheme.hintColor,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a valid Phone';
                                  }
                                  // You can add more validation logic as needed
                                  return null; // Input is valid
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.05,
                          ),
                          TextButtonWidget(
                            size: size,
                            onTap: () async {},
                            buttonText: "Submit",
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
