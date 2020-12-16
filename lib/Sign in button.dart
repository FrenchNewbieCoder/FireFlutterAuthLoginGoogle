import 'package:flutter/material.dart';


Widget button()
{
Padding
(
padding: EdgeInsets.all(10
)
);
TextButton.icon(onPressed: () {},
icon: Icon
(
Icons.account_circle, color: Colors.white,)
,
label: Text
("Enter your Login"
,
style: TextStyle
(
color: Colors.white),
)
,
style: ButtonStyle
(
backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder
(
borderRadius: BorderRadius.circular(40
)
)
)
,
elevation: MaterialStateProperty.all<double>(0
)
,
side: MaterialStateProperty.all<BorderSide>(BorderSide
(
width: 1
,
color: Colors.transparent))
)
);
TextButton.icon(onPressed: () {},
icon: Icon
(
Icons.login, color: Colors.white,)
,
label: Text
('Enter your Password'
,
style: TextStyle
(
color: Colors.white),
)
,
style: ButtonStyle
(
backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder
(
borderRadius: BorderRadius.circular(40
)
)
)
,
elevation: MaterialStateProperty.all<double>(0
)
,
side: MaterialStateProperty.all<BorderSide>(BorderSide
(
width: 1
,
color: Colors.transparent))
)
);
Padding
(
padding: EdgeInsets.only(left: 2
)
);


Padding
(
padding: EdgeInsets.all(10
)
);
}