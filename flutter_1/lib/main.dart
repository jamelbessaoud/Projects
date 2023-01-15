import 'package:flutter_1/mobile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_1/Test1.dart';
import 'package:flutter_1/one.dart';
import 'package:flutter_1/two.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import "package:http/http.dart" as http;
import 'dart:convert';
// import 'package:dropdown_search/dropdown_search.dart';

// ignore_for_file: prefer_const_constructors
//or go analyses......yal and pubspec.yal file and remove the two line 
//to remove the blue line error 

void main() {
//runApp :it is an widget ,MaterialApp :it is an widget 

  runApp(MyApp());
}

//statefullwidget or statelesswidget 
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(//MaterialApp is the principal widget
      debugShowCheckedModeBanner: false,
      // home:Text('hellow jamel'),//it just a print a text in the page 
      home:MobileFirst(),

      // declar routes to use it 
      routes: {
        'one' :(context) => One(),
        'two' :(context) => Two(),
        'main' :(context) => Nav1(),

        'singUp' :(context) => Mobile1(),
        'logIn' :(context) => Mobile2(),
        'offer' :(context) => Mobile3(),
        'cours' :(context) => Mobile4(),
        'session' :(context) => Mobile5(),
        'evaluation' :(context) => Mobile6(),
        'profil' :(context) => Mobile7(),
        'edit' :(context) => Mobile8(),
/*         'SINGUP' :(context) => Desk1(),
        'LOGIN' :(context) => Desk2(),
        'OFFER' :(context) => Desk3(),
        'COURS' :(context) => Desk4(),
        'SESSION' :(context) => Desk5(),
        'EVALUATION' :(context) => Desk6(), */

      
      },

    );
  }
}
class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {


    return Scaffold(//Scaffold: it segment the page to parts 
      appBar: AppBar(),
      drawer: Drawer(),
      body  : Text(
          'home page' ,
          style:TextStyle(
              fontSize: 150,
              color:Colors.greenAccent,
              fontWeight: FontWeight.bold,
              letterSpacing:10,
              wordSpacing:20,
              decoration: TextDecoration.lineThrough,
              shadows: [Shadow(color: Colors.blueAccent,blurRadius: 5,offset:Offset(5,5) )])),//o,r,g,b
    );

  }

}

class LoginPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(//it segment the page to parts 
      appBar: AppBar(),
      drawer: Drawer(),
      body  : Text('login page ',style: TextStyle(fontSize: 40,color:Colors.pinkAccent[400] ,fontWeight: FontWeight.w700),),
    );

  }

}

//texts properties and decoration border ,alignment ,shadow ......
class OtherPage extends StatelessWidget{
  @override

  Widget build(BuildContext context){
    return Scaffold(
      //scaffolds proprties 
      appBar: AppBar(),
      drawer: Drawer(),
      body:Container(

        //containers proprties 

        height:double.tryParse('270'),
        width:double.infinity,
        // margin:EdgeInsets.all(20),
        margin:EdgeInsets.symmetric(vertical: 30,horizontal: 70),
        // margin:EdgeInsets.only(right: 20) ,
        padding:EdgeInsets.all(20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.greenAccent,blurRadius: 10,offset: Offset(10,10),)],//spreadRadius: 20
            image: DecorationImage(image: AssetImage('images/background.webp',),
              fit:BoxFit.fill,),//repeat:ImageRepeat.noRepeat
            /* image:DecorationImage(image: NetworkImage('https://cdn.pixabay.com/photo/2018/10/23/03/10/abstract-3766886__480.jpg'),
                                               fit: BoxFit.fill) , */
            border: Border.all(width: 10,color: Colors.blueAccent),
/*                       border: Border(left: BorderSide(color: Colors.blueAccent,width: 20),
                                      right: BorderSide(color:Colors.blueAccent,width: 20),
                                      top: BorderSide(color:Colors.greenAccent,width: 30),
                                      bottom: BorderSide(color:Colors.greenAccent,width: 30)), */
            color: Colors.pinkAccent,
            // borderRadius: BorderRadius.circular(20),
/*                       borderRadius:BorderRadius.only(bottomRight:Radius.circular(20),
                                                      topLeft: Radius.circular(20)) */
            borderRadius: BorderRadius.horizontal(left: Radius.circular(20),
                right: Radius.circular(400)
              //the bottom ,controlle the top and the bottom of the
            )
        ),


        child: Text('jamel Bessaoud' ,//texts proprties
          style: TextStyle(fontSize: 80,//styles proprties
              color: Colors.greenAccent,
              shadows: [Shadow(color: Colors.blueAccent,
                  blurRadius: 5,
                  offset: Offset(5,5))],
              // backgroundColor: Colors.white,
              wordSpacing: 10,
              letterSpacing: 5,
              decoration:TextDecoration.underline ),),) ,


    );

  }


}

class OtherPage1 extends StatelessWidget{
  @override

  Widget build(BuildContext context){
    return Scaffold(
      //scaffolds proprties 
      appBar: AppBar(),
      drawer: Drawer(),
      body:Container(

        margin: EdgeInsets.all(100),
        decoration: BoxDecoration(
            border:Border.all(color: Colors.yellowAccent,width: 5,)
        ),
        child: Image.asset('images/background.webp',
          width: 1000,
          height: 1400,
          fit: BoxFit.cover,),),);
/*       body:Image.asset('images/background.webp',
                        width: 1200,
                        height: 480,
                        fit: BoxFit.cover,),); */
  }
}


class CardPage extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      //scaffolds proprties 
      appBar: AppBar(),
      drawer: Drawer(),
//the container and the card are the same , but the card is may be contaire for another widget 
      body:Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),
            side: BorderSide(color: Colors.black,width: 5)),
        elevation: 100,
        shadowColor: Colors.deepPurple,
        child: Text('hellow jamel',
          style:TextStyle(color:Colors.purpleAccent ,fontSize:50 ,),
          textAlign:TextAlign.center,),),);
//and it maybe ther a few widget fast to use here 
  }
}

class ColumnPage extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      //the columns is  widget master because it might containes more than one widget
      //columns takes the whole heigth of page ,widthe => depand content  
      appBar: AppBar(),
      drawer: Drawer(),

      body:Column(children: [
        Text('login',textAlign: TextAlign.center,style: TextStyle(fontSize: 100),),
        Text('jamel bessaoud ',style: TextStyle(fontSize: 40),),
        Text('from medenine',style: TextStyle(color: Colors.pinkAccent,fontSize: 40)),
        Image.asset('images/background.webp')


      ],),);

  }
}


class ColumnPage1 extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      //the columns is  widget master because it might containes more than one widget

      appBar: AppBar(),
      drawer: Drawer(),
//************the main axis here is veritical********* 
      body:Container(
          width:double.infinity,
          //alignment: Alignment.center,
          //alignment: Alignment.center,
          color: Colors.black,

          child:Column(mainAxisAlignment: MainAxisAlignment.end,//equal space between the defferent widget there is end and start ....
            //mainAxisAlignment: MainAxisAlignment.center,
            //mainAxisSize:MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.end,
            //it takes the minimal sise  or the max
            children: [
              Text('login',textAlign: TextAlign.center,style: TextStyle(color: Colors.pinkAccent,fontSize: 100),),
              Text('jamel bessaoud ',style: TextStyle(color: Colors.pinkAccent,fontSize: 40),),
              Text('from medenine',style: TextStyle(color: Colors.pinkAccent,fontSize: 40)),
              //Image.asset('images/background.webp')
//columns takes the whole heigth of page ,widthe => depand content(depend the widget that inside it)
//disable the 'image' to test it 
            ],)

      ),);

  }
}

class RowPage extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      //the row is  widget master because it might containes more than one widget

        appBar: AppBar(),
        drawer: Drawer(),
//************the main axes here is horizontal*********  
        body:Container(

            width:double.infinity,
            // height:double.infinity ,
            color: Colors.black,
            child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('login',textAlign: TextAlign.center,style: TextStyle(color: Colors.pinkAccent,fontSize: 100),),
                  Text('jamel bessaoud ',style: TextStyle(color: Colors.pinkAccent,fontSize: 40),),
                  Text('from medenine',style: TextStyle(color: Colors.pinkAccent,fontSize: 40)),

                ])));

  }
}

class StackPage extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Scaffold(


        appBar: AppBar(),
        drawer: Drawer(),
        body:Container(//in this case ,container is the 'father' of stack
          width: 500,
          height: 2500,
          color: Colors.black,
          child: Stack(

            alignment:Alignment.center ,

            children: [
              Container(width: 200,height: 200,color: Colors.red,child: Text('first'),),
              Container(margin:EdgeInsets.only(top: 30),width: 100,height: 100,color: Colors.blue,child: Text('second'),),
              Container(margin:EdgeInsets.only(top: 60),width: 50,height: 50,color: Colors.green,child: Text('third'),),

            ],),
        ));

  }
}


class StackPage1 extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Scaffold(


        appBar: AppBar(),
        drawer: Drawer(),
        body:Container(//in this case ,container is the 'father' of stack
          width: 500,
          height: 500,
          color: Colors.black,
          child: Stack(

            clipBehavior:Clip.none,//the make the part that passed the border visibil ,the 'overflow' ''changed'' to 'clipbehavior'
            children: [
              Positioned(//we can use more '''than one position'''
                top: 450,
                left: 100,
                right: 100,
                height: 200,
                //bottom: 20,
                child: Container(color: Colors.red,child: Text('is the placeholder text used in design when creating content. It helps designers plan out where the content will sit, without needing to wait for the content to be written and approved. It originally comes from a Latin is the placeholder text used in design when creating content. It helps designers plan out where the content will sit, without needing to wait for the content to be written and approved. It originally comes from a Latin is the placeholder text used in design when creating content. It helps designers plan out where the content will sit, without needing to wait for the content to be written and approved. It originally comes from a Latin is the placeholder text used in design when creating content. It helps designers plan out where the content will sit, without needing to wait for the content to be written and approved. It originally comes from a Latin '),),)



            ],),
        ));

  }
}

