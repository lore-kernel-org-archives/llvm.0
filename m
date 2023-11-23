Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4471382
	for <llvm@lists.linux.dev>; Thu, 23 Nov 2023 00:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 3AN0fd9A32593574, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.95/5.92) with ESMTPS id 3AN0fd9A32593574
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Nov 2023 08:41:39 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.32; Thu, 23 Nov 2023 08:41:40 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 23 Nov 2023 08:41:39 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::40c2:6c24:2df4:e6c7]) by
 RTEXMBS04.realtek.com.tw ([fe80::40c2:6c24:2df4:e6c7%5]) with mapi id
 15.01.2375.007; Thu, 23 Nov 2023 08:41:39 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Dan Carpenter <dan.carpenter@linaro.org>, Su Hui <suhui@nfschina.com>
CC: "kvalo@kernel.org" <kvalo@kernel.org>,
        "nathan@kernel.org"
	<nathan@kernel.org>,
        "ndesaulniers@google.com" <ndesaulniers@google.com>,
        "trix@redhat.com" <trix@redhat.com>,
        "lizetao1@huawei.com"
	<lizetao1@huawei.com>,
        "linville@tuxdriver.com" <linville@tuxdriver.com>,
        "Larry.Finger@lwfinger.net" <Larry.Finger@lwfinger.net>,
        "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: RE: [PATCH wireless-next 2/2] rtlwifi: rtl8821ae: phy: fix an undefined bitwise shift behavior
Thread-Topic: [PATCH wireless-next 2/2] rtlwifi: rtl8821ae: phy: fix an
 undefined bitwise shift behavior
Thread-Index: AQHaHSNCghVLlD1f6kiAq806Rpki+bCFx80AgAFHvAA=
Date: Thu, 23 Nov 2023 00:41:39 +0000
Message-ID: <99ec66d717b249e781f9316cbd689521@realtek.com>
References: <20231122090210.951185-1-suhui@nfschina.com>
 <20231122090210.951185-2-suhui@nfschina.com>
 <2ec14802-78b0-4a3f-a730-19e95ec8d359@suswa.mountain>
In-Reply-To: <2ec14802-78b0-4a3f-a730-19e95ec8d359@suswa.mountain>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
x-kse-serverinfo: RTEXMBS01.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback



> -----Original Message-----
> From: Dan Carpenter <dan.carpenter@linaro.org>
> Sent: Wednesday, November 22, 2023 9:02 PM
> To: Su Hui <suhui@nfschina.com>
> Cc: Ping-Ke Shih <pkshih@realtek.com>; kvalo@kernel.org; nathan@kernel.or=
g; ndesaulniers@google.com;
> trix@redhat.com; lizetao1@huawei.com; linville@tuxdriver.com; Larry.Finge=
r@lwfinger.net;
> linux-wireless@vger.kernel.org; linux-kernel@vger.kernel.org; llvm@lists.=
linux.dev;
> kernel-janitors@vger.kernel.org
> Subject: Re: [PATCH wireless-next 2/2] rtlwifi: rtl8821ae: phy: fix an un=
defined bitwise shift behavior
>=20
> Perhaps, a better way to silence the warning is to just change
> _rtl8821ae_phy_calculate_bit_shift() to not return 32 bits?  Do we
> really ever pass bitmask 0?  No idea...
>=20

I think the bitmask should not 0, so just replace _rtl8821ae_phy_calculate_=
bit_shift()
by __ffs(bitmask). To be safer, callers can check bitmask is not 0 before c=
alling.=20

Ping-Ke

