
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutterexperiences/utils/util_text.dart';
import 'package:flutterexperiences/utils/util_textfield.dart';

class BaseWidgetTextView extends StatefulWidget {
  BaseWidgetTextView({ Key key }) : super(key: key);

  @override
  BaseWidgetTextViewState createState() => new BaseWidgetTextViewState();
}

class BaseWidgetTextViewState extends State<BaseWidgetTextView> {

  TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

  }

  void getValue(String text){
    print('获取文本$text');
    setState(() {

    });
  }

  String style = 'TextStyle(fontSize: 36)';

  String ttt = "Text('1111',style: TextStyle(fontSize: 36))";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Padding(
              padding: EdgeInsets.only(
                left: ScreenUtil().setWidth(20),
                top: ScreenUtil().setHeight(20)
              ),

              child: UtilText.title(
                'Text属性：'
              ),
            ),

            Container(
              margin: EdgeInsets.all(ScreenUtil().setWidth(20)),
              height: ScreenUtil().setHeight(56),
              alignment: Alignment.center,
              child: UtilTextField(
                textEditingController: _textController,
                color: Colors.lightBlue,
                valueChanged: getValue,hintText: '输入Text',
              ),
            ),

            Container(
              margin: EdgeInsets.only(
                left: ScreenUtil().setWidth(20)
              ),
              width: ScreenUtil().setWidth(400),
              height: ScreenUtil().setHeight(96),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey
                )
              ),
              child: Scrollbar(
                child: SingleChildScrollView(
                  child: Text(
                    '这里是一段测试文字这里是一段测试文字这里是一段测试文字这里是一段测试文字这里是一段测试文字'
                        '这里是一段AAAcsacas测试文字这里是一段测试文字这里是一段测试文字这里是一段测试文字这里是一段测试文字'
                        '这里是一段测试文字这里是一段测试文字这里是一段测试文字这里是一段测试文字这里是一段测试文字',
//                    textAlign: TextAlign.left,
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      letterSpacing: 1,

                    ),
                  ),
                ),
              ),

            ),

//            Container(
//              margin: EdgeInsets.all(100),
//              decoration: BoxDecoration(
//                border: Border.all(
//                  color: Colors.grey
//                )
//              ),
//              width: ScreenUtil().setWidth(400),
//              height: ScreenUtil().setHeight(200),
//              child: Text('cxzczxczxczxxzczxczxcxzczxczxczxxzczxczxcxzczxczxczxxzczxczx',
//                textWidthBasis: TextWidthBasis.parent,
//                strutStyle: StrutStyle(
//                  fontFamily: 'serif',
//                  fontFamilyFallback: ['monospace', 'serif'],
//                  fontSize: 20,
//                  height: 2,
//                  leading: 2.0,
//                  fontWeight: FontWeight.w300,
//                  fontStyle: FontStyle.normal,
//                  forceStrutHeight: true,
//                  debugLabel: 'text demo',
//                ),),
//            ),
            


          ],
        ),
      ),
    );
  }
}