class ExpandedPage extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Scaffold(

      //expand takes the space as much as he can  
      //if the container does't ''has any thing'' ,it will takes the ''whole heigth of the screen'' 
        appBar: AppBar(),
        drawer: Drawer(),
        body:Row(
          children: [//the flex enable us to give space for a specific one than one
            Expanded(flex: 2,child: Container(child: Text('jamel'),color: Colors.red,height: double.infinity,),),
            Expanded(flex:1,child:Container(child: Text('ahmed'),color: Colors.green,height: double.infinity,),),
            // Container(child: Text('ahmed'),color: Colors.green,),
            Expanded(flex:1,child: Container(child: Text('khaled'),color: Colors.blue,height: double.infinity,),),


          ],


        ));

  }
}
//we can use the ''expanded ''with the ''column'' too 

class IconcnPage extends StatelessWidget{
  @override

  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(),
        drawer: Drawer(),
        body: Container(

          decoration:BoxDecoration(
              color: Colors.blueAccent,
              border:Border.all(width: 10),
              borderRadius: BorderRadius.circular(5)
          ),

          child: Row(

            children: [
              Icon(Icons.shop,size: 100,color: Colors.greenAccent),
              Icon(Icons.shop,size: 100,color: Colors.greenAccent),
            ],
          ),
        ));
//flutter material desing icons
  }
}

class DeviderPage extends StatelessWidget{
  @override


// divider add a horizontal line 
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(),
        drawer: Drawer(),
        body: Container(
            height: 100,
//if we use row the line will be ''vertical'' vertical devider
          child: Row(children: [

            Text('jamel',style: TextStyle(fontSize: 50),),
            VerticalDivider(color: Colors.pink.shade900,thickness:5),
            Text('bessaoud',style: TextStyle(fontSize:50),)
          ]),
        )
    );
//flutter material desing icons

  }
}



class ExamplePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
        drawer: Drawer(),
        body: Container(
          //margin: EdgeInsets.only(top: 200,bottom: 200,left: 30,right: 30),
          padding: EdgeInsets.symmetric(horizontal: 30),//correction and fontweiht : bold
          alignment: Alignment.center,
          child: Column(mainAxisAlignment: MainAxisAlignment.center,children:[
            //first part
            Container(
              padding: EdgeInsets.all(5),
              width: 400,

              alignment: Alignment.center,
              decoration:BoxDecoration(
                    color: Colors.blueAccent,
                    border:Border.all(width: 5,color: Colors.black),) ,
              child:Text('Strawberry Pavlova Recipe',style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),),),

            //second part
            //extAlign: TextAlign.center && hight
            Container(width: double.infinity,alignment: Alignment.center,padding: EdgeInsets.symmetric(vertical: 20),child: Text('A top favourite with all ages. Traditionally the inside of the meringue is soft and marshmallow-like and the outside is crisp. Don’t worry if the Pavlova cracks on the top – this is all part of its charm.',
                                style: TextStyle(fontSize: 20,height: 1.5),textAlign: TextAlign.center,),),

            //third part
            Container(
              padding: EdgeInsets.only(top: 10,bottom: 15),
              decoration: BoxDecoration(
                border: Border.all(width: 3,color: Colors.grey),

              ),
              child: Column(

                    children: [

                      //the review part
                      //replace spaceevently bu spaceaound ///
                      Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
//and we can replace the mainaxisallignement by adding container and use padding ,margin
//spacier is alike expanded
                        children: [
                        Row(children: [
                          Icon(Icons.star_rate_sharp,color: Colors.yellow,),
                          Icon(Icons.star_rate_sharp,color: Colors.yellow,),
                          Icon(Icons.star_rate_sharp,color: Colors.yellow,),
                          Icon(Icons.star_rate_sharp,color: Colors.black,),
                          Icon(Icons.star_rate_sharp,color: Colors.black,),


                        ],),
                        Text('17 review')

                      ],),
                      //between of them



                        Divider(height: 20,color: Colors.white,),


                      //the icon part
                      //it better put the'''' row in container'''' to add the margin and the padding easily
                      Container(
                        child: Row(children: [
                          //the first goupe of the icons
                          Expanded(child: Column(children: [
                            Icon(Icons.restaurant,color: Colors.green.shade800,),
                            Text('Feed'),
                            Text('2 - 4')

                          ],),),


                          //the second group of the icons
                          Expanded(flex: 2,child: Column(children: [

                            Icon(Icons.category,color: Colors.green.shade800,),
                            Text('Feed'),
                            Text('2 - 4')

                          ],),),


                          //the third group of the icons
                          Expanded(child:Column(children: [

                            Icon(Icons.emoji_food_beverage_rounded,color: Colors.green.shade800,),
                            Text('Feed'),
                            Text('2 - 4')

                          ],),)




                        ],),
                      ),
                    ],


              ),
            )




          ]),),




    );


  }


}


class IndexedPage extends StatelessWidget{

  @override

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      body: IndexedStack(
        index: 02,//it's nice ,it choose the widget based on the index
        children: [
          Container(color: Colors.red,width: 100,),
          Container(color: Colors.yellow,width: 100,),
          Container(color: Colors.blue,width: 100,),
          Container(color: Colors.green,width: 100,),

        ],

      ),
    );

  }

}



class WrapdPage extends StatelessWidget{

  @override

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      body: Wrap(
        direction:Axis.vertical,//it's resolves the probleme when the space is not enought
        //vertical and horizontal
        children: [
          Container(color: Colors.red,width: 100,height: 100,),
          Container(color: Colors.yellow,width: 100,height: 100,),
          Container(color: Colors.blue,width: 100,height: 100,),
          Container(color: Colors.green,width: 100,height: 100,),
          Container(color: Colors.green,width: 100,height: 100,),
          Container(color: Colors.blue,width: 100,height: 100,),
          Container(color: Colors.yellow,width: 100,height: 100,),
          Container(color: Colors.red,width: 100,height: 100,),
          Container(color: Colors.red,width: 100,height: 100,),
          Container(color: Colors.yellow,width: 100,height: 100,),
          Container(color: Colors.blue,width: 100,height: 100,),
          Container(color: Colors.green,width: 100,height: 100,),


        ],

      ),
    );

  }

}


class ScrollPage extends StatelessWidget{

  @override

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      body: SingleChildScrollView(
        scrollDirection:Axis.vertical,//here is defferent ,it not return to a new line
        //but we can scroll the specific wedget,horizontam with Row ,vertical with colums
        child: Column(
        children: [
          Container(color: Colors.red,width: 100,height: 100,),
          Container(color: Colors.yellow,width: 100,height: 100,),
          Container(color: Colors.blue,width: 100,height: 100,),
          Container(color: Colors.green,width: 100,height: 100,),
          Container(color: Colors.green,width: 100,height: 100,),
          Container(color: Colors.blue,width: 100,height: 100,),
          Container(color: Colors.yellow,width: 100,height: 100,),
          Container(color: Colors.red,width: 100,height: 100,),
          Container(color: Colors.red,width: 100,height: 100,),
          Container(color: Colors.yellow,width: 100,height: 100,),
          Container(color: Colors.blue,width: 100,height: 100,),
          Container(color: Colors.green,width: 100,height: 100,),


        ],)

      ),
    );

  }
}//there is a widget '''sizebox''' it jus contain the width and the height ,except the color

class SizedPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      body: Row(

        children: [
          Container(color: Colors.red, width: 100, height: 100,),
          SizedBox(height: 100, width: 100,),
          Container(color: Colors.yellow, width: 100, height: 100,),


        ],

      ),
    );
  }
}

//Center(),it is a widget make the containt in the center of the father widget 
class CenterPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      body: Container(
        color: Colors.yellow,
        height: 600,
        width: 600,
        margin: EdgeInsets.symmetric(horizontal: 50,vertical: 50),
        
        //if the container empty and don't has any demension ,it will take the whole page 
            child: Center(child: Text('helldddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddhelldddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddhellddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddodddddddddddddddddddddddddddodddddddddddddddddddddddddddo'),
            ),),);
    
  }
}
///* butons  */
class ButtonPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      body: Center(
        //widthFactor: 1,
        child: MaterialButton(
          //there is a widget '''ElevatedButoon.icon''' it has an ''icon'' withe ''text'' 
          //there is a widget '''MaterialButton''' easy than the other it not have the ''style'' proprerti
          //there si s widget '''textbutton''' it hase '''style:textbutton.forme()'''
          //IconButton too
          //InkWell
          //floatActionButton :the button still fix when i scroll the page 
          //geusterdetector : has a lot of function more than others  up , down ,cancel ,start ,end 
          color: Colors.greenAccent,
          splashColor: Colors.blueAccent,
          animationDuration: Duration(seconds: 30),
          onLongPress: (){
                print('it the funtion of the long press');
            },
            //this is better than bouttonstyle  (the properties name easy)
/*             style: ElevatedButton.styleFrom(
              elevation: 20,
              primary: Colors.greenAccent,
              padding: EdgeInsets.symmetric(horizontal:15,vertical: 20 ),
              shadowColor: Colors.blueAccent,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              //text style
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
              )

            ), */

/*           style: ButtonStyle(
            // shape: RoundedRectangleBorder(borderRadius:BorderRadius.all(20) ),   
            backgroundColor: MaterialStateProperty.all(Colors.amber),
              elevation:MaterialStateProperty.all(40)  ,
              
          ), */
          onPressed: (){
          print('HELLO JAMEL');

        }, child:Container(
          //margin: EdgeInsets.symmetric(horizontal: 50),
          width: 70,//we need the width when we use the expanded and we can delete that(mainAxisSize:MainAxisSize.min,)
          child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [

            Expanded(flex:1,child: Icon(Icons.badge,),),
            Expanded(flex:2,child:Text('HOME',textAlign:TextAlign.end,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),) ,

          ],),
        ),),));
    
  }
}


