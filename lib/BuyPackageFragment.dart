import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:konnect/res/colors.dart';
import 'package:konnect/widget/verification_code.dart';

class BuyPackageFragment extends StatefulWidget {
  @override
  _BuyPackageFragmentState createState() => _BuyPackageFragmentState();
}

class _BuyPackageFragmentState extends State<BuyPackageFragment> {
  //手机号的控制器
  TextEditingController phoneController = TextEditingController();

  //密码的控制器
  TextEditingController passController = TextEditingController();

  TextEditingController _textController = TextEditingController();

  String value;

  FocusNode secondTextFieldNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _textController.addListener(() {
      print(_textController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        children: <Widget>[
          SizedBox(
            height: kToolbarHeight,
          ),
          Text("要为设备充值，请输入您的设备SN或扫描设备背面印刷的二维码,来购买流量包"),
          SizedBox(
            height: 20.0,
          ),
          Text("输入您的设备SN"),
          SizedBox(
            height: 20.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: TextField(
                  textAlign: TextAlign.center,
                  maxLength: 15,
                  focusNode: secondTextFieldNode,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    border: OutlineInputBorder(),
                  ),
                  textCapitalization: TextCapitalization.characters,
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              IconButton(
                padding: EdgeInsets.only(bottom: 15.0),
                // action button
                icon: Image.asset('assets/images/ic_search_sn.png'),
                iconSize: 40.0,
                onPressed: () {}, //按键响应
              ),
            ],
          ),
          Text("或者"),
          SizedBox(
            height: kToolbarHeight,
          ),
          Text("扫描设备二维码输入"),
          SizedBox(
            height: 20.0,
          ),
          IconButton(
            // action button
            icon: Image.asset('assets/images/ic_scan_sn.png'),
            iconSize: 80.0,
            onPressed: () {}, //按键响应
          ),
          SizedBox(
            height: 20.0,
          ),
          MaterialButton(
            color: Colours.colorPrimaryDark,
            textColor: Colors.white,
            child: new Text('购买'),
            padding: EdgeInsets.all(10),
            onPressed: _login,
          ),
        ],
      ),
    );
  }

  void _login() {
    print({'phone': phoneController.text, 'password': passController.text});
    if (phoneController.text.length != 11) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('手机号码格式不对'),
              ));
    } else if (passController.text.length == 0) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('请填写密码'),
              ));
    } else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('登录成功'),
              ));
      onTextClear();
    }
  }

  void onTextClear() {
    setState(() {
      phoneController.clear();
      passController.clear();
    });
  }

  ///验证码组件
  verificationCode() {
    var textSize = 50.0;
    var spaceWidth = 30.0;
    var letterSpacing = 30.0;
    var underLineBorder = DottedLineUnderlineInputBorder(
      spaceWidth: spaceWidth,
      textSize: textSize,
      textLength: 4,
      letterSpacing: letterSpacing,
      borderSide: BorderSide(color: Colors.black26, width: 2.0),
    );
    return TextField(
      maxLength: 4,
      keyboardType: TextInputType.number,
      style: TextStyle(
        fontSize: textSize,
        color: Colors.black87,
        letterSpacing: letterSpacing,
      ),
      decoration: InputDecoration(
        hintText: '    请 输 入 验 证 码',
        hintStyle: TextStyle(fontSize: 14.0, letterSpacing: 0.0),
        enabledBorder: underLineBorder,
        focusedBorder: underLineBorder,
      ),
    );
  }
}
