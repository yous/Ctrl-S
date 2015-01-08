-- ------------------------------------------------------------------------------ --
--                            TradeSkillMaster_Shopping                           --
--            http://www.curse.com/addons/wow/tradeskillmaster_shopping           --
--                                                                                --
--             A TradeSkillMaster Addon (http://tradeskillmaster.com)             --
--    All Rights Reserved* - Detailed license information included with addon.    --
-- ------------------------------------------------------------------------------ --

-- TradeSkillMaster_Shopping Locale - deDE
-- Please use the localization app on CurseForge to update this
-- http://wow.curseforge.com/addons/TradeSkillMaster_Shopping/localization/

local L = LibStub("AceLocale-3.0"):NewLocale("TradeSkillMaster_Shopping", "deDE")
if not L then return end

L["Action"] = "Aktion" -- Needs review
L["Added '%s' to your favorite searches."] = "'%s' wurde zu Euren Lieblingssuchbegriffen hinzugefügt." -- Needs review
L["Below Custom Price ('0c' to disable)"] = "Unterhalb des benutzerdefinierten Preises ('0c' zum Deaktivieren)" -- Needs review
L["Below Max Price"] = "Unterhalb des Maximalpreises" -- Needs review
L["Below Vendor Sell Price"] = "Unterhalb des Händlerverkaufpreises" -- Needs review
L["Bid Percent"] = "Gebot-Prozent" -- Needs review
L["Buyout"] = "Sofortkauf" -- Needs review
L[ [=[Click to search for an item.
Shift-Click to post at market value.]=] ] = "Klickt, um nach einen Gegenstand zu suchen." -- Needs review
L["Custom Filter"] = "Benutzerdefinierter Filter" -- Needs review
L["Default Post Undercut Amount"] = "Standardmenge zum Unterbieten einer Auktion" -- Needs review
L["Destroy Mode"] = "Destroy-Modus" -- Needs review
L["% DE Value"] = "% DE-Wert" -- Needs review
L["Disenchant Search Profit: %s"] = "Entzauberungssuche-Gewinn: %s" -- Needs review
L["Done Scanning"] = "Scannen abgeschlossen" -- Needs review
L["Enter what you want to search for in this box. You can also use the following options for more complicated searches."] = "Tragt im Eingabefeld etwas ein, das gesucht werden soll. Ihr könnt auch die folgenden Optionen verwenden, um komplexere Suchen durchzuführen." -- Needs review
L["Error creating operation. Operation with name '%s' already exists."] = "Fehler beim Erstellen einer Operation. Operation mit dem Namen '%s' existiert bereits." -- Needs review
L["Even (5/10/15/20) Stacks Only"] = "Nur gerade Stapel (5/10/15/20)" -- Needs review
L["Favorite Searches"] = "Favorisierte Suchbegriffe" -- Needs review
L["General"] = "Allgemein" -- Needs review
L["General Operation Options"] = "Allgemeine Operations-Optionen" -- Needs review
L["General Options"] = "Allgemeine Einstellungen"
L["General Settings"] = "Allgemeine Einstellungen" -- Needs review
L["Give the new operation a name. A descriptive name will help you find this operation later."] = "Gebt der neuen Operation einen Namen. Ein beschreibender Name wird Euch später helfen, diese Operation wiederzufinden." -- Needs review
L["Hide Grouped Items"] = "Verstecke gruppierte Gegenstände" -- Needs review
L["If checked, auctions above the max price will be shown."] = "Wenn aktiviert, werden Auktionen oberhalb des Maximalpreises angezeigt." -- Needs review
L["If checked, only auctions posted in even quantities will be considered for purchasing."] = "Wenn aktiviert, werden nur Auktionen zum Einkaufen berücksichtigt, die gerade Mengen haben." -- Needs review
L["If checked, the maximum shopping price will be shown in the tooltip for the item."] = "Wenn aktiviert, wird der maximale Einkaufspreis des Gegenstandes im Tooltip angezeigt." -- Needs review
L["If set, only items which are usable by your character will be included in the results."] = "Wenn gesetzt, werden nur Gegenstände in die Ergebnisse einbezogen, die Euer Charakter benutzen kann." -- Needs review
L["If set, only items which exactly match the search filter you have set will be included in the results."] = "Wenn gesetzt, werden nur Gegenstände in die Ergebnisse einbezogen, deren Namen exakt mit dem Suchbegriff übereinstimmen." -- Needs review
L["Import"] = "Importieren" -- Needs review
L["Import Favorite Search"] = "Importiere favorisierte Suchbegriffe" -- Needs review
L["Inline Filters:|r You can easily add common search filters to your search such as rarity, level, and item type. For example '%sarmor/leather/epic/85/i350/i377|r' will search for all leather armor of epic quality that requires level 85 and has an ilvl between 350 and 377 inclusive. Also, '%sinferno ruby/exact|r' will display only raw inferno rubys (none of the cuts)."] = "Inline-Filter:|r Ihr könnt einfach häufig verwendete Suchfilter in Eure Suche einfügen, wie z. B. Seltenheit, Stufe und Gegenstandstyp. Zum Beispiel würde '%srüstung/leder/episch/85/i350/i377|r' nach Lederrüstungen epischer Qualität suchen, die Stufe 85 benötigen und einen ilvl zwischen 350 und 377 haben. Zudem würde '%sinfernorubin/exact|r' nur unbearbeitete Infernorubine anzeigen (und keines der Endprodukte)." -- Needs review
L["Invalid custom price source for %s. %s"] = "Ungültige benutzerdefinierte Preisquelle für %s. %s" -- Needs review
L["Invalid destroy search: '%s'"] = "Ungültige Destroy-Suche: '%s'" -- Needs review
L["Invalid destroy target: '%s'"] = "Ungültiges Destroy-Ziel: '%s'" -- Needs review
L["Invalid Even Only Filter"] = "Ungültiger Filter für 'Nur gerade'" -- Needs review
L["Invalid Exact Only Filter"] = "Ungültiger Filter für 'Exakte Übereinstimmung'" -- Needs review
L["Invalid Filter"] = "Ungültiger Filter" -- Needs review
L["Invalid Item Level"] = "Ungültige Gegenstandsstufe" -- Needs review
L["Invalid Item Rarity"] = "Ungültige Seltenheitsstufe" -- Needs review
L["Invalid Item SubType"] = "Ungültiger Untertyp" -- Needs review
L["Invalid Item Type"] = "Ungültiger Gegenstandstyp" -- Needs review
L["Invalid Max Quantity"] = "Ungültige Maximalmenge" -- Needs review
L["Invalid Min Level"] = "Ungültige Minimalstufe" -- Needs review
L["Invalid target item for destroy search: '%s'"] = "Ungültiger Zielgegenstand für Destroy-Suche: '%s'" -- Needs review
L["Invalid Usable Only Filter"] = "Ungültiger Filter für 'Nur benutzbar'" -- Needs review
L["Item"] = "Gegenstand" -- Needs review
L["Item Class"] = "Gegenstandsklasse" -- Needs review
L["Item Level Range:"] = "Item-Level-Bereich:" -- Needs review
L["Item SubClass"] = "Gegenstand-Nebenklasse" -- Needs review
L["Items which are below their maximum price (per their group / Shopping operation) will be displayed in Sniper searches."] = "Gegenstände, die unterhalb ihres Maximalpreises sind (über ihre Gruppe / Shopping-Operation), werden in der Sniper-Suche angezeigt." -- Needs review
L["Items which are below their vendor sell price will be displayed in Sniper searches."] = "Gegenstände, die unterhalb ihres Händlerverkaufpreises sind, werden in der Sniper-Suche angezeigt." -- Needs review
L["Items which are below this custom price will be displayed in Sniper searches."] = "Gegenstände, die unterhalb diesen benutzerdefinierten Preises sind, werden in der Sniper-Suche angezeigt." -- Needs review
L["Left-Click to run this search."] = "Linksklick, um diese Suche zu starten." -- Needs review
L["Log"] = "Log" -- Needs review
L["Management"] = "Verwaltung" -- Needs review
L["% Market Value"] = "% Marktwert"
L["Market Value Price Source"] = "Marktwertpreisquelle" -- Needs review
L["% Mat Price"] = "% Materialpreis" -- Needs review
L["Max Disenchant Search Percent"] = "Maximaler Prozentsatz für die Entzauberungs-Suche" -- Needs review
L["Maximum Auction Price (per item)"] = "Maximaler Auktionspreis (je Gegenstand)" -- Needs review
L["Maximum quantity purchased for destroy search."] = "Maximale Menge, die für die Destroy-Suche eingekauft werden soll." -- Needs review
L["Maximum quantity purchased for %s."] = "Maximale Menge, die für %s eingekauft werden soll." -- Needs review
L["Maximum Quantity to Buy:"] = "Maximale Einkaufsmenge:" -- Needs review
L["% Max Price"] = "% Marktpreis"
L["Max Shopping Price:"] = "Maximaler Einkaufspreis:" -- Needs review
L["Minimum Rarity"] = "Minimale Seltenheitsstufe" -- Needs review
L["Multiple Search Terms:|r You can search for multiple things at once by simply separated them with a ';'. For example '%selementium ore; obsidium ore|r' will search for both elementium and obsidium ore."] = "Mehrere Suchbegriffe:|r Ihr könnt mehrere Dinge auf einmal suchen, indem Ihr sie jeweils mit einem ';' trennt. Zum Beispiel würde '%selementiumerz; obsidiumerz|r' sowohl nach Elementiumerz als auch Obsidiumerz suchen." -- Needs review
L["New Operation"] = "Neue Operation" -- Needs review
L["No recent AuctionDB scan data found."] = "Keine aktuellen AuctionDB-Scandaten gefunden." -- Needs review
L["Normal Mode"] = "Normal-Modus" -- Needs review
L["Normal Post Price"] = "Normaler Preis zum Erstellen einer Auktion" -- Needs review
L["NOTE: The scan must be stopped before you can buy anything."] = "HINWEIS: Der Scan muss gestoppt werden, bevor Ihr etwas kaufen könnt." -- Needs review
L["Num"] = "Anzahl" -- Needs review
L["Operation Name"] = "Operationsname" -- Needs review
L["Operations"] = "Operationen" -- Needs review
L["Options"] = "Einstellungen"
L["Other"] = "Sonstiges" -- Needs review
L["Paste the search you'd like to import into the box below."] = "Fügt eine Suche ein, die Ihr in die Box unten importieren wollt." -- Needs review
L["Posted a %s with a buyuot of %s."] = "Auktion für %s mit einem Sofortkaufpreis von %s erstellt." -- Needs review
L["Preparing Filter %d / %d"] = "Vorbereitung des Filters %d / %d" -- Needs review
L["Preparing filters..."] = "Bereite Filter vor..." -- Needs review
L["Press Ctrl-C to copy this saved search."] = "Drückt STRG+C, um diesen gespeicherten Suchbegriff zu kopieren. " -- Needs review
L["Price"] = "Preis" -- Needs review
L["Quick Posting"] = "Schnell-Erstellen" -- Needs review
L["Quick Posting Duration"] = "Schnell-Erstellungsdauer" -- Needs review
L["Quick Posting Price"] = "Schnell-Erstellungspreis" -- Needs review
L["Recent Searches"] = "Aktuelle Suchbegriffe" -- Needs review
L["Relationships"] = "Beziehungen" -- Needs review
L["Removed '%s' from your favorite searches."] = "'%s' aus Euren favorisierten Suchbegriffen entfernt." -- Needs review
L["Removed '%s' from your recent searches."] = "'%s' aus Euren aktuellen Suchbegriffen entfernt." -- Needs review
L["Required Level Range:"] = "Benötigter Stufenbereich:" -- Needs review
L["Reset Filters"] = "Filter zurücksetzen" -- Needs review
L["Right-Click to favorite this recent search."] = "Rechtsklick, um diese aktuelle Suche zu favorisieren." -- Needs review
L["Right-Click to remove from favorite searches."] = "Rechtsklick, um es aus den favorisierten Suchbegriffen zu entfernen." -- Needs review
L["Saved Searches"] = "Gespeicherte Suchbegriffe" -- Needs review
L["Scanning %d / %d (Page %d / %d)"] = "Scanne %d / %d (Seite %d / %d)" -- Needs review
L["Search Filter:"] = "Suchfilter:" -- Needs review
L["Select the groups which you would like to include in the search."] = "Wählt die Gruppen aus, die in die Suche einbezogen werden sollen." -- Needs review
L["'%s' has a Shopping operation of '%s' which no longer exists. Shopping will ignore this group until this is fixed."] = "'%s' hat eine Shopping-Operation von '%s', die nicht mehr existiert. Shopping wird diese Gruppe ignorieren, bis das behoben wurde." -- Needs review
L["Shift-Left-Click to export this search."] = "Umschalt-Linksklick, um diese Suche zu exportieren." -- Needs review
L["Shift-Right-Click to remove this recent search."] = "Umschalt-Rechtsklick, um diese aktuelle Suche zu entfernen." -- Needs review
L["Shopping for auctions including those above the max price."] = "Das Einkaufen von Auktionen schließt solche mit ein, die oberhalb des Maximalpreises sind. " -- Needs review
L["Shopping for auctions with a max price set."] = "Das Einkaufen von Auktionen mit einem maximalen Preissatz." -- Needs review
L["Shopping for even stacks including those above the max price"] = "Das Einkaufen von geraden Stapelmengen, einschließlich solche, die oberhalb des Maximalpreises sind." -- Needs review
L["Shopping for even stacks with a max price set."] = "Das Einkaufen von geraden Stapelmengen mit einem maximalen Preissatz." -- Needs review
L["Shopping operations contain settings items which you regularly buy from the auction house."] = "Shopping-Operationen enthalten Einstellungen für Gegenstände, die Ihr regelmäßig im Auktionshaus kauft." -- Needs review
L["Show Auctions Above Max Price"] = "Zeige Auktionen oberhalb des Maximalpreises" -- Needs review
L["Show Shopping Max Price in Tooltip"] = "Zeige maximalen Einkaufspreis im Tooltip" -- Needs review
L["Sidebar Pages:"] = "Seitenfenster-Seiten:" -- Needs review
L["Skipped the following search term because it's invalid."] = "Der folgende Suchbegriff wurde übersprungen, weil er ungültig ist." -- Needs review
L["Skipped the following search term because it's too long. Blizzard does not allow search terms over 63 characters."] = "Der folgende Suchbegriff wurde übersprungen, weil er zu lang ist. Blizzard erlaubt keine Suchbegriffe länger als 63 Zeichen." -- Needs review
L["Sniper Options"] = "Sniper-Optionen" -- Needs review
L["Start Disenchant Search"] = "Starte Entzauberungs-Suche" -- Needs review
L["Start Search"] = "Starte Suche" -- Needs review
L["Start Sniper"] = "Starte Sniper" -- Needs review
L["Start Vendor Search"] = "Starte Händler-Suche" -- Needs review
L["Stop"] = "Stopp" -- Needs review
L["Stop Sniper"] = "Stoppe Sniper" -- Needs review
L["% Target Value"] = "% Zielwert" -- Needs review
L["The disenchant search looks for items on the AH below their disenchant value. You can set the maximum percentage of disenchant value to search for in the Shopping General options"] = "Die Entzauberungs-Suche sucht nach Gegenständen im AH, die unterhalb ihres Entzauberungswertes sind. Ihr könnt den maximalen Prozentsatz des zu suchenden Entzauberungswertes in den allgemeinen Shopping-Optionen einstellen." -- Needs review
L["The duration at which items will be posted via the 'Quick Posting' frame."] = "Die Dauer, mit der Auktionen von Gegenständen via Schnell-Erstellen-Fenster erstellt werden sollen." -- Needs review
L["The highest price per item you will pay for items in affected by this operation."] = "Der höchste Preis pro Gegenstand, den Ihr für Gegenstände bezahlten wollt, unter Einfluss dieser Operation." -- Needs review
L["The Sniper feature will look in real-time for items that have recently been posted to the AH which are worth snatching! You can configure the parameters of Sniper in the Shopping options."] = "Das Sniper-Feature wird in Echtzeit nach frischen Auktionen suchen, die zum Kaufen geeignet sind. Ihr könnt die Parameter des Sniper in den Shopping-Optionen einstellen." -- Needs review
L["The vendor search looks for items on the AH below their vendor sell price."] = "Die Händler-Suche sucht nach Gegenständen im AH, die unterhalb des Händlerverkaufpreises angeboten werden." -- Needs review
L["This is how Shopping calculates the '% Market Value' column in the search results."] = "Auf diese Weise berechnet Shopping die Spalte '% Marktwert' in den Suchergebnissen." -- Needs review
L["This is the default price Shopping will suggest to post items at when there's no others posted."] = "Dies ist der Standardpreis, den Shopping beim Erstellen von Auktionen vorschlagen wird, wenn keine anderen vorhanden sind. " -- Needs review
L["This is the maximum percentage of disenchant value that the Other > Disenchant search will display results for."] = "Dies ist der maximale Prozentsatz des Entzauberungswertes, auf dessen Basis die Sonstiges > Entzauberungs-Suche Ergebnisse anzeigen soll." -- Needs review
L["This is the percentage of your buyout price that your bid will be set to when posting auctions with Shopping."] = "Dies ist der Prozentsatz Eures Sofortkaufpreises, der als Gebot beim Erstellen von Auktionen via Shopping verwendet wird." -- Needs review
L["This price is used to determine what items will be posted at through the 'Quick Posting' frame."] = "Mit diesem Preis wird festgelegt, welche Auktionen über das Fenster 'Schnell-Erstellen' erstellt werden." -- Needs review
L["TSM Groups"] = "TSM-Gruppen" -- Needs review
L["Unknown Filter"] = "Unbekannter Filter" -- Needs review
L["Unknown milling search target: '%s'"] = "Unbekanntes Suchziel zum Zermahlen: '%s'" -- Needs review
L["% Vendor Price"] = "% Händlerpreis" -- Needs review
L["Vendor Search Profit: %s"] = "Händlersuche-Gewinn: %s" -- Needs review
L["What to set the default undercut to when posting items with Shopping."] = "Um wieviel der Preis beim Erstellen einer Auktion via Shopping unterboten werden soll." -- Needs review
L["When in destroy mode, you simply enter a target item (ink/pigment, enchanting mat, gem, etc) into the search box to search for everything you can destroy to get that item."] = "Im Zerstörenmodus, gibst du einfach einen Zielgegenstand (Tinte/Pigment, Verzaubermaterial, Edelstein, etc) in das Suchfeld ein um alle Gegenstände zu erhalten, die bei Zerstörung den Zielgegenstand enthalten." -- Needs review
L["When in normal mode, you may run simple and filtered searches of the auction house."] = "Im Normalmodus, kannst du einfache oder gefilterte Suchen des Auktionshauses durchführen." -- Needs review
