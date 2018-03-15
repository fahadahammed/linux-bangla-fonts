#!/bin/bash
#-------------------------------
#	Created By Fahad Ahammed
#
#	Get me by email@fahadahammed.com or obak.krondon@gmail.com if you want to ...
#-------------------------------

# Variables
downloadUrls=("http://www.fahadahammed.com/extras/fonts/archieve/lsaBanglaFonts.tar.gz" "https://raw.githubusercontent.com/fahadahammed/linux-bangla-fonts/master/archieve/lsaBanglaFonts.tar.gz")
finalurl="" # it will select lowest latency mirror


# If need Index of Anything
indexof()
{
    local word
    local item
    local idx

    word=$1
    shift
    item=$(printf '%s\n' "$@" | fgrep -nx "$word")
    let idx=${item%%:*}-1
    echo $idx
}





# Get arrays of latency and plain urls.
point=()
pointPlus=()

for i in ${downloadUrls[@]};do 
  a=$(echo $i | sed 's|http://||g' | sed 's|https://||g' | cut -d '/' -f -1)
  aa=$(ping -c 5 "$a" | tail -1 | awk '{print $4}' | cut -d '/' -f 2)
  aaa=${aa%.*}
  urls+=("$aa,$a")
done



# Calculate Minimum Latency
#---------------------------
max=${point[0]}
min=${point[0]}

# Loop through all elements in the array
for i in "${point[@]}"
do
    # Update max if applicable
    if [[ "$i" -gt "$max" ]]; then
        max="$i"
    fi

    # Update min if applicable
    if [[ "$i" -lt "$min" ]]; then
        min="$i"
    fi

done


# Get low latency mirror
for i in ${pointPlus[@]};do
  if grep -q $min <<<$i; then
      a=$(echo $i | cut -d ',' -f 2)
      if grep -q $a <<<$downloadUrls;then
        finalurl=$downloadUrls
      fi
  fi
done





if [ $USER = "root" ]; then
  fontsDir="/root/.fonts/lsaBanglaFonts"
fi
if [ $USER != "root" ]; then
  fontsDir="/home/$USER/.fonts/lsaBanglaFonts"
fi


echo "Welcome to http://fahadahammed.com !!!"
echo "------------------------------------"
echo "Now starting to download and install all bangla fonts..........."
echo "------------------------------------"

echo -e "\n"

if [ ! -d "$fontsDir" ]; then
  mkdir -p $fontsDir
else
  echo -e "Upgrading bangla fonts provided by us....\n";
  rm -r $fontsDir;
fi

echo -e "\n"
echo -e "Downloading the fonts compressed file....\n"
echo -e "\n"

wget -v -P $fontsDir"/" $finalurl

cd $fontsDir"/"
tar -zxvf lsaBanglaFonts.tar.gz
rm lsaBanglaFonts.tar.gz

cd

echo -e "\n"
echo -e "Initiating font refresh......\n"
fc-cache -f -v
echo -e "\n"

echo "------------------------------------"
echo "Download and Installation Complete !!!"
echo -e "Script is Created by Fahad Ahammed\n"
echo -e "Website: http://fahadahammed.com\n"