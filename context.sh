#/bin/bash

show_func() {
	echo -e "\n+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++="
 	echo -e "\n1. 콜라850원, 2. 사이다 800원, 3. 환타 750원, 4. 생수 500원\n "
	echo -e "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=\n"
}

cal_func() {
        chun_won=5
        obak_won=10
        bak_won=10
        osip_won=10
        sip_won=30

	read -p "금액을 입력하세요 : " money
	read -p "메뉴를 입력하세요 : " menu
	if [ $money -gt 0 ] 2> /dev/null 
	then
		case $menu in
                	1) money=$[$money-850] ;;
                	2) money=$[$money-800] ;;
                	3) money=$[$money-750] ;;
                	4) money=$[$money-500] ;;
                	*) echo -e "\n잘못된 메뉴선택!!"
                   	continue ;;
        esac
        else
		echo "잘못된 금액 입력!!"
		continue
	fi
	if [ $money -gt 11800 ]
	then
		echo "너무 많은 금액을 입금하셨습니다. 거슬러줄 잔돈이 부족합니다."
		continue
	fi
	imsi_money=$money
	if [ $money -le 5000 ]
	then	
		chun_won=$[$imsi_money/1000]
		imsi_money=$[$imsi_money-$chun_won*1000]

		obak_won=$[$imsi_money/500]
                imsi_money=$[$imsi_money-$obak_won*500]

                bak_won=$[$imsi_money/100]
                imsi_money=$[$imsi_money-$bak_won*100]

                osip_won=$[$imsi_money/50]
                imsi_money=$[$imsi_money-$osip_won*50]

                sip_won=$[$imsi_money/10]
                imsi_money=$[$imsi_money-$sip_won*10]
	elif [ $money -le 10000 ]
	then
		chun_won=5
		imsi_money=$[$imsi_money-5000]	
		
                obak_won=$[$imsi_money/500]
                imsi_money=$[$imsi_money-$obak_won*500]

                bak_won=$[$imsi_money/100]
                imsi_money=$[$imsi_money-$bak_won*100]

                osip_won=$[$imsi_money/50]
                imsi_money=$[$imsi_money-$osip_won*50]

                sip_won=$[$imsi_money/10]
                imsi_money=$[$imsi_money-$sip_won*10]
	else
		chun_won=5
                imsi_money=$[$imsi_money-5000]

                obak_won=10
                imsi_money=$[$imsi_money-5000]

                bak_won=$[$imsi_money/100]
                imsi_money=$[$imsi_money-$bak_won*100]

                osip_won=$[$imsi_money/50]
                imsi_money=$[$imsi_money-$osip_won*50]

                sip_won=$[$imsi_money/10]
                imsi_money=$[$imsi_money-$sip_won*10]
	fi
}

result_func() {
	echo -e "\n잔돈 : $money"
	echo -e "천원 : $chun_won 개, 오백원 :  $obak_won 개, 백원 : $bak_won 개, 오십원 : $osip_won 개, 십원 : $sip_won 개"
}
while :
do
	show_func
	cal_func
	result_func
done
