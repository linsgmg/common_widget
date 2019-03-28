import 'package:flutter/material.dart';

class StepDemo extends StatefulWidget {
  _StepDemoState createState() => _StepDemoState();
}

class _StepDemoState extends State<StepDemo> {
  int _currentStep=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StepDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Theme(
              data: Theme.of(context).copyWith(primaryColor: Colors.black),
              child: Stepper(
                currentStep: _currentStep,
                onStepTapped: (value){
                  setState(() {
                   _currentStep=value; 
                  });
                },
                onStepContinue: (){
                  setState(() {
                   _currentStep<2?_currentStep+=1:_currentStep=2; 
                  });
                },
                onStepCancel: (){
                  setState(() {
                   _currentStep>0?_currentStep-=1:_currentStep=0; 
                  });
                },
                steps: [
                  Step(
                      title: Text('Login'),
                      subtitle: Text('Login first'),
                      content: Text(
                          'Deserunt anim et culpa nostrud sunt aute aliqua mollit fugiat.'),
                      isActive: _currentStep==0),
                  Step(
                      title: Text('Chose Plan'),
                      subtitle: Text('Chose your plan'),
                      content: Text(
                          'Deserunt anim et culpa nostrud sunt aute aliqua mollit fugiat.'),
                      isActive: _currentStep==1),
                  Step(
                      title: Text('Confirm payment'),
                      subtitle: Text('Confirm your payment method'),
                      content: Text(
                          'Deserunt anim et culpa nostrud sunt aute aliqua mollit fugiat.'),
                      isActive: _currentStep==2),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
