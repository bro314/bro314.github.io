
open(CSV, 'c:\Homepageneu\preisliste.csv') or die "DIE: Cant open file.\n";
open(HTML, '>c:\Homepageneu\preisliste.html') or die "DIE: Cant open file.\n";

print HTML '<html>
<head>
<title>Die Preisliste</title>

</head>

<body bgcolor=#008800 text=#FFCC99 link=#88AA55 vlink=#440000 alink=#FFFFFF leftmargin=30 topmargin=50 onLoad="makesnake()" style="width:100%; overflow-x:hidden; overflow-y:scroll">
<p align=right><a href="index.html">zurück zur Startseite</a></p>
<h1>Hier ist meine aktuelle Preisliste.</h1>
<p> Letzte Aktualisierung am 15.3.2016. </p>
<p>Als engagierter Hobbygärtner habe ich bei der Vermehrung für den eigenen Bedarf immer wieder Pflanzen übrig, die ich auf diesem Wege anderen Interessenten zugänglich machen möchte, zumal es sich oft um echte Raritäten handelt, die sonst nur unter Schwierigkeiten oder zu hohen Preisen zu bekommen sind. Natürlich habe ich nicht unbegrenzte Mengen von jeder Sorte und bitte deshalb um Verständnis, wenn ich das eine oder andere nicht liefern kann. Andererseits habe ich außerhalb dieser Liste noch etwa 800 andere Arten und Sorten (fast nur Steingartenpflanzen, so gut wie keine Prachtstauden), von denen ich einzelne Exemplare abgeben kann. Bitte rufen Sie mich (abends) an, wenn Sie irgend etwas suchen oder schicken Sie mir eine e- mail.
Es handelt sich um kleine 1-2jährige Jungpflanzen im Topf oder mit Ballen, auf jeden Fall gut bewurzelt, aber meist kleiner als aus der Gärtnerei gewohnt. </p>
<p> Im Hauptberuf bin ich übrigens Zahnarzt, verheiratat, 2 Kinder. Mein Garten liegt in Bonn, allerdings nicht im Rheintal, sondern in etwas weniger mildem Klima in 140m Höhe am Stadtrand.
</p>

<p>Sie können die Preisliste <a href="preisliste.xls" >  hier</a>&nbsp;als EXCEL-Datei downloaden und ausdrucken oder das Formular online ausfüllen und abschicken(Leider geht dies nicht mehr, wenn sie Windows NT oder XP als Betriebssystem haben. In diesem Fall bitte e-mail schicken.
Die Lieferung erfolgt per Postpaket. Leider sind nicht immer alle Pflanzen vorhanden. Die Portokosten werden in der tatsächlich angefallenen Höhe in Rechnung gestellt.</p>
   
<form action="mailto:rohlfs.bonn@freenet.de" method="post" enctype="text/plain">
<table>
<tr>
  <td>Name</td><td><input name="Name" size=60 maxlength=60></td>
</tr> 
<tr> 
  <td>Stra&szlig;e</td><td><input name="Strasse" size=60 maxlength=60></td>
</tr>
<tr>  
  <td>PLZ&nbsp;/&nbsp;Ort</td><td><input name="Postleitzahl/Ort" size=60 maxlength=60>
  </tr>
<tr> 
  <td>e-Mailadresse</td><td><input name="e-Mailadresse" size=60 maxlength=60></td>
</tr>
<tr> 
  <td>gewünschter Liefertermin</td><td><input name="Liefertermin" size=60 maxlength=60></td>
</tr>
<tr> 
<td valign=top>Besondere Wünsche</td><td><textarea name="Sonderwunsch" rows=5 cols=60 wrap=physical></textarea></td>
</tr> 
</table>  
<br>
<br>

  <table>
';

LINE:while ($line = <CSV>) 
{
  chop $line;  

  if($line =~ /;/) {
  }
  else {
    next LINE;
  }

  print HTML '  <tr>'."\n";
  
	@zeile = split (/;/,$line);
	
  $zeile[6] = '<input name="'.$zeile[0].'" size=2 maxlength=2>';
  $zeile[5] .= " Euro";
  if($zeile[0] =~ /^Art$/) { $zeile[5]="Preis"; $zeile[6]="Bestellung Anzahl"; }
  
	
  for($i=0; $i<=$#zeile; $i++) {
    print HTML '    <td>'."\n";
    print HTML '      '.@zeile[$i]."\n";
    print HTML '    </td>'."\n";
  }

  print HTML '  </tr>'."\n";
}

print HTML '</table>
<br>
<br>
  <input type=submit value="Absenden">
  <input type=reset value="Abbrechen">
</form>
<p><a href="index.html">zurück zur Startseite</a></p>
</body>
</html>
';

close(CSV);
close(HTML);