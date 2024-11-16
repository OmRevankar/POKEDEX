import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {

  final pokemonDetail;
  final Color color;
  final int heroTag;

  const DetailScreen({super.key , required this.pokemonDetail, required this.color , required this.heroTag});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {

    bool save = false;
    var width = MediaQuery.of(context).size.width;
    var height  = MediaQuery.of(context).size.height;


    return Scaffold(
      backgroundColor: widget.color,
      body: Stack(
        alignment: Alignment.center,
        children: [

          Positioned(
            top: height*0.055,
            left: width*0.035,
            child: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back , color: Colors.white, ),
              iconSize: 32
            ),
          ),


          Positioned(
            top : height*0.21,
              right: -30,
              child: Image.asset('images/pokeball.png' , fit: BoxFit.fitHeight, height: 225,)
          ),
          Positioned(
            bottom: 0,
              height: height*0.6,
              child: Container(
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30) , topRight: Radius.circular(30)),
                  color: Colors.white,
                ),
              )
          ),

          Positioned(
              top: height*0.156,
              left: width*0.07,
              child: Container(
                child: Padding(
                  padding: EdgeInsets.only(top: 3 , bottom: 3 ,left: 20,right: 20),
                  child:Text(widget.pokemonDetail['type'].join('  ') , style: TextStyle(
                      color: Colors.white ,fontSize: 22
                  ), )),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.shade200.withOpacity(0.5)
                ),
              )
          ),

          Positioned(
            top: height*0.1,
              left: width*0.07,
              child: Text(widget.pokemonDetail['name'] , style: TextStyle(
                color: Colors.white , fontWeight: FontWeight.bold , fontSize: 40
              ), )
          ),

          Positioned(
            top: height*0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                      Container(
                          width:width*0.5,
                          child: Text("Spawn Chances",style: TextStyle(fontSize: 28), )),

                      Container(
                          width:width*0.4,
                          child: Text(widget.pokemonDetail['spawn_chance'].toString() ,style: TextStyle( fontSize: 25,fontWeight: FontWeight.bold ) ))
                    ],),
                  ),

                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        Container(
                          width:width*0.5,
                            child: Text("Spawn Time",style: TextStyle( fontSize: 28), )),
                        Container(
                            width:width*0.4,
                            child: Text(widget.pokemonDetail['spawn_time'].toString(),style: TextStyle( fontSize: 25,fontWeight: FontWeight.bold ) ))

                      ],),
                  ),

                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        Container(
                            width:width*0.5,
                            child: Text("Weakness",style: TextStyle(fontSize: 28), )),
                        Container(
                            width:width*0.4,
                            child: Text(widget.pokemonDetail['weaknesses'][0],style: TextStyle( fontSize: 25,fontWeight: FontWeight.bold ,) ))

                      ],),
                  ),

                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        Container(
                            width:width*0.5,
                            child: Text("Next Evolution",style: TextStyle(fontSize: 28), )),
                        Container(
                            width:width*0.4,
                            child: widget.pokemonDetail['next_evolution'] != null ? Text(widget.pokemonDetail['next_evolution'][0]['name'],style: TextStyle( fontSize: 25,fontWeight: FontWeight.bold ,) ) : Text("Final Evolution",style: TextStyle( fontSize: 25,fontWeight: FontWeight.bold ,) ))

                      ],),
                  ),

                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        Container(
                            width:width*0.5,
                            child: Text("Weight",style: TextStyle(fontSize: 28), )),
                        Container(
                            width:width*0.4,
                            child: Text(widget.pokemonDetail['weight'],style: TextStyle( fontSize: 25,fontWeight: FontWeight.bold ,) ))

                      ],),
                  ),

                ],
              )
          ),

          Positioned(
            top: height*0.2,
              right: width*0.1780,
              child: CachedNetworkImage(
                imageUrl: widget.pokemonDetail['img'],
                height: 280,
                fit: BoxFit.fitHeight,
              )
          ),
        ],
      ),
    );
  }
}

//TODO Whenever we use variables from the top section(ie which we take from super.key)
//TODO we have to mention widget.variable