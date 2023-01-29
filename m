Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D6E17D9
	for <llvm@lists.linux.dev>; Sun, 29 Jan 2023 09:41:13 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 250135C00B0;
	Sun, 29 Jan 2023 04:41:12 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Sun, 29 Jan 2023 04:41:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1674985272; x=1675071672; bh=gvxX2jQcdH
	c8rEvuygTvx/0yZ0YB/qwhzET6CC1ytVU=; b=j0/+et4h9SvryZn386nVoG+ih5
	tNkMssAnF/F5rN+AbcnR/Y4n3e7Z1rQ9zeXt4PYjv2SdNulKNFg6qU4Q8WI1M6XK
	rQNM+lki858UnMXGnYIwi76+Ijnd73ERIQbcM5MLoLpbW5qXHoNDCJMrgxsSVVKv
	wcfBgmZJu7TYrl2jfTDXNQ7SmZpo2tAQX6xcmOGx+AToeqmR5Wvp/T7ecxFtJc6z
	G3xzaAVGuk6iraweQ3PE4YCl3wy2Yu7631mEklQfO3JGaZTp1FcR0wZFigvlf2Sh
	7dKnHSK6R/NWaYRTqBDHhqktzCETC63og4S9pBOLnz1bC+dHF4iRMHsYOeZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1674985272; x=1675071672; bh=gvxX2jQcdHc8rEvuygTvx/0yZ0YB
	/qwhzET6CC1ytVU=; b=Y8x3UCB/c49ZclwZEFalH75PkOheb1apgnscp5hrkv45
	8b4EjtWoIQt4Oxz/+8ir3zkb/dAC9l2t6Cuqb6KLe7x1hVF2TMiWR0hVOBSDyaFE
	6WxX8KuWmR8xkXSPJrs/YYpKp98gYOiyDWuPCcCI61xEofqP0AdYJ2w7Av7YMDry
	lFCywUIn9KySYP3a4bCX1LcWywKEV5VrD1k8wqmGJnm4oie9W+/QrMP83YLgR0HE
	fmV/K2oQGauWd16yPrxSWOKJfcgDwOMl+t1nou/Z0V3deDb4gUYmuFS3q3mN0JRo
	7xrq63XxJCaHj5j3doLTiGQyyBdjFXTDdlPAfF/+2g==
X-ME-Sender: <xms:Nz_WYwkz8jvMsybynVvVRLdqXADbjHp0BQkcXpuay2tpj1RtmLhgnA>
    <xme:Nz_WY_3sO0JjFJcPJQ9_FgmXVCvPskj7-1ywKer9fuRINAov1MTRU9kCETdDvvmZu
    fIkvx47bb46VnUpAOg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeftddgtdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvvefutgesth
    dtredtreertdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnuges
    rghrnhgusgdruggvqeenucggtffrrghtthgvrhhnpeffheeugeetiefhgeethfejgfdtue
    fggeejleehjeeutefhfeeggefhkedtkeetffenucevlhhushhtvghrufhiiigvpedtnecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:Nz_WY-qNC-HzkAHfgnYUy4DHRHU6TtQxf94m9edA7vKZNl0cGkBtFw>
    <xmx:Nz_WY8kUBzhNkz7dR9F9ULS2D9NKivi14jxN31hc59gyiPbDTCAUkQ>
    <xmx:Nz_WY-0zQOtFYXhNEq0epGGgzR5XGpQ5dnQARRPprGNwEEkgptgwdA>
    <xmx:OD_WYz--wDAuqQf0XknzspJX8CNjl750osyDEqXl2OK8Ouccyjfd2w>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id C33AFB60086; Sun, 29 Jan 2023 04:41:11 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-85-gd6d859e0cf-fm-20230116.001-gd6d859e0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-Id: <f49c86cd-1bf0-4237-ad52-cfa4a3dd7e0f@app.fastmail.com>
In-Reply-To: <594801854.6143.1674979105470@jenkins.jenkins>
References: <594801854.6143.1674979105470@jenkins.jenkins>
Date: Sun, 29 Jan 2023 10:40:52 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: ci_notify <ci_notify@linaro.org>
Cc: llvm@lists.linux.dev, "Arnd Bergmann" <arnd@linaro.org>
Subject: Re: [TCWG CI] Failure after v6.2-rc1-1-gc476a78f19ef: ARM: remove
 CONFIG_UNUSED_BOARD_FILES
Content-Type: text/plain

On Sun, Jan 29, 2023, at 08:58, ci_notify@linaro.org wrote:
> Failure after v6.2-rc1-1-gc476a78f19ef: ARM: remove CONFIG_UNUSED_BOARD_FILES:
>
> Results changed to
> -10
> # build_abe binutils:
> -9
> # build_kernel_llvm:
> -5
> # build_abe qemu:
> -2
> # linux_n_obj:

Again, another bisection seems to have gone wrong. The patch you
listed clearly has no effect on this driver. Whatever  the CI
is doing fails to detect the root cause.

Unrelated to this, the patch I mad for fixing this bug was
merged  on Dec 23 and is part of linux-6.1-rc3.

      Arnd

> 21005
> # First few build errors in logs:
> # 00:33:08 drivers/gpu/drm/tests/drm_mm_test.c:344:12: error: stack 
> frame size (1040) exceeds limit (1024) in '__drm_test_mm_reserve' 
> [-Werror,-Wframe-larger-than]
> # 00:33:08 make[5]: *** [scripts/Makefile.build:252: 
> drivers/gpu/drm/tests/drm_mm_test.o] Error 1
> # 00:33:14 make[4]: *** [scripts/Makefile.build:504: 
> drivers/gpu/drm/tests] Error 2
> # 01:16:13 drivers/net/ethernet/mellanox/mlx5/core/en_main.c:3597:12: 
> error: stack frame size (1256) exceeds limit (1024) in 'mlx5e_setup_tc' 
> [-Werror,-Wframe-larger-than]
> # 01:16:14 make[6]: *** [scripts/Makefile.build:252: 
> drivers/net/ethernet/mellanox/mlx5/core/en_main.o] Error 1
> # 01:19:43 make[5]: *** [scripts/Makefile.build:504: 
> drivers/net/ethernet/mellanox/mlx5/core] Error 2
> # 01:19:43 make[4]: *** [scripts/Makefile.build:504: 
> drivers/net/ethernet/mellanox] Error 2
> # 01:19:43 make[3]: *** [scripts/Makefile.build:504: 
> drivers/net/ethernet] Error 2
> # 01:19:43 make[2]: *** [scripts/Makefile.build:504: drivers/net] Error 
> 2
> # 01:19:46 make[3]: *** [scripts/Makefile.build:504: drivers/gpu/drm] 
> Error 2
>
> from
> -10
> # build_abe binutils:
> -9
> # build_kernel_llvm:
> -5
> # build_abe qemu:
> -2
> # linux_n_obj:
> 21030
>
> THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, 
> REPRODUCTION INSTRUCTIONS, AND THE RAW COMMIT.