//Center(),it is a widget make the containt in the center of the father widget 
class FieldPage extends StatelessWidget {
TextEditingController user = new TextEditingController();
String value="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      // drawer: Drawer(),
      body:
      Container(
        //the first container 
        width: double.infinity,
        //margin: EdgeInsets.symmetric(vertical: 50,horizontal: 50),



        child:Column(children: [
          //the header text 
          Container(margin: EdgeInsets.symmetric(vertical: 50,horizontal: 50),child:Text('Sing up',style: TextStyle(fontSize:60,color: Colors.blue),),),





          //the body,the main container of this part 
          Container(margin: EdgeInsets.only(top: 50,bottom: 50,left: 30,right: 30),
          width: double.infinity,

          
          
          
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            

            //the name field 
            Container(child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                            //Text('First name:',style: TextStyle(fontSize:30,color: Colors.black),),
                            TextFormField(
                              onTap: (){//it run one focused on the field 
                                print('you just focused know ');
                              },
                              
                              //this fuction can give the stirng after each one 
                              onChanged: (String){
                                // the setState() not working 
                                print('the content of field changed to :$String');
/*                                 setState((){
                                  value = String;
                                }
                                ); */

                              },

                              onEditingComplete: (){
                                print('the editing is finished');
                              },
                              //maxLength: 222,
                                  //maxLines: 2,
                              // readonly
                              //textinput action 
                              //text
                              //we can get the information that user put (make a button to print the content )
                              controller: user,

                              textInputAction: TextInputAction.next,
                              //obscureText: true,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(hintText:'Enter your First name' ,
                            prefixIcon: Icon(Icons.emergency_rounded)    ,                      
                            labelText:'First name:' ,
                            labelStyle: TextStyle(fontSize:30 ),
                            //suffix in the end 
                            //fill = true
                            //the 4 case of input
                            //if we add border ,it will word on the all cases
                            //we can add the icon in the decoration ,befor the field 
                            //keybord type (we can choose it just a number keybord )
                            
                            enabled: true,
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.red)),
                              
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.blue,width: 3)),  

                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.blue,width: 3)),

                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.red.shade600,width: 3)), 
                            ),),


                              //test botton ,we can get the information that put by user 
                              MaterialButton(onPressed:(){
                              print(user);
                              },
                              child:Text('get the content',),),


                              //get the value that puts in the field
                              
                              Text('the content:$value'),
            
            
            ],),)



          ],),)
        ]),
      
      
      ),
      );
    
  }
}


//validator 
class ValidPage extends StatelessWidget {
TextEditingController user = new TextEditingController();
String value="";

  @override
  Widget build(BuildContext context) {
var phone;
var name;
    GlobalKey<FormState> forma = new GlobalKey<FormState>();
    send(){
      var formate = forma.currentState;
      
      if(formate!.validate()){
        formate.save();
        print('$name');
        print('$phone');
      }
      else{
        print('not valid');
      }
    }
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      body:
      Form(
        autovalidateMode:AutovalidateMode.always,
      key: forma, 
        child:Column(children: [
              TextFormField(
                // we have another function onSave ,it save it the field valid and we use formate.save
                  onSaved: (text){
                    name = text;
                  },
                  validator:(string){
                      if(string!.length! <= 4){//we need to use ! to avoid the error 
                        return('the length of this must be > 3');
                      }

                    },
                          decoration:InputDecoration(
                            label:Text('name') ,



                            enabled: true,
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.red)),
                              
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.blue,width: 3)),  

                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.blue,width: 3)),

                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.red.shade600,width: 3)), 
                          
                          
                          
                          
                          ) ,
                            
                            ),


              TextFormField(
                onSaved: (text){
                  phone = text;
                },
                    validator:(string){
                      if(string!.length! <= 10){//we need to use ! to avoid the error 
                        return('the length of this must be > 10');
                      }

                    },
                          decoration:InputDecoration(
                            label:Text('phone') ,



                            enabled: true,
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.red)),
                              
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.blue,width: 3)),  

                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.blue,width: 3)),

                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.red.shade600,width: 3)), 
                          
                          
                          
                          
                          ) ,
                            
                            ),                            
                            MaterialButton(onPressed:send,
                            child: Text('send'),)
                            ]),


                              //test botton ,we can get the information that put by user 
    



              )
      );

    
  }
}


// ******* the page1 (sing up )**********
class Page1 extends StatefulWidget {
  Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => Page1State();
}

/* class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
} */
// i chage the class to fulwidget ,to can use setState

class Page1State extends State<Page1> {
TextEditingController user = new TextEditingController();
  @override
  Widget build(BuildContext context) {
        bool pss = true;
    GlobalKey<FormState> data= new GlobalKey<FormState>();
    send(){
      var dataa =data.currentState;
      if(dataa!.validate()){
          print('valide');
        
      }else{
        print('not valid');
      }

      }
    return Scaffold(
      // appBar: AppBar(),
      // drawer: Drawer(),
      body:Form(
        key: data,
        child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child:Container(
          //the first container 
          width: double.infinity,
          //margin: EdgeInsets.symmetric(vertical: 50,horizontal: 50),



          child:Column(children: [
            //the header text 
            Container(alignment: Alignment.center,margin: EdgeInsets.only(top:100),child:Text('S\'inscrire',style: TextStyle(fontSize:25,color: Colors.blue),textAlign:TextAlign.center,),),





            //the body,the main container of this part 
            Container(margin: EdgeInsets.only(top: 50,bottom: 50,left: 10,right: 10),
            width: double.infinity,

            
            
            
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
              


              //the name field 
              Container(padding: EdgeInsets.only(bottom: 20),child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                              //Text('First name:',style: TextStyle(fontSize:30,color: Colors.black),),
                              TextFormField(
                                // autovalidateMode:AutovalidateMode.always ,
                                validator: (Stringg){
                                  String pattern = r'[a-zA-Z]{3,20}';
                                  var regle =RegExp(pattern);
                                        if(! (regle.hasMatch(Stringg!))){
                                          return('le Nom doit être inférieur ou égal à 20 lettres');
                                        }
                                                                  },
                                textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                              hintText:'Entrez votre name' ,
                              hintStyle:TextStyle(color: Colors.black) ,
                              prefixIcon: Icon(Icons.person,color: Colors.orange.shade500,) ,                      
                              labelText:'Name:' ,
                              labelStyle: TextStyle(fontSize:15,color: Colors.orange.shade500 ),
                              
                              enabled: true,
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.red)),
                                
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.blue,width: 1)),  

                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.blue,width: 1)),

                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.pink.shade600,width: 1)), 
                              ),),
              ],),),



              //the Last name field 
              Container(padding: EdgeInsets.only(bottom: 20),child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                              //Text('First name:',style: TextStyle(fontSize:30,color: Colors.black),),
                              TextFormField(

                                // autovalidateMode:AutovalidateMode.always ,
                                validator: (Stringg){
                                  String pattern = r'[a-zA-Z]{3,20}';
                                  var regle =RegExp(pattern);
                                        if(!(regle.hasMatch(Stringg!))){
                                          return('le nom de famille doit être inférieur ou égal à 20 lettres');
                                        }
                                                                  },


                                textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                              hintText:'Entrez votre prénom' ,
                              hintStyle: TextStyle(color: Colors.black),
                              prefixIcon: Icon(Icons.person,color: Colors.orange.shade500,)    ,                      
                              labelText:'prénom:' ,
                              labelStyle: TextStyle(fontSize:15,color: Colors.orange.shade500, ),
                              
                              enabled: true,
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.red)),
                                
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.blue,width: 1)),  

                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.blue,width: 1)),

                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.red.shade600,width: 1)), 
                              ),),
              ],),),


              //the Email field 
              Container(padding: EdgeInsets.only(bottom: 20),child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                              //Text('First name:',style: TextStyle(fontSize:30,color: Colors.black),),
                              TextFormField(
                                
                                // autovalidateMode:AutovalidateMode.always ,
                                validator: (Stringg){
                                  String pattern = r'[a-zA-Z]{4,15}[0-1]*@[a-z]+ . [a-z]+';
                                        if(Stringg!.length < 10){
                                          return('la longueur de l\'email doit tre d\'au moins 11 lettres');
                                        }
                                                                  },

                                textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                              hintText:'Entrez votre Email' ,
                              hintStyle: TextStyle(color: Colors.black),
                              prefixIcon: Icon(Icons.mail,color: Colors.orange.shade500,)    ,                      
                              labelText:'Email:' ,
                              labelStyle: TextStyle(fontSize:15 ,color: Colors.orange.shade500,),
                              
                              enabled: true,
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.red)),
                                
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.blue,width: 1)),  

                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.blue,width: 1)),

                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.red.shade600,width: 1)), 
                              ),),
              ],),),


              //the Password field 
              Container(padding: EdgeInsets.only(bottom: 20),child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                              //Text('First name:',style: TextStyle(fontSize:30,color: Colors.black),),
                              TextFormField(
                                

                                // autovalidateMode:AutovalidateMode.always ,
                                validator: (String){
                                        if(String!.length < 8 || String.isEmpty){
                                          return('le mot de passe doit être d\'au moins 8 lettres');
                                        }
                                                                  },

                                textInputAction: TextInputAction.next,
                                obscureText: pss,
                                keyboardType: TextInputType.visiblePassword,
                                decoration: InputDecoration(
                                hintText:'Entrez votre mot de pass' ,
                                hintStyle: TextStyle(color: Colors.black),
                                prefixIcon: Icon(Icons.key_rounded,color: Colors.orange.shade500,),  
                                suffixIcon: IconButton(
                                    onPressed: (){
                                    setState(() {
                                    pss = false;
                                                });
                                                },                                
                                    icon : pss 
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.visibility),  
                                                  ),
                              labelText:'Mot de pass:' ,
                              labelStyle: TextStyle(fontSize:15 ,color: Colors.orange.shade500,),
                              
                              enabled: true,
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.red)),
                                
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.blue,width: 1)),  

                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.blue,width: 1)),

                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.red.shade600,width: 1)), 
                                ),),
              ],),),            


              //the Phone field 
              Container(padding: EdgeInsets.only(bottom: 20),child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                              //Text('First name:',style: TextStyle(fontSize:30,color: Colors.black),),
                              TextFormField(

                                // autovalidateMode:AutovalidateMode.always ,
                                onChanged: (Stringg){

                                },
                                validator: (Stringg){
                                  String pattern = r'[0-9]{8}';
                                  var regle =RegExp(pattern);
                                /**/ 
                                
                              
                                

                                        if(!(regle.hasMatch(Stringg!))){
                                          print(Stringg.toString());
                                          return('Le numéro de téléphone n\'est pas valide');
                                        }
                                                                  },

                                textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                              hintText:'Entre votre Phone' ,
                              hintStyle: TextStyle(color: Colors.black),
                              prefixIcon: Icon(Icons.phone_android,color: Colors.orange.shade500,)    ,                      
                              labelText:'Phone:' ,
                              labelStyle: TextStyle(fontSize:15 ,color: Colors.orange.shade500,),
                              
                              enabled: true,
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.red)),
                                
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.blue,width: 1)),  

                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.blue,width: 1)),

                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.red.shade600,width: 1)), 
                              ),),
              ],),),


              //the Date of birth field 
              Container(child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                              //Text('First name:',style: TextStyle(fontSize:30,color: Colors.black),),
                              TextFormField(
                                validator: (Stringg){
                                  String pattern = r'[0-9]{1,2}/[0-9]{1,2}/[1-9]{4}';
                                  var regle =RegExp(pattern);
                                  if (!(regle.hasMatch(Stringg!))  || Stringg!.isEmpty){
                                    return('ça doit être comme ça DD/MM/YYYY');
                                  }

                                },
                                
                                textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                              hintText:'Entrez votre date de naissance' ,
                              hintStyle: TextStyle(color: Colors.black),
                              prefixIcon: Icon(Icons.date_range,color: Colors.orange.shade500,)    ,                      
                              labelText:'date de naissance:' ,
                              labelStyle: TextStyle(fontSize:15 ,color: Colors.orange.shade500,),
                              
                              enabled: true,
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.red)),
                                
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.blue,width: 1)),  

                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.blue,width: 1)),

                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.red.shade600,width: 1)), 
                              ),),
              ],),),            


            ],),),
          
          
          //the button  
            Container(width: double.infinity,
            
            margin: EdgeInsets.symmetric(horizontal: 10),
            child:MaterialButton(
              shape:RoundedRectangleBorder(
                borderRadius:BorderRadius.circular(20) ) ,
              padding: EdgeInsets.all(10),
              color: Colors.blue.shade700,
              onPressed:send,
            child:Text('Rejoignez gratuitement',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),) ,),),

            //the other case 
            Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                Container(child:Text('Vous avez déjà un compte ?',style: TextStyle(fontSize:18,color: Colors.black54),),),
                Container(child:Text('Connexion',style: TextStyle(fontSize:18,color: Colors.black,fontWeight: FontWeight.bold),),),

            ],),


          ]),
        
        
        ),),
      )
      );
    
  }
}


