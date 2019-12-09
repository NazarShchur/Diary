
import 'package:course/pages/pulse/pickermodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Day extends StatefulWidget{
  final DateTime dateTime;
  Day(this.dateTime);
  @override
  State<StatefulWidget> createState() => _DayState();
}
class _DayState extends State<Day>{
  @override
  Widget build(BuildContext context){
    final model = Provider.of<PulsePageModel>(context);
    Color color;
    if(model.pulse(widget.dateTime)!=null){
      color = Colors.green;
    } else if(widget.dateTime.isAfter(DateTime.now())){
      color = Colors.yellow;
    } else {
      color = Colors.red;
    }
    return GestureDetector(
      onTap: (){
        model.setDate(widget.dateTime);
      },
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
            border: Border.all(color: Colors.blue, width: widget.dateTime == model.date ? 2 : 0)
        ),
        child: Center(
          child: Text("${widget.dateTime.month.toString()}-${widget.dateTime.day.toString()} "),
        ),
      ),
    );
  }

}