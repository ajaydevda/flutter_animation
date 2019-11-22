import 'dart:async';

import 'package:animation_flutter/pageTransitionAnimation.dart';
import 'package:animation_flutter/secondPage.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math ;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
//      theme: ThemeData(
//
//        textTheme: TextTheme(body1: TextStyle(fontStyle: FontStyle.normal,fontSize: 20.0,)),
//        primarySwatch: Colors.blue,
//      ),

        theme: new ThemeData(
          brightness: Brightness.dark,
          textTheme: TextTheme(body1: TextStyle(fontStyle: FontStyle.normal,fontSize: 24.0,color: Colors.grey,),
            body2: TextStyle(fontStyle: FontStyle.normal,fontSize: 20.0,color:Colors.cyan),
            subhead: TextStyle(fontStyle: FontStyle.normal,fontSize: 14.0,color:Colors.grey),

          ),buttonTheme: ButtonThemeData(buttonColor:Color(0xFF4354b3),disabledColor: Color(0xFF0040ff))),

          // new
              home: splashScreen()//MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}



class splashScreen extends StatefulWidget {
  @override
  splashScreen1 createState() => splashScreen1();
}

class splashScreen1 extends State<splashScreen> with SingleTickerProviderStateMixin {

  AnimationController animationController;

  Animation animation,animation2,animation3;

  double Width,Height;

  Timer timer;
  int i=0;

  @override
  void initState() {
    super.initState();
    print('FirstPage INIT');

    animationController = AnimationController(duration: const Duration(seconds: 5), vsync: this);
    animationMethod(100.0,0.0);


    const oneSec = const Duration(seconds:5);
    timer= new Timer.periodic(oneSec, (Timer t) =>
        setState(() {
        })
    );


  }



  animationMethod(a,b)
  {
    animation = Tween<double>(begin: a, end: b).animate(CurvedAnimation(parent: animationController,curve: Interval(0.0, 1.0)));
    /*..addListener(() {
                        setState(() {
                          // The state that has changed here is the animation object’s value.
                        });
                      });*/

    animation2 = Tween<double>(begin: 120, end: 0.0).animate(CurvedAnimation(parent: animationController,  curve: Interval(0.5, 1.0)));
    /*..addListener(() {
        setState(() {
          // The state that has changed here is the animation object’s value.
        });
      });*/

    animation3 = Tween<double>(begin: 0.0, end: 200).animate(animationController);
    /*..addListener(() {
        setState(() {
          // The state that has changed here is the animation object’s value.
        });
      });*/

    animationController.forward();
  }


  Widget _buildCircle(radius) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        ),
        color: Colors.red,
      ),
    );
  }

  Widget _getText()
  {
    String message;
    i++;
    if(i>2)
      {
        i=0;
      }

    switch(i) {
      case 1: {

        message='Credit Card Managed Smartly.';

        // statements;
      }
      break;

      case 2: {
        //statements;
        message= 'lightning fast Payment SettleMent.';
      }
      break;

      default: {
        //statements;
        message= 'Exclusive Reward from Premium Brands.';
      }
      break;
    }

    return new Text(message,style: Theme.of(context).textTheme.body2,);


  }


  @override
  Widget build(BuildContext context) {

    Width= MediaQuery.of(context).size.width;
    Height=MediaQuery.of(context).size.height;




      return Scaffold(
//        body: Container(
//          child: Image.asset('Assests/tenor.gif'),
//        )

//          appBar: AppBar(title: new Text('Animation',),),


          body:

      SafeArea(child:
      Container(height: Height,width: Width,
        decoration: BoxDecoration(
      image: DecorationImage(
      image: AssetImage("Assests/tenor.gif"),fit: BoxFit.cover

      ),),
        child:Column(crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[

              Padding(
                padding: const EdgeInsets.only(left:20.0,bottom: 10.0,),
                child: _getText(),
              ),

            Padding(
              padding: const EdgeInsets.only(bottom :20.0,left: 20.0),
              child: RaisedButton(onPressed: () =>
                  Navigator.push(context,
                      EnterExitRoute(exitPage: this.widget, enterPage: secondPage())),
                child: new Text("Get Started"),
              ),
            )

          ],
        ),
      ),bottom: true,

)
/*
    Container(
      child:Column(
        children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
            AnimatedBuilder(
                animation: animation,
                child: Align(
                  child: _buildCircle(30.0),
                ),

                builder:  (BuildContext context, Widget child) {
                  return Transform.translate(offset: Offset(animation.value, 20.0),child:
                    new Center(
                        child:new Container(height: 200.0,width: 50.0,color: Colors.blue,)
                    )
                      ,);
                }),

            AnimatedBuilder(
                animation: animation2,
                child: Align(
                  child: _buildCircle(30.0),
                ),
                builder:  (BuildContext context, Widget child) {
                  return Transform.translate(offset: Offset(animation2.value, 20.0),
                    child:
                    new Center(
                        child:new Container(height: 200.0,width: 50.0,color: Colors.red,)
                    )
                    ,);}),





        AnimatedBuilder(
            animation: animation3,

            child: Align(
              child: _buildCircle(30.0),
            ),

            builder:  (BuildContext context, Widget child) {
              return Transform.rotate(angle: animation3.value,origin: Offset(0.0, 0.0),
                child:
                new Center(
                    child:new Container(height: 40.0,width: 40.0,color: Colors.red,)
                )
                ,);}),



          ],),

          new RaisedButton(onPressed: onPress)

        ],
      )

    )

*/

      );


    }

