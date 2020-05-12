import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UtilTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  final ValueChanged<String> valueChanged;
  final Color color;
  final String hintText;

  const UtilTextField({
    Key key,
    @ required this.textEditingController,
    this.color = Colors.orange,
    this.hintText = '',
    this.valueChanged }) : super(key: key);

  @override
  UtilTextFieldState createState() => new UtilTextFieldState();
}

class UtilTextFieldState extends State<UtilTextField> {
  int _textLen = 0;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.textEditingController,
      style: TextStyle(
          fontSize: ScreenUtil().setSp(20)
      ),
      cursorColor: widget.color,
      onChanged: (v){
        if(widget.valueChanged != null) widget.valueChanged(v);
        if(v.length == 0 || _textLen == 0 ){
          _textLen = v.length;

          setState(() {

          });
        }
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(

        enabled: true,
        hintText: widget.hintText,
        hintStyle: TextStyle(
            fontSize: ScreenUtil().setSp(20)
        ),
        suffixIcon:  _textLen > 0 ? InkWell(
          borderRadius: BorderRadius.horizontal(
              right: Radius.circular(4)
          ),
          onTap: (){
            //在Frame绘制完成后回调一次，能监听到第一帧绘制完成，第一帧绘制完成标志着已经Build完成
            WidgetsBinding.instance.addPostFrameCallback((_) {
              widget.textEditingController.clear();
              if(widget.valueChanged != null)
                widget.valueChanged('');
            } );
            setState(() {
              _textLen = 0;
            });

          },
          child: Container(
            child: Icon(
                Icons.clear,
                size: ScreenUtil().setWidth(28),
                color: widget.color
            ),
          ),
        ) : null,
        contentPadding: EdgeInsets.only(
            left: ScreenUtil().setWidth(16)
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(4)
            ),
            borderSide: BorderSide(
                color:widget.color
            )
        ),

        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(4)
            ),
            borderSide: BorderSide(
                color:widget.color
            )
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(4)
            ),
            borderSide: BorderSide(
                color:widget.color
            )
        ),
      ),

    );
  }
}