import 'package:fixitnow/models/sub_service.dart';
import 'package:fixitnow/utils/custom_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:searchfield/searchfield.dart';

class ServiceForm extends StatefulWidget {
  const ServiceForm({super.key});

  @override
  State<ServiceForm> createState() => _ServiceFormState();
}

class _ServiceFormState extends State<ServiceForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  String? _selectedItem;

  List<String> suggestions = [
    'Afghanistan',
    'Turkey',
    'Germany',
    'France',
    'Italy',
    'Spain',
    'United Kingdom',
    'United States',
    'Canada',
    'Australia',
    'New Zealand',
    'India',
    'Indonesia',
    'Bangladesh',
    'Sri Lanka',
  ];

  List<Map<String, dynamic>> subServices = [];

  @override
  void initState() {
    super.initState();
    subServices.add({'title': 'Installation', 'isChecked': false});
    subServices.add({'title': 'Maintainance', 'isChecked': false});
    subServices.add({'title': 'Reparations', 'isChecked': false});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              searchInput(),
              inputTextField(
                hintText: 'Please insert service description ',
                iconData: Icons.person_2_rounded,
                context: context,
                controller: descriptionController,
                maxLines: 1,
              ),
              groupCheckBox()
            ],
          ),
        ),
      ),
      bottomNavigationBar: buildBottomContinue(context: context),
    );
  }

  Widget buildBottomContinue({required BuildContext context}) => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 8.h,
        ),
        child: ElevatedButton.icon(
          onPressed: () {
            debugPrint(subServices.toString());
            var allSubServices = subServices
                .map<SubService>((e) => SubService.fromJson(e))
                .toList();

            for (SubService subService in allSubServices) {
              if (subService.isChecked == true) {
                debugPrint(subService.toString());
              }
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: CustomColor.primaryColors,
            minimumSize: const Size(double.infinity, 56),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(30.r),
                bottomLeft: Radius.circular(30.r),
                bottomRight: Radius.circular(30.r),
              ),
            ),
          ),
          icon: const Icon(
            CupertinoIcons.arrow_right,
            color: Colors.white,
          ),
          label: const Text(
            'Continue',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );

  Widget groupCheckBox() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Sub-services',
          style: TextStyle(
            fontSize: 18,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w600,
          ),
        ),
        ListView.builder(
            shrinkWrap: true,
            itemCount: subServices.length,
            itemBuilder: (context, index) {
              return CheckboxListTile(
                title: Text(
                  subServices[index]['title'],
                  style: const TextStyle(color: Colors.black87),
                ),
                value: subServices[index]['isChecked'],
                onChanged: (value) {
                  setState(() {
                    subServices[index]['isChecked'] = value!;
                  });
                },
              );
            }),
      ],
    );
  }

  Widget inputTextField({
    required IconData iconData,
    required String hintText,
    required BuildContext context,
    required TextEditingController controller,
    required int maxLines,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * .008,
      ),
      child: TextFormField(
        maxLines: maxLines,
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          focusColor: Colors.white,
          prefixIcon: Icon(
            iconData,
            color: Colors.grey,
          ),
          //errorText: "Error",
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white, width: 1.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          fillColor: Colors.white,
          hoverColor: Colors.white70,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white, width: 1.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
            fontFamily: "verdana_regular",
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  Widget searchInput() {
    return SearchField(
      hint: 'Service title',
      searchInputDecoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      maxSuggestionsInViewPort: 6,
      itemHeight: 50,
      suggestionsDecoration: SuggestionDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      controller: titleController,
      onSearchTextChanged: (value) {
        final filter = suggestions
            .where((element) =>
                element.toLowerCase().contains(value.toLowerCase()))
            .toList();
        setState(() {
          _selectedItem = value;
        });
        debugPrint(_selectedItem);
        return filter
            .map((e) => SearchFieldListItem<String>(
                  e,
                  child: Text(e,
                      style: const TextStyle(fontSize: 24, color: Colors.red)),
                ))
            .toList();
      },
      suggestions: suggestions
          .map(
            (e) => SearchFieldListItem<String>(
              e,
              child: Text(
                e,
                style: const TextStyle(fontSize: 24, color: Colors.red),
              ),
            ),
          )
          .toList(),
    );
  }
}
