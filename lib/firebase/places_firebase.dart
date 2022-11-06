import 'package:cloud_firestore/cloud_firestore.dart';

class PlacesFarebase {
  FirebaseFirestore? _firestore;
  CollectionReference? _placesCollection;

  PlacesFarebase() {
    _firestore = FirebaseFirestore.instance;
    _placesCollection = _firestore!.collection('places');
  }
}
