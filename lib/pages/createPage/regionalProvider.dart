import 'package:flutter/material.dart';
import 'package:projectkost/pages/createPage/regionalModel.dart';

class RegionProvider extends ChangeNotifier {
  String selectedKabupaten = '';
  String selectedKecamatan = '';
  String selectedKelurahan = '';

  List<RegionModel> kabupatenData = [
    RegionModel(name: 'Bangka Barat'),
    RegionModel(name: 'Bangka Tengah'),
    RegionModel(name: 'Bangka Selatan'),
  ];

  Map<String, List<RegionModel>> kecamatanData = {
    'Bangka Barat': [
      RegionModel(name: 'Kecamatan 1'),
      RegionModel(name: 'Kecamatan 2'),
    ],
    'Bangka Tengah': [
      RegionModel(name: 'Kecamatan 3'),
      RegionModel(name: 'Kecamatan 4'),
    ],
    'Bangka Selatan': [
      RegionModel(name: 'Kecamatan 5'),
      RegionModel(name: 'Kecamatan 6'),
    ],
  };

  Map<String, List<RegionModel>> kelurahanData = {
    'Kecamatan 1': [
      RegionModel(name: 'Kelurahan A'),
      RegionModel(name: 'Kelurahan B'),
    ],
    'Kecamatan 2': [
      RegionModel(name: 'Kelurahan C'),
      RegionModel(name: 'Kelurahan D'),
    ],
    'Kecamatan 3': [
      RegionModel(name: 'Kelurahan E'),
      RegionModel(name: 'Kelurahan F'),
    ],
    // Add more kelurahan as needed
  };

  void selectKabupaten(String kabupaten) {
    selectedKabupaten = kabupaten;
    selectedKecamatan = '';
    selectedKelurahan = '';
    notifyListeners();
  }

  void selectKecamatan(String kecamatan) {
    selectedKecamatan = kecamatan;
    selectedKelurahan = '';
    notifyListeners();
  }

  void selectKelurahan(String kelurahan) {
    selectedKelurahan = kelurahan;
    notifyListeners();
  }
}
