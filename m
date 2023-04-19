Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3846FD310
	for <llvm@lists.linux.dev>; Wed, 19 Apr 2023 23:36:56 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 024F33200033;
	Wed, 19 Apr 2023 19:36:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Wed, 19 Apr 2023 19:36:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1681947414; x=1682033814; bh=GLMPVgV6xsUU9TvUrlna2wd4KxrdWZ6q0Ww
	QPVUyA7M=; b=THEIpDb/jQ1NQDqJEXLLhRzSvhOPFUXcRm7pzuqPkW8/6eBPbaK
	I/csbqSYQG35ZbBUWm1HAXN5vr3oYZK4Lg5flZF3Qwyy/5NYXXvb9v0xvk2BcgSS
	gjNlqVM1V0oupd0wMfYqskwRm8FgL22wfvcU+XbkDG/MiR0XX7vh0XNQh/9VP2eF
	yffJDZ/r9UEHXsL3p7Z5WG9UgT5fGu1WTFwkxvoAN28mQtsYk/QFdAlTtetHOTWP
	hlN1K+tyn1gFDARkj1gkwltLW5ylDwqiJhmK2OXwbUjBfXiipl4/Iw5NHwguugbt
	LIRm1bTrzsx/a9jSMAM0WdWVlwaMoupPvmg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1681947414; x=1682033814; bh=GLMPVgV6xsUU9TvUrlna2wd4KxrdWZ6q0Ww
	QPVUyA7M=; b=UkPktIGgx81fAuWst2tq13To5U0MTekQrvmP1Zs0U62FNCrKsAL
	y8MN1QLFL/VqqZOqAHbyAWcAgmDQt2Ba6TGowy+XyeM3MXsJHw6QUvXRAKf6QMuA
	pNbkjnONav3MgFOI9ZHBQ5uyeem3NKVCPzGqoYw6F9zNr9gp1ITroa6x5zYPx0So
	NLNHjFMqhkTlpzrGSIKs6TH6xG5k5zHqfVekmphxkzHQ9UAVZhW4s+NplcMkmHpE
	LMsPmW1mHWT3CiACH9KRsO9OiBDoYIK3Jlal7vM90HM+ij9+YkWu0sYSVe++ckju
	Y0tFUUi6WsrGaeZgsjnXhlCbCC6lqVnINeQ==
X-ME-Sender: <xms:FntAZFPsQe2P1sdYHyyKdU8DTnPBlO_s9Y2sZF3no4RRv8g7Npjghg>
    <xme:FntAZH9N3l2iaaq4cjz1igodMWA0xDhjH6kj_6pMTmLY5u2C4EMAlNmVGd5ikArwX
    GAVo-jFUtBgFmHCdKA>
X-ME-Received: <xmr:FntAZERxuzvU6Mh3wfyb2QryzbXcaSM6PejWKFovC7SAMGdepUX7YahY3JwELRtF52Fe>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedtuddgvdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurheptggguffhjgffvefgkfhfvffosehtqhhmtdhhtdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepudelfeeugefgiedtgfekueekteejvdevleeiveeivdeukeeu
    leejhfelueeghfdunecuffhomhgrihhnpehgihhthhhusgdrtghomhdpfihikhhiphgvug
    hirgdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
    ohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:FntAZBu-JX43oZAiaDp6wxYoVJvN2TptWQ4lrB7QaExAkzM6vqI0NQ>
    <xmx:FntAZNf3BYYO4ZFVEGMZ4zksUu1dLMZOuuPuFO5yiNx6tHF4XOsE-w>
    <xmx:FntAZN1MUNov8dvvsFVnzUZJHwhj8YE0ss4owac4PUncFXLvY85Glw>
    <xmx:FntAZB6RsEjaFm1-5Ct5JqHi6Oal0gu8aPqyPz__gGYFeQ-MFNKUug>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 19 Apr 2023 19:36:53 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.500.231\))
