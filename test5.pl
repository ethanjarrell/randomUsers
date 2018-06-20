#!/usr/bin/perl
use DBI;
use strict;
use warnings;
use lib qw(..);
use JSON qw(  );
use Data::Dumper;

# declare a variable for the test txt file
my $ethnicity = 'randomUser/ethnicity.txt';
# connect to and open the json file
open (FH, "< $ethnicity") or die "Can't open $ethnicity for read: $!";
my @ethnicityLines;
while (<FH>) {
    push (@ethnicityLines, $_);
}
close FH or die "Cannot close $ethnicity: $!";

my @ethnicityList = ();
foreach my $x (@ethnicityLines) {
  my $str = $x;
@ethnicityList = split(',', $str);
}

# declare a variable for the test txt file
my $associate = 'randomUser/associateDegrees.txt';
# connect to and open the json file
open (FH, "< $associate") or die "Can't open $associate for read: $!";
my @associateLines;
while (<FH>) {
    push (@associateLines, $_);
}
close FH or die "Cannot close $associate: $!";

my @associateList = ();
foreach my $x (@associateLines) {
  my $str = $x;
@associateList = split(',', $str);
}

# declare a variable for the test txt file
my $bachelor = 'randomUser/bachelorsDegree.txt';
# connect to and open the json file
open (FH, "< $bachelor") or die "Can't open $bachelor for read: $!";
my @bachelorLines;
while (<FH>) {
    push (@bachelorLines, $_);
}
close FH or die "Cannot close $bachelor: $!";

my @bachelorList = ();
foreach my $x (@bachelorLines) {
  my $str = $x;
@bachelorList = split(',', $str);
}

# declare a variable for the test txt file
my $master = 'randomUser/mastersDegree.txt';
# connect to and open the json file
open (FH, "< $master") or die "Can't open $master for read: $!";
my @masterLines;
while (<FH>) {
    push (@masterLines, $_);
}
close FH or die "Cannot close $master: $!";

my @masterList = ();
foreach my $x (@masterLines) {
  my $str = $x;
@masterList = split(',', $str);
}

# declare a variable for the test txt file
my $hobbies = 'randomUser/hobbies.txt';
# connect to and open the json file
open (FH, "< $hobbies") or die "Can't open $hobbies for read: $!";
my @hobbieLines;
while (<FH>) {
    push (@hobbieLines, $_);
}
close FH or die "Cannot close $hobbies: $!";

my @hobbyList = ();
foreach my $x (@hobbieLines) {
  my $str = $x;
@hobbyList = split(',', $str);
}

# declare a variable for the test txt file
my $occupations = 'randomUser/occupations.txt';
# connect to and open the json file
open (FH, "< $occupations") or die "Can't open $occupations for read: $!";
my @occupationsLines;
while (<FH>) {
    push (@occupationsLines, $_);
}
close FH or die "Cannot close $occupations: $!";

my @occupationList = ();
foreach my $x (@occupationsLines) {
  my $str = $x;
@occupationList = split(',', $str);
}

# declare a variable for the test txt file
my $animals = 'randomUser/animals.txt';
# connect to and open the json file
open (FH, "< $animals") or die "Can't open $animals for read: $!";
my @animalsLines;
while (<FH>) {
    push (@animalsLines, $_);
}
close FH or die "Cannot close $animals: $!";

my @animalsList = ();
foreach my $x (@animalsLines) {
  my $str = $x;
@animalsList = split(',', $str);
}

# declare a variable for the test txt file
my $adjectives = 'randomUser/adjectives.txt';
# connect to and open the json file
open (FH, "< $adjectives") or die "Can't open $adjectives for read: $!";
my @adjectiveLines;
while (<FH>) {
    push (@adjectiveLines, $_);
}
close FH or die "Cannot close $adjectives: $!";

my @adjectiveList = ();
foreach my $x (@adjectiveLines) {
  my $str = $x;
@adjectiveList = split(',', $str);
}


# declare a variable for the test txt file
my $streetNames = 'randomUser/streetNames.txt';
# connect to and open the json file
open (FH, "< $streetNames") or die "Can't open $streetNames for read: $!";
my @streetLines;
while (<FH>) {
    push (@streetLines, $_);
}
close FH or die "Cannot close $streetNames: $!";

my @streetList = ();
foreach my $x (@streetLines) {
  my $str = $x;
@streetList = split(',', $str);
}

# declare a variable for the test txt file
my $maleNames = 'randomUser/maleNames.txt';
# connect to and open the json file
open (FH, "< $maleNames") or die "Can't open $maleNames for read: $!";
my @maleLines;
while (<FH>) {
    push (@maleLines, $_);
}
close FH or die "Cannot close $maleNames: $!";