//  Transform.rotate(
//  child: child,
//  angle: math.pi * 2 * animation.value,
//  origin: Offset(0, 500),
//  )




  @override
  void dispose() {
    print('FirstPage Dispose');
    animationController.dispose();
    timer.cancel();
    super.dispose();
  }

}




class Spinner extends StatefulWidget {
  @override
  _SpinnerState createState() => _SpinnerState();
}

class _SpinnerState extends State<Spinner> with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SpinningContainer(controller: _controller);
  }
}

class SpinningContainer extends AnimatedWidget {
  const SpinningContainer({Key key, AnimationController controller})
      : super(key: key, listenable: controller);


  Animation<double> get _progress => listenable;

  static const Cubic fastOutSlowIn = Cubic(0.4, 0.0, 0.2, 1.0);
  @override
  Widget build(BuildContext context) {




    return Transform.rotate(
      angle: _progress.value * 2.0 * math.pi,
      child: Container(width: 200.0, height: 200.0, color: Colors.green
      ,child:
        Center(child:
        AnimatedContainer(duration: Duration(seconds: 2),curve: Curves.fastOutSlowIn,child: Container(color: Colors.black,
          height: 20.0,width: 20.0,
        )),
        )
      ),
    );






  }
}




class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}


//
//import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
//import 'package:quick_actions/quick_actions.dart';
//import 'package:simple_permissions/simple_permissions.dart';
//
//void main() => runApp(new MyApp());
//
//class MyApp extends StatefulWidget {
//  @override
//  _MyAppState createState() => new _MyAppState();
//}
//
//class _MyAppState extends State<MyApp> {
//  String _platformVersion = 'Unknown';
//  Permission permission;
//  final  quickActions =  QuickActions();
//
//  @override
//  initState() {
//    super.initState();
//
//
//    initPlatformState();
//
//    quickActions.setShortcutItems(<ShortcutItem>[
//      const ShortcutItem(type: 'action_main', localizedTitle: 'Main view', icon: 'icon_main'),
//      const ShortcutItem(type: 'action_help', localizedTitle: 'Help', icon: 'icon_help')
//    ]);
//
//    quickActions.initialize((shortcutType) {
//      if (shortcutType == 'action_main') {
//        print('action_main');
//      }
//      else if(shortcutType=='action_help')
//        {
//          print('action_help');
//
//        }
//      // More handling code...
//    });
//
//  }
//
//
//
//  // Platform messages are asynchronous, so we initialize in an async method.
//  initPlatformState() async {
//    String platformVersion;
//    // Platform messages may fail, so we use a try/catch PlatformException.
//    try {
//      platformVersion = await SimplePermissions.platformVersion;
//    } on PlatformException {
//      platformVersion = 'Failed to get platform version.';
//    }
//
//    // If the widget was removed from the tree while the asynchronous platform
//    // message was in flight, we want to discard the reply rather than calling
//    // setState to update our non-existent appearance.
//    if (!mounted) return;
//
//    setState(() {
//      _platformVersion = platformVersion;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//
//
//
//
//
//    return new MaterialApp(
//      home: new Scaffold(
//        appBar: new AppBar(
//          title: new Text('Plugin example app'),
//        ),
//        body: new Center(
//          child: new Column(children: <Widget>[
//            new Text('Running on: $_platformVersion\n'),
//            new DropdownButton(
//                items: _getDropDownItems(),
//                value: permission,
//                onChanged: onDropDownChanged),
//            new RaisedButton(
//                onPressed: checkPermission,
//                child: new Text("Check permission")),
//            new RaisedButton(
//                onPressed: requestPermission,
//                child: new Text("Request permission")),
//            new RaisedButton(
//                onPressed: getPermissionStatus,
//                child: new Text("Get permission status")),
//            new RaisedButton(
//                onPressed: SimplePermissions.openSettings,
//                child: new Text("Open settings"))
//          ]),
//        ),
//      ),
//    );
//  }
//
//  onDropDownChanged(Permission permission) {
//    setState(() => this.permission = permission);
//    print(permission);
//  }
//
//  requestPermission() async {
//    final res = await SimplePermissions.requestPermission(permission);
//    print("permission request result is " + res.toString());
//  }
//
//  checkPermission() async {
//    bool res = await SimplePermissions.checkPermission(permission);
//    print("permission is " + res.toString());
//  }
//
//  getPermissionStatus() async {
//    final res = await SimplePermissions.getPermissionStatus(permission);
//    print("permission status is " + res.toString());
//  }
//
//
//
//
//
//  List<DropdownMenuItem<Permission>> _getDropDownItems() {
//    List<DropdownMenuItem<Permission>> items = new List();
//
//    Permission.values.forEach((permission) {
//      var item = new DropdownMenuItem(
//          child: new Text(getPermissionString(permission)), value: permission);
//
//      items.add(item);
//
//    });
//
//
//    return items;
//  }
//}
//
//
//
//
//
//
//
//