//page 2

class Page2 extends StatelessWidget {
TextEditingController user = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      // drawer: Drawer(),
      body:SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child:Container(
        margin: EdgeInsets.only(top: 100),
        //the first container 
        width: double.infinity,
        //margin: EdgeInsets.symmetric(vertical: 50,horizontal: 50),



        child:Column(children: [
          //the header text 
          Container(margin: EdgeInsets.only(left: 10,right: 10,top:100),child:Text('Bienvenu',style: TextStyle(fontSize:25,color: Colors.blue),),),





          //the body,the main container of this part 
          Container(margin: EdgeInsets.only(top: 50,bottom: 50,left: 10,right: 10),
          width: double.infinity,

          
          
          
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            


            
            //the Email field 
            Container(padding: EdgeInsets.only(bottom: 20),child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                            //Text('First name:',style: TextStyle(fontSize:30,color: Colors.black),),
                            TextFormField(
                              
                              textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(hintText:'Entrez votre Email' ,
                            hintStyle: TextStyle(color: Colors.black),
                            prefixIcon: Icon(Icons.mail,color: Colors.orange.shade500)    ,                      
                            labelText:'Email:' ,
                            labelStyle: TextStyle(fontSize:15 ,color: Colors.orange.shade500),
                            
                            enabled: true,
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.red)),
                              
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.blue,width: 1)),  

                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.blue,width: 1)),

                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.red.shade600,width: 1)), 
                            ),),
            ],),),


            //the Password field 
            Container(padding: EdgeInsets.only(bottom: 20),child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                            //Text('First name:',style: TextStyle(fontSize:30,color: Colors.black),),
                            TextFormField(
                              
                              textInputAction: TextInputAction.next,
                              obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(hintText:'Entrez votre mot de pass' ,
                            hintStyle: TextStyle(color: Colors.black),
                            prefixIcon: Icon(Icons.key_rounded,color: Colors.orange.shade500)    ,                      
                            labelText:'Mot de pass:' ,
                            labelStyle: TextStyle(fontSize:15,color: Colors.orange.shade500),
                            
                            enabled: true,
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.red)),
                              
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.blue,width: 1)),  

                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.blue,width: 1)),

                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.red.shade600,width: 1)), 
                            ),),
            ],),),            



          ],),),
        
        
        //the button  
          Container(width: double.infinity,
          
          margin: EdgeInsets.symmetric(horizontal: 10),
          child:MaterialButton(
            shape:RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.all(10),
            color: Colors.blue.shade700,
            onPressed:(){

          },
          child:Text('Connexion',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),) ,),),

          //the other case 
          Row(mainAxisAlignment: MainAxisAlignment.center,children: [
              Container(child:Text('Vous n’avez pas de compte?',style: TextStyle(fontSize:18,color: Colors.black54),),),
              Container(child:Text('S’iscrire',style: TextStyle(fontSize:18,color: Colors.black,fontWeight: FontWeight.bold),),),

          ],),


        ]),
      
      
      ),)
      );
    
  }
}

//************** */ statefull widget **********

class Test extends StatefulWidget{
  State<StatefulWidget> createState(){
    return TestState();
  }
}
class TestState extends State<Test>{
  var text='click';
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(),
        drawer: Drawer(),
        body: Center(child:Column(mainAxisAlignment: MainAxisAlignment.center,children: [
          Text('$text',style: TextStyle(fontSize: 50),),
          MaterialButton(
            child: Text('click'),
            onPressed: (){
              setState(() {//the set state make a rebuild for the widget ,and print the new content 
//it just work withe the stateFULwidget
//it make a refrech just for a part of the page (reload the page )
                text = 'changed';  
                print('$text');                
              });

            }),



        ],) ),
      );
  }
}
// or this structure (it is the same )
/* class Test2 extends StatefulWidget {
  Test2({Key? key}) : super(key: key);

  @override
  State<Test2> createState() => _Test2State();
}

class _Test2State extends State<Test2> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
} */

// drop down button 

class Test1 extends StatefulWidget{
  State<StatefulWidget> createState(){
    return Test1State();
  }
}
// radio

// checkbox

// switch

class SwitchPage extends StatefulWidget {
  SwitchPage({Key? key}) : super(key: key);

  @override
  State<SwitchPage> createState() => _SwitchState();
}

class _SwitchState extends State<SwitchPage> {
  bool val=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      body: Center(
        child: Row(mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Text('DARK MODE'),
            Switch(
              activeTrackColor: Colors.greenAccent,
              activeColor: Colors.blueAccent,
              inactiveTrackColor: Colors.black,
              inactiveThumbColor: Colors.green,

              value: val,
              onChanged: (test){
              setState(() {
                val=test;
              });
              print('the status of the switch changed');
            },),
          ]

      ),),

    );
  }
}



// switch list til

class SwitchTilPage extends StatefulWidget {
  SwitchTilPage({Key? key}) : super(key: key);

  @override
  State<SwitchTilPage> createState() => _SwitchTilState();
}

class _SwitchTilState extends State<SwitchTilPage> {
  bool val=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      body: Center(
        child: SwitchListTile(
            
            title : Text('DARK MODE',style: TextStyle(fontSize: 20),),
            subtitle: Text('change the status',style: TextStyle(fontSize: 20),),
            isThreeLine: true,
            tileColor: Colors.orange,
            secondary:Icon(Icons.notification_add,),
            controlAffinity:ListTileControlAffinity.trailing,//or trailing

              activeTrackColor: Colors.greenAccent,
              activeColor: Colors.blueAccent,
              inactiveTrackColor: Colors.black,
              inactiveThumbColor: Colors.green,

              value: val,
              onChanged: (test){
              setState(() {
                val=test;
              });
              print('the status of the switch changed');
            },
          

      ),),

    );
  }
}


// switch list til

class ListTilePage extends StatefulWidget {
  ListTilePage({Key? key}) : super(key: key);

  @override
  State<ListTilePage> createState() => _ListTileState();
}

class _ListTileState extends State<ListTilePage> {
  bool val=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
        // color: Colors.red,
        child: ListTile(
          tileColor: Colors.greenAccent,//it's better use the prop of the widget than the parents 
          title: Text('Samsung M51'),
          subtitle:Text('samsung'),
          leading: Icon(Icons.phone_android_outlined),
          trailing: Text('price 300\$'),
          onTap: (){
            print('users tab');
          },
          onLongPress: (){
            print('user long press');
          },


        ),),

    );
  }
}


// circle avatar

class CirclePage extends StatefulWidget {
  CirclePage({Key? key}) : super(key: key);

  @override
  State<CirclePage> createState() => _CircleAvatarState();
}

class _CircleAvatarState extends State<CirclePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      body: Center(
        child: CircleAvatar(//we use this when we need a circle on our designe 
          backgroundImage: AssetImage('images/background.webp'),
          // backgroundColor: Colors.greenAccent,
          radius: 40,
          child:Text('hello'),),),
    );
  }
}

// snack bar
/*
class Snack extends StatefulWidget {
  Snack({Key? key}) : super(key: key);

  @override
  State<Snack> createState() => _SnackState();
}

class _SnackState extends State<Snack> {
  GlobalKey<ScaffoldState> scaffold = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffold,//to get to the prop of the widget(scaffold) ==>to show the snackbar
      body: Center(child: ElevatedButton(
        onPressed: (){
          
          var snack=SnackBar(
            action: SnackBarAction(
              label: 'close',
              onPressed: (){ 
                print('the snackbar closed');
              
              },),  
            onVisible: (){
              print('this snack bar is showing ');
            },
            backgroundColor: Colors.orange,
            behavior: SnackBarBehavior.floating,
            content: Text('this is the snackbar',style: TextStyle(fontSize: 25),),
            duration:Duration(seconds: 5));
          scaffold.currentState?.showSnackBar(snack);
          
        },
        child:Text('click')
      )),
    );
  }
}
*/
// alter dialog

class AlertDia extends StatefulWidget {
  AlertDia({Key? key}) : super(key: key);

  @override
  State<AlertDia> createState() => _AlertDiaState();
}

