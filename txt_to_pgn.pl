open (A, "/source/metal-repo/chess//flashcards/chess_strategy.txt");
$j = 1;
$i = 0;
$fen = "";
$move = "";
$tomove = "";
@players = ();
$result = "";
while(<A>) {
    chomp($_);
    if ($i == 2) {
	print "[Event \"Game $j\"]\n";
	if ($tomove eq 'w') {
	    $move = "1.$move";
	    @players = ('Player', 'Opponent');
	    $result = "1-0";
	} else {
	    $move = "1...$move";
	    @players = ('Opponent', 'Player');
	    $result = "0-1";
	}
	print "[White \"".$players[0]."\"]\n";
	print "[Black \"".$players[1]."\"]\n";
	print "[Result \"$result\"]\n";
	print "[FEN \"$fen\"]\n\n";
	print $move . " {$_} $result\n\n";

	$fen = $tomove = $result = "";
	@players = ();
	$i = 0;
    }
    if ($i == 1) {
	$move = $_;
	$i = 2;
    }
    if ($_ =~ /.*?\/.*?\/.*?\/.*?\//) {
	$fen = $_;
	$fen =~ / ([wb])/;
	$tomove = $1;
	$i = 1;
    }

    
}

close(A);
