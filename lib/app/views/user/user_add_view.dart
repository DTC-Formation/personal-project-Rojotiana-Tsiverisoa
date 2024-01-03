import 'package:flutter/material.dart';

import 'package:tetiharana/app/controller/user_controller.dart';
import 'package:tetiharana/utilities/helper.dart';
import 'package:tetiharana/widget/dialog/dialog.dart';
import 'package:tetiharana/widget/input/dropdown.dart';
import 'package:tetiharana/widget/loader/loader.dart';
import 'package:tetiharana/widget/navigation/app_bar.dart';
import 'package:tetiharana/widget/button/button.dart';
import 'package:tetiharana/widget/input/date_picker.dart';
import 'package:tetiharana/widget/navigation/drawer.dart';
import 'package:tetiharana/widget/image/background_image.dart';
import 'package:tetiharana/widget/input/image_picker.dart';
import 'package:tetiharana/widget/input/text_input.dart';
import 'package:tetiharana/utilities/tools.dart';

enum SexeChoice { male, female }

class UserAddView extends StatefulWidget {
  const UserAddView({super.key});

  @override
  State<UserAddView> createState() => _MemberAddState();
}

class _MemberAddState extends State<UserAddView> {
  MyDialog myDialog = MyDialog();
  Helper helper = Helper();
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();

  SexeChoice? _sexe = SexeChoice.male;
  IconData _sexeIcon = Icons.male_rounded;

  // -------------- input controller --------------
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  String sexeController = 'male';
  TextEditingController emailController = TextEditingController();
  String birthdateController = "";
  String deathdateController = "";
  String ruleController = "";
  String maritalStatusController = "";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

// ***************** Create new user *****************
    UserController userController = UserController();

    onAddingSuccess(String title, String message) {
      setState(() {
        isLoading = false;
      });

      myDialog.showMyDialog(
        title: title,
        description: message,
        confirmAction: () => {Navigator.of(context).pop()},
        confirmTitle: "Ok",
        context: context,
      );
    }

    onAddingFail(String title, String message) {
      setState(() {
        isLoading = false;
      });

      myDialog.showMyDialog(
        title: title,
        description: message,
        confirmAction: () => {Navigator.of(context).pop()},
        confirmTitle: "Ok",
        context: context,
      );
    }

