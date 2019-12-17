import 'package:course/dao/fields/Fields.dart';

class PDN{
  DateTime date;
  int pulseBeforeSits;
  int pulseAfterSits;
  int indexPDN;

  PDN({this.date, this.pulseAfterSits, this.pulseBeforeSits});

  factory PDN.fromJson(Map<String, dynamic> json){
    return PDN(
      date: DateTime.tryParse(json[Fields.PDN_DATE]),
    );
  }
  String get dateString{
    return "${date.year}-${date.month}-${date.day}";
  }
  Map<String,dynamic> toJson() => {
    Fields.PDN_DATE : date,
    Fields.INDEX_PDN : indexPDN
  };

  int countIndexPDN() => (((pulseAfterSits - pulseBeforeSits) / pulseBeforeSits) * 100).round();

  @override
  String toString() {
    return 'PDN{date: $date, pulseBeforeSits: $pulseBeforeSits, pulseAfterSits: $pulseAfterSits, indexPDN: ${countIndexPDN()}';
  }

}