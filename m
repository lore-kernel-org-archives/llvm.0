Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1034613BAC2;
	Sun,  8 Sep 2024 10:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725790817; cv=none; b=dPAq8CaTiPDZgJRWxVczLrJsWJitbbSPImuBDJC0ps1GkxH9aB8vFNLpH4cXTmSXMBHY2x9nMv30CBlS/t8i4s8D9V4p2Y5YgEcko7uZ7AIg9akGVeiyGIv/dlzsrvrIYQNLHkOHWr10YBJ2QB6T4unSDffRrGBNhLqqB14Ch/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725790817; c=relaxed/simple;
	bh=lk1+zZ+jiu2Oz9/qJlhKahZ3/gT/P2RzNeEcaBMO0oc=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=fvykcMCuEw+jxsZbWPuykf0kgT6URDnTUe1dUAPvMCwdmfZV1Auq/l2BA8rRSwxq9naiKr0K6ejc/H7Vgcu4Qbb7jEJE+lhe4Ka6HpdGIwPmcmzne1SS5il5AaOwnQSBLoQizjVFEPDzHo4FiIWWYYZU0gQwLkRcvXXbxtUbN3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=lRnzknhS; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=eTa6pUfw; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="lRnzknhS";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="eTa6pUfw"
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfout.phl.internal (Postfix) with ESMTP id E0CAA13802F2;
	Sun,  8 Sep 2024 06:20:14 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-09.internal (MEProxy); Sun, 08 Sep 2024 06:20:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1725790814;
	 x=1725877214; bh=9EaytkM5LDH5lJ/uxj4WXd/rSRPpUoaSxQw9e1SAr90=; b=
	lRnzknhSCJCq2nwona3ZNH0RMIunu1ORNxxuNPYzKIdn8Ktg2qq/28g2VJ0uvBnO
	+UGokr6zRt4gXu+LV8XSNk1ciVoFfhzGjN5wdPgMeewrN/eBF6QZ0tNkoTKcZhUI
	oTsQPxY72FcYAc2ELKL+sPDrU1Db38XeKXZ1zpdp3sSxRd5l3n/kREI8lV6sSacZ
	NU4Po7tsyEXAXVB3+d+S0zVvtPlRDX1kreCxONDrPfqgNJ7p0xziRwMK5sl9jp0z
	MoE0QOukdfF1kN0IQAdTA40uqzckcUob9wduI97QdTquDUaqY/jv6xTArQ3YWMj7
	wf4Ralzx5d4fCjot/P1HWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725790814; x=
	1725877214; bh=9EaytkM5LDH5lJ/uxj4WXd/rSRPpUoaSxQw9e1SAr90=; b=e
	Ta6pUfwWFU7xYhcOaBw2lezc5f26nkZutWdlIuFkEchQzxd55tCMIALDXgj7fSi3
	TZA/lFh+u9Arr34EEGfvk6UF3wigj7oNo6Z3ForWw31aB4Szql4elHDzB8nGpWpS
	ky0fzqRhcuysCt0oOLVIpbvX0K7AGdys1a42xs26KZ5xMskyBK5SUDpcb0i+hkfK
	UsOK72t+QpZobSOjVuCvH2+BAHZlGcsqqW1AFYrJ6nx7K5t4h29kkW/mmeHCS5f6
	JUCPhgWKPvy0Wgt8+/kpaBUj59O5ol95RyHoHA1QR6TjuGBMgOW2SEDdc5L+DTE4
	weBGqhWi0+sdNWs4tOdSw==
X-ME-Sender: <xms:XHrdZq1OhCboq_TEeQrym_mWsXGs0YBbH7Qdi_v8D4FkaiETKKr5NQ>
    <xme:XHrdZtEJdxoEcK_OFOYW8-KbCEOYg3XYmw-uLEdSTZMpiJyN4mUGvsHu7pqokhBTK
    2uGrXKbP9y2zjh7nrI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeihedgvdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdej
    necuhfhrohhmpedflfhirgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfh
    hlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepjeelheeigeduueffieeiffel
    jeejhedtudekkeeuffevhfejuefghfeutdejfffgnecuffhomhgrihhnpehgihhthhhusg
    drtghomhdpkhgvrhhnvghlrdhorhhgpddtuddrohhrghenucevlhhushhtvghrufhiiigv
    pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihgh
    horghtrdgtohhmpdhnsggprhgtphhtthhopeeffedpmhhouggvpehsmhhtphhouhhtpdhr
    tghpthhtohepsghpsegrlhhivghnkedruggvpdhrtghpthhtohepthhssghoghgvnhguse
    grlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgtphhtthhopehmrghrkhdrrhhuthhlrghn
    ugesrghrmhdrtghomhdprhgtphhtthhopegrnhhtohhnrdhivhgrnhhovhestggrmhgsrh
    hiughgvghgrhgvhihsrdgtohhmpdhrtghpthhtohepnhhitgholhgrshesfhhjrghslhgv
    rdgvuhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhope
    grlhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghoqhhunhdr
    fhgvnhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtohepfigvughsohhnrghfsehgmhgrih
    hlrdgtohhm
