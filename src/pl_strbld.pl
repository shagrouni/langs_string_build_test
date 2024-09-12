use strict;
use warnings;
use Time::HiRes qw(gettimeofday tv_interval);
use File::Slurp;

sub test {
    my ($num) = @_;
    
    print "  Perl";
    my $start_time = [gettimeofday];
    $num += 1;
    my $output = '';

    for my $i (1 .. $num - 1) {
        $output .= " P $i";
    }

    my $elapsed_time = tv_interval($start_time);
    my $minutes = int($elapsed_time / 60);
    my $seconds = int($elapsed_time % 60);
    my $milliseconds = int(($elapsed_time - int($elapsed_time)) * 1000);

    print "  $minutes:$seconds:$milliseconds Iter $num Len " . length($output) . " \n";
    
    my $file_path = 'out/perl_output.txt';
    
    eval {
        write_file($file_path, $output);
    };
    if ($@) {
        print "Error saving string to file: $@\n";
    }
}

my $arg = shift @ARGV;
my $num = int($arg);
test($num);