#!/data/data/com.termux/files/usr/bin/bash

echo -e "\033[92m[*] ruijie_voucher အား ထည့်သွင်းနေပါသည်...\033[0m"

# ၁။ လိုအပ်တဲ့ Python နဲ့ Library တွေ သွင်းမယ်
pkg update && pkg upgrade -y
pkg install python -y
pip install requests

# ၂။ Folder အဟောင်းရှိရင် ဖျက်ပြီး အသစ်ဆောက်မယ်
rm -rf ~/ruijie_voucher
mkdir -p ~/ruijie_voucher
cd ~/ruijie_voucher

# ၃။ ဖုန်းရဲ့ Bit (Architecture) ကို စစ်ဆေးမယ်
ARCH=$(getprop ro.product.cpu.abi)

if [ "$ARCH" = "arm64-v8a" ]; then
    echo -e "\033[94m[*] 64-bit ဖုန်းဖြစ်ကြောင်း စစ်ဆေးတွေ့ရှိရသဖြင့် 64-bit version ကို ဒေါင်းလုဒ်ဆွဲနေသည်...\033[0m"
    # ဖိုင်ကို အရင်ဒေါင်းပြီးမှ နာမည်ပြောင်းမယ်
    curl -LO https://raw.githubusercontent.com/sandar18705-del/ruijie_voucher/main/ruijie_voucher_64bit.so
    mv ruijie_voucher_64bit.so ruijie_voucher.so
else
    echo -e "\033[94m[*] 32-bit ဖုန်းဖြစ်ကြောင်း စစ်ဆေးတွေ့ရှိရသဖြင့် 32-bit version ကို ဒေါင်းလုဒ်ဆွဲနေသည်...\033[0m"
    curl -LO https://raw.githubusercontent.com/sandar18705-del/ruijie_voucher/main/ruijie_voucher_32bit.so
    mv ruijie_voucher_32bit.so ruijie_voucher.so
fi

# ၄။ Starter ဖိုင်ကို ဒေါင်းမယ်
curl -LO https://raw.githubusercontent.com/sandar18705-del/ruijie_voucher/main/runn.py

echo -e "\033[92m[✔] အောင်မြင်စွာ ထည့်သွင်းပြီးပါပြီ!\033[0m"
echo -e "\033[93mအသုံးပြုရန်: cd ~/ruijie_voucher && python runn.py\033[0m"
