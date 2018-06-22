#!/usr/bin/perl
use strict;
use warnings;
use feature qw{ say };

use Time::Piece;
use JSON qw( encode_json );


sub load_file {
    my ($filename) = @_;
    open my $fh, '<', $filename
        or die "Can't open $filename for read: $!";
    my @list;
    while (my $religion_line = <$fh>) {
        chomp $religion_line;
        push @list, split /,/, $religion_line;
    }
    return @list
}


my @religion_list   = load_file('religion.txt');
my @ethnicity_list  = load_file('ethnicity.txt');
my @associate_list  = load_file('associateDegrees.txt');
my @bachelor_list   = load_file('bachelorsDegree.txt');
my @master_list     = load_file('mastersDegree.txt');
my @university_list = load_file('university.txt');
my @hobby_list      = load_file('hobbies.txt');
my @occupation_list = load_file('occupations.txt');
my @animals_list    = load_file('animals.txt');
my @adjective_list  = load_file('adjectives.txt');
my @street_list     = load_file('streetNames.txt');
my @male_list       = load_file('maleNames.txt');
my @female_list     = load_file('femaleNames.txt');
my @city_list       = load_file('city.txt');
my @state_list      = load_file('states.txt');

my @digits = (1 + int rand 9);
push @digits, int rand 10 for 2 .. 10;
my $phone_number = sprintf '(%d%d%d) %d%d%d-%d%d%d%d', @digits;
my $zipcode = join "", 1 + int rand 9, map int rand 10, 2 .. 5;

my @emails = qw( gmail hotmail protonmail yahoo aol );

my $email             = $emails[ rand @emails ];
my $adjective         = $adjective_list[ rand @adjective_list ];
my $animal            = $animals_list[ rand @animals_list ];
my $job               = $occupation_list[ rand @occupation_list ];
my $hobby1            = $hobby_list[ rand @hobby_list ];
my $hobby2            = $hobby_list[ rand @hobby_list ];
my $hobby3            = $hobby_list[ rand @hobby_list ];
my $ethnic_background = $ethnicity_list[ rand @ethnicity_list ];
my $religion          = $religion_list[ rand @religion_list ];

my $street_number = 1 + int rand 9999;

my $gender = qw( male female )[ my $gender_index = int rand 2 ];
my @name_lists = (\@male_list, \@female_list);
my $name = $name_lists[$gender_index][ rand @{ $name_lists[$gender_index] } ];
my $spouse = $name_lists[ ! $gender_index ][ rand @{ $name_lists[ ! $gender_index ] } ];

my $city = $city_list[ rand @city_list ];
my $state = $state_list[ rand @state_list ];
my $street = $street_list[ rand @street_list ];

my @university_choices = grep { -1 != index $_, $state } @university_list;
my $instate = int rand 4;
my $school;
if (@university_choices && $instate < 3) {
    $school = $university_choices[ rand @university_choices ];
} else {
    $school = $university_list[ rand @university_list ];
}

my $married = qw( single married )[ rand 2 ];
$spouse = 'none' if $married eq 'single';
my $kids = $married eq 'married' ? int rand 8 : 0;
$kids = $kids + int rand 4 if $state eq 'Utah';

my @names = split / /, $name;

my $who = { male => 'guy', female => 'girl' }->{$gender};
( my $email_address = ("$names[0].$names[1]" . (10 + int rand 90),
                       "${adjective}_$animal" . int(rand 10),
                       "${adjective}_$names[0]" . int(rand 10),
                       "${state}_$who" . (100 + int rand 900),
                       "${adjective}_${city}_$who" . (100 + int rand 900),
                      )[ rand 5 ] . "\@$email.com"
) =~ s/\s+//g;

my @degrees = grep {
    -1 != index $_, substr $job, 0, 5
} @bachelor_list, @associate_list, @master_list;
my $degree = join ', ', @degrees;
my $student_loan_debt = 0;
my $highest_level_of_education = $degrees[-1];
if ($degree eq "") {
    my $education = (
        [ $associate_list[@associate_list], 'Associates Degree', int rand 3000, $school ],
        [ 'High School Diploma', 'High School Diploma', 0, "$city High School" ],
        [ 'High School Diploma', 'Some College', int rand 2500, "$state community college" ],
    )[ rand 3 ];

    ($degree, $highest_level_of_education, $student_loan_debt, $school) = @$education;
}

my $age = @degrees * 5 + 20 + int rand 50;

my $birth_year = localtime->year - $age;
my $birth_day = 1 + int rand 29;
my $birth_month = qw( January February March April May June July August September October November December )[ rand 12 ];

my $birth_date = join ' ', $birth_month, $birth_day, $birth_year;
substr $job, 0, 0, 'retired ' if $age > 65;


my @job_list = 
my $annual_salary = 15_000 + int rand 38_000;
$annual_salary += 20_000 + int rand 60_000 if @degrees >= 2;