X-ME-Proxy: <xmx:XHrdZi5MjXmazbkYWJyyrTrAQ4pHD9qCEeMwl9D-q9Ok_kkT44Z9yQ>
    <xmx:XHrdZr0v5haPnTbwVcjvAKiWc6fYEY6E2uYr_4LSFdvDToLPoB4bDA>
    <xmx:XHrdZtHlZbMaQqW16ZVeONZY_E8qWRMYYSYDp0plGcY3UE6wU2Moqw>
    <xmx:XHrdZk88b4rKdAQjWldtcj9F8btYB7myTXW-XtsO3WwbC8jcYQht8A>
    <xmx:XnrdZk8k1Kih0ysKc34UeVTIOuXeyIkcvv_zRuqpHCEhutXZdDD8_GhF>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6FE011C20065; Sun,  8 Sep 2024 06:20:12 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Sun, 08 Sep 2024 11:19:52 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "kernel test robot" <lkp@intel.com>,
 "Masahiro Yamada" <masahiroy@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Nicolas Schier" <nicolas@fjasle.eu>,
 "Richard Weinberger" <richard@nod.at>,
 "Anton Ivanov" <anton.ivanov@cambridgegreys.com>,
 "Johannes Berg" <johannes@sipsolutions.net>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>,
 "Wedson Almeida Filho" <wedsonaf@gmail.com>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@samsung.com>,
 "Alice Ryhl" <aliceryhl@google.com>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Steven Rostedt" <rostedt@goodmis.org>,
 "Masami Hiramatsu" <mhiramat@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>,
 "Jonathan Corbet" <corbet@lwn.net>, "Alex Shi" <alexs@kernel.org>,
 "Yanteng Si" <siyanteng@loongson.cn>,
 "Nick Desaulniers" <ndesaulniers@google.com>,
 "Bill Wendling" <morbo@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Message-Id: <70ccb9a6-7bef-435d-bd3c-7f3d8487031e@app.fastmail.com>
In-Reply-To: <202409081703.CUljfXjY-lkp@intel.com>
References: <20240905-mips-rust-v2-1-409d66819418@flygoat.com>
 <202409081703.CUljfXjY-lkp@intel.com>
Subject: Re: [PATCH v2 1/3] rust: Introduce HAVE_GENERATE_RUST_TARGET config option
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B49=E6=9C=888=E6=97=A5=E4=B9=9D=E6=9C=88 =E4=B8=8A=E5=
=8D=8811:05=EF=BC=8Ckernel test robot=E5=86=99=E9=81=93=EF=BC=9A
> Hi Jiaxun,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on 469f1bad3c1c6e268059f78c0eec7e9552b3894c]
>
> url:   =20
> https://github.com/intel-lab-lkp/linux/commits/Jiaxun-Yang/rust-Introd=
uce-HAVE_GENERATE_RUST_TARGET-config-option/20240905-213538
> base:   469f1bad3c1c6e268059f78c0eec7e9552b3894c
> patch link:   =20
> https://lore.kernel.org/r/20240905-mips-rust-v2-1-409d66819418%40flygo=
at.com
> patch subject: [PATCH v2 1/3] rust: Introduce HAVE_GENERATE_RUST_TARGE=
T=20
> config option
> config: x86_64-rhel-8.3-rust=20
> (https://download.01.org/0day-ci/archive/20240908/202409081703.CUljfXj=
Y-lkp@intel.com/config)
> compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project=20
> 617a15a9eac96088ae5e9134248d8236e34b91b1)
> reproduce (this is a W=3D1 build):=20
> (https://download.01.org/0day-ci/archive/20240908/202409081703.CUljfXj=
Y-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new=20
> version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes:=20
> https://lore.kernel.org/oe-kbuild-all/202409081703.CUljfXjY-lkp@intel.=
com/
>
> All errors (new ones prefixed by >>):
>
>>> error: /opt/cross/rustc-1.78.0-bindgen-0.65.1/rustup/toolchains/1.78=
.0-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/num/f3=
2.rs:804:6: in function _RNvMNtCs5QSdWC790r4_4core3f32f7next_up float (f=
loat): SSE register return with SSE disabled

It seems like not related to this patch?

No functional behaviour change on x86.=20

Thanks
>
> --=20
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

--=20
- Jiaxun
