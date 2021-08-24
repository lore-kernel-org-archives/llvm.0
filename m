Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D3B3FC1
	for <llvm@lists.linux.dev>; Tue, 24 Aug 2021 01:50:09 +0000 (UTC)
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 17O1jQohD005631, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36502.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.71/5.88) with ESMTPS id 17O1jQohD005631
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 24 Aug 2021 09:45:26 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXH36502.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Tue, 24 Aug 2021 09:45:25 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXMBS04.realtek.com.tw (172.21.6.97) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 24 Aug 2021 09:45:25 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::cdd5:82a3:e854:7098]) by
 RTEXMBS04.realtek.com.tw ([fe80::cdd5:82a3:e854:7098%5]) with mapi id
 15.01.2106.013; Tue, 24 Aug 2021 09:45:25 +0800
From: Pkshih <pkshih@realtek.com>
To: Nathan Chancellor <nathan@kernel.org>, Kalle Valo <kvalo@codeaurora.org>
CC: Colin Ian King <colin.king@canonical.com>,
        "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "clang-built-linux@googlegroups.com" <clang-built-linux@googlegroups.com>,
        "llvm@lists.linux.dev" <llvm@lists.linux.dev>
Subject: RE: [PATCH] rtlwifi: rtl8192de: Fix initialization of place in _rtl92c_phy_get_rightchnlplace()
Thread-Topic: [PATCH] rtlwifi: rtl8192de: Fix initialization of place in
 _rtl92c_phy_get_rightchnlplace()
Thread-Index: AQHXmG0s5HBB1+4FIUaWbT4swfecM6uB4bug
Date: Tue, 24 Aug 2021 01:45:25 +0000
Message-ID: <6ad224d9cd5545bebfaf2e60c54d359b@realtek.com>
References: <20210823222014.764557-1-nathan@kernel.org>
In-Reply-To: <20210823222014.764557-1-nathan@kernel.org>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [172.21.69.146]
x-kse-serverinfo: RTEXMBS04.realtek.com.tw, 9
x-kse-attachmentfiltering-interceptor-info: no applicable attachment filtering
 rules found
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: =?us-ascii?Q?Clean,_bases:_2021/8/23_=3F=3F_11:22:00?=
x-kse-bulkmessagesfiltering-scan-result: protection disabled
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-KSE-ServerInfo: RTEXH36502.realtek.com.tw, 9
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-AntiSpam-Outbound-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.20, Database issued on: 08/24/2021 01:27:34
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 165744 [Aug 23 2021]
X-KSE-AntiSpam-Info: Version: 5.9.20.0
X-KSE-AntiSpam-Info: Envelope from: pkshih@realtek.com
X-KSE-AntiSpam-Info: LuaCore: 454 454 39c6e442fd417993330528e7f9d13ac1bf7fdf8c
X-KSE-AntiSpam-Info: {Tracking_uf_ne_domains}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info:
	d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;realtek.com:7.1.1;127.0.0.199:7.1.2
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 08/24/2021 01:29:00


> -----Original Message-----
> From: Nathan Chancellor [mailto:nathan@kernel.org]
> Sent: Tuesday, August 24, 2021 6:20 AM
> To: Pkshih; Kalle Valo
> Cc: Colin Ian King; linux-wireless@vger.kernel.org; netdev@vger.kernel.or=
g;
> linux-kernel@vger.kernel.org; clang-built-linux@googlegroups.com; llvm@li=
sts.linux.dev; Nathan
> Chancellor
> Subject: [PATCH] rtlwifi: rtl8192de: Fix initialization of place in _rtl9=
2c_phy_get_rightchnlplace()
>=20
> Clang warns:
>=20
> drivers/net/wireless/realtek/rtlwifi/rtl8192de/phy.c:901:6: warning:
> variable 'place' is used uninitialized whenever 'if' condition is false
> [-Wsometimes-uninitialized]
>         if (chnl > 14) {
>             ^~~~~~~~~
> drivers/net/wireless/realtek/rtlwifi/rtl8192de/phy.c:909:9: note:
> uninitialized use occurs here
>         return place;
>                ^~~~~
> drivers/net/wireless/realtek/rtlwifi/rtl8192de/phy.c:901:2: note: remove
> the 'if' if its condition is always true
>         if (chnl > 14) {
>         ^~~~~~~~~~~~~~~
> drivers/net/wireless/realtek/rtlwifi/rtl8192de/phy.c:899:10: note:
> initialize the variable 'place' to silence this warning
>         u8 place;
>                 ^
>                  =3D '\0'
> 1 warning generated.
>=20
> Commit 369956ae5720 ("rtlwifi: rtl8192de: Remove redundant variable
> initializations") removed the initialization of place but it appears
> that this removal was in the wrong function.

Somehow, I also look into wrong function.
Thanks for the catch.

>=20
> _rtl92c_phy_get_rightchnlplace() returns place's value at the end of the
> function so now if the if statement is false, place never gets
> initialized. Add that initialization back to address the warning.
>=20
> place's initialization is not necessary in
> rtl92d_get_rightchnlplace_for_iqk() as place is only used within the if
> statement so it can be removed, which is likely what was intended in the
> first place.
>=20
> Fixes: 369956ae5720 ("rtlwifi: rtl8192de: Remove redundant variable initi=
alizations")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Acked-by: Ping-Ke Shih <pkshih@realtek.com>

> ---
>  drivers/net/wireless/realtek/rtlwifi/rtl8192de/phy.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192de/phy.c
> b/drivers/net/wireless/realtek/rtlwifi/rtl8192de/phy.c
> index 8ae69d914312..9b83c710c9b8 100644
> --- a/drivers/net/wireless/realtek/rtlwifi/rtl8192de/phy.c
> +++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192de/phy.c
> @@ -896,7 +896,7 @@ static void _rtl92d_ccxpower_index_check(struct ieee8=
0211_hw *hw,
>=20
>  static u8 _rtl92c_phy_get_rightchnlplace(u8 chnl)
>  {
> -	u8 place;
> +	u8 place =3D chnl;
>=20
>  	if (chnl > 14) {
>  		for (place =3D 14; place < sizeof(channel5g); place++) {
> @@ -1363,7 +1363,7 @@ static void _rtl92d_phy_switch_rf_setting(struct ie=
ee80211_hw *hw, u8 channel)
>=20
>  u8 rtl92d_get_rightchnlplace_for_iqk(u8 chnl)
>  {
> -	u8 place =3D chnl;
> +	u8 place;
>=20
>  	if (chnl > 14) {
>  		for (place =3D 14; place < sizeof(channel_all); place++) {
>=20
> base-commit: 609c1308fbc6446fd6d8fec42b80e157768a5362
> --
> 2.33.0

