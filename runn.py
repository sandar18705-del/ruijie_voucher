import asyncio
import sys
import os

# အရေးကြီး: .so ဖိုင်နာမည်ကို import လုပ်ပါမယ်
# ဥပမာ - သင့်ဖိုင်နာမည်က ruijie_voucher.so ဆိုရင် import ruijie_voucher လို့ ရေးရပါမယ်
try:
    import ruijie_voucher
except ImportError:
    print("[-] Error: .so ဖိုင်ကို ရှာမတွေ့ပါ။ ဖိုင်နာမည်ကို မှန်အောင် စစ်ဆေးပါ။")
    sys.exit(1)

async def main():
    # .so ထဲက start_tool() function ကို ခေါ်သုံးခြင်း
    # အကယ်၍ function နာမည်မတူရင် dir(ruijie_voucher) နဲ့ စစ်ကြည့်လို့ရပါတယ်
    if hasattr(ruijie_voucher, 'start_tool'):
        await ruijie_voucher.start_tool()
    else:
        print("[-] Error: 'start_tool' ဆိုတဲ့ function ကို မတွေ့ပါ။")

if __name__ == "__main__":
    try:
        asyncio.run(main())
    except KeyboardInterrupt:
        print("\n[*] Program stopped by user.")
