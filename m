Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95AEE6132
	for <llvm@lists.linux.dev>; Wed, 11 Oct 2023 06:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 39B6gOcJ53664973, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.92/5.92) with ESMTPS id 39B6gOcJ53664973
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Oct 2023 14:42:24 +0800
Received: from RTEXMBS03.realtek.com.tw (172.21.6.96) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Wed, 11 Oct 2023 14:42:24 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXMBS03.realtek.com.tw (172.21.6.96) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Wed, 11 Oct 2023 14:42:24 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::40c2:6c24:2df4:e6c7]) by
 RTEXMBS04.realtek.com.tw ([fe80::40c2:6c24:2df4:e6c7%5]) with mapi id
 15.01.2375.007; Wed, 11 Oct 2023 14:42:24 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Kees Cook <keescook@chromium.org>
CC: "kvalo@kernel.org" <kvalo@kernel.org>,
        "llvm@lists.linux.dev"
	<llvm@lists.linux.dev>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>,
        "linux-hardening@vger.kernel.org"
	<linux-hardening@vger.kernel.org>,
        "trix@redhat.com" <trix@redhat.com>,
        "nathan@kernel.org" <nathan@kernel.org>,
        "ndesaulniers@google.com"
	<ndesaulniers@google.com>,
        "gustavoars@kernel.org" <gustavoars@kernel.org>
Subject: RE: [PATCH] wifi: rtw89: coex: Annotate struct rtw89_btc_btf_set_slot_table with __counted_by
Thread-Topic: [PATCH] wifi: rtw89: coex: Annotate struct
 rtw89_btc_btf_set_slot_table with __counted_by
Thread-Index: AQHZ+JIdINNFwhWCA0q/Xu1rquYi7LA9Aa0AgAQqFYCAAv5lMA==
Date: Wed, 11 Oct 2023 06:42:23 +0000
Message-ID: <a47f01def02c4ccdb0d4ca3967ad7584@realtek.com>
References: <20231006201715.work.239-kees@kernel.org>
 <4716f3c7bf3d34ea25229edd5250f5f0cff639d8.camel@realtek.com>
 <202310090953.B7CE5CF4B@keescook>
In-Reply-To: <202310090953.B7CE5CF4B@keescook>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
x-originating-ip: [172.21.69.25]
x-kse-serverinfo: RTEXMBS03.realtek.com.tw, 9
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

Hi Kees,

> -----Original Message-----
> From: Kees Cook <keescook@chromium.org>
> Sent: Tuesday, October 10, 2023 12:56 AM
> To: Ping-Ke Shih <pkshih@realtek.com>
> Cc: kvalo@kernel.org; llvm@lists.linux.dev; linux-kernel@vger.kernel.org;=
 linux-wireless@vger.kernel.org;
> linux-hardening@vger.kernel.org; trix@redhat.com; nathan@kernel.org; ndes=
aulniers@google.com;
> gustavoars@kernel.org
> Subject: Re: [PATCH] wifi: rtw89: coex: Annotate struct rtw89_btc_btf_set=
_slot_table with __counted_by
>=20
> On Sat, Oct 07, 2023 at 01:20:43AM +0000, Ping-Ke Shih wrote:
> > On Fri, 2023-10-06 at 13:17 -0700, Kees Cook wrote:
> >
> > So, NACK this patch. I will prepare one or two patches for them next we=
ek.
>=20
> Ah-ha; thank you!

I have sent two patches [1]. Please help to review and Cc people if needed.=
=20

[1] https://lore.kernel.org/linux-wireless/20231011063725.25276-1-pkshih@re=
altek.com/T/#t



