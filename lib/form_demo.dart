import 'package:flutter/material.dart';

class FormDemo extends StatelessWidget {
  final Widget child;

  FormDemo({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('form demo'),
      ),
      body: Theme(
        // data: ThemeData(
        //   primaryColor: Colors.blue,
        // ),
        data: Theme.of(context).copyWith(primaryColor: Colors.yellow),
        // child: ThemeDemo(),

        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[RegisterFormDemo()],
          ),
        ),
      ),
    );
  }
}

class RegisterFormDemo extends StatefulWidget {
  final Widget child;

  RegisterFormDemo({Key key, this.child}) : super(key: key);

  _RegisterFormDemoState createState() => _RegisterFormDemoState();
}

class _RegisterFormDemoState extends State<RegisterFormDemo> {
  final registerFormKey = new GlobalKey<FormState>();
  String username;
  String password;
  bool _autovalidate = false;

  void submitRegisterForm() {
    if (registerFormKey.currentState.validate()) {
      registerFormKey.currentState.save();
      debugPrint('username: $username');
      debugPrint('password: $password');
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('Register...'),
        )
      );
    } else {
      setState(() {
        _autovalidate = true;
      });
    }
  }

  String validatUsername(value) {
    if (value.isEmpty) {
      return 'Username is required.';
    }
    return null;
  }

  String validatPassword(value) {
    if (value.isEmpty) {
      return 'Username is required.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerFormKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Username',
              helperText: '',
              helperStyle: TextStyle(color: Colors.red),
            ),
            onSaved: (value) {
              username = value;
            },
            validator: validatUsername,
            autovalidate: _autovalidate,
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              helperText: '',
              helperStyle: TextStyle(color: Colors.red),
            ),
            onSaved: (value) {
              password = value;
            },
            validator: validatPassword,
            autovalidate: _autovalidate,
          ),
          SizedBox(
            height: 32,
          ),
          Container(
            width: double.infinity,
            child: RaisedButton(
              color: Theme.of(context).accentColor,
              child: Text('Register',
                  style: TextStyle(
                    color: Colors.white,
                  )),
              elevation: 0,
              onPressed: () => submitRegisterForm(),
            ),
          )
        ],
      ),
    );
  }
}

class ThemeDemo extends StatelessWidget {
  final Widget child;

  ThemeDemo({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
    );
  }
}

class TextFieldDemo extends StatefulWidget {
  final Widget child;

  TextFieldDemo({Key key, this.child}) : super(key: key);

  _TextFieldDemoState createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  final textEditingController = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textEditingController.text = 'hello';
    textEditingController.addListener(() {
      debugPrint('input: ${textEditingController.text}');
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      // onChanged: (value){
      //   debugPrint('change: $value');
      // },
      controller: textEditingController,
      onSubmitted: (value) {
        debugPrint('submitt; $value');
      },
      decoration: InputDecoration(
        icon: Icon(Icons.subject),
        labelText: 'Title',
        hintText: 'Enter the post name',
        // border: InputBorder.none,
        border: OutlineInputBorder(),
        filled: true,
      ),
    );
  }
}
