import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/Home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:login/main_page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class capture extends StatefulWidget {
  const capture({Key? key}) : super(key: key);

  @override
  State<capture> createState() => _captureState();
}

class _captureState extends State<capture> {
  String imageUrl = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Image Here'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                ImagePicker imagePicker = ImagePicker();
                XFile? file =
                await imagePicker.pickImage(source: ImageSource.camera);

                if (file == null) return;

                String uniqueFileName =
                DateTime.now().millisecondsSinceEpoch.toString();

                Reference referenceDirImages =
                FirebaseStorage.instance.ref().child('images');
                Reference referenceImageToUpload =
                referenceDirImages.child('$uniqueFileName.jpg');

                try {
                  await referenceImageToUpload.putFile(File(file.path));
                  imageUrl = await referenceImageToUpload.getDownloadURL();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Image uploaded successfully.'),
                    ),
                  );
                } catch (error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Error uploading image: $error'),
                    ),
                  );
                }
              },
              child: Icon(
                Icons.camera_alt,
                size: 100.0, // Adjust the size as needed
              ),
            ),
          ],
        ),
      ),
    );
  }
}







//
// class _captureState extends State<capture> {
//   TextEditingController _controllerName = TextEditingController();
//   TextEditingController _controllerQuantity = TextEditingController();
//
//   GlobalKey<FormState> key = GlobalKey();
//
//   CollectionReference _reference =
//   FirebaseFirestore.instance.collection('shopping_list');
//
//   String imageUrl = '';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add an item'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Form(
//           key: key,
//           child: Column(
//             children: [
//               TextFormField(
//                 controller: _controllerName,
//                 decoration:
//                 InputDecoration(hintText: 'Enter the name of the item'),
//                 validator: (String? value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter the item name';
//                   }
//
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _controllerQuantity,
//                 decoration:
//                 InputDecoration(hintText: 'Enter the quantity of the item'),
//                 validator: (String? value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter the item quantity';
//                   }
//
//                   return null;
//                 },
//               ),
//               IconButton(
//                   onPressed: () async {
//                     /*
//                 * Step 1. Pick/Capture an image   (image_picker)
//                 * Step 2. Upload the image to Firebase storage
//                 * Step 3. Get the URL of the uploaded image
//                 * Step 4. Store the image URL inside the corresponding
//                 *         document of the database.
//                 * Step 5. Display the image on the list
//                 *
//                 * */
//
//                     /*Step 1:Pick image*/
//                     //Install image_picker
//                     //Import the corresponding library
//
//                     ImagePicker imagePicker = ImagePicker();
//                     XFile? file =
//                     await imagePicker.pickImage(source: ImageSource.camera);
//                     print('${file?.path}');
//
//                     if (file == null) return;
//                     //Import dart:core
//                     String uniqueFileName =
//                     DateTime
//                         .now()
//                         .millisecondsSinceEpoch
//                         .toString();
//
//                     /*Step 2: Upload to Firebase storage*/
//                     //Install firebase_storage
//                     //Import the library
//
//                     //Get a reference to storage root
//                     Reference referenceRoot = FirebaseStorage.instance.ref();
//                     Reference referenceDirImages =
//                     referenceRoot.child('images');
//
//                     //Create a reference for the image to be stored
//                     Reference referenceImageToUpload =
//                     referenceDirImages.child('name');
//
//                     //Handle errors/success
//                     try {
//                       //Store the file
//                       await referenceImageToUpload.putFile(File(file!.path));
//                       //Success: get the download URL
//                       imageUrl = await referenceImageToUpload.getDownloadURL();
//                     } catch (error) {
//                       //Some error occurred
//                     }
//                   },
//                   icon: Icon(Icons.camera_alt)),
//               ElevatedButton(
//                   onPressed: () async {
//                     if (imageUrl.isEmpty) {
//                       ScaffoldMessenger.of(context)
//                           .showSnackBar(
//                           SnackBar(content: Text('Please upload an image')));
//
//                       return;
//                     }
//
//                     if (key.currentState!.validate()) {
//                       String itemName = _controllerName.text;
//                       String itemQuantity = _controllerQuantity.text;
//
//                       //Create a Map of data
//                       Map<String, String> dataToSend = {
//                         'name': itemName,
//                         // 'quantity': itemQuantity,
//                         'image': imageUrl,
//                       };
//
//                       //Add a new item
//                       _reference.add(dataToSend);
//                     }
//                   },
//                   child: Text('Submit'))
//             ],
//           ),
//         ),
//       ),
//     );
//
//     // @override
//     Widget build(BuildContext context) {
//       return Scaffold(
//
//         body:Center(
//           child: Text("Capture",style: TextStyle(
//               fontSize: 40
//           ),),
//         ),
//
//       );
//     }
//   }
// }
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';

// class CapturePage extends StatefulWidget {
//   @override
//   _CapturePageState createState() => _CapturePageState();
// }
//
// class _CapturePageState extends State<CapturePage> {
//   String imageUrl = '';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Upload Image Here'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               onPressed: () async {
//                 ImagePicker imagePicker = ImagePicker();
//                 XFile? file =
//                 await imagePicker.pickImage(source: ImageSource.camera);
//
//                 if (file == null) return;
//
//                 String uniqueFileName =
//                 DateTime.now().millisecondsSinceEpoch.toString();
//
//                 Reference referenceDirImages =
//                 FirebaseStorage.instance.ref().child('images');
//                 Reference referenceImageToUpload =
//                 referenceDirImages.child('$uniqueFileName.jpg');
//
//                 try {
//                   await referenceImageToUpload.putFile(File(file.path));
//                   imageUrl = await referenceImageToUpload.getDownloadURL();
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                       content: Text('Image uploaded successfully.'),
//                     ),
//                   );
//                 } catch (error) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                       content: Text('Error uploading image: $error'),
//                     ),
//                   );
//                 }
//               },
//               child: Icon(
//                 Icons.camera_alt,
//                 size: 100.0, // Adjust the size as needed
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
