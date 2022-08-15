
import 'dart:math';
import 'package:baseball/controllers/controller.dart';
import 'package:baseball/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   LogicControllers _logicControllers = Get.put(LogicControllers());
   final _formKey = new GlobalKey<FormState>();
   TextEditingController _textEditingController = new TextEditingController();
  String randNumber='';
  String guessNumber='';
  bool fstSttring=false;
  bool scndSttring=false;
  
  bool thrdSttring=false;
  int strikeLeng=0;

  String strike='0';


  bool firstBall=false;
  bool secBall=false;
  bool thirdBall=false;
 int ballLength=0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMessage();
    _logicControllers.print();
    randNumber='${_logicControllers.rand1.value}${_logicControllers.rand2.value}${_logicControllers.rand3.value}';
  }


  guessNumberState(){
    setState(() {
      guessNumber=_textEditingController.text;
      _textEditingController.text='';
     
    });

    setState(() {
      
      if (strikeLeng <3 ) {
 if (guessNumber[0] == randNumber[0]) {
        fstSttring=true;
        strike='1';
         strikeLeng <3 ?strikeLeng +=1: strikeLeng=strikeLeng;
      } 
      if(guessNumber[1] == randNumber[1]){
        scndSttring=true;
        strike='2';
         strikeLeng <3 ?strikeLeng +=1: strikeLeng=strikeLeng;
      }
      if(guessNumber[2]== randNumber[2]){
        thrdSttring=true;
        strike='3';
        strikeLeng <3 ?strikeLeng +=1: strikeLeng=strikeLeng;
      }        
      } else if(strikeLeng > 3){
        strikeLeng =3;
      }
      
      print('strike$strike');

      if (strikeLeng==3) {
        strikeOut();
      }


      if (ballLength <= 3) {
         if (guessNumber[0] == randNumber[0] || guessNumber[0]==randNumber[1] 
         || guessNumber[0]==randNumber[2] ) {
        firstBall=true;
        // strike='1';
        ballLength<3? ballLength +=1 : ballLength=ballLength;
      } 
      if (guessNumber[1] == randNumber[0]  || guessNumber[1]==randNumber[1] 
         || guessNumber[1]==randNumber[2] ) {
        firstBall=true;
        // strike='1';
        ballLength<3? ballLength +=1 : ballLength=ballLength;
      }
      if (guessNumber[2] == randNumber[0]  || guessNumber[2]==randNumber[1] 
         || guessNumber[2]==randNumber[2] ) {
        firstBall=true;
        // strike='1';
       ballLength<3? ballLength +=1 : ballLength=ballLength;
      }
        
        
      } else if (ballLength>3) {
        ballLength=3;
      }

      print("balllength$ballLength");


    });
  }

  strikeOut(){
         showDialog(
        context: context,
        builder: (_) => AlertDialog(
            title: Text('Strike out'),
            content: Container(
              height: 95,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Start new game'),
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: RaisedButton(
                      child: Text('Ok'),
                      onPressed: (){
                       Navigator.pop(context);
                       setState(() {
                        //  guessNumber='';
                         Get.offAll(SplashScreen());
  //         randNumber='${_logicControllers.rand1.value}${_logicControllers.rand2.value}${_logicControllers.rand3.value}';
  //                         guessNumber='';
  //  fstSttring=false;
  //  scndSttring=false;
  
  //  thrdSttring=false;
  //  strikeLeng=0;

  //  strike='0';

                       });
                      },
                      color: Colors.blue,
                      textColor: Colors.white,
                      ),
                  )
                ],
              ),
            ),
        )
    );
  }

  getMessage() async{
     await Future.delayed(Duration(milliseconds: 50));
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
            title: Text('Play Ball'),
            content: Container(
              height: 95,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Press Start'),
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: RaisedButton(
                      child: Text('Start'),
                      onPressed: (){
                       Navigator.pop(context);
                      },
                      color: Colors.blue,
                      textColor: Colors.white,
                      ),
                  )
                ],
              ),
            ),
        )
    );
  }

  
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init:  LogicControllers(),
      builder: (controller){
return Scaffold(
      appBar: AppBar(
        title: Text('Baseball Game'),
        actions: [
          TextButton(
            onPressed: (){
            //  getMessage();
            _logicControllers.print();
            print(_logicControllers.rand1.value);
            print(_logicControllers.rand2.value);
            print(_logicControllers.rand3.value);
            randNumber='${_logicControllers.rand1.value}${_logicControllers.rand2.value}${_logicControllers.rand3.value}';

            print("rand $randNumber");
            setState(() {
            ballLength=0;
            strikeLeng=0;
            guessNumber='';
            fstSttring=false;
            scndSttring=false;
            thrdSttring=false;

            firstBall=false;
            secBall=false;
            thirdBall=false;
            ballLength=0;
            _textEditingController.text='';
             randNumber='${_logicControllers.rand1.value}${_logicControllers.rand2.value}${_logicControllers.rand3.value}';

            });
            
          }, child: Padding(
            padding: const EdgeInsets.only(right :8.0),
            child: Text('New Game', style: TextStyle(color: Colors.white),),
          ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 18.0 ,
          top: 12
          ),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  child: Row(
                    children: [
                      Text('key      :  ' ,style:  TextStyle(fontSize: 18),),
                      Text('$randNumber')
                    ],
                  ),
                  
                  
                ),
                SizedBox(
                  height: 18,
                ),
                 Row(
                    children: [
                      Text('Guess :  ' ,style:  TextStyle(fontSize: 18),),
                      Text('$guessNumber')
                    ],
                  ),
                  
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text('Balls :  '),
                      Text('$ballLength')
                      ],
          
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: (ballLength ==1 || ballLength==2 || ballLength ==3) ? Colors.blueAccent : Colors.transparent,
                          shape: BoxShape.circle,
                          border:Border.all(
                            color: Colors.blueAccent,
                            width: 4
                          )
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color:(ballLength==2 || ballLength ==3 )? Colors.blueAccent : Colors.transparent,
                          shape: BoxShape.circle,
                          border:Border.all(
                            color: Colors.blueAccent,
                            width: 4
                          )
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: ballLength ==3? Colors.blueAccent : Colors.transparent,
                          shape: BoxShape.circle,
                          border:Border.all(
                            color: Colors.blueAccent,
                            width: 4
                          )
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                    ],
                  ),
          
                  SizedBox(
                    height: 5,
                  ),
          
          
                  Row(
                    children: [
                      Text('Strikes :  '),
                      Text('$strikeLeng')
                    ],
                  ),
          
                   Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: strikeLeng ==1 || strikeLeng==2 || strikeLeng==3 ? Colors.redAccent : Colors.transparent,
                          border:Border.all(
                           color: Colors.redAccent,
                            width: 4
                          )
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          
                          color: strikeLeng ==2|| strikeLeng==3 ? Colors.redAccent : Colors.transparent,
                          shape: BoxShape.circle,
                          border:Border.all(
                            color: Colors.redAccent,
                            width: 4
                          )
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          
                          color:  strikeLeng==3 ? Colors.redAccent : Colors.transparent,
                          shape: BoxShape.circle,
                          border:Border.all(
                            color: Colors.redAccent,
                            width: 4
                          )
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
          
                      SizedBox(
                        height: 12,
                      ),
          
                      
                    ],
                  ),
          
                  Padding(
                    padding: const EdgeInsets.only(right:18.0),
                    child: TextFormField(
                      controller: _textEditingController,
                      textAlign: TextAlign.center,
                      validator: (value){
                        if (value.toString().length > 3) {
                            return 'Digit greater than 3 ';
                        }
                         if (value.toString().length < 3) {
                            return 'Digit less than 3 ';
                        }
                        if (value.toString().contains('-') ||value.toString().contains('-') ) {
                          return 'only digits are allowed';
                        }
                        if (_textEditingController.text[0] == _textEditingController.text[1] || _textEditingController.text[1] == _textEditingController.text[2] ||  _textEditingController.text[0] == _textEditingController.text[2]) {
                          
                        return 'invalid : repeated digits are not allowed'; 
                        }
                      } ,
                      keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                          
                            suffixIcon: IconButton(
                              onPressed: (){
                                _textEditingController.text='';
                              },
                               icon: Icon(
                                 Icons.cancel
                               ))
                            ,
                            hintText: 'Enter your Guess( 3 Digits)'
                          ),
                          
                        ),
                  ),
          
                  RaisedButton(
                    color: Colors.blue,
                    onPressed: (){
                            if (_formKey.currentState!.validate()) {
                              guessNumberState();
                    }
                    },
                    child: Text('Submit',style: TextStyle(color: Colors.white),),
                    
                    )
              ],
            ),
          ),
        ),
      ),
    );
    });
  }
}