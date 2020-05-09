import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterexperiences/Router.dart';
import 'package:flutterexperiences/utils/util_functions.dart';
import 'package:flutterexperiences/utils/util_item.dart';

import 'R.dart';


void main(){
  //在runApp()之前如果访问二进制文件或者初始化插件，需要先调用
  WidgetsFlutterBinding.ensureInitialized();
  //强制竖屏
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((v){
    runApp(MyApp());
  });

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: Router.generateRoute,
      navigatorKey: Router.navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key,}) : super(key: key);


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    var t= MediaQuery.of(context).size;
    print('t is :$t');
    ScreenUtil.init(context, width: 800, height: 1280);
    return Scaffold(
      appBar: AppBar(
        title: Text('demo'),

      ),
      body: Stack(
        children: <Widget>[
//          Image(image: AssetImage(R.intPic.int_pic_01)),
          Container(
            padding: EdgeInsets.only(
            ),
            child: Scrollbar(
              child: ListView(
                children: <Widget>[
                  UtilItem(
                    icon: Icon(Icons.build,color: Colors.lightBlueAccent[400].withOpacity(0.8),),
                    onPressed: (){

                    },
                    title: '基础组件',
                    description: 'TextView、TextPainter之类的',
                  ),


                  UtilItem(
                    icon: Icon(Icons.center_focus_weak,color: Colors.lightBlueAccent[400].withOpacity(0.8),),
                    onPressed: (){

                    },
                    title: '自定义组件',
                    description: 'CustomPaint、Path之类的',
                  ),

                  UtilItem(
                    icon: Icon(Icons.center_focus_weak,color: Colors.lightBlueAccent[400].withOpacity(0.8),),
                    onPressed: (){

                    },
                    title: '自定义组件',
                    description: 'CustomPaint、Path之类的',
                    isShape: true,
                  ),



                ],
                
              )
            ),
          )
        ],
      )
    );
  }



}

