import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex_try1/Pages/DetailScreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var pokeApi = "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
  List pokedex = [];

  @override

  //TODO when we include somthing in a initstate eg fun , then we dont have to call
  //TODO that function again and again it automatically gets called

  void initState() {
    super.initState();
    if(mounted) //TODO If the screen is ready to change its state then run this fun
      {
        fetchPokemonData();
      }
  }

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      //appbar , body
      backgroundColor: Colors.white,
      body:Stack(
        children: [
          Positioned(
            top: 100,
              left: 20,
              child: Text("POKEDEX",
                style: TextStyle(color: Colors.black , fontWeight: FontWeight.bold ,fontSize: 35 ),
              ),
          ),

          Positioned(
            right: -50,
              top: -30,
              child: Image.asset('images/pokeball.png',width: 280 , fit: BoxFit.fitHeight, color: Colors.grey.shade500, ),
          ),

          Positioned(
            top: 150,
            bottom: 0,
            width: width,
            child: Column(
                children: [
                  pokedex != null ? Expanded(
                      child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // 2 grids in one row
                        childAspectRatio: 1.4,
                      ),
                      itemCount: pokedex.length,
                      itemBuilder: (context, index) {
                        var type = pokedex[index]['type'][0];
                        return InkWell(
                          child: Padding(
                          padding: EdgeInsets.all(8),
                        child: Container(
                          decoration: BoxDecoration(
                            color: type == 'Grass' ? (Colors.green) : type == 'Fire' ? Colors.red : type == 'Water' ? Colors.blue : type == "Electric" ? Colors.yellow : Colors.pink,
                            borderRadius: BorderRadius.circular(15)
                          ),

                        child: Stack(
                            children: [
                              Positioned(
                                bottom: -15,
                                right: -15,
                                child:
                                  Image.asset('images/pokeball.png' , height: 125 , fit: BoxFit.fitHeight,),
                              ),



                              Positioned(
                                top: 50,left: 15,
                                child:Container(

                                  child: Padding(
                                    padding: EdgeInsets.only(left:8,right: 8,top: 4,bottom: 4),
                                    child : Text(type.toString() , style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey.shade400.withOpacity(0.5),

                                  ),
                                )

                              ),

                              Positioned(
                                bottom:3, right: 3,
                                child:
                                CachedNetworkImage(imageUrl: pokedex[index]['img'] , height: 120, fit: BoxFit.fitHeight,),
                              ),

                              Positioned(
                                top: 25,left: 15,
                                child:
                                Text(pokedex[index]['name'] ,
                                  style: TextStyle(fontWeight: FontWeight.bold , fontSize: 15 ,color: Colors.white),
                                ),
                              ),

                            ],
                        ),
                        ),
                          ),
                        //TODO navigate to detail screen
                        onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (_) => DetailScreen(
                                pokemonDetail: pokedex[index],
                                color: type == 'Grass' ? (Colors.green) : type == 'Fire' ? Colors.red : type == 'Water' ? Colors.blue : type == "Electric" ? Colors.yellow : Colors.pink,
                                heroTag: index,
                            )));
                        }

                        //TODO Navigator PUSH means we add another layer and
                          // TODO POP means we remove the layer present in stack at the top
                          //TODO context means we have to travel from this screen to then DetailScreen
                        );
                      },
                  ))
                      : Center(
            child: CircularProgressIndicator(),
                )
                ],
              ),
          ),
        ],
      )
      );
  }

  //TODO expanded is used when we need grid view as we need grid
  //TODO to take entire width and height of screen

  void fetchPokemonData(){
    var url = Uri.https("raw.githubusercontent.com" , "/Biuni/PokemonGO-Pokedex/master/pokedex.json");
    http.get(url).then((onValue){
      if(onValue.statusCode == 200)
        {
          var decodeJsonData = jsonDecode(onValue.body);
          pokedex = decodeJsonData['pokemon'];
          setState(() {

          });
        }


    });
  }

}


//TODO Try using width factor when using positioned widget