class _AlertDiaState extends State<AlertDia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      body: Center(
        child:ElevatedButton(
          onPressed: (){
            showDialog(context: context, builder: (context){
              print('this is the contenet : $context');
              return AlertDialog(
                actions: [
                  ElevatedButton(onPressed:(){print('OK');}, child: Text('OK')),
                  ElevatedButton(onPressed:(){print('CANCEL');}, child: Text('CANCEL')),
                ],
                titlePadding: EdgeInsets.only(left: 30,top: 30),
                contentPadding: EdgeInsets.only(left: 40,top: 40,bottom: 40),
                title: Text('Title'),
                content: Text('this is the content of dialog'),
                titleTextStyle: TextStyle(fontSize: 30,color: Colors.blueAccent,fontWeight:FontWeight.bold ),
                contentTextStyle:TextStyle(fontSize: 30,color: Colors.greenAccent,fontWeight:FontWeight.bold),
                backgroundColor: Colors.pinkAccent,
                shape: RoundedRectangleBorder(
                  borderRadius:BorderRadius.circular(10),
                ),
                
              );
            });
          },
          child: Text('click'),)),
    );
  }
}

// LSITVIEW 

class ListVi extends StatefulWidget {
  ListVi({Key? key}) : super(key: key);

  @override
  State<ListVi> createState() => _ListViState();
}

class _ListViState extends State<ListVi> {
  @override
// listview ,takes the whole widthe in axis vertical ,takes the whole height in axis horizontal 
// so put it on a container 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      body : Container(
        //to make it not git the whole page (the widget that inside listview)
      // width:100,axis veritical
      // height: 100,axis horizontal
      child: ListView(
        scrollDirection: Axis.horizontal,
        reverse: true,
        physics:BouncingScrollPhysics() ,//or : ClampingScrollPhysics,NeverScrollableScrollPhysics
        children: [
          Container(color: Colors.red,height: 400,width: 400,),
          Container(color: Colors.blue,height: 400,width: 400,),
          Container(color: Colors.green,height: 400,width: 400,),
          
          ],),
    ));
  }
}

// list view 2
class ListVi2 extends StatefulWidget {
  ListVi2({Key? key}) : super(key: key);

  @override
  State<ListVi2> createState() => _ListVi2State();
}
// it will return the error ,becuse the the listview child will takes the whole page 
class _ListVi2State extends State<ListVi2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      body: Container(
        child: ListView(
          children: [
          Container(color: Colors.red,height: 400,width: 400,),
          Container(
            height: 700,

            child: ListView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              //(shrinkWrap)use it we don't five a height for this list ,but we want to use the height of the content 
              //it better when give a hight for this list 
              //scrollDirection: Axis.vertical,
                children: [
                  Row(
                    children: [
                      Container(color: Colors.purple,height: 200,width: 100,),
                      Container(color: Colors.black,height: 200,width: 100,),
                      Container(color: Colors.pink,height: 200,width: 100,),
                    ],
                  ),

                ],),
          ),
          Container(color: Colors.blue,height: 400,width: 400,),
          Container(color: Colors.green,height: 400,width: 400,),

          ],)),
    );
  }
}

// lsit view  3

// list view 2
class ListVi3 extends StatefulWidget {
  ListVi3({Key? key}) : super(key: key);

  @override
  State<ListVi3> createState() => _ListVi3State();
}
// it will return the error ,becuse the the listview child will takes the whole page 
class _ListVi3State extends State<ListVi3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      body: Container( height: 1000,
        child: ListView(
          children: [

            Text('first',style: TextStyle(fontSize: 30),),
            ListView(
              physics: NeverScrollableScrollPhysics(),//the scroll of this list not working 
              shrinkWrap: true,//it depand on the hieght of the widget r
              scrollDirection: Axis.vertical,
              children: [
                        Container(color: Colors.purple,height: 200,width: 100,),
                        Container(color: Colors.black,height: 200,width: 100,),
                        Container(color: Colors.pink,height: 200,width: 100,),
            ],),

            Text('second',style: TextStyle(fontSize: 30)),
            ListView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                        Container(color: Colors.yellow,height: 200,width: 100,),
                        Container(color: Colors.green,height: 200,width: 100,),
                        Container(color: Colors.blue,height: 200,width: 100,),
            ],),            



          ],)),
    );
  }
}

// *****we use the builder when we have a data on our data base and we need to use it 
// list view builder 

class ListBuil extends StatefulWidget {
  ListBuil({Key? key}) : super(key: key);

  @override
  State<ListBuil> createState() => _ListBuilState();
}

class _ListBuilState extends State<ListBuil> {
  List mobiles=[
    { 'name':'S 21',
      'CPU':'snapdragon',
      'screen':'7'},

      {'name':'NOTE 10',
      'CPU':'snapdragon',
      'screen':'6'},

      {'name':'S 10',
      'CPU':'snapdragon',
      'screen':'5'},

      {'name':'Nokia',
      'CPU':'snapdragon',
      'screen':'10'},      

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      body: Container(
        // listView + loop 
        child:ListView.builder(
          itemCount: mobiles.length,
          itemBuilder:(builder , i ){
            return Container(
              child: Text('the names : ${mobiles[i]["name"]} , the cpu  : ${mobiles[i]["CPU"]} , the screen : ${mobiles[i]["screen"]} ',),
              color: Colors.red,
              margin: EdgeInsets.only(top: 10),
              height: 50,);
        }) 
        
        
        ),
    );
  }
}


// list view separator

class ListSep extends StatefulWidget {
  ListSep({Key? key}) : super(key: key);

  @override
  State<ListSep> createState() => _ListSepState();
}

class _ListSepState extends State<ListSep> {
  List mobiles=[
    { 'name':'S 21',
      'CPU':'snapdragon',
      'screen':'7'},

      {'name':'NOTE 10',
      'CPU':'snapdragon',
      'screen':'6'},

      {'name':'S 10',
      'CPU':'snapdragon',
      'screen':'5'},

      {'name':'Nokia',
      'CPU':'snapdragon',
      'screen':'10'},

    { 'name':'S 21',
      'CPU':'snapdragon',
      'screen':'7'},

      {'name':'NOTE 10',
      'CPU':'snapdragon',
      'screen':'6'},

      {'name':'S 10',
      'CPU':'snapdragon',
      'screen':'5'},

      {'name':'Nokia',
      'CPU':'snapdragon',
      'screen':'10'},              

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      body: Container(
        // ut's alike listViewBuilder + separat between the widget 
        child:ListView.separated(separatorBuilder: (contentx,int){
          return Divider(color: Colors.black,thickness: 3,height: 20,);
        },
          itemCount: mobiles.length,
          itemBuilder:(builder , i ){
            return Container(
              child: Text('the names : ${mobiles[i]["name"]} , the cpu  : ${mobiles[i]["CPU"]} , the screen : ${mobiles[i]["screen"]} ',style: TextStyle(fontSize: 25),),
              color: Colors.red,
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 30),
              height: 50,);
        }) 
        
        
        ),
    );
  }
}


//list view grid builder 

// list view builder 

class GridBuil extends StatefulWidget {
  GridBuil({Key? key}) : super(key: key);

  @override
  State<GridBuil> createState() => _GridBuilState();
}

class _GridBuilState extends State<GridBuil> {
  List mobiles=[
    { 'name':'S 21',
      'CPU':'snapdragon',
      'screen':'7'},

      {'name':'NOTE 10',
      'CPU':'snapdragon',
      'screen':'6'},

      {'name':'S 10',
      'CPU':'snapdragon',
      'screen':'5'},

      {'name':'Nokia',
      'CPU':'snapdragon',
      'screen':'10'},      

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      body: Container(
        height: 1000,
        width:double.infinity,
        //listveiw lopp + choose how many widget in the same row
        child:GridView.builder(
          scrollDirection: Axis.vertical,
          //the new prop :
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio:2,crossAxisCount: 3,crossAxisSpacing: 10,mainAxisSpacing: 10),
          itemCount: mobiles.length,
          itemBuilder:(builder , i ){
            return Container(
              child: Text('the names : ${mobiles[i]["name"]} , the cpu  : ${mobiles[i]["CPU"]} , the screen : ${mobiles[i]["screen"]} ',style: TextStyle(fontSize: 20),),
              color: Colors.red,
              // hieght:100 ,
              width:double.infinity,
              // padding: EdgeInsets.only(right: 20),
              // margin: EdgeInsets.only(top: 10,right: 20),
              height: 300,);
        }) 
        
        
        ),
    );
  }
}


//grid view 

class Grid extends StatefulWidget {
  Grid({Key? key}) : super(key: key);

  @override
  State<Grid> createState() => _GridState();
}

class _GridState extends State<Grid> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      body: Container(
        height: 1000,
        width:double.infinity,
        //choose how many widget in the same row
        child:GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio:1,crossAxisCount: 2,crossAxisSpacing: 10,mainAxisSpacing: 10),
          children: [
            Container( 
              color: Colors.red,
              height:100 ,
              width:100,
                      ),
            Container( 
              color: Colors.green,
              height:100 ,
              width:100,
                      ),
            Container( 
              color: Colors.blue,
              height:100 ,
              width:100,
                      ),
            Container( 
              color: Colors.black,
              height:100 ,
              width:100,
                      ),
          ],
                      
                      ) 
        
        
        ),
    );
  }
}



// make the listviw or gridview alike listviewbuilder and gridviewbuilder 
// list generate 
class ListGen extends StatefulWidget {
  ListGen({Key? key}) : super(key: key);

  @override
  State<ListGen> createState() => _ListGenState();
}

class _ListGenState extends State<ListGen> {
  
  @override
  Widget build(BuildContext context) {
    List l=['jamel','ahmed','khaled','sami'];
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      body: Container(
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,childAspectRatio: 1,crossAxisSpacing: 10,mainAxisSpacing: 10),
            children:
              List.generate(l.length,(index){
                return Container(child:Text('the $index is : ${l[index]}'),color:Colors.red);

              })
            ,)),
      );

  }
}


// gridview count is alike girdview ,
//just on the gridview count we don't use
//(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount ),use directly like a prop 

// list view custom
class ListCust extends StatefulWidget {
  ListCust({Key? key}) : super(key: key);

  @override
  State<ListCust> createState() => _ListCustState();
}

