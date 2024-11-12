import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pricing_calculator/src/constants/app_sizes.dart';
import 'package:pricing_calculator/src/constants/colors.dart';
import 'package:pricing_calculator/src/shared/container_widget.dart';
import 'package:pricing_calculator/src/utilities/device_extensions.dart';

class InfoDialog extends HookConsumerWidget {
  const InfoDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ContainerWidget(
      borderRadius: BorderRadius.circular(20),
      color: AppColors.white,
      padding: EdgeInsets.all(
        context.isTabletOrLess ? Sizes.p24 : Sizes.p60,
      ),
      child: Stack(
        children: [
          const Markdown(data: '''
# Die PreisRechner Formel

Unsere Methode berechnet den Verkaufspreis eines Produkts, indem die variablen und fixen Kosten auf jede produzierte Einheit aufgeteilt werden und am Ende eine flexible Gewinnmarge aufgeschlagen wird. Dieses Verfahren eignet sich besonders gut für kleine und mittlere Unternehmen (KMUs), die eine einfache und transparente Preisfindung benötigen.

## Grundlagen der Berechnung

Die Methode basiert auf zwei Hauptkostentypen:

1. Variable Kosten pro Einheit: Direkte Kosten, die spezifisch für jedes Produkt anfallen (z. B. Material und Arbeitszeit).
2. Fixkosten: Gemeinkosten, die nicht direkt einem Produkt zugeordnet werden können (z. B. Miete, Verwaltung). Diese Kosten werden gleichmäßig auf alle Produkte verteilt.

## Einfache Formel zur Berechnung des Selbstkostenpreises

Um den Grundpreis oder Selbstkostenpreis eines Produkts zu berechnen, verwenden wir folgende Formel:

Selbstkostenpreis = Variable Kosten pro Einheit + Fixkosten pro Einheit

Dabei ist:

- Variable Kosten pro Einheit: Die direkten Kosten, die nur für dieses spezielle Produkt anfallen.
- Fixkosten pro Einheit: Der Anteil der Fixkosten, der auf jede hergestellte Einheit entfällt. Er wird berechnet, indem die gesamten Fixkosten durch die Gesamtproduktionsmenge geteilt werden.

## Schritt-für-Schritt-Berechnung

1. Fixkosten pro Einheit berechnen:
  Fixkosten pro Einheit = Gesamte Fixkosten / Gesamtproduktionsmenge
2. Selbstkostenpreis berechnen:
  Selbstkostenpreis = Variable Kosten pro Einheit + Fixkosten pro Einheit
3. Gewinnmarge anwenden:
  Wählen Sie die gewünschte Gewinnmarge (in Prozent) und fügen Sie sie hinzu, um den Verkaufspreis festzulegen:
  Verkaufspreis = Selbstkostenpreis * (1 + Gewinnmarge / 100)

## Beispielrechnung: Preisberechnung für einen Schreibtisch mit Gewinnmarge

Stellen wir uns vor, ein Unternehmen stellt Schreibtische her und möchte den Preis pro Schreibtisch berechnen. Hier sind die gegebenen Daten:

1. Variable Kosten pro Schreibtisch:
  - Materialkosten: 30 €
  - Arbeitskosten: 20 €
  Variable Kosten pro Schreibtisch = 30 € + 20 € = 50 €
2. Fixkosten des Unternehmens: 5.000 € pro Monat
3. Produktionsmenge: 100 Schreibtische pro Monat

Schritt 1: Berechnung der Fixkosten pro Schreibtisch
Fixkosten pro Schreibtisch = 5.000 € / 100 = 50 €

Schritt 2: Berechnung des Selbstkostenpreises pro Schreibtisch
Selbstkostenpreis = 50 € + 50 € = 100 €

Schritt 3: Anwendung der Gewinnmarge
Angenommen, das Unternehmen möchte eine Gewinnmarge von 20 % aufschlagen. Der Verkaufspreis berechnet sich dann wie folgt:
Verkaufspreis = 100 € * (1 + 20 / 100) = 100 € * 1,20 = 120 €

## Endergebnis

Der Verkaufspreis des Schreibtischs bei einer 20 % Gewinnmarge beträgt 120 €.

## Flexible Anpassung der Gewinnmarge

Mit dem Gewinnmargen-Regler kann der Verkaufspreis je nach gewünschter Marge flexibel angepasst werden:

- 0 % Gewinnmarge (nur die Produktionskosten decken): 100 €
- 10 % Gewinnmarge: 100 € × 1,10 = 110 €
- 50 % Gewinnmarge: 100 € × 1,50 = 150 €
- 100 % Gewinnmarge: 100 € × 2,00 = 200 €

Der Gewinnmargen-Regler ermöglicht es dem Unternehmen, den Verkaufspreis für den Schreibtisch dynamisch an verschiedene Gewinnziele anzupassen.

## Zusammenfassung

Die FDC-Methode mit einem Gewinnmargen-Regler bietet eine einfache und effiziente Möglichkeit, die Gesamtkosten eines Produkts zu berechnen und dabei eine gewünschte Gewinnspanne zu berücksichtigen. Diese Methode stellt sicher, dass alle Kosten gedeckt sind und flexibel an Marktbedingungen und Unternehmensziele angepasst werden können.        '''),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                context.pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