my @maleList = ();
foreach my $x (@maleLines) {
  my $str = $x;
@maleList = split(',', $str);
}

# declare a variable for the test txt file
my $femaleNames = 'randomUser/femaleNames.txt';
# connect to and open the json file
open (FH, "< $femaleNames") or die "Can't open $femaleNames for read: $!";
my @femaleLines;
while (<FH>) {
    push (@femaleLines, $_);
}
close FH or die "Cannot close $femaleNames: $!";

my @femaleList = ();
foreach my $x (@femaleLines) {
  my $str = $x;
@femaleList = split(',', $str);
}

# declare a variable for the test txt file
my $cities = 'randomUser/city.txt';
# connect to and open the json file
open (FH, "< $cities") or die "Can't open $cities for read: $!";
my @cities;
while (<FH>) {
    push (@cities, $_);
}
close FH or die "Cannot close $cities: $!";

my @cityList = ();
foreach my $x (@cities) {
  my $str = $x;
@cityList = split(',', $str);
}

# declare a variable for the test txt file
my $states = 'randomUser/states.txt';
# connect to and open the json file
open (FH, "< $states") or die "Can't open $states for read: $!";
my @states;
while (<FH>) {
    push (@states, $_);
}
close FH or die "Cannot close $states: $!";

my @stateList = ();
foreach my $x (@states) {
  my $str = $x;
@stateList = split(',', $str);
}
my $n1 = int(rand(8)+1);
my $n2 = int(rand(9));
my $n3 = int(rand(9));
my $n4 = int(rand(9));
my $n5 = int(rand(9));
my $n6 = int(rand(9));
my $n7 = int(rand(9));
my $n8 = int(rand(9));
my $n9 = int(rand(9));
my $n10 = int(rand(9));

my $phoneNumber = "($n1$n2$n3) $n4$n5$n6-$n7$n8$n9$n10";

my $z1 = int(rand(8)+1);
my $z2 = int(rand(9));
my $z3 = int(rand(9));
my $z4 = int(rand(9));
my $z5 = int(rand(9));

my $zipcode = $z1 . $z2 . $z3 . $z4 . $z5;

my @emails = ("gmail", "hotmail", "protonmail", "yahoo", "aol");

my $index = rand @emails;
my $email = $emails[$index];

my $index2 = rand @adjectiveList;
my $adjective = $adjectiveList[$index2];

my $index3 = rand @animalsList;
my $myAnimal = $animalsList[$index3];

my $index4 = rand @occupationList;
my $job = $occupationList[$index4];

my $index5 = rand @hobbyList;
my $hobby1 = $hobbyList[$index5];

my $index6 = rand @hobbyList;
my $hobby2 = $hobbyList[$index6];

my $index7 = rand @hobbyList;
my $hobby3 = $hobbyList[$index7];

my $index9 = rand @ethnicityList;
my $ethnicBackground = $ethnicityList[$index9];

my $sN1 = int(rand(8)+1);
my $sN2 = int(rand(9));
my $sN3 = int(rand(9));
my $sN4 = int(rand(9));
my $sN5 = int(rand(9));

my $streetNumber = 0;
my $streetNumberLength = int(rand(5));
if ($streetNumberLength == 5){
  $streetNumber = $sN1 . $sN2 . $sN3 . $sN4 . $sN5;
}
if ($streetNumberLength == 4){
  $streetNumber = $sN1 . $sN2 . $sN3 . $sN4;
}
if ($streetNumberLength == 3){
  $streetNumber = $sN1 . $sN2 . $sN3;
}
if ($streetNumberLength == 2){
  $streetNumber = $sN1 . $sN2;
}
if ($streetNumberLength == 1){
  $streetNumber = $sN1;
}



my $male = @maleList;
my $female = @femaleList;
my $city = @cityList;
my $state = @stateList;
my $street = @streetList;

my $male_or_female = int(rand(2));
my $gender = "";
my @genderArr = ();
my @genderArr2 = ();

if($male_or_female == 0){
  @genderArr = @maleList;
  @genderArr2 = @femaleList;
  $gender = "male";
}else {
  @genderArr = @femaleList;
  @genderArr2 = @maleList;
  $gender = "female";
}

my @maleRange = (0..$male);
my @femaleRange = (0..$female);
my @cityRange = (0..$city);
my @stateRange = (0..$state);
my @streetRange = (0..$street);

my $random_name = int(rand(@maleRange));
my $random_spouse = int(rand(@femaleRange));
my $random_city = int(rand(@cityList));
my $random_state = int(rand(@stateList));
my $random_street = int(rand(@streetList));

