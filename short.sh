b="\033[34;1m"

p="\033[39;1m"

k="\033[33;1m"

m="\033[31;1m"

h="\033[32;1m"

c="\033[35;1m"

pu="\033[36;1m"

x="\033[30;1m"

o="\033[0m"

clear

echo " install bahan dulu sob"

sleep 1

pkg install pv

clear

echo " install selesai.."

sleep 1

clear

function check(){

if [ -z $(command -v curl) ];then

printf "${p}[${m}!${p}]${m}curl belum di install!!\n"

printf "${p}[${m}!${p}]${h}pkg install curl\n"

printf "${p}[${m}!${p}]${m}Silahkan Install dulu\n"

exit

fi

}

check

function sec(){

printf "\b${p}[${h}•${p}] Second!${h}...    ${p}"

for w in {3..0};do

get=$(printf "\b${w}")

printf "\b\b\b((${h}${get}${p})"

sleep 1

done

}

function sec1(){

printf "\n\b${p}[${h}•${p}]Proses Minning${h}...    ${p}"

for w in {3..0};do

get=$(printf "\b${w}")

printf "\b\b\b((${h}${get}${p})"

sleep 1

done

}

function banner(){

clear

printf "\t              ${x}Version${m}: ${p}0.1 *_*\n" | pv -qL 100

printf "\t${b}______________________________\n" | pv -qL 100

printf "\t      ${p}Author${m}: ${c}Noiz ID\n" | pv -qL 100

printf "\t ${p}Tools${m}: ${h}SHORTLINK ${m}| ${p}Bitly.com\n" pv -qL 100

printf "\t  ${p} Telegram${m}: ${c}@n0izID\n" | pv -qL 100

printf "\t${b}______________________________\n" | pv -qL 100

printf "\t ${x}[21-04-20] ${m}| ${x}©Copyright_2020\n\n\n" | pv -qL 100

}

banner

function short(){

printf "${c}_________________________\n\n"

printf "${p}[${h}•${p}] URL WEBSITE${m}: ${h}" wal

read url;

printf "${c}_________________________\n"

if [[ ${url:0:7} =~ "http://" ]];then

url="https://${url:7:10000}"

elif [[ ${url:0:8} =~ "https://" ]];then

url="https://${url:8:10000}"

elif [[ ${url:0:100000} =~ ".com" ]];then

url="${url:0:100000}"

else

printf "${p}[${m}!${p}] ${k}Invalid URL ${m}!!\n\n"

exit 1

fi

host=$(curl \

-s \

"https://pastelink.net/1iriu" \

-d "password=12345&submitbtn=Enter" | \

grep \

-Eo \

"pre-line.*" | \

cut \

-d \

">" \

-f2 \

| \

cut \

-d \

"<" \

-f1)

v=$(curl \

-s \

-i \

"${host}" \

-L \

| \

grep \

-Eo \

"_xs.*" | \

cut \

-d \

";" \

-f1 | \

cut \

-d \

"=" \

-f2)

a=$(curl \

-s \

-i \

"${host}" \

-L \

| \

grep \

-Eo \

"anon.*" \

| \

cut \

-d \

";" \

-f1)

get=$(curl \

-s \

-X \

POST \

-H "accept:application/json, text/javascript, */*; q=0.01" \

-H "sec-fetch-dest:empty" \

-H "x-requested-with:XMLHttpRequest" \

-H "content-type:application/x-www-form-urlencoded; charset=UTF-8" \

-H "sec-fetch-site:same-origin" \

-H "sec-fetch-mode:cors" \

-H "x-xsrftoken:${v}" \

-H "user-agent:Mozilla/5.0 (Linux; Android 9; Redmi 6A) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.162 Mobile Safari/537.36" \

-H "cookie:_ga=GA1.2.1013702271.1587107486" \

-H "cookie:wow-modal-id-2=yes" \

-H "cookie:_gid=GA1.2.1565357338.1587427733" \

-H "cookie:_xsrf=${v}" \

-H "cookie:_mkto_trk=id:754-KBJ-733&token:_mch-bitly.com-1587107485958-63611" \

-H "cookie:anon_u=cHN1X185ZTgyYmNhYy1jYWMwLTQ2Y2MtOGRlMy1mOTkyMDAzNDRmN2Y=|1587107481|b427c58045f2a47b5ea3078a0fd163f803289c39" \

-d "url=${url}" "https://bitly.com/data/shorten")

sux=$(echo \

-e \

"${get}" | \

grep \

-Eo \

"200" | \

wc \

-l)

ok=$(echo \

-e \

"${get}" \

| \

tr \

'"' \

"\n" \

| \

sed \

-n \

"18p")

fal=$(echo \

-e \

"${get}" \

| \

grep \

-Eo \

"200" \

| \

wc \

-l)

if [[ ${fal} =~ "0" ]];then

printf "${p}[${m}!${p}] ${k}Invalid URL ${m}!!\n\n"

exit 1

elif [[ ${sux} =~ "1" ]];then

sec

echo -e "\n\n${p}[${pu}✓${p}] [ ${h}Success! ${p}]"

echo -e "${p}[${h}•${p}] HASIL${m}: ${h}${ok}"

echo -e "${c}_________________________\n"

fi

};short
