///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsDe = Translations; // ignore: unused_element
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.de,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <de>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	late final TranslationsLandingDe landing = TranslationsLandingDe._(_root);
	String get feedbackDialogTitle => 'Wir schätzen Ihr Feedback';
	String get feedbackDialogCloseWaitMessage => 'Bitte warten Sie 5 Sekunden';
	String get feedbackDialogDescription => 'Helfen Sie uns, indem Sie Ihre Erfahrungen mit dem Preisrechner teilen.';
	String get question1 => 'F.1 Wie viel Zeit hat Ihnen die Nutzung dieses Rechners im Vergleich zu traditionellen Methoden gespart?';
	List<String> get timeSavingsOptions => [
		'Keine Zeitersparnis',
		'Weniger als 5 Minuten',
		'5-15 Minuten',
		'15-30 Minuten',
		'Mehr als 30 Minuten',
	];
	String get question2 => 'F.2 Wie einfach war es, den Preisrechner zu benutzen?';
	List<String> get easeOptions => [
		'Sehr schwierig',
		'Schwierig',
		'Neutral',
		'Einfach',
		'Sehr einfach',
	];
	String get question3 => 'F.3 Wie genau waren die Preisvorschläge im Vergleich zu Ihren Erwartungen?';
	List<String> get accuracyOptions => [
		'Sehr ungenau',
		'Ungenau',
		'Neutral',
		'Genau',
		'Sehr genau',
	];
	String get question4 => 'F.4 Wie zufrieden sind Sie mit den Preisvorschlägen des Rechners?';
	List<String> get satisfactionOptions => [
		'Sehr unzufrieden',
		'Unzufrieden',
		'Neutral',
		'Zufrieden',
		'Sehr zufrieden',
	];
	String get submitButtonLabel => 'Feedback absenden';
	String get submittingLabel => 'Absenden...';
	String get errorMessageIncomplete => 'Bitte beantworten Sie alle Fragen';
	String get successMessage => 'Feedback erfolgreich gesendet';
	String get errorMessageGeneral => 'Ein Fehler ist aufgetreten';
	String get fixedCostComment => 'Fixkosten sind Kosten, die sich nicht mit dem Produktions- oder Outputniveau ändern.';
	String get variableCostComment => 'Variable Kosten sind Kosten, die sich proportional zu den Änderungen im Output oder in der Produktion ändern.';
	String get productionQuantity => 'Outputmenge pro Monat. Wie viele Einheiten des Produktes werden pro Monat ca. hergestellt?';
	String get yourPriceSuggestion => 'Ihre Preisempfehlung';
	String get perUnit => 'Pro Einheit';
	String get profitMargin => 'Gewinnmarge';
}

