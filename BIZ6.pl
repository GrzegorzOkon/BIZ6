#################################################################
# Autor: Grzegorz Okoń - główny programista
#
# Sprawdzanie ilości dokumentów spływających z BizTalk.
#
# Przykład formatu użytego w logu:
# od_godz     do_godz     dzien_biez_m_ca ilosc_dokument˘w_v2 
# ----------- ----------- --------------- ------------------- 
#          13          14              24                   7 
#################################################################

use strict;
use warnings;

my $console = $ARGV[0];
my @bats = ('incoming_xxx.bat');
my $bat = '';
my $flag = 0;

open (QUANTITY_ETIQUETTE, ">BIZ6.txt") || die "nie moge utworzyc pliku";

foreach $bat (@bats) {
   $flag = 0;
   open (INPUT_FILE,"$bat|");
   while (<INPUT_FILE>) {
      $flag += 1; 
      if ($flag > 2 && $flag < 8) {		 
		 open (QUANTITY_ETIQUETTE, ">>BIZ6.txt") || die "nie moge zapisac do pliku";
         print QUANTITY_ETIQUETTE $_;
		 if (defined $console) {
            open (QUANTITY_ETIQUETTE, ">&STDOUT") || die "nie moge utworzyc polaczenia do konsoli";
            print QUANTITY_ETIQUETTE $_;
         }
      }
   }
}

close INPUT_FILE;

format QUANTITY_ETIQUETTE =
.