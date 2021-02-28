import 'package:flutter/material.dart';

void main() {
  runApp(app);
}

Widget get app {
  return MaterialApp(
    title: 'Stepper App',
    theme: ThemeData(primarySwatch: Colors.purple),
    home: homeScreen,
  );
}

Widget get homeScreen {
  return Scaffold(
    appBar: appBar,
    body: body,
  );
}

Widget get appBar {
  return AppBar(
    title: Text('Stepper'),
    leading: Icon(Icons.home),
    actions: [IconButton(icon: Icon(Icons.search), onPressed: onSearchClick)],
  );
}

Widget get body {
  return Stepper(
    type: StepperType.horizontal,
    currentStep: 1,
    steps: [
      Step(
          isActive: true,
          title: Text('Delivery'),
          content: deliveryContentWidget),
      Step(title: Text('Address'), content: addressContentWidget),
      Step(title: Text('Payment'), content: paymentContentWidget)
    ],
  );
}

Widget get deliveryContentWidget {
  return Container(
    width: 100,
    height: 100,
    color: Colors.grey,
    child: Center(
      child: Text('Delivery'),
    ),
  );
}

Widget get addressContentWidget {
  return Container(
    width: 100,
    height: 100,
    color: Colors.blueAccent,
    child: Center(
      child: Text('Address'),
    ),
  );
}

Widget get paymentContentWidget {
  return Container(
    width: 100,
    height: 100,
    color: Colors.black,
    child: Center(
      child: Text('Payment'),
    ),
  );
}

void onSearchClick() {}
