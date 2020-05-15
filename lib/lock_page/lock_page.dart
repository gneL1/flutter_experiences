import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui' as ui;

class LockPage extends StatefulWidget {
  LockPage({ Key key }) : super(key: key);

  @override
  LockPageState createState() => new LockPageState();
}

class LockPageState extends State<LockPage> {




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



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('锁定'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
//            Container(
//              width: ScreenUtil().setWidth(480),
////              height: ScreenUtil().setHeight(44),
//              child: UtilVerification(
//                textCount: 6,
//                height: ScreenUtil().setHeight(56),
//                onFinish: (v){
//                  print('输入完的值是$v');
//                },
//                decoration: BoxDecoration(
//                  border: Border.all(color: Colors.grey),
//                ),
////                inputFormatters: <TextInputFormatter>[
////                  WhitelistingTextInputFormatter.digitsOnly
////                ],
//              ),
//            ),


            Container(
              width: 400,
              margin: EdgeInsets.symmetric(
                vertical: ScreenUtil().setHeight(56),
                horizontal: ScreenUtil().setWidth(44)
              ),
//              color: Colors.red[100].withOpacity(0.2),
              child: UtilVerificationNew(
                textCount: 6,
                itemWidth: ScreenUtil().setWidth(56),
                height: ScreenUtil().setHeight(72),
                textStyle: TextStyle(
                  fontSize: ScreenUtil().setSp(24)
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 2
                  ),
                  borderRadius: BorderRadius.circular(4)
                ),
                onFinish: (v){
                  print('输入完成$v');
                },
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  WhitelistingTextInputFormatter.digitsOnly
                ],
              ),
            ),

//            FlatButton(
//              onPressed: (){
//                FocusScope.of(context).unfocus();
//              },
//              child: Text('关闭焦点'),
//            ),
//
//
//
//            Container(
//              decoration: BoxDecoration(
//                border: Border.all(color: Colors.grey),
//              ),
//              height: ScreenUtil().setHeight(72),
//              width: ScreenUtil().setWidth(56),
//              alignment: Alignment.center,
//              child: TextField(
//                maxLines: 1,
//                textAlign: TextAlign.center,
//                decoration: InputDecoration(
//                  filled: true,
//                  fillColor: Colors.red[100],
//                  border: InputBorder.none,
//                  contentPadding: EdgeInsets.symmetric(
//                    vertical: 10
//                  )
//                ),
//              ),
//            ),

            Container(
              width: ScreenUtil().setWidth(210),
              decoration: BoxDecoration(
                color: Colors.grey
              ),
            ),
          ],
        ),
      ),
    );
  }



}


class UtilVerification extends StatefulWidget {
  //完成输入的回调函数
  final ValueChanged<String> onFinish;

  //装饰
  final Decoration decoration;

  //字体
  final TextStyle textStyle;

  //输入数量
  final int textCount;

  //高度
  final double height;

  //单个输入宽度
  final double itemWidth;

  //键盘类型
  final TextInputType keyboardType;

  //输入限制
  final List<TextInputFormatter> inputFormatters;

  const UtilVerification({
    Key key ,
    this.onFinish,
    this.decoration = const BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: Colors.grey
        )
      )
    ),
    this.textStyle = const TextStyle(
      //去掉文字底部的装饰线
      // decorationColor: Colors.white.withOpacity(0)
    ),
    this.textCount = 6,
    this.height = 44,
    this.itemWidth = 36,
    this.keyboardType = TextInputType.number,
    this.inputFormatters
  }) : super(key: key);

  @override
  UtilVerificationState createState() => new UtilVerificationState();
}

class UtilVerificationState extends State<UtilVerification> {



  List<FocusNode> _focusNodeList = List<FocusNode>();
  List<TextEditingController> _controllerList = List<TextEditingController>();
  FocusNode _currentFocusNode;

  //一个输入对应一个组件
  List<Widget> _widgetList(){
    List<Widget> _widgetList = List<Widget>();
    for(int i = 0; i < widget.textCount ;i ++){
      _widgetList.add(_item(index: i));
    }
    return _widgetList;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for(int i = 0; i < widget.textCount ;i ++){
      _focusNodeList.add(FocusNode());
      _controllerList.add(TextEditingController()..text = ' ');
    }
    //设置当前focusnode
    _currentFocusNode = _focusNodeList[0];
    setState(() {
    });

  }

