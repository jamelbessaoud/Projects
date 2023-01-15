import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:better_player/better_player.dart';
import 'package:flutter_1/main.dart';
import 'package:http/http.dart' as http;
// import 'package:video_player/video_player.dart';
// import 'package:plateform/main.dart';

// declar the whole variable that we need
//global
final double mainPadding = 30;

// the first page
class MobileFirst extends StatefulWidget {
  MobileFirst({Key? key}) : super(key: key);

  @override
  State<MobileFirst> createState() => _MobileFirstState();
}

class _MobileFirstState extends State<MobileFirst> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        // padding: EdgeInsets.symmetric(vertical: 100,horizontal: 20),
        color: Colors.orange.shade500,
        height: size.height,
        width: size.width,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          // the logo
          Container(
              margin: EdgeInsets.only(bottom: 50),
              // height: 104,
              width: 156,
              child: Image(image: AssetImage('images/logo2_v1.png'))),

          // titre
          Container(
              margin: EdgeInsets.only(bottom: 20),
              width: size.width / 5 * 3,
              child: Text(
                'Bienvenu !!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )),
          // paragraphe
          Container(
              margin: EdgeInsets.only(bottom: 10),
              width: size.width / 5 * 3,
              child: Text(
                'Notre plate-forme vous permet de mieux les leçons sous la supervision des meilleurs professeurs',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
              )),
          // sub titte
          Container(
              margin: EdgeInsets.only(bottom: 50),
              width: size.width / 5 * 3,
              child: Text(
                'N\'importe où et à tout moment',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              )),
          // boutton sing up
          Container(
            margin: EdgeInsets.only(bottom: 10),
            width: size.width / 5 * 3,
            child: MaterialButton(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              onPressed: () {
                Navigator.of(context).pushNamed('singUp');
              },
              child: Text(
                'Rejoignez-Nous gratuitement',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
            ),
          ),
          // boutton sing up
          Container(
            width: size.width / 5 * 3,
            child: MaterialButton(
              color: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              onPressed: () {
                Navigator.of(context).pushNamed('logIn');
              },
              child: Text(
                'Connexion',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

// the other class of input decoration
class DecoInput extends StatelessWidget {
  DecoInput(
      {Key? key,
      required this.FN,
      required this.val,
      required this.hint,
      required this.label,
      required this.iconn})
      : super(key: key);
  var FN;
  var val;
  String? hint;
  IconData? iconn;
  String? label;

  String? stringg;
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> data = new GlobalKey<FormState>();

    return TextFormField(
      onSaved: FN,
      // maxLength:20,
      // autovalidateMode:AutovalidateMode.always ,
      validator: val,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.orange.shade400,
        hintText: hint,
        hintStyle: TextStyle(color: Colors.black),
        prefixIcon: Icon(iconn, color: Colors.white),
        labelText: label,
        labelStyle: TextStyle(fontSize: 15, color: Colors.white),
        enabled: true,
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.orange.shade500)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.orange.shade500, width: 0)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.orange.shade500, width: 0)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.orange.shade500)),
      ),
    );
  }
}

class Mobile1 extends StatefulWidget {
  Mobile1({Key? key}) : super(key: key);

  @override
  State<Mobile1> createState() => Mobile1State();
}

/* class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
} */
// i chage the class to fulwidget ,to can use setState
// the first page

// page sing up
class Mobile1State extends State<Mobile1> {
  // DECLAR VARIABLES
  String? NAME;
  String? LASTNAME;
  String? DATEBIRTH;
  String? EMAIL;
  String? PWD;
  String? TEL;
  // CREATE FUNCTION POST DATA
// be carful when the wifi is changed (change the adress ip !!!!)
//and use the php artisan serce
  Future postData(Map d) async {
    bool? error = true;
    String url = 'http://192.168.1.11:8000/api/utilisateurs';
// 'https://jsonplaceholder.typicode.com/posts'
/*Exception has occurred.
  ClientException (Connection closed while receiving data)*/
    try {
      var response = await http.post(
        Uri.parse(url),
        body: d,
/*         {
          // test : give a value static (not variable )
          "id_utilisateur": "4".toString(),
          "nom_utilisateur": 'jamel'.toString(),
          "prenom_utilisateur": 'bessaoud'.toString(),
          "age_utilisateur": "23".toString(),
          "email_utilisateur": 'jamelbessaoud07@gmail.Com'.toString(),
          "pwd_utilisateur": 'jamelbessaoud'.toString(),
          "telephone_utilisateur": '12345678'.toString(),        
              }, */

/*         headers: {
          'content-type' :'application/json',
          'charset' : 'UTF-8 '
          } */
      );
      var responseBody = jsonDecode(response.body);
      print('the response is : ${responseBody}'); /* mazen@gmail.com */
    } catch (e) {
      if (e.toString() == 'Connection closed while receiving data') {
        error = false;
        await buildDialogPlus(
            context,
            'Cet E-mail Existe Eéjà!!.\n Voulez-vous Vous Connecter !!',
            'logIn',
            'Connexion');
      }

      print('the exception value is : $e');
    }
    if (error == true) {
      await buildDialogPlus(
          context,
          'Cette Inscription Complète Avec Succès !!.\n Voulez-vous Vous Connecter !!',
          'logIn',
          'Connexion');
    }
  }

  Future send() async {
    var dataa = data.currentState;

    if (dataa!.validate()) {
      dataa.save();
      Map d = {
        // test : give a value static (not variable )
        // "id_utilisateur": "6".toString(),
        "nom_utilisateur": NAME.toString(),
        "prenom_utilisateur": LASTNAME.toString(),
        "age_utilisateur": DATEBIRTH.toString(),
        "email_utilisateur": EMAIL.toString(),
        "pwd_utilisateur": PWD.toString(),
        "telephone_utilisateur": TEL.toString(),
      };
      print('valide');
      // print(LASTNAME);

      postData(d);
/*         if(error == 'Connection closed while receiving data' ){
          await buildDialog(context, 'this email is already exist *');
        } */
      // await buildDialog(context, 'success!!');

    } else {
      print('not valid');
    }
  }