class _ListCustState extends State<ListCust> {
  @override
  Widget build(BuildContext context) {
    List l=['jamel', 'ahmed', 'sami', 'khaled' ];
    return Scaffold(
        appBar: AppBar(),
        drawer: Drawer(),
        body: Container(
          // in this we can use listview and listview builder ,ther is no deffernet 
            child: ListView.custom(
                //list view  
              childrenDelegate: SliverChildListDelegate(
                
                [
                  Container(height:300,width:300,color: Colors.red,child: Text('hellow'),),
                  Container(height:300,width:300,color: Colors.yellow,child: Text('hellow'),),
                  Container(height:300,width:300,color: Colors.green,child: Text('hellow'),),
                  Container(height:300,width:300,color: Colors.black,child: Text('hellow'),),

                ]
              ),
/*            list view builder   
              childrenDelegate: SliverChildBuilderDelegate(
            
                (builder,index){
                  
                return Container(child: Text('the $index is ${l[index]}'),);
              },
              childCount: l.length), */
              
              
              
              ),


        ),


    );
  }
}


// exemple

class MyAppp extends StatefulWidget {
  @override
  _MyApppState createState() => _MyApppState();
}
class _MyApppState extends State<MyAppp> {
  bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter TextField Password Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter TextField Password Example'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Type your password below...',
                  style: TextStyle(fontSize: 15), textAlign: TextAlign.left),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                onChanged: (value) {
                  print(value);
                },
                obscureText: hidePassword,//show/hide password
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                              suffixIcon: IconButton(
                              onPressed: (){
                                setState(() {
                                  hidePassword = !hidePassword;
                                });
                              },
                                icon : hidePassword
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility)
                                ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),//circular border for TextField.
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

class Page22 extends StatefulWidget {
  Page22({Key? key}) : super(key: key);

  @override
  State<Page22> createState() => _Page22State();
}

class _Page22State extends State<Page22> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      // drawer: Drawer(),
      body:SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child:Container(
        margin: EdgeInsets.only(top: 100),
        //the first container 
        width: double.infinity,
        //margin: EdgeInsets.symmetric(vertical: 50,horizontal: 50),



        child:Column(children: [
          //the header text 
          Container(margin: EdgeInsets.only(left: 10,right: 10,top:100),child:Text('Bienvenu',style: TextStyle(fontSize:25,color: Colors.blue),),),





          //the body,the main container of this part 
          Container(margin: EdgeInsets.only(top: 50,bottom: 50,left: 10,right: 10),
          width: double.infinity,

          
          
          
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            


            
            //the Email field 
            Container(padding: EdgeInsets.only(bottom: 20),child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                            //Text('First name:',style: TextStyle(fontSize:30,color: Colors.black),),
                            TextFormField(
                              
                              textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(hintText:'Entrez votre Email' ,
                            hintStyle: TextStyle(color: Colors.black),
                            prefixIcon: Icon(Icons.mail,color: Colors.orange.shade500)    ,                      
                            labelText:'Email:' ,
                            labelStyle: TextStyle(fontSize:15 ,color: Colors.orange.shade500),
                            
                            enabled: true,
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.red)),
                              
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.blue,width: 1)),  

                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.blue,width: 1)),

                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.red.shade600,width: 1)), 
                            ),),
            ],),),


            //the Password field 
            Container(padding: EdgeInsets.only(bottom: 20),child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                            //Text('First name:',style: TextStyle(fontSize:30,color: Colors.black),),
                            TextFormField(
                              
                              textInputAction: TextInputAction.next,
                              obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(hintText:'Entrez votre mot de pass' ,
                            hintStyle: TextStyle(color: Colors.black),
                            prefixIcon: Icon(Icons.key_rounded,color: Colors.orange.shade500)    ,                      
                            labelText:'Mot de pass:' ,
                            labelStyle: TextStyle(fontSize:15,color: Colors.orange.shade500),
                            
                            enabled: true,
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.red)),
                              
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.blue,width: 1)),  

                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.blue,width: 1)),

                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.red.shade600,width: 1)), 
                            ),),
            ],),),            



          ],),),
        
        
        //the button  
          Container(width: double.infinity,
          
          margin: EdgeInsets.symmetric(horizontal: 10),
          child:MaterialButton(
            shape:RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.all(10),
            color: Colors.blue.shade700,
            onPressed:(){

          },
          child:Text('Connexion',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),) ,),),

          //the other case 
          Row(mainAxisAlignment: MainAxisAlignment.center,children: [
              Container(child:Text('Vous n’avez pas de compte?',style: TextStyle(fontSize:18,color: Colors.black54),),),
              Container(child:Text('S’iscrire',style: TextStyle(fontSize:18,color: Colors.black,fontWeight: FontWeight.bold),),),

          ],),


        ]),
      
      
      ),)
      );
  }
}


class Page11 extends StatefulWidget {
  Page11({Key? key}) : super(key: key);

  @override
  State<Page11> createState() => _Page11State();
}

class _Page11State extends State<Page11> {
  bool hidePass = true;
  @override
  Widget build(BuildContext context) {

    GlobalKey<FormState> data= new GlobalKey<FormState>();
    send(){
      var dataa =data.currentState;
      if(dataa!.validate()){
          print('valide');
        
      }else{
        print('not valid');
      }

      }    
    return Scaffold(
      // appBar: AppBar(),
      // drawer: Drawer(),
      body:Form(
        key: data,
        child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child:Container(
          //the first container 
          width: double.infinity,
          //margin: EdgeInsets.symmetric(vertical: 50,horizontal: 50),



          child:Column(children: [
            //the header text 
            Container(alignment: Alignment.center,margin: EdgeInsets.only(top:100),child:Text('S\'inscrire',style: TextStyle(fontSize:25,color: Colors.blue),textAlign:TextAlign.center,),),





            //the body,the main container of this part 
            Container(margin: EdgeInsets.only(top: 50,bottom: 50,left: 10,right: 10),
            width: double.infinity,

            
            
            
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
              


              //the name field 
              Container(padding: EdgeInsets.only(bottom: 20),child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                              //Text('First name:',style: TextStyle(fontSize:30,color: Colors.black),),
                              TextFormField(
                                // autovalidateMode:AutovalidateMode.always ,
                                validator: (Stringg){
                                  String pattern = r'[a-zA-Z]{3,20}';
                                  var regle =RegExp(pattern);
                                        if(! (regle.hasMatch(Stringg!))){
                                          return('le Nom doit être inférieur ou égal à 20 lettres');
                                        }
                                                                  },
                                textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                              hintText:'Entrez votre name' ,
                              hintStyle:TextStyle(color: Colors.black) ,
                              prefixIcon: Icon(Icons.person,color: Colors.orange.shade500,) ,                      
                              labelText:'Name:' ,
                              labelStyle: TextStyle(fontSize:15,color: Colors.orange.shade500 ),
                              
                              enabled: true,
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.red)),
                                
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.blue,width: 1)),  

                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.blue,width: 1)),

                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.pink.shade600,width: 1)), 
                              ),),
              ],),),



              //the Last name field 
              Container(padding: EdgeInsets.only(bottom: 20),child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                              //Text('First name:',style: TextStyle(fontSize:30,color: Colors.black),),
                              TextFormField(

                                // autovalidateMode:AutovalidateMode.always ,
                                validator: (Stringg){
                                  String pattern = r'[a-zA-Z]{3,20}';
                                  var regle =RegExp(pattern);
                                        if(!(regle.hasMatch(Stringg!))){
                                          return('le nom de famille doit être inférieur ou égal à 20 lettres');
                                        }
                                                                  },


                                textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                              hintText:'Entrez votre prénom' ,
                              hintStyle: TextStyle(color: Colors.black),
                              prefixIcon: Icon(Icons.person,color: Colors.orange.shade500,)    ,                      
                              labelText:'prénom:' ,
                              labelStyle: TextStyle(fontSize:15,color: Colors.orange.shade500, ),
                              
                              enabled: true,
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.red)),
                                
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.blue,width: 1)),  

                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.blue,width: 1)),

                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.red.shade600,width: 1)), 
                              ),),
              ],),),


              //the Email field 
              Container(padding: EdgeInsets.only(bottom: 20),child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                              //Text('First name:',style: TextStyle(fontSize:30,color: Colors.black),),
                              TextFormField(
                                
                                // autovalidateMode:AutovalidateMode.always ,
                                validator: (Stringg){
                                  String pattern = r'[a-zA-Z]{4,15}[0-1]*@[a-z]+ . [a-z]+';
                                        if(Stringg!.length < 10){
                                          return('la longueur de l\'email doit tre d\'au moins 11 lettres');
                                        }
                                                                  },

                                textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                              hintText:'Entrez votre Email' ,
                              hintStyle: TextStyle(color: Colors.black),
                              prefixIcon: Icon(Icons.mail,color: Colors.orange.shade500,)    ,                      
                              labelText:'Email:' ,
                              labelStyle: TextStyle(fontSize:15 ,color: Colors.orange.shade500,),
                              
                              enabled: true,
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.red)),
                                
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.blue,width: 1)),  

                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.blue,width: 1)),

                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.red.shade600,width: 1)), 
                              ),),
              ],),),


              //the Password field 
              Container(padding: EdgeInsets.only(bottom: 20),child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                              //Text('First name:',style: TextStyle(fontSize:30,color: Colors.black),),
                              TextFormField(


                                // autovalidateMode:AutovalidateMode.always ,
                                validator: (String){
                                        if(String!.length < 8 || String.isEmpty){
                                          return('le mot de passe doit être d\'au moins 8 lettres');
                                        }
                                                                  },

                                //textInputAction: TextInputAction.next,
                                obscureText: hidePass,
                                //keyboardType: TextInputType.visiblePassword,
                                decoration: InputDecoration(
                                hintText:'Entrez votre mot de pass' ,
                                hintStyle: TextStyle(color: Colors.black),
                                prefixIcon: Icon(Icons.key_rounded,color: Colors.orange.shade500,),
                                suffixIcon: IconButton(
                                    onPressed: (){
                                    setState(() {
                                    hidePass = ! hidePass;
                                    });
                                                },
                                    icon : hidePass
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.visibility),
                                    color: Colors.orange.shade500,),
                              labelText:'Mot de pass:' ,
                              labelStyle: TextStyle(fontSize:15 ,color: Colors.orange.shade500,),

                              enabled: true,
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.red)),

                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.blue,width: 1)),

                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.blue,width: 1)),

                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.red.shade600,width: 1)),
                                ),),
              ],),),            


              //the Phone field 
              Container(padding: EdgeInsets.only(bottom: 20),child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                              //Text('First name:',style: TextStyle(fontSize:30,color: Colors.black),),
                              TextFormField(

                                // autovalidateMode:AutovalidateMode.always ,
                                onChanged: (Stringg){

                                },
                                validator: (Stringg){
                                  String pattern = r'[0-9]{8}';
                                  var regle =RegExp(pattern);
                                /**/ 
                                
                              
                                

                                        if(!(regle.hasMatch(Stringg!))){
                                          print(Stringg.toString());
                                          return('Le numéro de téléphone n\'est pas valide');
                                        }
                                                                  },

                                textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                              hintText:'Entre votre Phone' ,
                              hintStyle: TextStyle(color: Colors.black),
                              prefixIcon: Icon(Icons.phone_android,color: Colors.orange.shade500,)    ,
                              labelText:'Phone:' ,
                              labelStyle: TextStyle(fontSize:15 ,color: Colors.orange.shade500,),
                              
                              enabled: true,
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.red)),
                                
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.blue,width: 1)),  

                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.blue,width: 1)),

                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.red.shade600,width: 1)), 
                              ),),
              ],),),


              //the Date of birth field 
              Container(child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                              //Text('First name:',style: TextStyle(fontSize:30,color: Colors.black),),
                              TextFormField(
                                validator: (Stringg){
                                  String pattern = r'[0-9]{1,2}/[0-9]{1,2}/[1-9]{4}';
                                  var regle =RegExp(pattern);
                                  if (!(regle.hasMatch(Stringg!))  || Stringg!.isEmpty){
                                    return('ça doit être comme ça DD/MM/YYYY');
                                  }

                                },
                                
                                textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                              hintText:'Entrez votre date de naissance' ,
                              hintStyle: TextStyle(color: Colors.black),
                              prefixIcon: Icon(Icons.date_range,color: Colors.orange.shade500,)    ,                      
                              labelText:'date de naissance:' ,
                              labelStyle: TextStyle(fontSize:15 ,color: Colors.orange.shade500,),
                              
                              enabled: true,
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.red)),
                                
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.blue,width: 1)),  

                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.blue,width: 1)),

                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.red.shade600,width: 1)), 
                              ),),
              ],),),            


            ],),),
          
          
          //the button  
            Container(width: double.infinity,
            
            margin: EdgeInsets.symmetric(horizontal: 10),
            child:MaterialButton(
              shape:RoundedRectangleBorder(
                borderRadius:BorderRadius.circular(20) ) ,
              padding: EdgeInsets.all(10),
              color: Colors.blue.shade700,
              onPressed:send,
            child:Text('Rejoignez gratuitement',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),) ,),),

            //the other case 
            Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                Container(child:Text('Vous avez déjà un compte ?',style: TextStyle(fontSize:18,color: Colors.black54),),),
                Container(child:Text('Connexion',style: TextStyle(fontSize:18,color: Colors.black,fontWeight: FontWeight.bold),),),

            ],),


          ]),
        
        
        ),),
      )
      );
  }
}



