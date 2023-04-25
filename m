Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17EAF7B;
	Tue, 25 Apr 2023 09:01:53 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 037C55C00CD;
	Tue, 25 Apr 2023 05:01:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 25 Apr 2023 05:01:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1682413312; x=1682499712; bh=R0z5Zs+wnEsIT1a8y/eZUxxArXE6qSZmRoh
	kAXezjZQ=; b=TzdRGTV2hO5JedwLX2OH2c1ohRTSGKu0BV1mcu4k29f/wMYONi1
	5kUeO8gw7bqkaAn7CHeoDEtaO7V0IujFVTqgWsb00ooBp87ZjGGlDqJ3qrnNxubS
	kWkJS3sf4U3dr/894BbN6ajEwk9Wfhro5QnfvHZHKn6Eqh2kVXGGyNFz0iG1Adty
	0cFij0usNnxVdc7ZbjGTbw4MV6UM6cWckn6LVOt4zhwOWzQrjknlZQtHYxgZfapb
	D0Ugd3uTRsJ30jSfca5/hREueVrgV6hSJc/QYM1v55o5P4sVFdHQ/YaM8r1nTCo0
	mbnY1Eydy7mpuZlrJDW/aYEO4VlNCZyCb8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1682413312; x=1682499712; bh=R0z5Zs+wnEsIT1a8y/eZUxxArXE6qSZmRoh
	kAXezjZQ=; b=dETx4Eje6jqkXHZfDAN1w4Z2QYI6v+22QFbitdpKZpmsP34Jnh6
	3XCvtuBxJj9lD5/Dz58wZBgT3IaAw8VhKe4FfAHsfy+H4vTlCwOeNNq83Q325psH
	Gizu/NVv4OwEGuP5w43EwdjiE16mSlmJcnTQEMEHwRdnsGG127x/rkilMSUYXN7J
	IYCzArom7aJfoGQLR8byHUhNpdPzZ4/qH/bflKJUZLIgWEHRuKb1P0tu3RDRFkW5
	QhngQjBPmbwdrOi7G7lCInLltSCKgGPzIBnS0Pi8/6QY1/yBNEtFiLr03FNCacT3
	kToS46wUsTLKxXsVcpFbTvSHUyJGb4yN6qw==
X-ME-Sender: <xms:_5ZHZJs_B7hg1lzne89QzMmORS9hGvNk8o8M4iA1Gy7iL7X2yVwgAQ>
    <xme:_5ZHZCdzFTOKhsfaifdVoqmUVJ2xykOm3TsZggZg1JCRFohW8-2SdwK2xQVw0KUT8
    NTXEDgRN5obyWGtm_Q>
X-ME-Received: <xmr:_5ZHZMxp6_a7Xz5O87kbYLMKnNqCtf6aJ15Phl84LBwtQGgsCDZO60xnTlG7Oo_VM_-i>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeduvddgudduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurheptggguffhjgffvefgkfhfvffosehtqhhmtdhhtdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepuddtjeffteetfeekjeeiheefueeigeeutdevieejveeihfff
    ledvgfduiefhvddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:_5ZHZAPAPFgLWOmgcyL-rILyIUiedFqHBFOFuA-xqK6Aet5uxAkr4g>
    <xmx:_5ZHZJ83aP9yDKsd9R6qKwGJODAnnfu8ZAN3mrUq9qmq9BkwofxEGA>
    <xmx:_5ZHZAUl0wp_xKPEHQzLWjsdxjfVHcgHRPoJcc38D5nHJ9qqABAnqA>
    <xmx:AJdHZMmh4uGwnwHmO4_3yRVNUwlGSQApy14d_RwCjDzFKL4vdUpItQ>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Apr 2023 05:01:50 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.500.231\))
Subject: Re: arch/mips/include/asm/timex.h:75:10: error: instruction requires
 a CPU feature not currently enabled
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <20230424200155.GA2605117@dev-arch.thelio-3990X>
Date: Tue, 25 Apr 2023 10:01:39 +0100
Cc: Borislav Petkov <bp@alien8.de>,
 kernel test robot <lkp@intel.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <FF433BBA-3723-4B4D-BBAC-664419EA52D0@flygoat.com>
References: <202304170748.Fg9VIgGd-lkp@intel.com>
 <20230419223707.GAZEBtE1vZGy5B4EUR@fat_crate.local>
 <20230419231834.GA1269248@dev-arch.thelio-3990X>
 <C6A730FC-C7B5-4A32-92CD-98FDA632782C@flygoat.com>
 <20230424200155.GA2605117@dev-arch.thelio-3990X>
To: Nathan Chancellor <nathan@kernel.org>
X-Mailer: Apple Mail (2.3731.500.231)



> 2023=E5=B9=B44=E6=9C=8824=E6=97=A5 21:01=EF=BC=8CNathan Chancellor =
<nathan@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Thu, Apr 20, 2023 at 12:41:50AM +0100, Jiaxun Yang wrote:
>>=20
>>=20
>>> 2023=E5=B9=B44=E6=9C=8820=E6=97=A5 00:18=EF=BC=8CNathan Chancellor =
<nathan@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>>>=20
>>> + Jiaxun, who has been looking into MIPS + LLVM issues recently and =
has
>>> been a big help :)
>>=20
>> I think this patch[1] may fix the problem.
>=20
> I have the following patch stack:
>=20
> $ git log --oneline origin/master^..
> c6cd9f17692e MIPS: Replace assembly isa level directives with macros
> 60508ba7d92f MIPS: Limit MIPS_MT_SMP support by ISA reversion
> c9e250105de4 MIPS: Fallback CPU -march CFLAG to ISA level if =
unsupported
> 49c0420e59bb MIPS: Remove cc-option checks for -march=3Docteon
> b7ea7e959023 MIPS: Detect toolchain support of o32 ABI with 64 bit CPU
> 51f2d93245ba MIPS: Detect toolchain support of workarounds in Kconfig
> 7382a07eb105 MIPS: Add toolchain feature dependency for microMIPS =
smartMIPS
> de0621fbedd3 MIPS: Move various toolchain ASE check to Kconfig
> 3b85b9b39960 Add linux-next specific files for 20230424
>=20
> but with the robot's configuration, I still see that error. I notice
> that the 'if (sel =3D=3D 0)' branch of ___read_32bit_c0_register() has =
no
> '.set push' directive, could that matter here?

Sorry I was identifying the wrong problem.

The real problem is LLVM IAS (or the whole LLVM stack)=E2=80=99s =
microMIPS is broken,
It unable to handle =E2=80=9Cmfc0=E2=80=9D and many other instructions.

Perhaps we should come up a method to block this config to happen.

Thanks
Jiaxun

>=20
> Cheers,
> Nathan
