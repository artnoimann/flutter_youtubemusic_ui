import 'package:flutter/material.dart';
import 'package:flutter_youtubemusic_ui/model/artist_model.dart';

class ArtistItemSelect extends StatefulWidget {
  final Key key;
  final ArtistModel artistModel;
  late ValueChanged<bool> isSelected;

  ArtistItemSelect({
    required this.artistModel,
    required this.isSelected,
    required this.key,
  });

  @override
  State<ArtistItemSelect> createState() => _ArtistItemSelectState();
}

class _ArtistItemSelectState extends State<ArtistItemSelect> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: isSelected
              ? BoxDecoration(
                  border: Border.all(width: 2, color: Colors.white),
                  borderRadius: BorderRadius.circular(50),
                )
              : BoxDecoration(),
          child: InkWell(
            onTap: () {
              setState(() {
                isSelected = !isSelected;
                widget.isSelected(isSelected);
              });
            },
            child: ClipRRect(
              child: Image.network(
                widget.artistModel.src,
                colorBlendMode: BlendMode.color,
                fit: BoxFit.cover,
                width: 100,
                height: 100,
              ),
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          // height: 80,
          child: Text(
            // overflow: TextOverflow.ellipsis,
            widget.artistModel.name,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
