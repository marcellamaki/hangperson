def build_hangperson(strikes)
    if @strikes == 0
    print " _________     \n";
        print "|         |     \n";
        print "|              \n";
        print "|              \n";
        print "|              \n";
        print "|              \n";
        print "|              \n";
    elsif @strikes == 1
      print " _________     \n";
        print "|         |    \n";
        print "|         0    \n";
        print "|              \n";
        print "|              \n";
        print "|              \n";
        print "|              \n";
     elsif @strikes == 2
        print " _________     \n";
        print "|         |    \n";
        print "|         0    \n";
        print "|         |    \n";
        print "|              \n";
        print "|              \n";
        print "|              \n";
     elsif @strikes == 3
        print " _________     \n";
        print "|         |    \n";
        print "|         0    \n";
        print "|        /|    \n";
        print "|              \n";
        print "|              \n";
        print "|              \n";
    elsif @strikes == 4
        print " _________     \n";
        print "|         |    \n";
        print "|         0    \n";
        print "|        /|\\  \n";
        print "|              \n";
        print "|              \n";
        print "|              \n";
    elsif @strikes == 5
        print " _________     \n";
        print "|         |    \n";
        print "|         0    \n";
        print "|        /|\\  \n";
        print "|        /     \n";
        print "|              \n";
        print "|              \n";
    else @strikes == 6
      print " _________     \n";
        print "|         |    \n";
        print "|         0    \n";
        print "|        /|\\  \n";
        print "|        / \\  \n";
        print "|              \n";
        print "|              \n";
    end
end