my $matches = 0;
for my $nice_job (qw(
    Engi Judge Consul Compu Scie Info Anal Market market anal info
    scie compu engi econo Econo thera Thera Astro astro Bio bio manag
    Manag Dent dent Doct doct polit Polit gist Medic medic Admin admin
    data Data Mist mist
)) {
    if (-1 != index $job, $nice_job) {
        ++$matches;
        $annual_salary += int rand 20_000;
        $highest_level_of_education = 'Masters Degree';
        $school = $master_list[ rand @master_list ];
    }
}

############################# --- Physical Appearance -- ###############################


my ($hair_color, $skin_color, $height, $body_type, $weight, $eye_color);
if ($ethnic_background =~ /Brazilian|African|Jew|Hispanic|Angolan|Asian|Chinese|
                           Cuban|Portuguese|Italian|Pakistani|Maori|Filipino/x
) {
    $hair_color = ('Brown', 'Dark Brown', 'Black')[ rand 4 ];
    $eye_color  = ('Brown', 'Dark Brown', 'Black', 'Hazel', 'Green' )[ rand 5 ];
}
if ($ethnic_background =~ /Brazilian|African|Maori/) {
    $skin_color = ('Brown', 'Dark Brown', 'Light Brown', 'Black')[ int rand 4 ];
}
if ($ethnic_background =~ /Filipino|Jew|Hispanic|Angolan|Asian|Chinese|Cuban|Portuguese|Italian|Pakistani/) {
    $skin_color = ("Brown", "Light Brown", "Tan", "Golden Brown", "Caramel")[ rand 6 ];
}

if ("$hobby1 $hobby2 $hobby3" =~ /Body|Boat|Sport|Basket|Ball|Golf|Outdoor|Hik|Body|Beach|BMX|Weight|Bik|Surf/) {
    $body_type = ("Muscular", "Athletic", "Fit", "Toned", "Average", "Thin", "Chubby")[ rand 7 ];
}

$skin_color = ("Brown", "Light Brown", "Tan", "Golden", "Caramel", "Light Skin",
               "White", "Pink", "Dark", "Black")[ rand 10 ]
    unless $skin_color;

$eye_color = ("Blue", "Green", "Hazel", "Brown", "Black")[ rand 5 ]
    unless $eye_color;

$hair_color = ("White", "Gray", "Black", "Brown", "Red", "Blonde", "Sandy",
               "Light Brown", "Dark Brown", "Silver", "Sandy Blonde", "Sandy Brown",
               "Ginger", "Brown with Highlights")[ rand 14 ]
    unless $hair_color;

$body_type = ("Fat", "Overweight", "Chubby", "Heavy-Set", "Big Boned", "Thick", "Muscular",
              "Fit", "Toned", "Average", "Thin", "Skinny", "Athletic")[ int rand 13 ]
    unless $weight;

my $feet = 4 + int rand 4;
my $inches = int rand 12;
my $tens = 10 + int rand 50;
my $hundreds = { 4 => 1, 5 => 1, 6 => 2, 7 => 3 }->{$feet};

my %corrections = (
    5 => {
        Muscular    => [ 1, 75 ],
        Fat         => [ 2, 75 ],
        Chubby      => [ 1, 90 ],
        'Heavy-Set' => [ 2, 25 ],
        Overweight  => [ 2, 25 ] },
    6 => {
        Muscular    => [ 3, 75 ],
        Fat         => [ 3, 75 ],
        Chubby      => [ 3, 90 ],
        'Heavy-Set' => [ 3, 25 ],
        Overweight  => [ 3, 25 ] },
    7 => {
        Muscular    => [ 4, 75 ],
        Fat         => [ 4, 75 ],
        Chubby      => [ 4, 90 ],
        'Heavy-Set' => [ 4, 25 ],
        Overweight  => [ 4, 25 ] }
);

if (my $corr = $corrections{$feet}{$body_type}) {
    ($hundreds, $tens) = ($corr->[0], 10 + int rand $corr->[1]);
}

my $final_weight = "$hundreds$tens lbs";
my $final_height = "$feet feet $inches inches";

my $struct = {
    NAME                       => $name,
    WEIGHT                     => $final_weight,
    HEIGHT                     => $final_height,
    EYE_COLOR                  => $eye_color,
    BODY_TYPE                  => $body_type,
    HAIR_COLOR                 => $hair_color,
    SKIN_COLOR                 => $skin_color,
    RELIGION                   => $religion,
    SCHOOL                     => $school,
    HIGHEST_LEVEL_OF_EDUCATION => $highest_level_of_education,
    AGE                        => $age,
    STUDENT_LOAN_DEBT          => '$' . $student_loan_debt . '.00',
    ANNUAL_SALARY              => '$' . $annual_salary . '.00',
    CHILDREN                   => $kids,
    BIRTHDAY                   => $birth_date,
    GENDER                     => $gender,
    MARITAL_STATUS             => $married,
    SPOUSE                     => $spouse,
    ADDRESS                    => "$street_number $street, $city, $state $zipcode",
    PHONE                      => $phone_number,
    EMAIL                      => $email_address,
    OCCUPATION                 => $job,
    HOBBIES                    => "$hobby1, $hobby2, $hobby3",
    DEGREE                     => $degree,
    ETHNICITY                  => $ethnic_background
};

say encode_json($struct);

