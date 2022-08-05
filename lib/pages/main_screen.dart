import 'package:flutter/material.dart';
import 'package:martial_arts_seeker/models/martial_arts.dart';
import 'package:martial_arts_seeker/models/martial_arts_data.dart';
import 'package:martial_arts_seeker/pages/home_components/martial_arts_screen.dart';
import 'package:martial_arts_seeker/pages/home_components/no_data_screen.dart';

class MainScreen extends StatefulWidget {
  final String title;

  const MainScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late TextEditingController _searchQuery;
  late List<MartialArts> _data;
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _searchQuery = TextEditingController();
    _data = martialArts;
  }

  void _startSearching() {
    ModalRoute.of(context)
        ?.addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));

    setState(() {
      _isSearching = true;
    });
  }

  void _clearSearching() {
    setState(() {
      _data = martialArts;
      _searchQuery.clear();
    });
  }

  void _updateSearching(String query) {
    final updatedData = martialArts.where((data) {
      final nameLower = data.name.toLowerCase();
      final keywordLower = query.toLowerCase();

      return nameLower.contains(keywordLower);
    }).toList();

    setState(() {
      _data = updatedData;
    });
  }

  void _stopSearching() {
    _clearSearching();

    setState(() {
      _isSearching = false;
    });
  }

  Widget _buildTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          Text(
            'Martial Arts',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _searchQuery,
      autofocus: true,
      cursorColor: Colors.black54,
      decoration: const InputDecoration(
        hintText: 'Enter a keyword...',
        // border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.black45, fontSize: 16),
      ),
      style: const TextStyle(color: Colors.black, fontSize: 16),
      onChanged: _updateSearching,
    );
  }

  List<Widget> _buildActions() {
    if (_isSearching) {
      return <Widget>[
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            if (_searchQuery.text.isEmpty) {
              Navigator.pop(context);
              return;
            }
            _clearSearching();
          },
        ),
      ];
    }

    return <Widget>[
      IconButton(
        icon: const Icon(Icons.search),
        onPressed: _startSearching,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: _isSearching ? const BackButton() : null,
        title: _isSearching ? _buildSearchField() : _buildTitle(context),
        actions: _buildActions(),
      ),
      body: _data.isNotEmpty
          ? LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                if (constraints.maxWidth <= 640) {
                  return MartialArtsScreen(
                    data: _data,
                    gridCount: 2,
                  );
                } else if (constraints.maxWidth <= 1080) {
                  return MartialArtsScreen(
                    data: _data,
                    gridCount: 3,
                  );
                } else {
                  return MartialArtsScreen(
                    data: _data,
                    gridCount: 5,
                  );
                }
              },
            )
          : const NoDataScreen(),
    );
  }
}