Subject: Re: [PATCH v2 6/7] MIPS: Fallback CPU -march CFLAG to ISA level if
 unsupported
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <20230419221500.GA17797@alpha.franken.de>
Date: Thu, 20 Apr 2023 00:36:41 +0100
Cc: Nick Desaulniers <ndesaulniers@google.com>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 llvm@lists.linux.dev,
 Nathan Chancellor <nathan@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <B02E6819-A25F-4588-8CDA-D7C5A2E5B0B6@flygoat.com>
References: <20230414080701.15503-1-jiaxun.yang@flygoat.com>
 <20230414080701.15503-7-jiaxun.yang@flygoat.com>
 <CAKwvOdkttvdZQyxrP60hAziaRQ4HWRBBSuA-vN25_USg-zEJqg@mail.gmail.com>
 <550FCA0F-2C48-4133-85B0-D9494CC1C23C@flygoat.com>
 <CAKwvOd=sNyOq9J=CS09XXQ6YY3y3ytLnwHxKoHNdddcxYk=nJQ@mail.gmail.com>
 <20230419221500.GA17797@alpha.franken.de>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
X-Mailer: Apple Mail (2.3731.500.231)



> 2023=E5=B9=B44=E6=9C=8819=E6=97=A5 23:15=EF=BC=8CThomas Bogendoerfer =
<tsbogend@alpha.franken.de> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Wed, Apr 19, 2023 at 02:35:02PM -0700, Nick Desaulniers wrote:
>> On Wed, Apr 19, 2023 at 9:50=E2=80=AFAM Jiaxun Yang =
<jiaxun.yang@flygoat.com> wrote:
>>>=20
>>>=20
>>>=20
>>>> 2023=E5=B9=B44=E6=9C=8818=E6=97=A5 21:07=EF=BC=8CNick Desaulniers =
<ndesaulniers@google.com> =E5=86=99=E9=81=93=EF=BC=9A
>>>>=20
>>>> On Fri, Apr 14, 2023 at 1:07=E2=80=AFAM Jiaxun Yang =
<jiaxun.yang@flygoat.com> wrote:
>>>>>=20
>>>>> LLVM does not implement some of -march options. However those =
options
>>>>> are not mandatory for kernel to build for those CPUs.
>>>>>=20
>>>>> Fallback -march CFLAG to ISA level if unsupported by toolchain so
>>>>> we can get those kernel to build with LLVM.
>>>>>=20
>>>>> Link: https://github.com/ClangBuiltLinux/linux/issues/1544
>>>>> Reported-by: Nathan Chancellor <nathan@kernel.org>
>>>>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>>>>=20
>>>> Thanks for the patch! Maybe it's more obvious to folks who work on
>>>> mips, but how did you determine that say `p5600` is `mips32r5` or
>>>> `r10000` is `mips4`?
>>>=20
>>> Wikipedia [1] should fit the purpose.
>>>=20
>>> [1]: =
https://en.wikipedia.org/wiki/List_of_MIPS_architecture_processors
>>=20
>> Mostly! Though I was not able to verify:
>> - p5600
>=20
> mips32r5

On wikipedia=E2=80=99s =E2=80=9CImagination Technologies=E2=80=9D =
section.

>=20
>> - r5500
>=20
> mips4
>=20
>> - rm5200
>=20
> mips4

I think those are all R5000 derivatives?

>=20
>> - sb1
>=20
> mips64r1

On wikipedia=E2=80=99s "Other designers=E2=80=9D section.

>=20
> all information taken from datasheets.
>=20
>> - loongson*

Loongson-1A/1B/1C: Claims to be MIPS32R2 but lacks FP64 and DIEI, so =
I=E2=80=99d say they are R1.
Loongson2e/Loongson2f: MIPS-III
Loongson64: MIPS64R2

Thanks.
- Jiaxu

>=20
> probably depends on the exact type, but as I don't have datasheets
> I can't say what it is exactly, probaly mips32r2/mips64r2.
>=20
> Thomas.
>=20
> --=20
> Crap can work. Given enough thrust pigs will fly, but it's not =
necessarily a
> good idea.                                                [ RFC1925, =
2.3 ]


