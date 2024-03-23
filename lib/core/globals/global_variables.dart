import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


// String PublishableKey =
//     "pk_test_51NXIWZJnTKd7GIGToyFGFNNCF8W3FDe7U3VUDAg8EdArbv9240KzSKFzBQfEKmdIUyoETkdakYUdw2mVeiQSgEoW00rYIBsdX9";
// String SECRET_KEY =
//     "sk_test_51NXIWZJnTKd7GIGTcK82ElRwj2P5Fct037oekkkyIAcds6lXAtAsls7B0HnmFLAhNoeI1G6L122HK3kvasoGiOe8008AnLPuaQ";
//
// String dummyProfilePic =
//     "https://www.cornwallbusinessawards.co.uk/wp-content/uploads/2017/11/dummy450x450.jpg";
// String dummyNoImage =
//     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdGodbj0sF1AYkdbc9LsjL1FDgHVGf0jHV_g&usqp=CAU";

//Rx<UserModel> userModelGlobal = UserModel().obs;

//Rx<ProductModel> productModelGlobal = ProductModel().obs;
//
// RxList<MainCategoryModel> mainCategoriesGlobal = RxList<MainCategoryModel>();
// RxList<ProductModel> productListGlobal = RxList<ProductModel>();
// RxList<ProductModel> cartProductList = RxList<ProductModel>();
//
// // A array that will have the predefined weights
// List<String> weightList = ["500 g", "1 kg", "2 kg", "3 kg"];

final imagePicker = ImagePicker();
Rx<File?> imageSubject = Rx<File?>(null);