  GlobalKey<FormState> data = new GlobalKey<FormState>();
  TextEditingController user = new TextEditingController();
  bool hidePass = true;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        body: Form(
      key: data,
      child: Container(
        color: Colors.red,
        height: size.height,
        width: size.width,
        child: Container(
          // margin: EdgeInsets.only(top: 140),
          // padding:EdgeInsets.only(top:70),
          height: size.height,
          color: Colors.orange.shade500,
          //the first container
          width: double.infinity,
          child: ListView(
            shrinkWrap: true,
            children: [
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                // the logo
                Container(
                    margin: EdgeInsets.only(bottom: 30, top: 70),
                    // height: 80,
                    width: 156,
                    child: Image(image: AssetImage('images/logo2_v1.png'))),
                //the header text
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'S\'inscrire',
                    style: TextStyle(
                        fontFamily: 'Cairo', fontSize: 25, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),

                //the body,the main container of this part
                ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Container(
                      // color: Colors.blueGrey,
                      // height:size.height/2,
                      margin: EdgeInsets.only(
                          top: 50, bottom: 50, left: 10, right: 10),
                      width: double.infinity,

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //the name field
                          Container(
                            padding: EdgeInsets.only(bottom: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //Text('First name:',style: TextStyle(fontSize:30,color: Colors.black),),
                                DecoInput(
                                    val: (Stringg) {
                                      String pattern = r'[a-zA-Z]{3,20}';
                                      var regle = RegExp(pattern);
                                      if (!(regle.hasMatch(Stringg!))) {
                                        return ('le nom doit être inférieur ou égal à 20 lettres et supérieur a 2 letter');
                                      }
                                    },
                                    hint: 'Entrez votre name',
                                    label: 'Nom:',
                                    FN: (V) {
                                      setState(() {
                                        NAME = V;
                                      });
                                    },
                                    iconn: Icons.person)
                              ],
                            ),
                          ),
                          //the Last name field
                          Container(
                            padding: EdgeInsets.only(bottom: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //Text('First name:',style: TextStyle(fontSize:30,color: Colors.black),),
                                DecoInput(
                                  val: (Stringg) {
                                    String pattern = r'[a-zA-Z]{3,20}';
                                    var regle = RegExp(pattern);
                                    if (!(regle.hasMatch(Stringg!))) {
                                      return ('le nom de famille doit être inférieur ou égal à 20 lettres et supérieur a 2 letter');
                                    }
                                  },
                                  hint: 'Entrez votre prénom',
                                  iconn: Icons.person,
                                  label: 'prénom:',
                                  FN: (V) {
                                    LASTNAME = V;
                                  },
                                ),
                              ],
                            ),
                          ),

                          //the Email field
                          Container(
                            padding: EdgeInsets.only(bottom: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //Text('First name:',style: TextStyle(fontSize:30,color: Colors.black),),
                                DecoInput(
                                  val: (Stringg) {
                                    String pattern =
                                        r'[a-zA-Z]{4,15}[0-1]*@[a-z]+ . [a-z]+';
                                    if (Stringg!.length < 10) {
                                      return ('la longueur de l\'email doit tre d\'au moins 11 lettres');
                                    }
                                  },
                                  label: 'Email:',
                                  iconn: Icons.email,
                                  hint: 'Entrez votre Email',
                                  FN: (V) {
                                    EMAIL = V;
                                  },
                                )
                              ],
                            ),
                          ),

                          //the Password field
                          Container(
                            padding: EdgeInsets.only(bottom: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //Text('First name:',style: TextStyle(fontSize:30,color: Colors.black),),
                                TextFormField(
                                  onSaved: (V) {
                                    PWD = V;
                                  },
                                  // maxLength: 20,
                                  // autovalidateMode:AutovalidateMode.always ,
                                  validator: (String) {
                                    if (String!.length < 8 || String.isEmpty) {
                                      return ('le mot de passe doit être d\'au moins 8 lettres');
                                    }
                                  },

                                  //textInputAction: TextInputAction.next,
                                  obscureText: hidePass,
                                  //keyboardType: TextInputType.visiblePassword,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.orange.shade400,
                                    hintText: 'Entrez votre mot de pass',
                                    hintStyle: TextStyle(color: Colors.black),
                                    prefixIcon: Icon(Icons.key_rounded,
                                        color: Colors.white),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          hidePass = !hidePass;
                                        });
                                      },
                                      icon: hidePass
                                          ? Icon(Icons.visibility_off)
                                          : Icon(Icons.visibility),
                                      color: Colors.white,
                                    ),
                                    labelText: 'Mot de pass:',
                                    labelStyle: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                    ),
                                    enabled: true,
                                    disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Colors.orange.shade500)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Colors.orange.shade500)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Colors.orange.shade500)),
                                    errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Colors.orange.shade500)),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          //the Phone field
                          Container(
                            padding: EdgeInsets.only(bottom: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                DecoInput(
                                  val: (Stringg) {
                                    String pattern = r'[0-9]{8}';
                                    var regle = RegExp(pattern);

                                    if (!(regle.hasMatch(Stringg!))) {
                                      print(Stringg.toString());
                                      return ('Le numéro de téléphone n\'est pas valide');
                                    }
                                  },
                                  label: 'Phone:',
                                  iconn: Icons.phone_android,
                                  hint: 'Entre votre Phone',
                                  FN: (V) {
                                    TEL = V;
                                  },
                                ),

                                //Text('First name:',style: TextStyle(fontSize:30,color: Colors.black),),
                              ],
                            ),
                          ),

                          //the Date of birth field
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //Text('First name:',style: TextStyle(fontSize:30,color: Colors.black),),

                                DecoInput(
                                  val: (Stringg) {
                                    String pattern =
                                        r'[0-9]{1,2}/[0-9]{1,2}/[1-2]{1}[0-9]{3}';
                                    var regle = RegExp(pattern);
                                    if (!(regle.hasMatch(Stringg!)) ||
                                        Stringg.isEmpty) {
                                      return ('ça doit être comme ça DD/MM/YYYY');
                                    }
                                  },
                                  label: 'date de naissance:',
                                  iconn: Icons.date_range,
                                  FN: (V) {
                                    DATEBIRTH = V;
                                  },
                                  hint: 'Entrez votre date de naissance',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                //the button
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    padding: EdgeInsets.all(10),
                    color: Colors.black,
                    onPressed: send,
                    child: Text(
                      'Rejoignez-Nous gratuitement ',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  ),
                ),

                //the other case
                Container(
                  margin: EdgeInsets.only(bottom: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Text(
                          'Vous avez déjà un compte ?',
                          style: TextStyle(fontSize: 18, color: Colors.black54),
                        ),
                      ),
                      Container(
                          child: MaterialButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('logIn');
                        },
                        child: Text(
                          'Connexion',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                    ],
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    ));
  }
}

//page log in
String? EMAIL;
String? PWD;

class Mobile2 extends StatefulWidget {
  Mobile2({Key? key}) : super(key: key);

  @override
  State<Mobile2> createState() => _Mobile2State();
}

class _Mobile2State extends State<Mobile2> {
  Future postData(String? email, String? pwd) async {
    List data = [];
    print(email);
    print(pwd);
    // email_utilisateur=$EMAIL&pwd_utilisateur=$PWD
    String url =
        'http://192.168.1.11:8000/api/utilisateurs/get_utilisateur_by_email_pwd/$EMAIL/$PWD';
// 'https://jsonplaceholder.typicode.com/posts?id=4';

    try {
      var response = await http.get(
        Uri.parse(url),
      );

      var responseBody = jsonDecode(response.body);

      print('the response is : ${responseBody}'); /*@gmail.com */
      setState(() {
        data.addAll(responseBody);
      });

      print('the content of data list is : \n');
      print(data);
      if (data.isEmpty) {
        buildDialogPlus(
            context,
            'Cet email n\'existe pas dans la base de données !! \n Voulez-vous vous S\'inscrire !!',
            'singUp',
            'S\'inscrire');
      } else {
        Navigator.of(context).pushReplacementNamed('offer');
      }
    } catch (e) {
/*             if(e.toString() =='Connection closed while receiving data' ){
              error = false;
await buildDialogPlus(context, 'Cet E-mail Existe Eéjà!!.\n Voulez-vous Vous Connecter !!');

            } */

      print('the exception value is : $e');
    }
/*           if (error == true)
          {
await buildDialogPlus(context, 'Cette Inscription Complète Avec Succès !!.\n Voulez-vous Vous Connecter !!');
          } */
  }

