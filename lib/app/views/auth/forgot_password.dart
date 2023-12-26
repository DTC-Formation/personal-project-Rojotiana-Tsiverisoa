import 'package:flutter/material.dart';

import 'package:tetiharana/utilities/tools.dart';
import 'package:tetiharana/widget/button/button.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 220,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          "assets/images/background/bg_1.webp",
                        ),
                        alignment: Alignment.topCenter,
                        colorFilter: ColorFilter.mode(
                          Tools.color11,
                          BlendMode.darken,
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Image(
                        image: AssetImage(
                          'assets/images/logo/logo_1.png',
                        ),
                        fit: BoxFit.contain,
                        width: 220,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 18,
                    left: 23,
                    child: InkWell(
                      onTap: () => {
                        Navigator.of(context).pop(),
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: Tools.color05,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                child: Container(
                  width: size.width,
                  decoration: const BoxDecoration(
                    color: Tools.color05,
                    boxShadow: [
                      Tools.shadow01,
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 20,
                              bottom: 10,
                            ),
                            child: Text(
                              'Mot de passe oublié ?',
                              style: TextStyle(
                                color: Tools.color07,
                                fontSize: Tools.fontSize01,
                                fontWeight: Tools.fontWeight01,
                              ),
                            ),
                          ),
                        ),
                        TextField(
                          cursorColor: Tools.color10,
                          decoration: InputDecoration(
                            suffixIcon: Transform.translate(
                              offset: const Offset(14, 6),
                              child: const Icon(
                                Icons.mail_outline,
                                color: Tools.color09,
                              ),
                            ),
                            labelText: 'Email',
                            floatingLabelStyle: const TextStyle(
                              color: Tools.color09,
                            ),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Tools.color10,
                              ),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Tools.color10,
                              ),
                            ),
                          ),
                          style: const TextStyle(
                            color: Tools.color10,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        MyButton(
                          title: 'Réinitialiser',
                          action: () => {},
                          textColor: Tools.color05,
                          backgroundColor: Tools.color08,
                          borderColor: Colors.transparent,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