// Path: landing
class TranslationsLandingDe {
	TranslationsLandingDe._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsLandingNavigationDe navigation = TranslationsLandingNavigationDe._(_root);
	String get hero_title => 'Ihre Preisgestaltung leicht gemacht – Das maßgeschneiderte Tool für Unternehmer';
	String get hero_subtitle => 'Optimieren Sie Ihre Preise und steigern Sie Ihre Gewinne mit kostenlosen automatisierten Berechnungen.';
	String get try_demo => 'Einfach ausprobieren';
	String get features_title => 'Sofortige Preiskalkulationen';
	String get feature_subtitle => 'Geben Sie Ihre Kosten ein und erhalten Sie sofort einen präzisen Preis auf Basis Ihrer gewünschten Gewinnspanne. Keine komplizierten Berechnungen nötig!';
	List<dynamic> get features => [
		TranslationsLanding$features$0i0$De._(_root),
		TranslationsLanding$features$0i1$De._(_root),
		TranslationsLanding$features$0i2$De._(_root),
	];
	String get pricing_calculator_header => 'Sofortiger Preisrechner';
	String get benefits_subtitle => 'Entdecken Sie, wie wir Unternehmen in verschiedenen Branchen unterstützen, Wachstum zu erzielen, Abläufe zu optimieren und Herausforderungen zu meistern.';
	String get benefits_title => 'Vorteile für KMU';
	String get slider_label => 'Prozentsatz des Gewinns, den Sie zur Kostendeckung und Gewinnerzielung hinzufügen möchten';
	List<dynamic> get benefits => [
		TranslationsLanding$benefits$0i0$De._(_root),
		TranslationsLanding$benefits$0i1$De._(_root),
		TranslationsLanding$benefits$0i2$De._(_root),
		TranslationsLanding$benefits$0i3$De._(_root),
	];
	String get testimonials => 'Kundenbewertungen';
	String get testimonial_title => 'Unsere zufriedenen Kunden';
	String get faq_title => 'Häufig gestellte Fragen';
	String get contacts_title => 'Bereit, Ihr Unternehmen zu transformieren?';
	String get start_your_free_trial => 'Starten Sie Ihre kostenlose Testphase';
	String get privacy_policy => 'Datenschutzrichtlinie';
	String get terms_and_conditions => 'Allgemeine Geschäftsbedingungen';
	String get cookie_policy => 'Cookie-Richtlinie';
	String get label => 'Bezeichnung';
	String get cost_type => 'Kostentyp';
	String get price => 'Preis';
	String get comment => 'Kommentar';
	String get cost_category => 'Kostenkategorie';
	String get cost_euro => 'Kosten (€)';
	String get fixed_cost => 'Fixkosten';
	String get variable_cost => 'Variable Kosten';
	String get add_row => 'Zeile hinzufügen';
	String get set_profit_margin => 'Gewinnmarge festlegen';
	String get calculate_price => 'Preis berechnen';
	String get please_fill_all_fields => 'Bitte füllen Sie alle Felder aus';
}

// Path: landing.navigation
class TranslationsLandingNavigationDe {
	TranslationsLandingNavigationDe._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get home => 'Startseite';
	String get features => 'Funktionen';
	String get pricing_calculator => 'Preisrechner';
	String get benefits => 'Vorteile';
	String get testimonials => 'Kundenstimmen';
	String get faq => 'FAQ';
	String get contact_us => 'Kontaktieren Sie uns';
	String get login => 'Anmelden';
	String get calculate => 'Berechnen';
}

// Path: landing.features.0
class TranslationsLanding$features$0i0$De {
	TranslationsLanding$features$0i0$De._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Preis-Simulation in Echtzeit';
	String get description => 'Geben Sie Ihre Kosten ein und erhalten Sie sofort einen genauen Preis basierend auf Ihrer gewünschten Gewinnmarge. Keine komplizierten Berechnungen nötig!';
}

// Path: landing.features.1
class TranslationsLanding$features$0i1$De {
	TranslationsLanding$features$0i1$De._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Echtzeit-Preissimulationen';
	String get description => 'Passen Sie Kosten oder Gewinnmargen an und sehen Sie sofort den aktualisierten Preis, um verschiedene Szenarien zu erkunden.';
}

// Path: landing.features.2
class TranslationsLanding$features$0i2$De {
	TranslationsLanding$features$0i2$De._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Übersichtliches Dashboard';
	String get description => 'Alle wichtigen Kennzahlen auf einen Blick, sodass Sie schnelle und fundierte Preisentscheidungen treffen können.';
}

// Path: landing.benefits.0
class TranslationsLanding$benefits$0i0$De {
	TranslationsLanding$benefits$0i0$De._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Automatisierte Preiskalkulationen';
	String get content => 'Geben Sie Ihre Kosten ein und erhalten Sie sofort einen genauen Preis basierend auf Ihrer gewünschten Gewinnmarge. Keine komplizierten Berechnungen nötig!';
}

// Path: landing.benefits.1
class TranslationsLanding$benefits$0i1$De {
	TranslationsLanding$benefits$0i1$De._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Zeitersparnis';
	String get content => 'Automatisierte Berechnungen sparen Ihnen bis zu 30 Minuten pro Preisaufgabe';
}

// Path: landing.benefits.2
class TranslationsLanding$benefits$0i2$De {
	TranslationsLanding$benefits$0i2$De._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Kostenersparnis';
	String get content => 'Erschwinglich für KMU, ohne dass zusätzliche Tools benötigt werden.';
}