  Future send() async {
    var dataa = data.currentState;

    if (dataa!.validate()) {
      dataa.save();

      print('valide');
      // print(LASTNAME);

      postData(EMAIL, PWD);
/*         if(error == 'Connection closed while receiving data' ){
          await buildDialog(context, 'this email is already exist *');
        } */
      // await buildDialog(context, 'success!!');

    } else {
      print('not valid');
    }
  }

  GlobalKey<FormState> data = new GlobalKey<FormState>();
  bool hidePass = true;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        // appBar: AppBar(),
        // drawer: Drawer(),
        body: Form(
      key: data,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
            color: Colors.orange.shade500,
            height: size.height,
            width: size.width,
            // padding: EdgeInsets.only(top: 50),
            //the first container

            //margin: EdgeInsets.symmetric(vertical: 50,horizontal: 50),

            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                  margin: EdgeInsets.only(top: 70),
                  // height: 80,
                  width: 156,
                  child: Image(image: AssetImage('images/logo2_v1.png'))),

              //the header text
              Container(
                margin: EdgeInsets.only(left: 10, right: 10, top: 30),
                child: Text(
                  'Bienvenu',
                  style: TextStyle(
                      fontFamily: 'Cairo', fontSize: 25, color: Colors.black),
                ),
              ),

              //the body,the main container of this part
              Container(
                margin:
                    EdgeInsets.only(top: 50, bottom: 50, left: 10, right: 10),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //the Email field
                    Container(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Text('First name:',style: TextStyle(fontSize:30,color: Colors.black),),
                          DecoInput(
                            val: (Stringg) {
                              String pattern =
                                  r'[a-zA-Z]{4,15}[0-1]*@[a-z]+ . [a-z]+';
                              if (Stringg!.length < 10) {
                                return ('la longueur de l\'email doit tre d\'au moins 11 lettres');
                              }
                            },
                            label: 'Email:',
                            iconn: Icons.email,
                            hint: 'Entrez votre Email',
                            FN: (V) {
                              EMAIL = V;
                            },
                          )
                        ],
                      ),
                    ),

                    //the Password field
                    Container(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Text('First name:',style: TextStyle(fontSize:30,color: Colors.black),),
                          TextFormField(
                            onSaved: (V) {
                              PWD = V;
                            },
                            // maxLength: 20,
                            // autovalidateMode:AutovalidateMode.always ,
                            validator: (String) {
                              if (String!.length < 8 || String.isEmpty) {
                                return ('le mot de passe doit être d\'au moins 8 lettres');
                              }
                            },

                            //textInputAction: TextInputAction.next,
                            obscureText: hidePass,
                            //keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.orange.shade400,
                              hintText: 'Entrez votre mot de pass',
                              hintStyle: TextStyle(color: Colors.black),
                              prefixIcon:
                                  Icon(Icons.key_rounded, color: Colors.white),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    hidePass = !hidePass;
                                  });
                                },
                                icon: hidePass
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.visibility),
                                color: Colors.white,
                              ),
                              labelText: 'Mot de pass:',
                              labelStyle: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                              enabled: true,
                              disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Colors.orange.shade500)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Colors.orange.shade500)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Colors.orange.shade500)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Colors.orange.shade500)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              //the button
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.all(10),
                  color: Colors.black,
                  onPressed: send,
                  child: Text(
                    'Connexion',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
              ),

              //the other case
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      'Vous n’avez pas de compte?',
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                    ),
                  ),
                  Container(
                      child: MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('singUp');
                    },
                    child: Text(
                      'S’iscrire',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
                ],
              ),
            ]),
          ),
        ],
      ),
    ));
  }
}

// page offer
// create the cutom app bar
/* when we need a custom widget just create a class 
and choose whenever we want  */

class CustomAppBar
    extends StatelessWidget /* implements PreferredSizeWidget */ {
/*   final double height;
  final Widget topChild;
  final AppBar appBar;
 */
  CustomAppBar({
    Key? key,
/*       this.height = 150.0,
      required this.topChild,
      required this.appBar */
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

/*   @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: topChild),
        appBar,
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(); */
}

// GlobalKey<ScaffoldState> keyScaffold = GlobalKey<ScaffoldState>();

// the second BarDrawer class state less widget
// the APPBAR and DRAWER class
class BarDrawer extends StatelessWidget {
  BarDrawer({Key? key, required Widget this.child}) : super(key: key);
  late AppBar appBarr;
  late Drawer drawerr;
  late Widget child;

  @override
  Widget build(BuildContext context) {
    // if we use the global key on another sub class
    //it will apperar an error global key deplicated
    GlobalKey<ScaffoldState> keyScaffold = GlobalKey<ScaffoldState>();
    final colorBtn = Colors.black;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      key: keyScaffold,
      appBar: AppBar(
        actions: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            child: MaterialButton(
              shape: StadiumBorder(
                  side: BorderSide(color: Colors.white, width: 0)),
              minWidth: 8,
              color: Colors.white,
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              },
              child: Icon(
                Icons.search,
                color: colorBtn,
                size: 17,
              ),
            ),
          ),

// the error is here keyScaffold null
          IconButton(
            iconSize: 40,
            icon: Icon(
              Icons.menu_rounded,
              color: colorBtn,
            ),
            onPressed: () {
              // Navigator.of(context).pushNamed('session');
              keyScaffold.currentState?.openEndDrawer();
              print('clicked on the button ');
            },
          ),
        ],
        backgroundColor: Colors.orange.shade500,
        // toolbarHeight: 50, because we use in the the class AppBrr
        title: Container(
          width: 300,
          padding: EdgeInsets.only(left: 5, right: 40),
          child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //the return button
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(right: 5),
                  child: MaterialButton(
                    minWidth: 30,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Colors.white,
                    onPressed: () {
                      if (Navigator.of(context).canPop()) {
                        Navigator.of(context).pop(true);
                      }
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 17,
                    ),
                  ),
                ),
                // the place of the logo
                // the logo
                Container(
                    // color:Colors.pink,
                    margin: EdgeInsets.only(left: 10, top: 5),
                    // height: 90,
                    width: 100,
                    child: Image(image: AssetImage('images/logo2_v2.png'))),
/*                 Text(
                  'Formation',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight:FontWeight.bold,
                    fontSize: 30),), */
              ]),
        ),
      ),
      endDrawer: Drawer(
        child: Container(
          child: Column(children: [
            //the background of the app bar
            Container(
              height: 150,
              color: Colors.orange.shade500,
              child: Column(
                children: [
                  // the return button
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(top: 30),
                    child: MaterialButton(
                      minWidth: 30,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      color: Colors.black,
                      // the problem is this function
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 17,
                      ),
                    ),
                  ),

                  //the place of logo
                  // the logo
                  Container(
                      // color:Colors.pink,
                      // margin:EdgeInsets.only(top: 5),
                      height: 50,
                      width: 120,
                      child: Image(image: AssetImage('images/logo2_v2.png'))),
                ],
              ),
            ),
            ListTile(
              title: Text(
                'Nos Formations',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              leading: Icon(
                Icons.computer_sharp,
                color: Colors.orange.shade500,
                size: 25,
              ),
              onTap: () {
                Navigator.of(context).pushNamed('cours');
              },
            ),

            ListTile(
              title: Text(
                'Mon Profil',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              leading: Icon(
                Icons.person_pin,
                color: Colors.orange.shade500,
                size: 25,
              ),
              onTap: () {
                Navigator.of(context).pushNamed('profil');
              },
            ),
            // we don't need the notification and the parmetre now
/*         ListTile(
          title: Text('Notification',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
          leading: Icon(
            Icons.notifications_on,
            color: Colors.orange.shade500,
            size: 25,),
          onTap: (){},), */

/*         ListTile(
          title: Text('Paramètre',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
          leading: Icon(
            Icons.settings,
            color: Colors.orange.shade500,
            size: 25,),
          onTap: (){},), */

            ListTile(
              title: Text(
                'Déconnexion',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.orange.shade500,
                size: 25,
              ),
              onTap: () {},
            ),
          ]),
        ),
      ),
      body: child,
    );
  }
}

