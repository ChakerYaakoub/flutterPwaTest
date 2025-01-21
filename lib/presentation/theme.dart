import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4279317312),
      surfaceTint: Color(4282606448),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4281750883),
      onPrimaryContainer: Color(4293064191),
      secondary: Color(4278213457),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4278223734),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4285946373),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4294036336),
      onTertiaryContainer: Color(4283250944),
      error: Color(4288888099),
      onError: Color(4294967295),
      errorContainer: Color(4294343259),
      onErrorContainer: Color(4280943616),
      surface: Color(4294899956),
      onSurface: Color(4280097561),
      onSurfaceVariant: Color(4282926910),
      outline: Color(4286150509),
      outlineVariant: Color(4291479227),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281479214),
      inversePrimary: Color(4289448923),
      primaryFixed: Color(4291225848),
      onPrimaryFixed: Color(4278198057),
      primaryFixedDim: Color(4289448923),
      onPrimaryFixedVariant: Color(4281027416),
      secondaryFixed: Color(4287428068),
      onSecondaryFixed: Color(4278198300),
      secondaryFixedDim: Color(4285520072),
      onSecondaryFixedVariant: Color(4278210632),
      tertiaryFixed: Color(4294958998),
      onTertiaryFixed: Color(4280621568),
      tertiaryFixedDim: Color(4293378664),
      onTertiaryFixedVariant: Color(4284105728),
      surfaceDim: Color(4292794837),
      surfaceBright: Color(4294899956),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294505455),
      surfaceContainer: Color(4294110697),
      surfaceContainerHigh: Color(4293715939),
      surfaceContainerHighest: Color(4293321438),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4279317312),
      surfaceTint: Color(4282606448),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4281750883),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4278209604),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4278223734),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4283777024),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4287525151),
      onTertiaryContainer: Color(4294967295),
      error: Color(4286456330),
      onError: Color(4294967295),
      errorContainer: Color(4290794039),
      onErrorContainer: Color(4294967295),
      surface: Color(4294899956),
      onSurface: Color(4280097561),
      onSurfaceVariant: Color(4282663738),
      outline: Color(4284571478),
      outlineVariant: Color(4286413681),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281479214),
      inversePrimary: Color(4289448923),
      primaryFixed: Color(4284053895),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4282474606),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4278223734),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4278216797),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4287525151),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4285749250),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292794837),
      surfaceBright: Color(4294899956),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294505455),
      surfaceContainer: Color(4294110697),
      surfaceContainerHigh: Color(4293715939),
      surfaceContainerHighest: Color(4293321438),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278199858),
      surfaceTint: Color(4282606448),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4280764244),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4278200355),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4278209604),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4281147392),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4283777024),
      onTertiaryContainer: Color(4294967295),
      error: Color(4282911232),
      onError: Color(4294967295),
      errorContainer: Color(4286456330),
      onErrorContainer: Color(4294967295),
      surface: Color(4294899956),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4280624157),
      outline: Color(4282663738),
      outlineVariant: Color(4282663738),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281479214),
      inversePrimary: Color(4292145663),
      primaryFixed: Color(4280764244),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4279120189),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4278209604),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4278203181),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4283777024),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4282001920),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292794837),
      surfaceBright: Color(4294899956),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294505455),
      surfaceContainer: Color(4294110697),
      surfaceContainerHigh: Color(4293715939),
      surfaceContainerHighest: Color(4293321438),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4289448923),
      surfaceTint: Color(4289448923),
      onPrimary: Color(4279383105),
      primaryContainer: Color(4280040777),
      onPrimaryContainer: Color(4289646559),
      secondary: Color(4285520072),
      onSecondary: Color(4278204209),
      secondaryContainer: Color(4278223734),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4294962373),
      onTertiary: Color(4282265088),
      tertiaryContainer: Color(4293181286),
      onTertiaryContainer: Color(4282593792),
      error: Color(4294948002),
      onError: Color(4284616960),
      errorContainer: Color(4290794039),
      onErrorContainer: Color(4294967295),
      surface: Color(4279505681),
      onSurface: Color(4293321438),
      onSurfaceVariant: Color(4291479227),
      outline: Color(4287861126),
      outlineVariant: Color(4282926910),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293321438),
      inversePrimary: Color(4282606448),
      primaryFixed: Color(4291225848),
      onPrimaryFixed: Color(4278198057),
      primaryFixedDim: Color(4289448923),
      onPrimaryFixedVariant: Color(4281027416),
      secondaryFixed: Color(4287428068),
      onSecondaryFixed: Color(4278198300),
      secondaryFixedDim: Color(4285520072),
      onSecondaryFixedVariant: Color(4278210632),
      tertiaryFixed: Color(4294958998),
      onTertiaryFixed: Color(4280621568),
      tertiaryFixedDim: Color(4293378664),
      onTertiaryFixedVariant: Color(4284105728),
      surfaceDim: Color(4279505681),
      surfaceBright: Color(4282071350),
      surfaceContainerLowest: Color(4279176716),
      surfaceContainerLow: Color(4280097561),
      surfaceContainer: Color(4280360733),
      surfaceContainerHigh: Color(4281018919),
      surfaceContainerHighest: Color(4281742386),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4289712352),
      surfaceTint: Color(4289448923),
      onPrimary: Color(4278196514),
      primaryContainer: Color(4285896100),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4285783245),
      onSecondary: Color(4278196759),
      secondaryContainer: Color(4281377171),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294962373),
      onTertiary: Color(4282265088),
      tertiaryContainer: Color(4293181286),
      onTertiaryContainer: Color(4279438336),
      error: Color(4294949546),
      onError: Color(4281533696),
      errorContainer: Color(4293225807),
      onErrorContainer: Color(4278190080),
      surface: Color(4279505681),
      onSurface: Color(4294966006),
      onSurfaceVariant: Color(4291742655),
      outline: Color(4289110936),
      outlineVariant: Color(4286940025),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293321438),
      inversePrimary: Color(4281093209),
      primaryFixed: Color(4291225848),
      onPrimaryFixed: Color(4278194971),
      primaryFixedDim: Color(4289448923),
      onPrimaryFixedVariant: Color(4279843399),
      secondaryFixed: Color(4287428068),
      onSecondaryFixed: Color(4278195474),
      secondaryFixedDim: Color(4285520072),
      onSecondaryFixedVariant: Color(4278206007),
      tertiaryFixed: Color(4294958998),
      onTertiaryFixed: Color(4279767040),
      tertiaryFixedDim: Color(4293378664),
      onTertiaryFixedVariant: Color(4282725376),
      surfaceDim: Color(4279505681),
      surfaceBright: Color(4282071350),
      surfaceContainerLowest: Color(4279176716),
      surfaceContainerLow: Color(4280097561),
      surfaceContainer: Color(4280360733),
      surfaceContainerHigh: Color(4281018919),
      surfaceContainerHighest: Color(4281742386),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294376447),
      surfaceTint: Color(4289448923),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4289712352),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4293656570),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4285783245),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294966006),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4293707372),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965752),
      onError: Color(4278190080),
      errorContainer: Color(4294949546),
      onErrorContainer: Color(4278190080),
      surface: Color(4279505681),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294966254),
      outline: Color(4291742655),
      outlineVariant: Color(4291742655),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293321438),
      inversePrimary: Color(4278857274),
      primaryFixed: Color(4291554556),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4289712352),
      onPrimaryFixedVariant: Color(4278196514),
      secondaryFixed: Color(4287691241),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4285783245),
      onSecondaryFixedVariant: Color(4278196759),
      tertiaryFixed: Color(4294960297),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4293707372),
      onTertiaryFixedVariant: Color(4280161536),
      surfaceDim: Color(4279505681),
      surfaceBright: Color(4282071350),
      surfaceContainerLowest: Color(4279176716),
      surfaceContainerLow: Color(4280097561),
      surfaceContainer: Color(4280360733),
      surfaceContainerHigh: Color(4281018919),
      surfaceContainerHighest: Color(4281742386),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.background,
        canvasColor: colorScheme.surface,
      );

  /// Custom Color 1
  static const customColor1 = ExtendedColor(
    seed: Color(4294222433),
    value: Color(4294222433),
    light: ColorFamily(
      color: Color(4287516180),
      onColor: Color(4294967295),
      colorContainer: Color(4294945641),
      onColorContainer: Color(4283311360),
    ),
    lightMediumContrast: ColorFamily(
      color: Color(4287516180),
      onColor: Color(4294967295),
      colorContainer: Color(4294945641),
      onColorContainer: Color(4283311360),
    ),
    lightHighContrast: ColorFamily(
      color: Color(4287516180),
      onColor: Color(4294967295),
      colorContainer: Color(4294945641),
      onColorContainer: Color(4283311360),
    ),
    dark: ColorFamily(
      color: Color(4294954925),
      onColor: Color(4283311616),
      colorContainer: Color(4293762140),
      onColorContainer: Color(4282129152),
    ),
    darkMediumContrast: ColorFamily(
      color: Color(4294954925),
      onColor: Color(4283311616),
      colorContainer: Color(4293762140),
      onColorContainer: Color(4282129152),
    ),
    darkHighContrast: ColorFamily(
      color: Color(4294954925),
      onColor: Color(4283311616),
      colorContainer: Color(4293762140),
      onColorContainer: Color(4282129152),
    ),
  );

  List<ExtendedColor> get extendedColors => [
        customColor1,
      ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