my $name = $genderArr[$random_name];
my $spouse = $genderArr2[$random_spouse];
my $newCity = $cityList[$random_city];
my $newState = $stateList[$random_state];
my $newStreet = $streetList[$random_street];

my $marital = int(rand(2));
my $married = "";
if ($marital == 0){
  $married = "married";
}else{
  $married = "single";
  $spouse = "none";
}

my $kids = 0;
if ($married eq "married"){
  $kids = $kids + int(rand(8));
}

my @lastName = split(" ", $name);

my $emailAddress = "";
my $girlGuy  ="";
if ($gender eq "male"){
  $girlGuy = "guy";
}else {
  $girlGuy = "girl";
}
my $emailFormat = int(rand(5));
if ($emailFormat == 0){
$emailAddress = $lastName[0] . "." . $lastName[1] . $sN3 . $z2 . "@" . $email . ".com";
} elsif ($emailFormat == 1) {
  $emailAddress = $adjective . "_" . $myAnimal . $sN1 . "@" . $email . ".com";
} elsif ($emailFormat == 2) {
  $emailAddress = $adjective . "_" . $lastName[0] . $sN1 . "@" . $email . ".com";
} elsif ($emailFormat == 3) {
  $emailAddress = $newState . "_" . $girlGuy . $sN1 . $sN2 . $sN3 . "@" . $email . ".com";
} elsif ($emailFormat == 4) {
  $emailAddress = $adjective . "_" . $newCity . "_" . $girlGuy . $sN1 . $sN2 . $sN3 . "@" . $email . ".com";
}
$emailAddress =~ s/\s+//g;

my $substring = substr $job, 0, 5;

my @degrees = ();
foreach my $x (@bachelorList) {
  if (index($x, $substring) != -1) {
      push @degrees, $x;
  }
}

foreach my $x (@associateList) {
  if (index($x, $substring) != -1) {
      push @degrees, $x;
  }
}

foreach my $x (@masterList) {
  if (index($x, $substring) != -1) {
      push @degrees, $x;
  }
}

my $degree = "";

foreach my $x (@degrees) {
  $degree = $degree . ", " . $x;
}

if ($degree eq ""){
  my $index8 = rand @bachelorList;
  $degree = $bachelorList[$index8];
}

my $age = int(rand(50)+20);

my $numberOfDegrees = @degrees;
if ($numberOfDegrees == 2 ){
  $age = $age + 5;
}elsif ($numberOfDegrees > 2  ){
  $age = $age + 15;
}

my $birthYear = 2018 - $age;
my $birthMonth = int(rand(12)+1);
my $birthDay = int(rand(29)+1);
my @months = ("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December");


my $birthdayMonth = $months[$birthMonth];

my $birthDate = $birthdayMonth . " " . $birthDay . ", " . $birthYear;
if ($age > 65){
  $job = "retired $job";
}
my $multiplier2 = int(rand(9574));
my $multiplier = int(rand(11320) + $multiplier2);
my $studentLoanDebt = ($numberOfDegrees+1) * $multiplier;

if ($newState eq "Utah"){
$kids = $kids + int(rand(4));
}

my @jobList = ("Engi", "Judge", "Consul", "Compu", "Scie", "Info", "Anal", "Market", "market", "anal", "info", "scie", "compu", "engi", "econo", "Econo", "thera", "Thera", "Astro", "astro", "Bio", "bio", "manag", "Manag", "Dent", "dent", "Doct", "doct", "polit", "Polit", "gist", "Medic", "medic", "Admin", "admin", "data", "Data");
my $annualSalary = int(rand(38000)+15000);
if ($numberOfDegrees >= 2) {
  $annualSalary = $annualSalary + int(rand(60000)+20000);
}
my $numberOfMatches = 0;
foreach my $x (@jobList) {
  if (index($job, $x) != -1) {
    $numberOfMatches = $numberOfMatches + 1;
    $annualSalary = $annualSalary + int(rand(20000));
  }
}

my $json = {NAME=>$name, AGE=>$age, STUDENT_LOAN_DEBT=>'$' . $studentLoanDebt . '.00', ANNUAL_SALARY=>'$' . $annualSalary . '.00', CHILDREN=>$kids, BIRTHDAY=>$birthDate, GENDER=>$gender, MARITAL_STATUS=>$married, SPOUSE=>$spouse, ADDRESS=>$streetNumber . " " . $newStreet . ", " . $newCity . ", " . $newState . " " . $zipcode, PHONE=>$phoneNumber, EMAIL=>$emailAddress, OCCUPATION=>$job, HOBBIES=>$hobby1 . ", " . $hobby2 . ", " . $hobby3, EDUCATION=>$degree, ETHNICITY=>$ethnicBackground};

print Dumper $json;