// the other class bar Remark(choose an offer )
class BarRemark extends StatelessWidget {
  BarRemark({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorBtn = Colors.black;
    final colorFont = Colors.white;
    final size = MediaQuery.of(context).size;
    return Container(
        height: 50,
        // width: size.width,
        color: Colors.red.shade800,
        child: ListView(
          reverse: true,
          scrollDirection: Axis.horizontal,
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Vous devez choisir une offre avant l\'expiration de votre offre ',
                  style: TextStyle(color: colorFont),
                ),
                MaterialButton(
                  minWidth: 30,
                  height: 25,
                  shape: StadiumBorder(
                      side: BorderSide(color: colorBtn, width: 1)),
                  color: colorBtn,
                  onPressed: () {
                    Navigator.of(context).pushNamed('offer');
                  },
                  child: Text(
                    'accèder',
                    style: TextStyle(color: colorFont),
                  ),
                )
              ],
            ),
          ],
        ));
  }
}

// the other class title container
class TitleContainer extends StatelessWidget {
  TitleContainer({Key? key, required this.title}) : super(key: key);
  late String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Text(
        title,
        style: TextStyle(color: Colors.black, fontSize: 25),
      ),
    );
  }
}

// the other class oneOffer
class OneOffer extends StatelessWidget {
  OneOffer({Key? key, required this.period, required this.price})
      : super(key: key);
  late String period;
  late String price;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colorBtn = Colors.black;
    final colorFont = Colors.white;
    return Container(
      margin: EdgeInsets.only(bottom: mainPadding),
      height: 70,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.orange.shade500,
          // border:Border.all(color: Colors.greenAccent,width: 5),
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // the period
          Container(
            child: Text(
              period,
              style: TextStyle(fontSize: 24, color: colorFont),
            ),
          ),

          // the price
          Container(
            // color:Colors.orange.shade500,
            margin: EdgeInsets.only(left: 50),
            child: MaterialButton(
                color: colorBtn,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                onPressed: () {},
                child: Text(
                  price,
                  style: TextStyle(fontSize: 24, color: colorFont),
                )),
          ),
        ],
      ),
    );
  }
}

// the other class container of the main content
class MainContainer extends StatelessWidget {
  MainContainer({Key? key, required this.child}) : super(key: key);
  late Widget child;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      // alignment: Alignment.center,

      margin: EdgeInsets.only(
          right: mainPadding, left: mainPadding, bottom: mainPadding),
      padding: EdgeInsets.only(
          right: mainPadding, left: mainPadding, top: mainPadding),
      decoration: BoxDecoration(
        // color: Colors.blueGrey,
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(30),
      ),
      //approximately the error of incorrect use of parentDataWidget
      //we delete the Expanded
      child: child,
    );
  }
}

// the other class ImgDesc

class ImgDesc extends StatelessWidget {
  ImgDesc({
    Key? key,
    required this.image,
    required this.title,
    required this.descreption,
  }) : super(key: key);
  late String image;
  late String title;
  late String descreption;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        width: double.infinity,
        height: 250,
        child: Image(
          image: AssetImage(image),
          fit: BoxFit.fill,
        ),
      ),
      // the informaion about the cours
      Container(
          color: Colors.black,
          width: double.infinity,
          padding: EdgeInsets.all(mainPadding),
          // why we should to change it from 150 to 140 !!!!!!!
          height: 140,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // the title
              Container(
                // margin: EdgeInsets.only(left:20,bottom: 20 ,top:20),
                alignment: Alignment.topLeft,
                child: Text(
                  title,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),

              // the description
              Container(
                // margin: EdgeInsets.only(left:20 ),
                alignment: Alignment.topLeft,
                child: Text(
                  descreption,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          )),
    ]);
  }
}

// the other page
class Mobile3 extends StatefulWidget {
  Mobile3({Key? key}) : super(key: key);

  @override
  State<Mobile3> createState() => _Mobile3State();
}