    onSubmit() async {
      final body = {
        "firstname": firstnameController.text,
        "lastname": lastnameController.text,
        "sexe": sexeController,
        "email": emailController.text,
        "birthday": helper.formatDate(birthdateController),
        "deathday": helper.formatDate(deathdateController),
        "rule": ruleController,
        "marital_status": maritalStatusController,
      };

      // if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      await userController.createUser(
        body: body,
        onSuccess: onAddingSuccess,
        onError: onAddingFail,
      );
      // }
    }

    clear() {
      setState(() {
        firstnameController.clear();
        lastnameController.clear();
        _sexe = SexeChoice.male;
        sexeController = 'male';
        emailController.clear();
        birthdateController = "";
        deathdateController = "";
      });
    }

    customTitle(String title) {
      return Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: Center(
          child: Container(
            color: Tools.color05,
            padding: const EdgeInsets.only(
              left: 5,
              right: 5,
            ),
            child: Text(
              title,
              style: const TextStyle(
                color: Tools.color02,
                fontSize: Tools.fontSize02,
                backgroundColor: Tools.color05,
              ),
            ),
          ),
        ),
      );
    }

    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            appBar: const PreferredSize(
              preferredSize: Size.fromHeight(58.0),
              child: MyAppBar(
                title: 'Adhésion / Membres',
              ),
            ),
            drawer: const MyDrawer(),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // --------------------- Image ---------------------
                      const MyBackgroundImage(
                        source: "assets/images/background/bg_3.webp",
                      ),
                      const SizedBox(
                        height: 15,
                      ),

                      // --------------------- Info perso ---------------------
                      Stack(
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                width: size.width,
                                height: 15,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: Tools.color09,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    Tools.radius01,
                                  ),
                                ),
                                width: size.width,
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                    20,
                                    10,
                                    20,
                                    20,
                                  ),
                                  child: Column(
                                    children: [
                                      MyTextInput(
                                        inputController: firstnameController,
                                        labelText: "Nom(s)",
                                        icon: Icons.person,
                                        required: true,
                                      ),
                                      MyTextInput(
                                        inputController: lastnameController,
                                        labelText: "Prénom(s)",
                                        icon: Icons.person,
                                      ),
                                      Column(
                                        children: [
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Flexible(
                                                child: Text(
                                                  'Sexe *',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: Tools.color10,
                                                  ),
                                                ),
                                              ),
                                              Flexible(
                                                child: Icon(
                                                  _sexeIcon,
                                                  color: Tools.color09,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Flexible(
                                                child:
                                                    RadioListTile<SexeChoice>(
                                                  activeColor: Tools.color08,
                                                  title: const Text(
                                                    'Homme',
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      color: Tools.color10,
                                                    ),
                                                  ),
                                                  value: SexeChoice.male,
                                                  groupValue: _sexe,
                                                  onChanged:
                                                      (SexeChoice? value) {
                                                    setState(() {
                                                      _sexe = value;
                                                      _sexeIcon =
                                                          Icons.male_rounded;
                                                      sexeController = 'male';
                                                    });
                                                  },
                                                ),
                                              ),
                                              Flexible(
                                                child:
                                                    RadioListTile<SexeChoice>(
                                                  activeColor: Tools.color08,
                                                  title: const Text(
                                                    'Femme',
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      color: Tools.color10,
                                                    ),
                                                  ),
                                                  value: SexeChoice.female,
                                                  groupValue: _sexe,
                                                  onChanged:
                                                      (SexeChoice? value) {
                                                    setState(() {
                                                      _sexe = value;
                                                      _sexeIcon =
                                                          Icons.female_rounded;
                                                      sexeController = 'female';
                                                    });
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Divider(
                                            color: Tools.color09,
                                          ),
                                        ],
                                      ),
                                      MyTextInput(
                                        inputController: emailController,
                                        labelText: "Email",
                                        icon: Icons.mail_outline,
                                      ),
                                      MyDatePicker(
                                        title: "Date de naissance *",
                                        controller: birthdateController,
                                        updateDate: (String newValue) {
                                          setState(() {
                                            birthdateController = newValue;
                                          });
                                        },
                                      ),
                                      MyDatePicker(
                                        title: "Date de décès",
                                        controller: deathdateController,
                                        updateDate: (String newValue) {
                                          setState(() {
                                            deathdateController = newValue;
                                          });
                                        },
                                      ),
                                      const ImagePicker(title: "Profile"),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          customTitle('Informations personnelles'),
                        ],
                      ),

                      const SizedBox(
                        height: 15,
                      ),

                      // --------------------- Info supp ---------------------
                      Stack(
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                width: size.width,
                                height: 15,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: Tools.color09,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    Tools.radius01,
                                  ),
                                ),
                                width: size.width,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 10, 20, 20),
                                  child: Column(
                                    children: [
                                      MyDropdown(
                                        items: [
                                          DropdownItem(
                                            list: "Visiteur",
                                            value: "viewer",
                                          ),
                                          DropdownItem(
                                            list: "Administrateur",
                                            value: "admin",
                                          ),
                                        ],
                                        onChanged: (newValue) {
                                          setState(() {
                                            ruleController = newValue;
                                          });
                                        },
                                        hintText: 'Rôle',
                                        controller: ruleController,
                                        required: true,
                                      ),
                                      MyDropdown(
                                        items: [
                                          DropdownItem(
                                            list: "Célibataire",
                                            value: "single",
                                          ),
                                          DropdownItem(
                                            list: "Marié(e)",
                                            value: "married",
                                          ),
                                          DropdownItem(
                                            list: "Divorcé(e)",
                                            value: "divorced",
                                          ),
                                        ],
                                        onChanged: (newValue) {
                                          setState(() {
                                            maritalStatusController = newValue;
                                          });
                                        },
                                        hintText: 'Situation matrimoniale',
                                        controller: maritalStatusController,
                                        required: true,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          customTitle('Informations supplémentaires'),
                        ],
                      ),

                      const SizedBox(
                        height: 20,
                      ),
                      // --------------------- Button ---------------------
                      Row(
                        children: [
                          Flexible(
                            child: MyButton(
                              title: 'Annuler',
                              action: clear,
                              textColor: Tools.color08,
                              backgroundColor: Colors.transparent,
                              borderColor: Tools.color08,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            child: MyButton(
                              title: 'Enregistrer',
                              action: onSubmit,
                              textColor: Tools.color05,
                              backgroundColor: Tools.color08,
                              borderColor: Colors.transparent,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          if (isLoading) const MyLoader(),
        ],
      ),
    );
  }
}

class ImagePicker extends StatefulWidget {
  final String title;

  const ImagePicker({
    super.key,
    required this.title,
  });

  @override
  State<ImagePicker> createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePicker> {
  String filename = "";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              filename != ""
                  ? Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Tools.color09,
                      ),
                    )
                  : Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 0,
                        color: Tools.color09,
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 5,
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1.5,
                        color: Tools.color09,
                      ),
                    ),
                  ),
                  child: SizedBox(
                    width: size.width,
                    height: 50,
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        Text(
                          filename != "" ? filename : widget.title,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const Positioned(
                          right: -2,
                          child: MyImagePicker(
                            icon: Icons.image_rounded,
                            iconColor: Tools.color09,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
