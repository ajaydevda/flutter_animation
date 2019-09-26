


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class secondPage extends StatefulWidget
{


  @override
  State<StatefulWidget> createState() {
    return _secondPage();
  }



}
class _secondPage extends State<secondPage> with SingleTickerProviderStateMixin
{


  AnimationController animationController;

  Animation animation,animation2;

  @override
  void initState() {
    // TODO: implement initState

    animationController = AnimationController(duration: const Duration(seconds: 2), vsync: this);

    animation = Tween<Offset>( begin: Offset(1.0, 0.0),
        end: Offset(-1.0, 0.0),).animate(CurvedAnimation(parent: animationController,
        curve: Interval(0.0, 1.0)));

    animation2 = Tween<Offset>( begin: Offset(0.0, 5.0),
      end: Offset(0.0, 1.8),).animate(CurvedAnimation(parent: animationController,curve: Interval(0.0, 1.0)));


    animationController.forward();
    print('Second INIT');
    super.initState();
  }

  Widget BottomUp()
  {
    return Container(

      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new Text('you agree to allow CRED to check your credit information with Experian or CRIF. \n '
              'we need to check if you are a credit card holder with a credit score higher than our accepted thresold'
              'verification not impact your credit Score.')
,
          new RaisedButton(onPressed:_onPress,child: new Text('Agree & Continue'),)

        ],
      ),

    );

  }


  _onPress()
  {

  }


  @override
  Widget build(BuildContext context) {

    print(">>><<<");

    return Scaffold(


      body:

          SafeArea(child:
      Container(

        child:  AnimatedBuilder(
            animation: animation,
            builder:  (BuildContext context, Widget child) {
              return Column(

                    children: <Widget>[


                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: new SlideTransition(position: animation,child:new Text(' give us Your\n mobile number') ,),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(bottom : 10.0,left: 10.0,right: 10.0),
                        child: new SlideTransition(position: animation2,child:BottomUp() ,),
                      )



              ],
                  );

            }),



      ),
          )
    );




  }

  @override
  void dispose() {
  print('SecondPage Dispose');

  animationController.dispose();
    super.dispose();
  }

}