// 
/* class ResponSiv extends StatefulWidget {
  ResponSiv({Key? key}) : super(key: key);
  final Widget mobile;
  final Widget desktopp;

  @override
  State<ResponSiv> createState() => _ResponSivState();
}

class _ResponSivState extends State<ResponSiv> {

  @override
  Widget build(BuildContext context) {
    return Container();
  }
} */

// app bar

class AppB extends StatefulWidget {
  AppB({Key? key}) : super(key: key);

  @override
  State<AppB> createState() => _AppBState();
}

class _AppBState extends State<AppB> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon : Icon(Icons.arrow_back),
          onPressed: (){
          },),
          actions: [
            IconButton(icon:Icon(Icons.login_outlined),
            onPressed: (){
          },),
            IconButton(icon:Icon(Icons.settings),
            onPressed: (){
          },) ,
            IconButton(icon:Icon(Icons.notifications),
            onPressed: (){
          },) ,
            IconButton(icon:Icon(Icons.person_pin),
            onPressed: (){
          },) ,          
          ],
        title: Text('Formation',style: TextStyle(fontSize: 25),),
      ),
    );
  }
}



// drawer 
class Drawerr extends StatefulWidget {
  Drawerr({Key? key}) : super(key: key);

  @override
  State<Drawerr> createState() => _DrawerrState();
}

class _DrawerrState extends State<Drawerr> {
  GlobalKey<ScaffoldState> keyScaffold =new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      // part2 drawer 'drawerScrimColor'
      drawerScrimColor: Colors.orange.shade500.withOpacity(0.2),//we an use transparent

      key: keyScaffold,
      appBar: AppBar(

          actions: [

            IconButton(icon:Icon(Icons.settings),
            onPressed: (){
          },) ,

            IconButton(icon:Icon(Icons.person_pin),
            onPressed: (){
          },) ,          
          ],
        title: Text('Formation',style: TextStyle(fontSize: 25),),   
        centerTitle: true,
      ),
      // we use end drawer if we want it from the right side 
      // drawer and leading not working in the same time
      drawer: Drawer(
        
        child: Column(children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                radius:1,
                backgroundColor: Colors.orange.shade500,
                child:Text('Ja'),
              ),
              accountName: Text('Jamel'),
              accountEmail: Text('Jamelbessaoud07@gmail.com')),
              ListTile(
                iconColor: Colors.orange.shade500,
                title: Text('profil'),
              leading:Icon(Icons.person_pin),
                      onTap:(){} ) ,

              ListTile(
                iconColor: Colors.orange.shade500,
                title: Text('Notification'),
              leading:Icon(Icons.notifications),
                      onTap:(){} ) ,
              ListTile(
                iconColor: Colors.orange.shade500,
                title: Text('Parametre'),
              leading:Icon(Icons.settings),
                      onTap:(){} ) ,
              ListTile(
                iconColor: Colors.orange.shade500,
                title: Text('desconnect'),
              leading:Icon(Icons.exit_to_app),
                      onTap:(){} ) ,                                                                              


              // 

        
        

        ]),
      ),
      // drawer part 2 :
      //we can use another button to open drawer (global key )
      body: Center(
        child: Container(

          child: ElevatedButton(child: Text('open drawer'),
          onPressed: (){
            keyScaffold.currentState!.openDrawer();
          },),
        ),
      ),  

    );
  }
}

// move from page to page usig swap 
// tabs,tab and tabbarview

class TabBarVieww extends StatefulWidget {
  TabBarVieww({Key? key}) : super(key: key);

  @override
  State<TabBarVieww> createState() => _TabBarViewwState();
}

class _TabBarViewwState extends State<TabBarVieww> with SingleTickerProviderStateMixin {
    TabController? myController;
    @override
    void initState() {
      print("the page is open ");
      // we can choose any widget will open first
      myController = new TabController(length: 5,vsync: this,initialIndex: 4);
      
      super.initState();
      
    }
  @override
  Widget build(BuildContext context) {

    // we use DefaultTabController or we can use our controller like this 
    return Scaffold(
      appBar: AppBar(//use the isScrollable if we have a lot of tabs
        bottom:TabBar(
          controller:myController,
          indicatorColor: Colors.black,
          indicatorWeight: 5,
          labelColor: Colors.black,
          labelStyle: TextStyle(letterSpacing:3,fontFamily:'OoohBaby'),
          onTap: (index){print(index);},//it return the index of the widget on the list 
          isScrollable: true,
          tabs:[
            Tab(icon: Icon(Icons.airplanemode_active_outlined),child:Text('page one ')),
            Tab(child:Text('page two ')),
            Tab(child:Text('page thre ')),
            Tab(child:Text('page four ')),
            Tab(child:Text('page five ')),
              ] ,),),
      body: TabBarView(
        controller: myController,
        children: [
        Container(color: Colors.red,width: double.infinity,),
        Container(color: Colors.green,width: double.infinity,),
        Container(color: Colors.yellow,width: double.infinity,),
        Container(color: Colors.grey,width: double.infinity,),
        Container(color: Colors.purple,width: double.infinity,),
      ]),

    );
  }
}

// initial state and tabControl-65

class TabCont extends StatefulWidget {
  TabCont({Key? key}) : super(key: key);

  @override
  State<TabCont> createState() => _TabContState();
}

class _TabContState extends State<TabCont> {
  @override
  @override
  // this function called when the page is open
  void initState() {
    print('the page is open now !!!');
    super.initState();
    
  }
  Widget build(BuildContext context) {
    return Container();
  }
}

// Bottom navigator bar 

class BottomNavigBar extends StatefulWidget {
  BottomNavigBar({Key? key}) : super(key: key);

  @override
  State<BottomNavigBar> createState() => _BottomNavigBarState();
}

class _BottomNavigBarState extends State<BottomNavigBar> {
  List<Widget> widgets = [
    Text('page home ** Jamel',style: TextStyle(color: Colors.red,fontSize: 20),),
    Page1()

  ];
  var index = 0;
  var current=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: TextStyle(fontSize: 20),
        currentIndex : current,
        onTap: (indexx){
          // refresh UI
          setState(() {
            current = indexx;
            index = indexx;
          });
        },
        backgroundColor: Colors.red,
        items: [
          BottomNavigationBarItem(label: 'home',icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: 's\'inscrire',icon: Icon(Icons.person)),

        ],
        
    ),
    // use the the same variable or another variable it give the same result 
    body: widgets.elementAt(current),
    );
  }
}

// page view 
//move from page to another just swap 
class PageVieww extends StatefulWidget {
  PageVieww({Key? key}) : super(key: key);

  @override
  State<PageVieww> createState() => _PageViewwState();
}

class _PageViewwState extends State<PageVieww> {
  PageController?  cont;
  @override
  void initState() {
      cont = new PageController(initialPage: 0,viewportFraction: 1,);
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width:size.width,
        height:size.height-00,
        child: Column(
          children : [
            Container(
        width:size.width,
        height:size.height-200,
            child: PageView(
              controller:cont,
              // we can use the controller here and choose whish widget will opne in the begin
              onPageChanged: (indexx){},//it give the index of the page destination
              reverse: false,
              scrollDirection: Axis.horizontal,
              children: [
                // we can use ''''page view builder'''' tooo 
                Image(image: AssetImage('images/1.webp')),
                Image(image: AssetImage('images/flutter.jpg')),
                Image(image: AssetImage('images/laravel.png')),
                Page1()
              ],),
              
          ),
          
          ElevatedButton(
            onPressed: (){
              cont?.jumpToPage(3);
              // cont?.animateToPage(0, duration:Duration(seconds: 1),curve:Curves.easeInBack);
            }, child: Text('click'))]
        ),
      ),
    );
  }
}

