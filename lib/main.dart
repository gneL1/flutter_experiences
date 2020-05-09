import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterexperiences/Router.dart';
import 'package:flutterexperiences/utils/util_functions.dart';
import 'package:flutterexperiences/utils/util_item.dart';

import 'R.dart';

void main() => runApp(MyApp());

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

                ],
                
              )
            ),
          )
        ],
      )
    );
  }


  Widget _item(BuildContext context,int index){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.lightBlueAccent),
        color: Colors.lightBlueAccent.withOpacity(0.25),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(16),
        vertical: ScreenUtil().setHeight(8)
      ),
      height: ScreenUtil().setHeight(120),
      child :InkWell(
        borderRadius: BorderRadius.all(Radius.circular(6)),

        onTap: (){

        },
        child: Row(
          children: <Widget>[
            Container(
              width: ScreenUtil().setWidth(90),
              height: ScreenUtil().setHeight(90),
              margin: EdgeInsets.only(
                left: ScreenUtil().setWidth(24)
              ),
              decoration: BoxDecoration(
                  color: getRandomColor(opacity: 0.2),
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: Colors.white,
                      width: 3
                  )
              ),
              child: Icon(
                Icons.build,
                color: Colors.lightBlue.withOpacity(0.8),
              ),
            ),

            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(
                  left: ScreenUtil().setWidth(24),
                  right: ScreenUtil().setWidth(24),
                  top: ScreenUtil().setHeight(24),
                  bottom: ScreenUtil().setHeight(24),
                ),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '基础组件',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: ScreenUtil().setSp(20),
                          fontWeight: FontWeight.w500,

                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),

                      Padding(
                        padding: EdgeInsets.only(
                          top: ScreenUtil().setHeight(8),
                        ),
                        child: Text(
                          '这里进行一些描述性语句',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: ScreenUtil().setSp(18),
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )

          ],
        ),
      )
    );
  }
}
