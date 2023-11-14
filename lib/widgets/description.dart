

import 'package:flutter/material.dart';



class Description extends StatefulWidget {
  const Description({
    super.key,
    });

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {

  int count = 1;

   List<bool> sized = [true, false, false, false];
  List<bool> colored = [true, false, false, false];
  int sizeIndex = 0;
  String? size;
  void getSize() {
    if (sizeIndex == 0) {
      setState(() {
        size = "S";
      });
    } else if (sizeIndex == 1) {
      setState(() {
        size = "M";
      });
    } else if (sizeIndex == 2) {
      setState(() {
        size = "L";
      });
    } else if (sizeIndex == 3) {
      setState(() {
        size = "XL";
      });
    }
  }

 Widget _buildSizePart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Size",
          style: myStyle,
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          width: 265,
          child: ToggleButtons(
            onPressed: (int index) {
              setState(() {
                for (int indexBtn = 0; indexBtn < sized.length; indexBtn++) {
                  if (indexBtn == index) {
                    sized[indexBtn] = true;
                  } else {
                    sized[indexBtn] = false;
                  }
                }
              });
              setState(() {
                sizeIndex = index;
              });
            },
            isSelected: sized,
            children:  const [
              Text("S"),
              Text("M"),
              Text("L"),
              Text("XL"),
            ],
          ),
        ),
      ],
    );
  }


  Widget _buildColorProduct({Color? color}){
    return Container(
          child: Container(
            height: 40,
            width: 40,
            color: color,
          ),
        );
  }

  int colorIndex = 0;
  String? color;
  void getColor() {
    if (colorIndex == 0) {
      setState(() {
        color = "Light Blue";
      });
    } else if (colorIndex == 1) {
      setState(() {
        color = "Light Green";
      });
    } else if (colorIndex == 2) {
      setState(() {
        color = "Light Yellow";
      });
    } else if (colorIndex == 3) {
      setState(() {
        color = "Cyan";
      });
    }
  }

   Widget _buildColorPart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(
          height: 10,
        ),
        Text(
          "Color",
          style: myStyle,
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          width: 265,
          child: ToggleButtons(
            fillColor: const Color(0xff746bc9),
            renderBorder: false,
            onPressed: (int index) {
              setState(() {
                for (int indexBtn = 0; indexBtn < colored.length; indexBtn++) {
                  if (indexBtn == index) {
                    colored[indexBtn] = true;
                  } else {
                    colored[indexBtn] = false;
                  }
                }
              });
              setState(() {
                colorIndex = index;
              });
            },
            isSelected: colored,
            children: [
              _buildColorProduct(color: Colors.blue[200]),
              _buildColorProduct(color: Colors.green[200]),
              _buildColorProduct(color: Colors.yellow[200]),
              _buildColorProduct(color: Colors.cyan[300]),
            ],
          ),
        ),
      ],
    );
  }

    Widget _buildQuantityPart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(
          height: 10,
        ),
        Text(
          "Quantity",
          style: myStyle,
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 40,
          width: 130,
          decoration: const BoxDecoration(
            color: Color(0xff746bc9),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                child: const Icon(
                  Icons.remove,
                  color: Colors.white,
                ),
                onTap: () {
                  setState(() {
                    if (count > 1) {
                      count--;
                    }
                  });
                },
              ),
              Text(
                count.toString(),
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
              GestureDetector(
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onTap: () {
                  setState(() {
                    count++;
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  final TextStyle myStyle = const TextStyle(
    fontSize: 18
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 50,),
      _buildSizePart(),
      
      const SizedBox(height: 10,),
     _buildColorPart(),
      const SizedBox(height: 10,),
       Column(
    crossAxisAlignment: CrossAxisAlignment.start, 
    children: [
      _buildQuantityPart(),
    ],
  ),
   ] );
  }
}






