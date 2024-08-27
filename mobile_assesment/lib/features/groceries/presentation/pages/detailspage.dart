import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_assesment/features/groceries/domain/entities/grocery_entity.dart';
import 'package:mobile_assesment/features/groceries/presentation/pages/getAllGroceries.dart';



class DetailsPage extends StatefulWidget {
  final GroceryEntity grocery;
  DetailsPage({super.key,required this.grocery});
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  
 
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          
          children: [
            
            Image.network(
              widget.grocery.image,
              height: 400,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
                  IconButton(
        onPressed: () {
          Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const getAllGroceries()),
      );
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.white, // Fixed color reference
        ),
      ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 400.0),
                  Padding(
                    padding: EdgeInsets.only(left: 14.0),
                    child: Text(
                      widget.grocery.title,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),

                  Padding(
                    padding: const EdgeInsets.only(left:14.0),
                    child: Row(
                    children: [
                    Text(widget.grocery.discount.toString(), 
                    style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.lineThrough,
                    ),
                    ),),
                    SizedBox(width: 10),
                    Text(widget.grocery.price.toString(),
                      style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      color: Color(0xFFFF6347),
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                      ),
                      ),
                      ],
      
                    ),
                  ),
              SizedBox(height: 10,),
                   Padding(
                    padding:  EdgeInsets.only(left: 14.0),
                    child: Row(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                          Icon(
                          Icons.star, 
                          color: Colors.yellow,
                          size: 24.0, 
                        ),
                        SizedBox(width:10),
                        Text(widget.grocery.rating.toString(), 
                        style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                    ),
                        ),
                        SizedBox(width:10),
                    Text('(1.205)',
                    style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                 
                    ),
                    ),
                      )

                          ],
                        ),
                    Text('See all review',
                    style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                    ),
                    ),)

                    
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    width: 400,
                    height: 100,
                    child: Padding(
                      padding: EdgeInsets.only(left: 14.0),
                      child: Text(
                      widget.grocery.description,
                      style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        
                      ),
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      ),
                    ),
                    
                  ),


          ],
        ),
      ),
          ],

    ),
    ) ,
    );   

  }
}

  

