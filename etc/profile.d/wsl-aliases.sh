#!/bin/bash
###################################################################################
#                                                                                 #
#                 file /etc/profile.d/wsl-aliasese.sh                             #
# must be chmod +x  /etc/profile.d/wsl-aliasese.sh                                #
#                                                                                 #
###################################################################################


###################################################################################
#create a alias for all the windows volume mounted                               ##
###################################################################################

touch ~/.mount_aliases
chmod +x ~/.mount_aliases
echo #!/bin/bash > ~/.mount_aliases

#  create alias like that --> alias c='cd /mnt/c'
#mount | column -t | grep -e mnt  | awk '{print $1 " " $3}' | sed 's/\:\\//g'| awk '{print "alias "  tolower($1) "=\047cd "$2 "\047"}' | grep -v wsl >> ~/.mount_aliases
#  create alias like that --> alias c:='cd /mnt/c'
mount | column -t | grep -e mnt  | awk '{print $1 " " $3}' | sed 's/\:\\//g'| awk '{print "alias "  tolower($1) ":=\047cd "$2 "\047"}' | grep -v wsl >> ~/.mount_aliases
#  create alias like that --> alias C='cd /mnt/c'
#mount | column -t | grep -e mnt  | awk '{print $1 " " $3}' | sed 's/\:\\//g'| awk '{print "alias "  $1 "=\047cd "$2 "\047"}' | grep -v wsl >> ~/.mount_aliases
#  create alias like that --> alias C:='cd /mnt/c'
mount | column -t | grep -e mnt  | awk '{print $1 " " $3}' | sed 's/\:\\//g'| awk '{print "alias "  $1 ":=\047cd "$2 "\047"}' | grep -v wsl >> ~/.mount_aliases
#  excute the alias file

. ~/.mount_aliases



