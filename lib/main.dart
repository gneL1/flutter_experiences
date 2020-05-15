import 'dart:ui';

import 'package:color_thief_flutter/color_thief_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterexperiences/Router.dart';
import 'package:flutterexperiences/utils/util_functions.dart';
import 'package:flutterexperiences/utils/util_item.dart';

import 'R.dart';


void main(){
  //在runApp()之前如果访问二进制文件或者初始化插件，需要先调用
  WidgetsFlutterBinding.ensureInitialized();
//  debugRepaintRainbowEnabled = true;
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
    return Listener(
      behavior: HitTestBehavior.translucent,
      onPointerDown: (v){
        //触摸收起键盘
//        FocusScopeNode currentFocus = FocusScope.of(context);
//        if(!currentFocus.hasPrimaryFocus){
//          currentFocus.unfocus();
//        }
//        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        onGenerateRoute: Router.generateRoute,
        navigatorKey: Router.navigatorKey,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key,}) : super(key: key);


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String _warmText = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //监听键盘的打开和关闭
    KeyboardVisibility.onChange.listen((visible){
      if(!visible)Router.closeFocusNode();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

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
                      Navigator.pushNamed(context, Router.BaseWidget_Index);
                    },
                    title: '基础组件',
                    description: 'TextView、TextPainter之类的',
                  ),


                  UtilItem(
                    icon: Icon(Icons.center_focus_weak,color: Colors.lightBlueAccent[400].withOpacity(0.8),),
                    onPressed: (){
                      Navigator.pushNamed(context, Router.CustomWidget_Index);
                    },
                    title: '自定义组件',
                    description: 'CustomPaint、Path之类的',
                  ),

                  UtilItem(
                    icon: Icon(Icons.transfer_within_a_station,color: Colors.lightBlueAccent[400].withOpacity(0.8),),
                    onPressed: (){
                      Navigator.pushNamed(context, Router.AnimationWidget_Index);
                    },
                    title: '动画组件',
                    description: 'Animation隐式、显示、Hero、交织、物理等动画',
                  ),

                  UtilItem(
                    icon: Icon(Icons.center_focus_weak,color: Colors.lightBlueAccent[400].withOpacity(0.8),),
                    onPressed: (){
                      Navigator.pushNamed(context, Router.Lock_Page);
                    },
                    title: '锁屏',
                    description: '',
                  ),

                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(100),
                    width: ScreenUtil().setWidth(300),
                    height: ScreenUtil().setHeight(300),
                    decoration: BoxDecoration(
                      color: Colors.red[100],
                    ),
                    child: FlatButton(
                      onPressed: () async{
                        _warmText = '开始转换';
                        setState(() {

                        });
                        await getImageFromProvider(
                          AssetImage(R.intPic.int_pic_01)
                        ).then((image) async{
                          print('获取图片：$image');
                          await getColorFromImage(image,1).then((color){
                            print('获取颜色：$color');
                          });
                          await getPaletteFromImage(image,256,1).then((palette){
                            print('获取Palette：$palette');
                          });

//                          await getImagePixelArray(image,256,1).then((pixelArray){
//                            print('获取pixelArray：$pixelArray');
//                          });
                        }).whenComplete((){
                          _warmText = '已完成';
                          setState(() {

                          });
                        });
                      },
                      child: Image(image: AssetImage(R.intPic.int_pic_01))
                    ),
                  ),

                  Container(
                    height: 40,

                      alignment:Alignment.center,child: Text(_warmText))





//                  UtilItem(
//                    icon: Icon(Icons.center_focus_weak,color: Colors.lightBlueAccent[400].withOpacity(0.8),),
//                    onPressed: (){
//
//                    },
//                    title: '自定义组件',
//                    description: 'CustomPaint、Path之类的',
//                    isShape: true,
//                  ),



                ],
                
              )
            ),
          )
        ],
      )
    );
  }



}

