import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:udemy_meals/Screens/meal_details_screen.dart';
import '../models/meal.dart';

class MealItem extends StatefulWidget {
  final Function favorite;
  bool isFav;
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem(
      {this.title,
      this.imageUrl,
      this.affordability,
      this.complexity,
      this.duration,
      this.id,
      this.favorite,
      this.isFav,
      });

  @override
  _MealItemState createState() => _MealItemState();
}

class _MealItemState extends State<MealItem> {
  get complexityText {
    switch (widget.complexity) {
      case Complexity.Simple:
        return "Simple";
      case Complexity.Challenging:
        return "Challenging";
      case Complexity.Hard:
        return "Hard";
      default:
        return "Unknown";
    }
  }

  get affordabilityText {
    switch (widget.affordability) {
      case Affordability.Affordable:
        return "Affordable";
      case Affordability.Pricey:
        return "Pricey";
      case Affordability.Luxurious:
        return "Expensive";
      default:
        return "Unknown";
    }
  }

  void selectedMeal(BuildContext context) {
    Navigator.of(context).pushNamed(MealDetailsScreen.routName, arguments: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectedMeal(context),
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 4,
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Image.network(
                      widget.imageUrl,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 10,
                    child: IconButton(
                    icon: Icon(
                      (widget.isFav) ? Icons.star : Icons.star_border,
                      color: Theme.of(context).accentColor,
                      size: 40,
                    ),
                    onPressed: () {
                      setState(() {
                        widget.isFav = !widget.isFav;
                        widget.favorite (widget.id);
                      });
                    },
                      ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      alignment: Alignment.centerRight,
                      width: 300,
                      color: Colors.black54,
                      child: Text(
                        widget.title,
                        style: TextStyle(fontSize: 26, color: Colors.white),
                        overflow: TextOverflow.fade,
                        softWrap: true,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.schedule),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          '${widget.duration} min',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.landscape),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          complexityText,
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.attach_money),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          affordabilityText,
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
