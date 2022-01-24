## Homework 1##

##change directory
cd ~
cd Onedrive/School/MATH_3190

#######Question 1#######

## a tarball is a system of combined files
# a .zip file compresses the files as well


##unzip contents
tar xvf HW1.tar.gz

##how effective is it?
  ##the uncompressed file is about 3-4 times larger than the compressed file


######Question 2########

cd HW1
##dowload baskebtall data and add to current directory
curl -O https://kenpom.com/cbbga22.txt



########Question 3##########

##the chmod function lets you change the access modes of files between three types of people (user, group, other) and
##three classes of permission (read, write, execute)


##change the permissions of the TB_microbiomes_data.txt
chmod g+r TB_microbiome_data.txt
ls -l


######Question 4######

#a
grep -c 'Southern Utah' cbbga22.txt

#b
grep -cv 'Southern Utah' cbbga22.txt

#c
egrep -n 'Southern Utah.*Dixie St.' cbbga22.txt

#d
egrep -c 'coronavirus' viral.fasta

#e
egrep -c "A|a" *

#f
grep -c 'Staphylococcus' TB_microbiome_data.txt
grep -c 'Mycobacterium tuberculosis' TB_microbiome_data.txt
grep -c 'Streptococcus' TB_microbiome_data.txt


########Question 5########

##displays line numbers
#less -N viral.fasta

##opens at the first occurence of coronavirus
less -Np "coronavirus" viral.fasta

##scroll n lines
less viral.fasta


##less may be advantageous over word when the file is larger


#######Question 6####### 


#:q to quit without saving
#:w is used to save
#press v to enter visual mode select text with cursor
#y is used to copy
#d is used to cut
#p is used to paste
vim cbbga22.txt

##vim allows you to edit where less does not
#it would be best to use less when you do not want to edit somehitng end vim when you do


######Quesstion 7######

#a

#shows current directory contents
ls -l

#shows current file
less

#b)creates a text file of the contents of the directory
ls -l > directory_contents.txt

#c) adds directory contents to existing 
ls -l >> directory_contents.txt

#d) prints the output of a file onto the screen
cat directory_contents.txt

#e) counts how many files are html in current direcotry
ls | grep -c html

#f)counts the number of words of files
ls | wc -l

#g) combines file1 and file2 into file3 and writes to a text file
cat file1.txt file2.txt > file3.txt


########Question 8#########

## history N is a useful command that will dsiplay the last N commands in case something goes wrong
history 10


#########Question 9#########
cd ..
cd github/my.package

##add name as an author
vim description

##add multiplication to package
vim my.package.Rproj

cd ..


cp ~  multiply.R github/my.package/R/


##push change to github
cd github/my.package

git add R
git add DESCRIPTION

git status

git commit -m "James Clark"

git push


