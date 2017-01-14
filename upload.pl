use Net::FTP;

$Host="home.arcor.de";
$UserId='rohlfs.bonn';
$Pwd="renatero";
$localDir='c:\Homepageneu';

print "\nDieses Skript lädt die Dateien der Pflanzenhomepage auf den ftp-Server.\n";
print "Server: $Host\n";
print "User: $UserId\n";
print "lokales Verzeichnis: $localDir\n\n";
print "Drücken Sie Return um fortzufahren oder STRG-C um abzubrechen.\n\n";
<STDIN>;

print "Connecting to $Host...\n";
if($ftp=Net::FTP->new($Host, Debug => 2, Timeout => 20, Passive => 1))
{
	print "Successfully connected to $Host.\n";
	if($ftp->login($UserId ,$Pwd))
	{
		print "Logged in as $UserId.\n";
	}
	else { print "NO CONNECTION!\n"; exit(0);	}
}
else { print "NO FTP-OBJECT! YOU ARE EITHER NOT ONLINE OR THE SERVER IS DOWN.\n"; exit(0); }

	if(chdir($localDir))
	{
		if($ftp->binary())
		{
			print "Mode changed to BINARY.\n";
			system 'dir /B c:\Homepageneu > c:\Homepageneu\dir.txt';
			open(DIR,'c:\Homepageneu\dir.txt') or die "Cannot open dir.txt!\n";
			
			LINE: while($file=<DIR>)
			{
				chomp $file;
                                $ftp->put($file)
                                	or die "transfer failed: ", $ftp->message;
				print "transferred $file\n";
			}
			close(DIR);
			$ftp->quit;
			print "\nLogged out successfully.\n";
		}
		else { print "COULD NOT CHANGE TO BINARY MODE!\n"; exit(0);	}
	}
	else { print "COULD NOT CHANGE DIRECTORY TO C:\\HOMEPAGENEU!\n";exit(0);	}
