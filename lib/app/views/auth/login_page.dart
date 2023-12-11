import 'package:flutter/material.dart';

import 'package:tetiharana/package/my_package.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                          MyPackage.color11,
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
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                child: Container(
                  width: size.width,
                  decoration: const BoxDecoration(
                    color: MyPackage.color05,
                    boxShadow: [
                      MyPackage.shadow01,
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
                              'Se connecter à votre compte',
                              style: TextStyle(
                                color: MyPackage.color07,
                                fontSize: MyPackage.fontSize01,
                                fontWeight: MyPackage.fontWeight01,
                              ),
                            ),
                          ),
                        ),
                        TextField(
                          cursorColor: MyPackage.color10,
                          decoration: InputDecoration(
                            suffixIcon: Transform.translate(
                              offset: const Offset(14, 6),
                              child: const Icon(
                                Icons.mail_outline,
                                color: MyPackage.color09,
                              ),
                            ),
                            labelText: 'Email',
                            floatingLabelStyle: const TextStyle(
                              color: MyPackage.color09,
                            ),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: MyPackage.color10,
                              ),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: MyPackage.color10,
                              ),
                            ),
                          ),
                          style: const TextStyle(
                            color: MyPackage.color10,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                          cursorColor: MyPackage.color10,
                          obscureText: true,
                          decoration: InputDecoration(
                            suffixIcon: Transform.translate(
                              offset: const Offset(14, 6),
                              child: const Icon(
                                Icons.lock_outline,
                                color: MyPackage.color09,
                              ),
                            ),
                            labelText: 'Mot de passe',
                            floatingLabelStyle: const TextStyle(
                              color: MyPackage.color09,
                            ),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: MyPackage.color10,
                              ),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: MyPackage.color10,
                              ),
                            ),
                          ),
                          style: const TextStyle(
                            color: MyPackage.color10,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 20,
                            bottom: 25,
                          ),
                          child: Row(
                            children: [
                              const Spacer(),
                              InkWell(
                                child: const Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    'Mot de passe oublié ?',
                                    style: TextStyle(
                                      color: MyPackage.color07,
                                    ),
                                  ),
                                ),
                                onTap: () => {
                                  Navigator.of(context)
                                      .pushNamed('/forgot-password'),
                                },
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 30,
                          ),
                          child: SizedBox(
                            width: size.width,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: MyPackage.color08,
                              ),
                              onPressed: () => {
                                Navigator.of(context).pushNamed('/home'),
                              },
                              child: const Text(
                                'Se connecter',
                                style: TextStyle(
                                  color: MyPackage.color05,
                                  fontSize: MyPackage.fontSize02,
                                ),
                              ),
                            ),
                          ),
                        )
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
