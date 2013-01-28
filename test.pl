#!/usr/bin/perl
use lib "../";

use Carp::Notify ("log_file" => \*STDOUT, "die_to_stdout" => 1, "email_it" => 0, 
		"death_message" => "If you're seeing this, then we exploded and notified properly and everything's A-OK.  Be sure to set your default variables in the module!\n\n");

notify ("A notification occurred.");

explode ("An explosion occurred.  Everything's a-ok.  :)");

