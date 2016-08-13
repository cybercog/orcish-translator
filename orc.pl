#!/usr/local/bin/perl
#
# Pass a HTML page through the ork-speak filter routine. This script
# is fairly primitive and I suspect that it doesn't handle unusual
# or mangled HTML formats very well.
#
# Revision History (latest first):
# -------------------------------------------------------------------
# 01mar02  RJHall  Initial version.

require 5.000;
require orklib;

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

# Initialize the output
print "Content-type: text/html\n\n";
print "<HTML>\n<HEAD>\n<TITLE>Ork Translation</TITLE>\n</HEAD>\n\n";
print "<BODY BGCOLOR=\"\#006600\">\n";
print "<BR><BR><P><TABLE BORDER=0 WIDTH=\"90%\" CELLPADDING=16 ALIGN=center>\n";
print "<TR><TD BGCOLOR=\"white\">\n<CENTER>\n";
print "<IMG SRC=\"http://hiddenway.tripod.com/images/titles/waaagh.gif\" ";
print "WIDTH=336 HEIGHT=72>\n</CENTER><HR NOSHADE SIZE=1>\n";

# Filter each of the lines
for ( $I=0; $I<=$#LINES; $I++ ) {
  # Convert the HTML-formatted string
  $LINE=&modify_HTML( $LINES[$I], \$STATE );

  # Write to standard output
  print "$LINE<BR>\n";
}

print "</TD></TR></TABLE>\n";
print "</BODY>\n</HTML>\n";

exit;
