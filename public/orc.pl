#!/usr/bin/perl
#
# Pass a HTML page through the ork-speak filter routine. This script
# is fairly primitive and I suspect that it doesn't handle unusual
# or mangled HTML formats very well.
#
# Revision History (latest first):
# -------------------------------------------------------------------
# 2016-09-13  antonkomarev Added JSON response support & moved lib.
# 2002-03-01  RJHall  Initial version.

require 5.000;
require orklib;

use Cwd qw(abs_path);
use FindBin;
use lib abs_path("$FindBin::Bin/../lib");
use JSON;

# Modify the HTML-formatted string

sub modify_HTML
{
  my( $LINE, $RSTATE ) = @_;
  my( $MODLINE, $LAST, $COMPONENT, $CHR );

  ### Initialization
  $MODLINE="";
  $LAST=1;

  # Process the HTML_formatted string
  while ( $LINE =~ m/[<">]/g ) {
    ### Obtain text component and the following character
    $COMPONENT = substr( $LINE, $LAST - 1, pos( $LINE ) - $LAST );
    $CHR = substr( $LINE, pos( $LINE ) - 1, 1 );

    ### Check for normal text that is not all white space
    if ( ( $$RSTATE == 0 ) && ( $COMPONENT =~ /\S/ ) ) {
      # Run the non-HTML text through the filter
      $MODLINE .= orklib::ork_speak( $COMPONENT );
    } else {
      $MODLINE .= $COMPONENT;
    }
    $MODLINE .= $CHR;

    ### Change state based on the special character
    if ( $CHR eq "<" ) {
      $$RSTATE=1 if ( $$RSTATE == 0 );
    } elsif ( $CHR eq ">" ) {
      $$RSTATE=0 if ( $$RSTATE == 1 );
    } elsif ( $CHR eq "\"" ) {
      if ( $$RSTATE == 1 ) {
        $$RSTATE=2;
      } elsif ( $$RSTATE == 2 ) {
        $$RSTATE=1;
      }
    }

    ### Store the position
    $LAST=pos( $LINE ) + 1;
  }

  ### Add the final segment
  if ( $LAST < length( $LINE ) ) {
    $COMPONENT = substr( $LINE, $LAST-1, length( $LINE )-$LAST+1 );
    if ( ( $$RSTATE == 0 ) && ( $COMPONENT =~ /\S/ ) ) {
      # Run the non-HTML text through the filter
      $MODLINE .= orklib::ork_speak( $COMPONENT );
    } else {
      $MODLINE .= $COMPONENT;
    }
  }

  ### Return the modified string
  return $MODLINE;
}

my( $BUFFER, $PAIR, $MESSAGE, $I, $STATE, $CONTENT, $LINE );
my( @PAIRS, @LINES, @NEWLINES );

# Get the input
read( STDIN, $BUFFER, $ENV{'CONTENT_LENGTH'} );

# Convert message into array of strings
@PAIRS = split( /&/, $BUFFER );
foreach $ENTRY ( @PAIRS ) {
  if ( $ENTRY =~ /message=/ ) {
    $ENTRY=~s/message=//;
    $ENTRY=~s/\+/ /g;
    $ENTRY=~s/%([a-fA-F0-9][a-fA-F0-9])/pack( "C", hex($1) )/ge;
    @LINES = split( /\n/, $ENTRY );
    break;
  }
}

# Initialization
$STATE=0;
$CONTENT=0;

$OUTPUT = '';
# Filter each of the lines
for ( $I=0; $I<=$#LINES; $I++ ) {
  # Convert the HTML-formatted string
  $LINE=&modify_HTML( $LINES[$I], \$STATE );
  $OUTPUT .= $LINE . "\n";
}

my %rec_hash = ('result' => $OUTPUT);
my $json = encode_json \%rec_hash;

# Initialize the output
print "Content-type: text/json\n\n";
print "$json";

exit;