class _Mobile3State extends State<Mobile3> {
  // GlobalKey<ScaffoldState> keyScaffold = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // var colorSide = Colors.black;
    var colorBtn = Colors.black;
    var colorFont = Colors.white;
    return BarDrawer(
      // now we need to change thgis container to a class
      child: Container(
        height: size.height - 50,
        // color: Colors.black,
        child: ListView(
          children: [
            // bar remark **we change the container by a class**
            BarRemark(),
            // the title and the offers
            Container(
              // margin: EdgeInsets.symmetric(vertical: 20),
              // color: Colors.red,
              height: size.height - 50,
              child: ListView(children: [
                // the title
                TitleContainer(
                  title: 'liste des offres',
                ),

                // the offers

                MainContainer(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // the offer 1 , 2, 3 ,4
                        OneOffer(period: '1 Mois', price: '1 dt'),
                        // the 2 offer
                        OneOffer(period: '3 Mois', price: '2 dt'),
                        // 3
                        OneOffer(period: '6 Mois', price: '3 dt'),
                        // 4
                        OneOffer(period: '12 Mois', price: '5 dt'),
                      ]),
                ),
/*    */
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

// page cour
String formationSelected = '';

class Mobile4 extends StatefulWidget {
  Mobile4({Key? key}) : super(key: key);

  @override
  State<Mobile4> createState() => _Mobile4State();
}

class _Mobile4State extends State<Mobile4> {
  List formation = [];
  Future getPost() async {
    String url = 'http://192.168.1.11:8000/api/formations';

    var response = await http.get(Uri.parse(url));

    var responseBody = jsonDecode(response.body);

    setState(() {
      formation.addAll(responseBody);
    });
  }

  @override
  void initState() {
    super.initState();
    getPost();
  }

  // GlobalKey<ScaffoldState> keyScaffold = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final colorBtn = Colors.black;
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
/*     List formation=[
      {'image':'image1.jpg',
      'titre':'fomation laravel ',
      'description':'description pour la foramtion laravel'},
      {'image':'image1.jpg',
      'titre':'fomation flutter ',
      'description':'description pour la foramtion flutter ,description pour la foramtion flutter,,description pour la foramtion flutter,,description pour la foramtion flutter'},
    ];  */
    return BarDrawer(
      // key: keyScaffold,
      child: Container(
        width: screenWidth,
        height: screenHeight,
        child: ListView(
          children: [
            //choose an offer
            BarRemark(),
            // the title and the offers
            ListView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  // the title
                  TitleContainer(title: 'Nos formations'),

                  // the cours
                  formation.isEmpty
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemCount: formation.length,
/*                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:1,
                    // mainAxisSpacing: 5,
                    // crossAxisSpacing: 50,
                    mainAxisExtent: 450), */
                                itemBuilder: (builder, i) {
                                  // the height of this container won't change ,so we use the scroll
                                  return ListView(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    children: [
                                      MainContainer(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            // the image
                                            Container(
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        width: 5,
                                                        color: Colors.black),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                // padding:EdgeInsets.only(top: 20,left:20,right:20),
                                                margin:
                                                    EdgeInsets.only(bottom: 20),
                                                height: 200,
                                                width: screenWidth -
                                                    (mainPadding *
                                                        4), //we remove the padding and the margin of the container
                                                child: Image(
                                                  image: AssetImage(
                                                      'images/${formation[i]['photo_formation']}'),
                                                  fit: BoxFit.fill,
                                                )),

                                            // the title
                                            Container(
                                              alignment: Alignment.topLeft,
                                              margin:
                                                  EdgeInsets.only(bottom: 20),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: mainPadding),
                                              child: Text(
                                                '${formation[i]['nom_formation']}',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                textAlign: TextAlign.start,
                                              ),
                                            ),

                                            // the description
                                            Container(
                                              alignment: Alignment.topLeft,
                                              margin:
                                                  EdgeInsets.only(bottom: 20),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: mainPadding),
                                              child: Text(
                                                '${formation[i]['description_formation']}',
                                                style: TextStyle(fontSize: 15),
                                              ),
                                            ),

                                            // the button
                                            Container(
                                              alignment: Alignment.topLeft,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: mainPadding),
                                              margin:
                                                  EdgeInsets.only(bottom: 20),
                                              child: MaterialButton(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    imgFormation = formation[i]
                                                        ['photo_formation'];

                                                    formationSelected =
                                                        formation[i]
                                                            ['id_formation'];
                                                  });
                                                  Navigator.of(context)
                                                      .pushNamed('session');
                                                },
                                                child: Text(
                                                  'voir plus',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                color: Colors.black,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                          ],
                        ),
                ]),
          ],
        ),
      ),
      // the body
    );
  }
}

String sceanceSelected = '';
String imgFormation = '';
String videoUrl = '';

// the page 5
class Mobile5 extends StatefulWidget {
  Mobile5({Key? key}) : super(key: key);
  var dem = 150;
  setDem() {
    dem += 150;
  }

  @override
  State<Mobile5> createState() => _Mobile5State();
}

class _Mobile5State extends State<Mobile5> {
  GlobalKey<ScaffoldState> keyScaffold = GlobalKey<ScaffoldState>();
  Future getFormation() async {
    String url =
        'http://192.168.1.11:8000/api/formations/get_formation_by_id/$formationSelected';

    var response = await http.get(Uri.parse(url));

    var responseBody = jsonDecode(response.body);

    return responseBody;
  }

  Future getSceance() async {
    String url =
        'http://192.168.1.11:8000/api/sceances/get_sceance_by_id_formation/$formationSelected';

    var response = await http.get(Uri.parse(url));

    var responseBody = jsonDecode(response.body);

    return responseBody;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFormation();
    getSceance();
  }

  @override
  Widget build(BuildContext context) {
    final colorBtn = Colors.black;
    var dem = 150;

    final screenHeight = MediaQuery.of(context).size.height;
    List formation = [
      {
        'image': 'image1.jpg',
        'titre': 'Fomation Laravel ',
        'description':
            'description pour la foramtion laravel,description pour la foramtion larave,description pour la foramtion laraveldescription pour la foramtion larave',
      },
    ];
    List sceance = [
      {
        'id': '1',
        'nom': 'introduction',
        'description': 'sceance1',
      },
      {
        'id': '1',
        'nom': 'introduction',
        'description': 'sceance1',
      },
      {
        'id': '1',
        'nom': 'introduction',
        'description': 'sceance1',
      },
      {
        'id': '1',
        'nom': 'introduction',
        'description': 'sceance1',
      },
      {
        'id': '1',
        'nom': 'introduction',
        'description': 'sceance1',
      },
      {
        'id': '1',
        'nom': 'introduction',
        'description': 'sceance1',
      },
      {
        'id': '1',
        'nom': 'introduction',
        'description': 'sceance1',
      },
      {
        'id': '1',
        'nom': 'introduction',
        'description': 'sceance1',
      },
      {
        'id': '1',
        'nom': 'introduction',
        'description': 'sceance1',
      },
    ];
    var l = sceance.length;
    return BarDrawer(
      // the body
      child: ListView(
        children: [
          BarRemark(),

          //
          Container(
            // color:Colors.red,
            margin: EdgeInsets.symmetric(vertical: 0),
            /* color: Colors.grey, */
            width: 400,
            // height: 510+50*l*1.0,
            // color: Colors.red,
            child: ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  // the first part
                  Container(
                    // color: Colors.purple,
                    height: 390, //nava bar 85 + red bar 40 + padding 10 =140
                    width: 300,
                    child: FutureBuilder(
                      future: getFormation(),
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                              // the image
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: snapshot.data.length,
                              itemBuilder: (builder, i) {
                                // the height of this container won't change ,so we use the scroll
                                // we use the class that we have

                                return ImgDesc(
                                    image:
                                        'images/${snapshot.data[i]['photo_formation']}',
                                    title:
                                        '${snapshot.data[i]['nom_formation']}',
                                    descreption:
                                        '${snapshot.data[i]['description_formation']}');
                              });
                        }
                        return Center(child: CircularProgressIndicator());
                      },
                    ),
                  ),
                  // **********************the second loop ****************
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: mainPadding, vertical: mainPadding),
                    padding: EdgeInsets.all(mainPadding),
                    decoration: BoxDecoration(
                        // color: Colors.yellow,
                        border: Border.all(width: 1, color: Colors.black),
                        borderRadius: BorderRadius.circular(20)),
                    // we add a value that we choose it for the padding
                    // height: 60+50*l*1.0,
                    width: 300,
                    child: FutureBuilder(
                      future: getSceance(),
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data.length,
                            itemBuilder: (builder, i) {
                              // the content titre , description ,button
                              return Container(
                                // padding: EdgeInsets.all(5),
                                // alignment: Alignment.topLeft,
                                // color: Colors.green,
                                height: 50,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                          margin: EdgeInsets.only(
                                              right: mainPadding / 3 * 2),
                                          width: 40,
                                          // color: Colors.blue,
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.ondemand_video,
                                              color: Colors.orange.shade500,
                                            ),
                                            onPressed: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      title: Text(
                                                        '${snapshot.data[i]['nom_sceance']}',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                        textAlign:
                                                            TextAlign.start,
                                                      ),
                                                      content: Container(
                                                        height: 300,
                                                        child: BetterPlayer
                                                            .network(
                                                          '${snapshot.data[i]['video_sceance']}',
                                                          betterPlayerConfiguration:
                                                              BetterPlayerConfiguration(
                                                            aspectRatio: 16 / 9,
                                                            // looping: true,
                                                            // autoPlay: true,
                                                            fit: BoxFit.contain,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  });
                                            },
                                          )),
                                    ),
                                    // the title

                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        child: Text(
                                          '${snapshot.data[i]['nom_sceance']}',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                    ),

