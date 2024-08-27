// import 'dart:math';
// import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_assesment/features/groceries/data/model/grocery_model.dart';
import 'package:mobile_assesment/features/groceries/domain/entities/grocery_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mobile_assesment/features/groceries/presentation/bloc/grocery_bloc.dart';
import 'package:mobile_assesment/features/groceries/presentation/bloc/grocery_state.dart';
import 'package:mobile_assesment/features/groceries/presentation/bloc/grocey_event.dart';
import 'package:mobile_assesment/features/groceries/presentation/pages/detailspage.dart';
import 'package:mobile_assesment/service_locator.dart';

class getAllGroceries extends StatefulWidget {
  const getAllGroceries({super.key});

  @override
  State<getAllGroceries> createState() => _getAllGroceriesState();
}

class _getAllGroceriesState extends State<getAllGroceries> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => getIt<GroceryBloc>()..add(GetAllGroceriesEvent()),
        child: Padding(
          padding: EdgeInsets.only(top: 60, left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                      image: AssetImage('assets/images/cheeseburger.png'),
                      width: 25,
                      height: 25),
                  SizedBox(width: 5),
                  Text(
                    'Burger',
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFf4f4f5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: null,
                            icon: Icon(Icons.search,
                                color: Colors.grey, size: 25)),
                        Text(
                          'Search',
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                        onPressed: null,
                        icon: Icon(Icons.filter_list,
                            color: Colors.grey, size: 25)),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Expanded(
                child: BlocBuilder<GroceryBloc, GroceryState>(
                  builder: (context, state) {
                    if (state is loading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is loaded) {
                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, 
                          crossAxisSpacing: 10, 
                          mainAxisSpacing: 10,
                        ),
                        itemCount: state.groceries.length,
                        itemBuilder: (context, index) {
                          final grocery = state.groceries[index];
                          return groceryCard(
                            grocery: GroceryEntity(
                              id: grocery.id,
                              image: grocery.image,
                              rating: grocery.rating,
                              price: grocery.price,
                              discount: grocery.discount,
                              description: grocery.description,
                              title: grocery.title,
                              options: grocery.options,
                            ),
                          );
                        },
                      );
                    } else {
                      return Center(child: Text('Failed to load groceries'));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class groceryCard extends StatelessWidget {
  const groceryCard({super.key, required this.grocery});
  final GroceryEntity grocery;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DetailsPage(grocery: grocery)),
      );
      }
          , // Navigate to the details page of the selected grocery item 
      child: Container(
          
      
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 3,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          width: 200,
          height: 600,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5,
              ),
              Center(
                child: Container(
                  width: 190,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(grocery.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                grocery.title,
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 24.0,
                  ),
                  Text(
                    grocery.rating.toString(),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    grocery.discount.toString(),
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 7,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    grocery.price.toString(),
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        color: Color(0xFFFF6347),
                        fontSize: 7,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
