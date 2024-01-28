import 'package:cloud_firestore/cloud_firestore.dart';

class ComplexModel {
  String? title;
  String? subTitle;
  GeoPoint? location;
  DateTime? createDateTime;
  ComplexModel({this.title, this.subTitle, this.location, this.createDateTime});

  ComplexModel.fromDoc(DocumentSnapshot snapshot) {
    title = snapshot.get('title');
    subTitle = snapshot.get('subTitle');
    location = GeoPoint(snapshot.get('location')['latitude'], snapshot.get('location')['longitude']);
    createDateTime = (snapshot.get('createDateTime')  as Timestamp).toDate();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['subTitle'] = subTitle;
    data['location'] = {
      'latitude': location?.latitude,
      'longitude': location?.longitude,
    };
    data['createDateTime'] = Timestamp.fromDate(createDateTime!);
    return data;
  }
}