                                    // the button
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        child: MaterialButton(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              videoUrl = snapshot.data[i]
                                                  ['video_sceance'];
                                              sceanceSelected = snapshot.data[i]
                                                  ['id_sceance'];
                                            });
                                            Navigator.of(context)
                                                .pushNamed('evaluation');
                                          },
                                          child: Text(
                                            'voir plus',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12),
                                          ),
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}

// the page 6
class Mobile6 extends StatefulWidget {
  Mobile6({Key? key}) : super(key: key);
  var dem = 150;
  setDem() {
    dem += 150;
  }

  @override
  State<Mobile6> createState() => _Mobile6State();
}

class _Mobile6State extends State<Mobile6> {
  GlobalKey<ScaffoldState> keyScaffold = GlobalKey<ScaffoldState>();

  Future getSceance() async {
    String url =
        'http://192.168.1.11:8000/api/sceances/get_sceance_by_id_sceance/$sceanceSelected';

    var response = await http.get(Uri.parse(url));

    var responseBody = jsonDecode(response.body);

    return responseBody;
  }

  Future getEvaluation() async {
    String url =
        'http://192.168.1.11:8000/api/evaluations/get_evaluations_by_id_sceance/$sceanceSelected';

    var response = await http.get(Uri.parse(url));

    var responseBody = jsonDecode(response.body);

    return responseBody;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSceance();
    getEvaluation();
  }

  //the problem that make the video player don't work is this :
  /*  late VideoPlayerController  _controller ;
    Future<Void>? _intialisedVideoPlayerFuture;
    void initState() {
      
      _controller = VideoPlayerController.network
      ('https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4');
      _intialisedVideoPlayerFuture = _controller.initialize() as Future<Void>?;
      _controller.setLooping(true);
      _controller.setVolume(1.0);
    }
        void dispose(){
        _controller.dispose();
        super.dispose();
      }  */
  @override
  Widget build(BuildContext context) {
    @override
    final colorBtn = Colors.black;
    var dem = 150;

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final media = MediaQuery.of(context).size;
    List formation = [
      {
        'image': 'image1.jpg',
        'titre': 'Fomation Laravel ',
        'description':
            'description pour la foramtion laravel,description pour la foramtion larave,description pour la foramtion laraveldescription pour la foramtion larave',
      },
    ];
    List sceance = [
      {
        'titre': 'Rout',
        'description': 'description pour la scenace',
      },
    ];
    List evaluation = [
      {
        'id': '1',
        'enonce': 'enonce.pdf',
        'corrige': 'corrige.pdf',
        'description': 'description de la evaluation ',
      },
      {
        'id': '1',
        'enonce': 'enonce2.pdf',
        'corrige': 'corrige2.pdf',
        'description': 'description 2 de la evaluation ',
      },
    ];
    var l = evaluation.length;
    return Scaffold(
      key: keyScaffold,
      body: BarDrawer(
        child: ListView(
          children: [
            // the bar of choose an offer
            BarRemark(),

// the container of the first part and the second prart
            Container(
              // color:Colors.red,
              margin: EdgeInsets.symmetric(vertical: 0),
              /* color: Colors.grey, */
              width: screenWidth, height: 430 + 450 * l * 1.0,
              // color: Colors.black,
              child:
                  ListView(physics: NeverScrollableScrollPhysics(), children: [
                // the first part
                Container(
                  // color: Colors.purple,
                  height: 390, //nava bar 85 + red bar 40 + padding 10 =140
                  width: 300,
                  child: FutureBuilder(
                    future: getSceance(),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            // the image
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: snapshot.data.length,
                            itemBuilder: (builder, i) {
                              // the height of this container won't change ,so we use the scroll
                              return ImgDesc(
                                // just to make it easier we put the url of image in a variable (initialize it on the page 4)
                                image: 'images/$imgFormation',
                                title: '${snapshot.data[i]['nom_sceance']}',
                                descreption:
                                    '${snapshot.data[i]['description_sceance']}',
                              );
                            });
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
                // **********************the second loop ****************
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: mainPadding, vertical: mainPadding),
                  padding: EdgeInsets.all(mainPadding),
                  decoration: BoxDecoration(

                      // color: Colors.yellow,
                      border: Border.all(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(20)),

                  height: 110 + 390 * l * 1.0,
                  // we don't need width cause we hacve a margin
                  // width: screenWidth - 100,
                  child: FutureBuilder(
                    future: getEvaluation(),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data.length,
                          itemBuilder: (builder, i) {
                            Divider(
                              color: Colors.black,
                            );
                            // the content titre , description ,button
                            return ListView(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                children: [
                                  Container(
                                    // margin: EdgeInsets.symmetric(horizontal: (screenWidth*0.15)/2,vertical: (screenWidth*0.1)/2),

                                    // padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      // color: Colors.green,
                                      border: Border(
                                          bottom: BorderSide(
                                              width:
                                                  1)), /* borderRadius: BorderRadius.circular(20) */
                                    ),
                                    // alignment: Alignment.topLeft,

                                    height: 400,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Container(
                                            height: 300,
                                            child: BetterPlayer.network(
                                              '$videoUrl',
                                              betterPlayerConfiguration:
                                                  BetterPlayerConfiguration(
                                                aspectRatio: 16 / 9,
                                                // looping: true,
                                                // autoPlay: true,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                        ),

                                        // enonce

                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                      child: IconButton(
                                                    icon: Icon(
                                                      Icons.picture_as_pdf,
                                                      color: Colors
                                                          .orange.shade500,
                                                    ),
                                                    onPressed: () {},
                                                  )),
                                                ),
                                                // the title

                                                Expanded(
                                                  flex: 2,
                                                  child: Container(
                                                    child: Text(
                                                      '${snapshot.data[i]['enonce_evaluation']}',
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                      textAlign:
                                                          TextAlign.start,
                                                    ),
                                                  ),
                                                ),

                                                // the button
                                                Expanded(
                                                  flex: 2,
                                                  child: Container(
                                                    child: MaterialButton(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30),
                                                      ),
                                                      onPressed: () {},
                                                      child: Text(
                                                        'Télécharger',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 12),
                                                      ),
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),

                                        // corrige

                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                      child: IconButton(
                                                    icon: Icon(
                                                      Icons.picture_as_pdf,
                                                      color: Colors
                                                          .orange.shade500,
                                                    ),
                                                    onPressed: () {},
                                                  )),
                                                ),
                                                // the title

                                                Expanded(
                                                  flex: 2,
                                                  child: Container(
                                                    child: Text(
                                                      '${snapshot.data[i]['corrige_evaluation']}',
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                      textAlign:
                                                          TextAlign.start,
                                                    ),
                                                  ),
                                                ),

                                                // the button
                                                Expanded(
                                                  flex: 2,
                                                  child: Container(
                                                    child: MaterialButton(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30),
                                                      ),
                                                      onPressed: () {},
                                                      child: Text(
                                                        'Télécharger',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 12),
                                                      ),
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),

                                        // the descreption
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                              alignment: Alignment.topLeft,
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 20),
                                              child: Text(
                                                  '${snapshot.data[i]['description_evaluation']}')),
                                        ),
                                      ],
                                    ),
                                  ),
                                ]);
                          },
                        );
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

// data search class
class DataSearch extends SearchDelegate {
  List name = [
    'formaion laravel',
    'formation flutter',
    'formation react',
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.close),
        onPressed: (() {
          //in the second parts
          query = '';
        }),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          // in the second parts
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Mobile5();
  }

// how search for a specific phrase
  @override
  Widget buildSuggestions(BuildContext context) {
    // we can use containes or startsWith
    List filter = name.where((element) => element.contains(query)).toList();
    return Container(
      child: ListView.builder(
          itemCount: query == '' ? name.length : filter.length,
          itemBuilder: (contex, i) {
            return InkWell(
              onTap: () {
                // when i click the index positiond  on where i click
                query = query == '' ? name[i] : filter[i];
                showResults(context);
              },
              child: Container(
                  padding: EdgeInsets.all(20),
                  child: query == ''
                      ? Text(
                          '${name[i]}',
                          style: TextStyle(fontSize: 20),
                        )
                      : Text(
                          '${filter[i]}',
                          style: TextStyle(fontSize: 20),
                        )),
            );
          }),
    );
  }
}

