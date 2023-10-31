
import 'package:flutter/material.dart';
import 'package:newcommerce/screens/homepage.dart';



class DetailScreen extends StatefulWidget {
   DetailScreen({
    super.key, this.image,
     this.price,
     this.name});

   final String? image;
   final String ?name;
   final String? price;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int count = 1;

  Widget _buildSizeProduct({String? name}){
    return Container(
          child: Container(
            height: 60,
            width: 60,
            color: Color(0xfff2f2f2),
            child: Center(child: 
            Text(name??"",style: TextStyle(fontSize: 18),)),
          ),
        );
  }

  Widget _buildColorProduct({Color? color}){
    return Container(
          child: Container(
            height: 60,
            width: 60,
            color: color,
          ),
        );
  }

  final TextStyle myStyle = const TextStyle(
    fontSize: 18
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Details Page",style:TextStyle(
          color: Colors.black
        ),
        
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pushReplacement
            (MaterialPageRoute(builder: 
            (ctx)=> HomePage(),
            ),
            );

          }, 
          icon: Icon(Icons.arrow_back,color: Colors.black,),
          ),
          actions: [
            IconButton(onPressed: (){},
             icon: const Icon(Icons.notifications_none,color: Colors.black,)),
          ],
      ),
      body: Container(
        child: ListView(
          children: [
            Column(
              children: [
                Center(
                  child: Container(
                    width: 250,
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          height: 290,
                          decoration:  BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(widget.image??""))
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 100,
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                               Text(widget.name??"",style: TextStyle(fontSize: 18),),
                                 Text("\$${widget.price.toString()}",
                                style: const TextStyle(fontSize: 18,
                                color: Color(0xff9b96d6)
                                ),
                                ),
                                Text("Description",style: myStyle,),
                              ],
                            ),
                          ],
                        ),
                      ),
                       SizedBox(
                        height: 140,
                        child: Wrap(
                          children:  [
                            Text("Lorem Ipsum is standard nly five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                            style: myStyle,
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 50,),
                       Text("Size",style: myStyle,),
                      const SizedBox(height: 10,),
                       SizedBox(
                        width: 280,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                          _buildSizeProduct(name: "S"),
                          _buildSizeProduct(name: "M"),
                         _buildSizeProduct(name: "L"),
                          _buildSizeProduct(name: "XXL"),
                          ],
                        ),),
                        const SizedBox(height: 10,),
                         Text("Color",style: myStyle,),
                      const SizedBox(height: 10,),
                       SizedBox(
                        width: 280,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                          _buildColorProduct(color:Colors.blue[300]),
                           _buildColorProduct(color:Colors.green[300]),
                         _buildColorProduct(color:Colors.yellow[300]),
                          _buildColorProduct(color:Colors.cyan[300]),
                          ],
                        ),),
                        const SizedBox(height: 10,),
                         Text("Quantity",style: myStyle,),
                        const SizedBox(height: 10,),
                        Container(
                          height: 40,
                          width: 130,
                          decoration: BoxDecoration(
                            color:Colors.blue[200],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                              onTap: (){
                                setState(() {
                                  if(count>1){
                                    count--;
                                  }
                                  
                                });
                              }, 
                              child: Icon(Icons.remove)
                              ),
                              Text(count.toString(),style:myStyle
                              ),
                              GestureDetector(
                              onTap: (){
                                setState(() {
                                  count++;
                                });
                              }, 
                              child: const Icon(Icons.add)
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          height: 60,
                          width: double.infinity,
                          child: ElevatedButton(
                           onPressed: (){},
                           style: ButtonStyle(
                            backgroundColor:
                             MaterialStateProperty.all<Color>(Colors.pink),
                             shape:MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(20)
                              ),
                             )
                           ),
                           
                          child:Text("Check out",style:myStyle),
                          
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}