// navigator push (got to a page )
// pop and can pop (return to a page)
class Nav1 extends StatefulWidget {
  Nav1({Key? key}) : super(key: key);

  @override
  State<Nav1> createState() => _Nav1State();
}

class _Nav1State extends State<Nav1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:Container(
        child:MaterialButton(
          color: Colors.blue.shade500,
          // we don't have a route
/*           onPressed:(){
            Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return One(); 
            }));} , */
            //we already create it(route) 
            onPressed: (){
              Navigator.of(context).pushReplacementNamed('one');
            },
          child: Text('go to the page one '),) ,)
    );
  }
}


// slider 
class Sliderr extends StatefulWidget {
  Sliderr({Key? key}) : super(key: key);

  @override
  State<Sliderr> createState() => _SliderrState();
}

class _SliderrState extends State<Sliderr> {
  var val;
  double v = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

      child:Slider(
        min:0.0,
        max:100.0,
        value: v,
        onChanged: (val){
          setState(() {
            v = val;
            print(v);
          });
        },
        ),
        ),
    );
  }
}


// scroll controller 

class ScrollCont extends StatefulWidget {
  ScrollCont({Key? key}) : super(key: key);

  @override
  State<ScrollCont> createState() => _ScrollContState();
}

class _ScrollContState extends State<ScrollCont> {
  ScrollController? sc;
  @override
  void initState() {
    
    sc = new ScrollController();
    sc?.addListener(() {
      print(sc?.offset);
      print(' the max position that i can reach ${sc?.position.maxScrollExtent}');
      print(' the min position that i can reach ${sc?.position.minScrollExtent}');
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        controller: sc,
        
        children: [
          MaterialButton(//we can use animateTo
            onPressed: (){sc?.jumpTo(sc!.position.maxScrollExtent);},child: Text('jup to bottom '),),
        ...List.generate(10,
        (index)=>Container(
          margin: EdgeInsets.all(20),
          height: 100,
          width: double.infinity,
          color:  index.isEven  ? Colors.yellow : Colors.pink ,
          child: Text('this is the $index container '),
        )),
          MaterialButton(
            onPressed: (){sc?.jumpTo(0);},child: Text('jup to top '),),        
      ],),
    );
  }
}

// show modal sheet 

class Modall extends StatefulWidget {
  Modall({Key? key}) : super(key: key);

  @override
  State<Modall> createState() => _ModallState();
}

class _ModallState extends State<Modall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          color:Colors.blue.shade500,
          onPressed: (){
            showModalBottomSheet(
              context: context,
              builder:(context){
                return Container(
                  color:Colors.yellow,
                  height: 100,
                  child:  Text('hello'),);
              } );
          },
          child: Text('show modal'),)),
    );
  }
}

// search delegate 
// how make the page of search 
// the search delegete part 2 

class Searchh extends StatefulWidget {
  Searchh({Key? key}) : super(key: key);

  @override
  State<Searchh> createState() => _SearchhState();
}

class _SearchhState extends State<Searchh> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(       
            icon : Icon(Icons.search),
            onPressed: (){
              showSearch(context: context, delegate: DataSearch());

            },)
        ]),
    );
  }
}
class DataSearch extends SearchDelegate{
  List name=[
    'jamel',
    'ahmed',
    'sami',
    'kamel',
    'fathi',
    'rami',
    'khaled',
    'salah',
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon : Icon(Icons.close),
        onPressed:(() {
          //in the second parts 
          query = '';
        }),
    )];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: (){
        // in the second parts 
        close(context, null);
      },
      icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text ('$query');
  }


// how search for a specific phrase 
  @override
  Widget buildSuggestions(BuildContext context) {
    // we can use containes or startsWith 
    List filter =name.where((element) => element.contains(query)).toList();
    return Container(
      child: ListView.builder(
        itemCount :query == '' ? name.length :filter.length,
        itemBuilder: (contex,i){
          return InkWell(
            onTap: (){
              // when i click the index positiond  on where i click 
              query = query == '' ? '$i': filter[i];
              showResults(context);
            },

            child: Container(
              padding: EdgeInsets.all(20),
              child:query == '' 
              ? Text('${name[i]}',style: TextStyle(fontSize: 20),)
              : Text('${filter[i]}',style: TextStyle(fontSize: 20),)
            ),
          );
        }),);

  }

  
}

// awdon dialogue 

class AwsomDiag extends StatefulWidget {
  AwsomDiag({Key? key}) : super(key: key);

  @override
  State<AwsomDiag> createState() => _AwsomDiagState();
}

class _AwsomDiagState extends State<AwsomDiag> {
  @override
  // puggin = package 
  // install , readme 
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children:[
          ElevatedButton(
            onPressed: (){
              AwesomeDialog(
            context: context,
            dialogType: DialogType.QUESTION,
            animType: AnimType.LEFTSLIDE,
            title: 'Dialog Title',
            // we can replace desc by body
            desc: 'Dialog description here.............',
            btnCancelOnPress: () {},
            btnOkOnPress: () {},
            )..show();
            },
            child: Text('click !!'))
        ]
      ),
    );
  }
}

// drop down search
/*
class DropDown extends StatefulWidget {
  DropDown({Key? key}) : super(key: key);

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          DropdownSearch<String>(
            
    // there is multi selection in this package (menu and multiSelection)
    //we can change the mod by changing 'menu' by another word
    popupProps: PopupProps.menu(
      showSearchBox: true,
        showSelectedItems: true,
        disabledItemFn: (String s) => s.startsWith('I'),
    ),
    items: ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
    dropdownDecoratorProps: DropDownDecoratorProps(
      dropdownSearchDecoration: InputDecoration(
        labelText: "Menu mode",
        hintText: "country in menu mode",
      )

    ),
    onChanged: (val){
      print(val);
    },
    selectedItem: "Brazil",
),

//the second type 
DropdownSearch<String>.multiSelection(
    items: ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
    popupProps: PopupPropsMultiSelection.menu(
        showSelectedItems: true,
        disabledItemFn: (String s) => s.startsWith('I'),
    ),
    onChanged: print,
    selectedItems: ["Brazil"],
),
        ]),
    );
  }
}
*/
// flutter luncher icon

class LunchIcon extends StatefulWidget {
  LunchIcon({Key? key}) : super(key: key);

  @override
  State<LunchIcon> createState() => _LunchIconState();
}

class _LunchIconState extends State<LunchIcon> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}



//geolocater
// 

//feutrue (await- async)

class Futuree extends StatefulWidget {
  Futuree({Key? key}) : super(key: key);

  @override
  State<Futuree> createState() => _FutureeState();
}

class _FutureeState extends State<Futuree> {
  //future : it need time
  //async : tazamen 
  //await : it wait until get the result ,and pass to another line 
  //because maybe the next line need the line above 
  Future getData() async{
    print('begin');
    await Future.delayed(Duration(seconds: 3) , () {
      print('jamel');
    },
    );
    print('end ');
  }
  @override
  void initState() {
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}



// http and Api 
// get method 

class Apii extends StatefulWidget {
  Apii({Key? key}) : super(key: key);

  @override
  State<Apii> createState() => _ApiiState();
}

class _ApiiState extends State<Apii> {
  List formation = [];
  Future getPost() async {
    // String url = 'https://jsonplaceholder.typicode.com/posts';
    String url = 'http://192.168.1.100:8000/api/formations';

    var response  = await http.get(Uri.parse(url) );

    // decode the data to can use like a list 
    var responseBody = jsonDecode(response.body);  
    // print(posts);
    // print(responseBody[5]);
  
    setState(() {
      formation.addAll(responseBody);
    });
  }

// we can make the function work:
//by a button or initial state(it work in moment of the page is load in the first time )
  @override
  void initState() {
    super.initState();
    getPost();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        ),
      body:formation.isEmpty
        ? Center(
            child : CircularProgressIndicator(),
        )
        : ListView.builder(
          itemCount: formation.length,
          itemBuilder: (builder , i )
          {
            return Column(
              children:[
                Text('${formation[i]['nom_formation']}'),
                Text('${formation[i]['description_formation']}'),

              ]
            );
          })


    );
  }
}

// anoter way to import data future 

class Futurr extends StatefulWidget {
  Futurr({Key? key}) : super(key: key);

  @override
  State<Futurr> createState() => _FuturrState();
}

class _FuturrState extends State<Futurr> {

  Future getPost() async {
    // ?id=2 to choose any post we will show 
    // we can use more than one parameter &
    String url = 'https://jsonplaceholder.typicode.com/posts?id=27&userId=3';

    var response = await http.get(Uri.parse(url));

    var responseBody = jsonDecode(response.body);

    return responseBody;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(30),
        child: FutureBuilder(
          future: getPost(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if ( snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext , i){
                return Text('${snapshot.data[i]['title']}');
              });
              
            }
            // we can the propties initialdata ,and then we can delete this return 
            return  Center (
              child  : CircularProgressIndicator());
            },
        ),
      ),
      
    );
  }
}

// post method 

class Postt extends StatefulWidget {
  Postt({Key? key}) : super(key: key);

  @override
  State<Postt> createState() => _PosttState();
}


class _PosttState extends State<Postt> {
  // get method 
  Future gett() async {
    String url = 'https://jsonplaceholder.typicode.com/posts';

    var response = await http.get(Uri.parse(url));

    var responseBody = jsonDecode(response.body);

    return responseBody;
  }


  Future Postt() async {
    String url = 'https://jsonplaceholder.typicode.com/posts';

    var response =await http.post(
      Uri.parse(url),
      body: {
        'userId': '1',
        'title': 'ttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt',
        'body': 'good'},
        headers: {'content-type' :'application/json ;charset-UTF-8 '});

    var responseBody = jsonDecode(response.body);
    print(responseBody);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [

          MaterialButton(
            child: Text('send a post '),
            color: Colors.pink,
            onPressed: (){Postt();}),

          FutureBuilder(
            future: gett(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                  // this two line important when use list view inested 
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data.length,
                  itemBuilder: (builser, i){
                    return Text('${snapshot.data[i]['title']}');
                  });
              }
              
              return Center(child:CircularProgressIndicator(),);
            },),
        ]
      )
    );
  }
}