// test play video
class Play extends StatefulWidget {
  Play({Key? key}) : super(key: key);

  @override
  State<Play> createState() => _PlayState();
}

class _PlayState extends State<Play> {
/*   late VideoPlayerController _controller ;
  // Future<Void>? _intialisedVideoPlayerFuture;
  void initState() {
    
    _controller = VideoPlayerController.network
    ('https://www.youtube.com/watch?v=jEvixM2yeug')
    ..initialize().then((_){
      setState(() {});
      });
/*     // _intialisedVideoPlayerFuture = _controller!.initialize() as Future<Void>?;
    _controller!.setLooping(true);
    _controller!.setVolume(1.0); */
    super.initState();
    } */
/*       void dispose(){
      _controller!.dispose();
      super.dispose();
    }  */

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BetterPlayer.network(
          'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
          betterPlayerConfiguration: BetterPlayerConfiguration(
            aspectRatio: 16 / 9,
            looping: true,
            autoPlay: true,
            // fit: BoxFit.contain,
          ),
        ),
      ),

/*       Container(
        color:Colors.yellow,
        child: FutureBuilder(
          // future: _intialisedVideoPlayerFuture,
          builder: (context,snapshot){
            if(snapshot.connectionState == ConnectionState.done){
              return AspectRatio(
                aspectRatio:_controller!.value.aspectRatio,
                child: VideoPlayer(_controller!),);
            }else{
              return Center(
                child:CircularProgressIndicator(),
              );
            }
          },
        ),
      ), */
    );
  }
}

// other class one personal informaion
class OneInfo extends StatelessWidget {
  OneInfo({Key? key, required this.info, required this.val}) : super(key: key);
  String? info;
  String? val;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      /* alignment: Alignment.topLeft, */
      // color:Colors.green,
      width: double.infinity,
      margin: EdgeInsets.only(bottom: mainPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: mainPadding / 4),
            child: Text(
              info!,
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
            ),
          ),
          Container(
            child: Text(
              val!,
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}

// page profile page 7
List user = [
  {
    'Nom': 'Ahmed',
    'Prenom': 'Tounsi',
    'Email': 'ahmed.tounsi@gmail.com',
    'Mot de pass': 'Jahmed5656',
    'Phone': '47474747',
    'Date de naissance': '1/11/1995',
  },
];

class Mobile7 extends StatefulWidget {
  Mobile7({Key? key}) : super(key: key);

  @override
  State<Mobile7> createState() => _Mobile7State();
}

class _Mobile7State extends State<Mobile7> {
  Future postData() async {
    try {
/*       EMAIL = 'anis@gmail.com';
      PWD  = 'ahmedbessaoud'; */
      String url =
          'http://192.168.1.11:8000/api/utilisateurs/get_utilisateur_by_email_pwd/$EMAIL/$PWD';
// 'https://jsonplaceholder.typicode.com/posts?id=4';

      print('in page 7 : $EMAIL');
      print('in page 7 : $PWD');
      var response = await http.get(
        Uri.parse(url),
      );

      var responseBody = jsonDecode(response.body);

      print('the response is(in page 7) : ${responseBody}'); /*@gmail.com */

/*
      if(data.isEmpty){
buildDialogPlus(context, 'Cet email n\'existe pas dans la base de données !! \n Voulez-vous vous S\'inscrire !!','singUp','S\'inscrire');
      }else{
        Navigator.of(context).pushReplacementNamed('offer');
      } */
      return responseBody;
    } catch (e) {
      print('the exception value is : $e');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    postData();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // List name=['nom_utilisateur','prenom_utilisateur','email_utilisateur','Mot de pass','Phone','Date de naissace'];
    return BarDrawer(
      child: ListView(
        children: [
          Column(
            children: [
              BarRemark(),
              TitleContainer(title: 'Profil'),
              MainContainer(
                // height: 1,
                child: Container(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: FutureBuilder(
                          future: postData(),
                          builder: (BuildContext context,
                              AsyncSnapshot<dynamic> snapshot) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: snapshot.data.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Column(
                                      children: [
                                        OneInfo(
                                          info: 'Nom:',
                                          val:
                                              '${snapshot.data[index]['nom_utilisateur']}',
                                        ),
                                        OneInfo(
                                          info: 'Prenom:',
                                          val:
                                              '${snapshot.data[index]['prenom_utilisateur']}',
                                        ),
                                        OneInfo(
                                          info: 'Email:',
                                          val:
                                              '${snapshot.data[index]['email_utilisateur']}',
                                        ),
                                        OneInfo(
                                          info: 'Mot de pass:',
                                          val:
                                              '${snapshot.data[index]['pwd_utilisateur']}',
                                        ),
                                        OneInfo(
                                          info: 'Phone:',
                                          val:
                                              '${snapshot.data[index]['telephone_utilisateur']}',
                                        ),
                                        OneInfo(
                                          info: 'Date de naissance:',
                                          val:
                                              '${snapshot.data[index]['age_utilisateur']}',
                                        ),
                                      ],
                                    );
                                  });
                            }
                            return CircularProgressIndicator();
                          },
                        ),
                      ),
/*                              */
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed('edit');
                        },
                        child: Container(
                            // height: 50,
                            width: 70,
                            // color: Colors.pink,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Icon(Icons.edit, color: Colors.white),
                                ),
                                Expanded(
                                    flex: 2,
                                    child: Text(
                                      'Éditer',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white),
                                    )),
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

// other class one personal informaion
class OneEditInfo extends StatelessWidget {
  OneEditInfo({Key? key, required this.info, required this.field})
      : super(key: key);
  String? info;
  Widget field;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      /* alignment: Alignment.topLeft, */
      // color:Colors.green,
      width: double.infinity,
      margin: EdgeInsets.only(bottom: mainPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: mainPadding / 4),
            child: Text(
              info!,
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
            ),
          ),
          Container(
            child: field,
          ),
        ],
      ),
    );
  }
}

