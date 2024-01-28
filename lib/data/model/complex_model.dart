import 'package:cloud_firestore/cloud_firestore.dart';

class ComplexModel {
  String? title;
  String? subTitle;
  GeoPoint? location;
  Timestamp? createDate;
  ComplexModel({this.title, this.subTitle, this.location, this.createDate});

  ComplexModel.fromDoc(DocumentSnapshot snapshot) {
    title = snapshot.get('title');
    subTitle = snapshot.get('subTitle');
    location = snapshot.get('location');
    createDate = snapshot.get('createDate');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['subTitle'] = subTitle;
    data['location'] = {
      'latitude': location?.latitude,
      'longitude': location?.longitude,
    };
    data['createDate'] = createDate;
    return data;
  }
}