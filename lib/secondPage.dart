


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
        end: Offset(0.0, 0.0),).animate(CurvedAnimation(parent: animationController,
        curve: Interval(0.0, 1.0)));

    animation2 = Tween<Offset>( begin: Offset(0.0, 1.0),
      end: Offset(0.0, 0.0),).animate(CurvedAnimation(parent: animationController,curve: Interval(0.0, 1.0)));


    animationController.forward();
    print('Second INIT');
    super.initState();
  }

  Widget BottomUp()
  {
    return Padding(
      padding: const EdgeInsets.only(top:10.0),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(70.0)),color: Colors.black12),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

            Padding(
              padding: const EdgeInsets.only(left: 10.0,right: 10.0,top: 25.0),
              child: SizedBox(height: 20.0,
              child:
        Checkbox(value: true, onChanged: null,),

        ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:20.0,top: 10.0),
              child: new Text('you agree to allow CRED to check your credit information with Experian or CRIF. \n '
                  'we need to check if you are a credit card holder with a credit score higher than our accepted thresold'
                  'verification not impact your credit Score.',style: Theme.of(context).textTheme.subhead,),
            )
,
            Padding(
              padding: const EdgeInsets.only(left:20.0,top: 10.0),
              child: new RaisedButton(onPressed:_onPress,child: new Text('Agree & Continue'),),
            )

          ],
        ),

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


                      Expanded(
                        child:
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0,left: 10.0,right: 10.0),
                        child: new SlideTransition(position: animation,

                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[

                             Expanded(child:
                              new Text(' give us Your\n mobile number',style: Theme.of(context).textTheme.body2),
                                flex: 1,),

                            Expanded(child:
                            Padding(
                              padding: const EdgeInsets.only(left:0,top:10.0),
                              child: new Text(' mobile number linked with bank is needed to apply', style: Theme.of(context).textTheme.subhead,),
                            ),
                            flex: 1,),



                            Expanded(child:
                            new Container(

                            child: TextField(
                              decoration: new InputDecoration.collapsed(
                                  enabled: true,hintText: ' 9999999999',hintStyle: Theme.of(context).textTheme.body1,
                              ),
                            ),
                            ),flex: 5,
                            )

                            ],
                          ) ,),
                      ),
                      flex: 3,
                      ),

                      Expanded(child:
                      Padding(
                        padding: const EdgeInsets.only(bottom : 0.0,left: 10.0,right: 10.0),
                        child: new SlideTransition(position: animation2,child:BottomUp() ,),
                      ),
                        flex: 2,
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
