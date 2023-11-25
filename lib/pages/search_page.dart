import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();
  List<String> _suggestions = [];
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  void _submit() {
    setState(() {
      autovalidateMode = AutovalidateMode.always;
    });

    final form = _formKey.currentState;

    if (form != null && form.validate()) {
      form.save();
      Navigator.pop(context, _controller.text.trim());
    }
  }

  void _getSuggestions(String query) {
    // This is where you'd call your API or search your list of city names.
    // For the sake of this example, let's just use a static list of city names.
    List<String> allCities = [
      'Addis Ababa',
      'Adama',
      'Ambo',
      'Dessie',
      'Dembidolo',
      'Gimbi',
      'Metu',
      'Bule Hora Town',
      'Finote Selam',
      'Fiche',
      'Aleta Wendo',
      'Haramaya',
      'Wukro',
      'Durame',
      '	Gimbi',
      'Tepi',
      'Chiro',
      'Alaba Kulito',
      'Alamata',
      'Assosa',
      'Goba',
      'alamaya',
      'Mizan Teferi',
      'Mojo',
      'Mota',
      'Negele Boran',
      'Nekemte',
      'Shashamane',
      'Waliso',
      'Jinka',
      'Kobo',
      'Bonga',
      'Negele Borana',
      'Meki',
      'Waliso',
      'Yirgalem',
      'Adwa',
      'Boditi',
      'Batu',
      'Butajira',
      'Bale Robe',
      'Gambela',
      'Aksum',
      'Arsi Negele',
      'Shire ',
      'Burayu',
      'Sebeta',
      'Areka',
      'Adigrat',
      'Debre Tabor',
      'Debre Markos ',
      'Bishoftu',
      'Gode',
      'Welkite',
      'Arba Minch',
      'Agaro',
      'Dimtu',
      'Dangila',
      'Hosaena',
      'Dilla',
      'Debre Birhan',
      'Asella',
      'Debre Mark’os',
      'Kombolcha',
      'Debre Tabor',
      'Ziway',
      'Adigra',
      'Areka',
      'Weldiya',
      'Dire Dawa',
      'Jimma',
      'Gondar',
      'Mekelle',
      'Bahir Dar',
      'Jijiga',
      'Sodo',
      'Hawassa',
      'Harar',
      'Seka',
      'Holeta',
      'Yebu',
      'Cembe',
      'Asendabo',
      'Deneba',
      'Fofa',
      'Omonada',
      'Gera',
      'Sokoru',
      'Yanfa',
      'Gechi',
      'Bedele',
      'Meko',
      'Agena',
    ];
    setState(() {
      _suggestions = allCities
          .where((city) => city.toLowerCase().startsWith(query.toLowerCase()))
          .take(3)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('የአየር ሁኔታ መፈለጊያ ቦታ')),
      body: Form(
        key: _formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            const SizedBox(height: 60.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: TextFormField(
                controller: _controller,
                autofocus: true,
                style: const TextStyle(fontSize: 18.0),
                decoration: const InputDecoration(
                  labelText: 'የከተማ ስም',
                  hintText: 'ከሁለት በላይ ፊደላት አስገባ!',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
                validator: (String? input) {
                  if (input == null || input.trim().length < 2) {
                    return 'የከተማው ስም ቢያንስ ከሁለት ላይ ፊደላት መሆን አለበት!';
                  }
                  return null;
                },
                onChanged: (String? input) {
                  _getSuggestions(input!);
                },
              ),
            ),
            ..._suggestions
                .map((suggestion) => ListTile(
                      title: Text(suggestion),
                      onTap: () {
                        setState(() {
                          _controller.text = suggestion;
                        });
                      },
                    ))
                .toList(),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _submit,
              child: const Text(
                "የአየር ሁኔታ ፈልግ?",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
