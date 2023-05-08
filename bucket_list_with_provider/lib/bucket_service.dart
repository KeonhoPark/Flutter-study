import 'package:flutter/material.dart';
import 'main.dart';

class BucketService extends ChangeNotifier {
  List<Bucket> bucketList = [
    Bucket('잠자기', false),
  ];
}