  @override
  void dispose() {
    for(int i = 0; i < widget.textCount ;i ++){
      _focusNodeList[i].dispose();
      _controllerList[i].dispose();
    }
    _focusNodeList.clear();
    _controllerList.clear();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: <Widget>[

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _widgetList(),
        ),

        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          child: Listener(
            onPointerDown: (v){
              FocusScope.of(context).unfocus();
              FocusScope.of(context).requestFocus(_currentFocusNode);
            },
            behavior: HitTestBehavior.opaque,
          ),
        ),
      ],
    );
  }


  Widget _item({FocusNode focus,int index}){

    return Container(
      width: widget.itemWidth,
      height: widget.height,
      decoration: widget.decoration,
      alignment: Alignment.center,
      child: TextField(
        focusNode: _focusNodeList[index],
        //添加了maxLength后，底部的counter就会冒出来，只能用SizedBox.shrink()勉强消去
        maxLines: 1,
        maxLength: 2,
        controller: _controllerList[index],
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        keyboardType: TextInputType.number,
        inputFormatters: widget.inputFormatters,
        onChanged: (v){
          //输入到最后一位时
          //v.length == 2用于判断是添加最后一位还是删除最后一位，
          //如果不添加v.length == 2的判断，则删除最后一位，焦点不会跳到上一位
          if((index + 1) == _focusNodeList.length && v.length == 2){
            //关闭焦点
            _focusNodeList.forEach((v){
              v.unfocus();
            });

            //获取输入值
            String text = '';
            _controllerList.forEach((item){
              text = text + item.text[item.text.length - 1];
            });
            if(widget.onFinish != null)widget.onFinish(text);
          }

          //当前位没有输入时，关闭键盘再点击控件
          else if(v.length == 0){
            //如果不在第一位，则点击删除为退回到上一位
            if(index - 1 >= 0){
              _controllerList[index].text = ' ';
              FocusScope.of(context).requestFocus(_focusNodeList[index - 1]);
              _currentFocusNode = _focusNodeList[index - 1];
            }
            //如果在第一位
            else{
              _controllerList[index].text = ' ';

              Future.sync((){
                _currentFocusNode.unfocus();
              }).whenComplete((){
                FocusScope.of(context).requestFocus(_focusNodeList[index]);
              });
            }

          }

          //v即输入文字，当前位输入后跳转到下一位
          else if(v.length == 2){
            FocusScope.of(context).requestFocus(_focusNodeList[index + 1]);
            _currentFocusNode = _focusNodeList[index + 1];

          }
          //删除当前位文字，v变为1，跳转到上一位
          else{
            //第一位删除后没有上一位，故在此做安全判断
            if(index - 1 >= 0){
              FocusScope.of(context).requestFocus(_focusNodeList[index - 1]);
              _currentFocusNode = _focusNodeList[index - 1];

            }
          }
        },
        style: widget.textStyle,
        decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(
              right: 1,
              top: 8,
              bottom: 10,
              left: 0

            ),
            counter: SizedBox.shrink()
        ),
      ),
    );
  }
}





class UtilVerificationNew extends StatefulWidget {
  //完成输入的回调函数
  final ValueChanged<String> onFinish;

  //装饰
  final Decoration decoration;

  //字体
  final TextStyle textStyle;

  //输入数量
  final int textCount;



  //高度
  final double height;

  //单个输入宽度
  final double itemWidth;

//
  //键盘类型
  final TextInputType keyboardType;
//
  //输入限制
  final List<TextInputFormatter> inputFormatters;

  UtilVerificationNew({
    Key key ,
    this.itemWidth = 44,
    this.textCount = 6,
    this.textStyle,
    this.decoration = const BoxDecoration(
      border: Border(
        bottom: BorderSide(color: Colors.grey)
      )
    ),
    this.onFinish,
    this.height = 56,
    this.keyboardType,
    this.inputFormatters
  }) : super(key: key);

  @override
  UtilVerificationNewState createState() => new UtilVerificationNewState();
}

class UtilVerificationNewState extends State<UtilVerificationNew> {

  //焦点
  FocusNode _focusNode;
  
  //获取输入内容
  TextEditingController _controller;
  
  //要显示的文字
  List<String> _textList = List<String>();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _focusNode = FocusNode();
    _controller = TextEditingController();
    for(int i = 0;i < widget.textCount;i++){
      _textList.add('');
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    _textList.clear();
    // TODO: implement dispose
    super.dispose();
  }


  List<Widget> _decorations(){
    List<Widget> _items = List<Widget>();
    for(int i = 0;i < widget.textCount;i++){
      _items.add(
        Container(
          width: widget.itemWidth,
          decoration: widget.decoration,
          alignment: Alignment.center,
          child: Text(
            _textList[i],
            style: widget.textStyle,
          ),
        ),
      );
    }
    return _items;
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      child: Stack(
        children: <Widget>[
          TextField(
            focusNode: _focusNode,
            controller: _controller,
            maxLength: widget.textCount,
            inputFormatters: widget.inputFormatters,
            keyboardType: widget.keyboardType,
            textAlign: TextAlign.right,
            showCursor: false,
            style: TextStyle(color: Colors.transparent,fontSize: 1),
            onChanged: (v){
              //输入框的值传递给Text
              for(int i = 0; i < widget.textCount; i++){
                if(i < v.length){
                  _textList[i] = v[i];
                }
                else{
                  _textList[i] = '';
                }
              }
              //达到最大长度关闭软键盘
              if(v.length == widget.textCount){
                _focusNode.unfocus();
                widget.onFinish(_controller.text);
              }
              setState(() {

              });
            },
            decoration: InputDecoration(
                border: InputBorder.none,
                counter: SizedBox.shrink()
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _decorations(),
          ),

          Listener(
            onPointerDown: (v){
              //点击控件打开软键盘
              FocusScope.of(context).requestFocus(_focusNode);
            },
            behavior: HitTestBehavior.opaque,
          )
        ],
      ),
    );
  }
}