// Path: landing.benefits.3
class TranslationsLanding$benefits$0i3$De {
	TranslationsLanding$benefits$0i3$De._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Einfachheit';
	String get content => 'Keine komplexe IT erforderlich; leicht zu bedienen für alle';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'landing.navigation.home': return 'Startseite';
			case 'landing.navigation.features': return 'Funktionen';
			case 'landing.navigation.pricing_calculator': return 'Preisrechner';
			case 'landing.navigation.benefits': return 'Vorteile';
			case 'landing.navigation.testimonials': return 'Kundenstimmen';
			case 'landing.navigation.faq': return 'FAQ';
			case 'landing.navigation.contact_us': return 'Kontaktieren Sie uns';
			case 'landing.navigation.login': return 'Anmelden';
			case 'landing.navigation.calculate': return 'Berechnen';
			case 'landing.hero_title': return 'Ihre Preisgestaltung leicht gemacht – Das maßgeschneiderte Tool für Unternehmer';
			case 'landing.hero_subtitle': return 'Optimieren Sie Ihre Preise und steigern Sie Ihre Gewinne mit kostenlosen automatisierten Berechnungen.';
			case 'landing.try_demo': return 'Einfach ausprobieren';
			case 'landing.features_title': return 'Sofortige Preiskalkulationen';
			case 'landing.feature_subtitle': return 'Geben Sie Ihre Kosten ein und erhalten Sie sofort einen präzisen Preis auf Basis Ihrer gewünschten Gewinnspanne. Keine komplizierten Berechnungen nötig!';
			case 'landing.features.0.title': return 'Preis-Simulation in Echtzeit';
			case 'landing.features.0.description': return 'Geben Sie Ihre Kosten ein und erhalten Sie sofort einen genauen Preis basierend auf Ihrer gewünschten Gewinnmarge. Keine komplizierten Berechnungen nötig!';
			case 'landing.features.1.title': return 'Echtzeit-Preissimulationen';
			case 'landing.features.1.description': return 'Passen Sie Kosten oder Gewinnmargen an und sehen Sie sofort den aktualisierten Preis, um verschiedene Szenarien zu erkunden.';
			case 'landing.features.2.title': return 'Übersichtliches Dashboard';
			case 'landing.features.2.description': return 'Alle wichtigen Kennzahlen auf einen Blick, sodass Sie schnelle und fundierte Preisentscheidungen treffen können.';
			case 'landing.pricing_calculator_header': return 'Sofortiger Preisrechner';
			case 'landing.benefits_subtitle': return 'Entdecken Sie, wie wir Unternehmen in verschiedenen Branchen unterstützen, Wachstum zu erzielen, Abläufe zu optimieren und Herausforderungen zu meistern.';
			case 'landing.benefits_title': return 'Vorteile für KMU';
			case 'landing.slider_label': return 'Prozentsatz des Gewinns, den Sie zur Kostendeckung und Gewinnerzielung hinzufügen möchten';
			case 'landing.benefits.0.title': return 'Automatisierte Preiskalkulationen';
			case 'landing.benefits.0.content': return 'Geben Sie Ihre Kosten ein und erhalten Sie sofort einen genauen Preis basierend auf Ihrer gewünschten Gewinnmarge. Keine komplizierten Berechnungen nötig!';
			case 'landing.benefits.1.title': return 'Zeitersparnis';
			case 'landing.benefits.1.content': return 'Automatisierte Berechnungen sparen Ihnen bis zu 30 Minuten pro Preisaufgabe';
			case 'landing.benefits.2.title': return 'Kostenersparnis';
			case 'landing.benefits.2.content': return 'Erschwinglich für KMU, ohne dass zusätzliche Tools benötigt werden.';
			case 'landing.benefits.3.title': return 'Einfachheit';
			case 'landing.benefits.3.content': return 'Keine komplexe IT erforderlich; leicht zu bedienen für alle';
			case 'landing.testimonials': return 'Kundenbewertungen';
			case 'landing.testimonial_title': return 'Unsere zufriedenen Kunden';
			case 'landing.faq_title': return 'Häufig gestellte Fragen';
			case 'landing.contacts_title': return 'Bereit, Ihr Unternehmen zu transformieren?';
			case 'landing.start_your_free_trial': return 'Starten Sie Ihre kostenlose Testphase';
			case 'landing.privacy_policy': return 'Datenschutzrichtlinie';
			case 'landing.terms_and_conditions': return 'Allgemeine Geschäftsbedingungen';
			case 'landing.cookie_policy': return 'Cookie-Richtlinie';
			case 'landing.label': return 'Bezeichnung';
			case 'landing.cost_type': return 'Kostentyp';
			case 'landing.price': return 'Preis';
			case 'landing.comment': return 'Kommentar';
			case 'landing.cost_category': return 'Kostenkategorie';
			case 'landing.cost_euro': return 'Kosten (€)';
			case 'landing.fixed_cost': return 'Fixkosten';
			case 'landing.variable_cost': return 'Variable Kosten';
			case 'landing.add_row': return 'Zeile hinzufügen';
			case 'landing.set_profit_margin': return 'Gewinnmarge festlegen';
			case 'landing.calculate_price': return 'Preis berechnen';
			case 'landing.please_fill_all_fields': return 'Bitte füllen Sie alle Felder aus';
			case 'feedbackDialogTitle': return 'Wir schätzen Ihr Feedback';
			case 'feedbackDialogCloseWaitMessage': return 'Bitte warten Sie 5 Sekunden';
			case 'feedbackDialogDescription': return 'Helfen Sie uns, indem Sie Ihre Erfahrungen mit dem Preisrechner teilen.';
			case 'question1': return 'F.1 Wie viel Zeit hat Ihnen die Nutzung dieses Rechners im Vergleich zu traditionellen Methoden gespart?';
			case 'timeSavingsOptions.0': return 'Keine Zeitersparnis';
			case 'timeSavingsOptions.1': return 'Weniger als 5 Minuten';
			case 'timeSavingsOptions.2': return '5-15 Minuten';
			case 'timeSavingsOptions.3': return '15-30 Minuten';
			case 'timeSavingsOptions.4': return 'Mehr als 30 Minuten';
			case 'question2': return 'F.2 Wie einfach war es, den Preisrechner zu benutzen?';
			case 'easeOptions.0': return 'Sehr schwierig';
			case 'easeOptions.1': return 'Schwierig';
			case 'easeOptions.2': return 'Neutral';
			case 'easeOptions.3': return 'Einfach';
			case 'easeOptions.4': return 'Sehr einfach';
			case 'question3': return 'F.3 Wie genau waren die Preisvorschläge im Vergleich zu Ihren Erwartungen?';
			case 'accuracyOptions.0': return 'Sehr ungenau';
			case 'accuracyOptions.1': return 'Ungenau';
			case 'accuracyOptions.2': return 'Neutral';
			case 'accuracyOptions.3': return 'Genau';
			case 'accuracyOptions.4': return 'Sehr genau';
			case 'question4': return 'F.4 Wie zufrieden sind Sie mit den Preisvorschlägen des Rechners?';
			case 'satisfactionOptions.0': return 'Sehr unzufrieden';
			case 'satisfactionOptions.1': return 'Unzufrieden';
			case 'satisfactionOptions.2': return 'Neutral';
			case 'satisfactionOptions.3': return 'Zufrieden';
			case 'satisfactionOptions.4': return 'Sehr zufrieden';
			case 'submitButtonLabel': return 'Feedback absenden';
			case 'submittingLabel': return 'Absenden...';
			case 'errorMessageIncomplete': return 'Bitte beantworten Sie alle Fragen';
			case 'successMessage': return 'Feedback erfolgreich gesendet';
			case 'errorMessageGeneral': return 'Ein Fehler ist aufgetreten';
			case 'fixedCostComment': return 'Fixkosten sind Kosten, die sich nicht mit dem Produktions- oder Outputniveau ändern.';
			case 'variableCostComment': return 'Variable Kosten sind Kosten, die sich proportional zu den Änderungen im Output oder in der Produktion ändern.';
			case 'productionQuantity': return 'Outputmenge pro Monat. Wie viele Einheiten des Produktes werden pro Monat ca. hergestellt?';
			case 'yourPriceSuggestion': return 'Ihre Preisempfehlung';
			case 'perUnit': return 'Pro Einheit';
			case 'profitMargin': return 'Gewinnmarge';
			default: return null;
		}
	}
}