// the other class of input decoration
class EdiInfo extends StatelessWidget {
  EdiInfo({
    Key? key,
    required this.initial,
/*     required this.val,
    required this.hint,
    required this.label,
    required this.iconn */
  }) : super(key: key);
/*   var val;
  String? hint;
  IconData? iconn;
  String? label;   */
  String initial;

  String? stringg;
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> data = new GlobalKey<FormState>();

    return TextFormField(
      // maxLength:20,
      // autovalidateMode:AutovalidateMode.always ,
      // validator:val,
      initialValue: initial,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.orange.shade400,
        // hintText:hint ,
        hintStyle: TextStyle(color: Colors.black),
        // prefixIcon: Icon(iconn,color: Colors.white) ,
        // labelText:label ,
        labelStyle: TextStyle(fontSize: 15, color: Colors.white),

        enabled: true,
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.orange.shade500)),

        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.orange.shade500, width: 0)),

        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.orange.shade500, width: 0)),

        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.orange.shade500)),
      ),
    );
  }
}

// page profile edit page 8

class Mobile8 extends StatefulWidget {
  Mobile8({Key? key}) : super(key: key);

  @override
  State<Mobile8> createState() => _Mobile8State();
}

class _Mobile8State extends State<Mobile8> {
  GlobalKey<FormState> data = new GlobalKey<FormState>();
  Future postData() async {
    try {
/*       EMAIL = 'anis@gmail.com';
      PWD  = 'ahmedbessaoud'; */
      String url =
          'http://192.168.1.11:8000/api/utilisateurs/get_utilisateur_by_email_pwd/$EMAIL/$PWD';
// 'https://jsonplaceholder.typicode.com/posts?id=4';

      print('in page 7 : $EMAIL');
      print('in page 7 : $PWD');
      var response = await http.get(
        Uri.parse(url),
      );

      var responseBody = jsonDecode(response.body);

      print('the response is(in page 7) : ${responseBody}'); /*@gmail.com */

/*
      if(data.isEmpty){
buildDialogPlus(context, 'Cet email n\'existe pas dans la base de données !! \n Voulez-vous vous S\'inscrire !!','singUp','S\'inscrire');
      }else{
        Navigator.of(context).pushReplacementNamed('offer');
      } */
      return responseBody;
    } catch (e) {
      print('the exception value is : $e');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    postData();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // List name=['Nom','Prenom','Email','Mot de pass','Phone','Date de naissace'];
    return BarDrawer(
      child: Scaffold(
          body: Form(
        key: data,
        child: Container(
          // color: Colors.green,
          height: size.height - 80,
          child: ListView(
            // shrinkWrap: true,jamelbe22@gmail.com
            children: [
              Column(
                children: [
                  BarRemark(),
                  Container(
                    child: TitleContainer(title: 'Modifier les informations'),
                  ),
                  MainContainer(
                      child: Column(
                    children: [
                      Container(
                        child: FutureBuilder(
                          future: postData(),
                          builder: (BuildContext context,
                              AsyncSnapshot<dynamic> snapshot) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                shrinkWrap: true,
                                itemCount: snapshot.data.length,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    child: ListView(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      //mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                                      children: [
                                        // NOM
                                        OneEditInfo(
                                          info: 'Nom:',
                                          field: EdiInfo(
                                              initial:
                                                  '${snapshot.data[index]['nom_utilisateur']}'),
                                        ),
                                        // PRENOM
                                        OneEditInfo(
                                          info: 'Prenom:',
                                          field: EdiInfo(
                                              initial:
                                                  '${snapshot.data[index]['prenom_utilisateur']}'),
                                        ),
                                        // EMAIL
                                        OneEditInfo(
                                          info: 'Email:',
                                          field: EdiInfo(
                                              initial:
                                                  '${snapshot.data[index]['email_utilisateur']}'),
                                        ),
                                        // MOT DE PASS
                                        OneEditInfo(
                                          info: 'Mot de pass:',
                                          field: EdiInfo(
                                              initial:
                                                  '${snapshot.data[index]['pwd_utilisateur']}'),
                                        ),
                                        // PHONE
                                        OneEditInfo(
                                          info: 'Phone:',
                                          field: EdiInfo(
                                              initial:
                                                  '${snapshot.data[index]['telephone_utilisateur']}'),
                                        ),
                                        // DATE DE NAISSANCE
                                        OneEditInfo(
                                          info: 'Date de naissance:',
                                          field: EdiInfo(
                                              initial:
                                                  '${snapshot.data[index]['age_utilisateur']}'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            }
                            return CircularProgressIndicator();
                          },
                        ),
                      ),
                      // BUTTON
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed('edit');
                        },
                        child: Container(
                            // height: 50,
                            width: 100,
                            // color: Colors.pink,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Icon(Icons.done, color: Colors.white),
                                ),
                                Expanded(
                                    flex: 4,
                                    child: Text(
                                      'Enregistrer',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white),
                                    )),
                              ],
                            )),
                      ),
                    ],
                  )),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}

Widget buildName(BuildContext context) => Column(
      children: [
        Text('jamel'),
      ],
    );
// List keyy = (user.keys).toList();
int search(String val) {
  int v = user[0].forEach((k, v) => v ? k == val : k);
  return v;
}

Future buildDialog(BuildContext context, String status) => showDialog(
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          status,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          textAlign: TextAlign.start,
        ),
//we don't need the content now
/*         content:Container(
          color: Colors.pink,
          height: 300,
          child: BetterPlayer.network(
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
    betterPlayerConfiguration: BetterPlayerConfiguration(
      aspectRatio: 16/9,
      // looping: true,
      // autoPlay: true,
      fit: BoxFit.contain,
      
    ),),
        ), */
      );
    },
    context: context);

Future buildDialogPlus(
        BuildContext context, String status, String root, String val) =>
    showDialog(
        builder: (BuildContext context) {
          return AlertDialog(
            actions: [
              MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: Colors.black,
                  onPressed: () {
                    Navigator.of(context).pushNamed(root);
                  },
                  child: Text(
                    val,
                    style: TextStyle(color: Colors.white),
                  ))
            ],
            title: Text(
              status,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),
          );
        },
        context: context);
