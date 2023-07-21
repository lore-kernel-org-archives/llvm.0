Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD8FECD;
	Fri, 21 Jul 2023 08:38:45 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 74BCE5C015A;
	Fri, 21 Jul 2023 04:38:43 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Fri, 21 Jul 2023 04:38:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1689928723; x=1690015123; bh=9x
	bAbWLOgyrqFZxhBvP3PsKKyJSMYggcHNnXEaR30rs=; b=Cx7KEx2qISeRAL6nJ0
	WmoTheQoFT4V0vpCfO0LnITx51wVeDwORR7HL7qhtt4x/zQ+/FnEYpNCMLgIcvi0
	wPOfPe11htgTKnJOmJWc2nGhk3Ohdm29Dl0CxemNUS2lFihsxSuWTw86771Q8hST
	4uzUdd1vPmJW4DZGAFa4DkXI+7wg4M5ElG0eydmr0ewtL69pD4/PRf5abC9b+yQK
	XpS0cdFwCmF1eMT/qoQq6hgKn0lRsyXV7xlMqGf2Xjs8zeP2UWcjCi8bAH2+gfl/
	l6M0Bz0TwetF1JcciqjADWntLmmD3ZE8sc2euRxaQ7Bl493jmIzw+e71uNxIakgF
	TwgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1689928723; x=1690015123; bh=9xbAbWLOgyrqF
	ZxhBvP3PsKKyJSMYggcHNnXEaR30rs=; b=pcMdRE7jZH3mU/l9PqDO3ncOnnSTe
	LSJC80doOPeSpCvXNvOSlvBx+afo7NVoOTwr1ROCu31cnU2ubx4u4ZKR1Qlqxy8f
	maDmgM2KBxYfiY+F+iWN+HunoxPuUkTugx8XLvrdWtUi8BHmQgjymOBD/TXwT7g0
	KWmNDlxkuhuyUYWN3aWCe1H2bs12BubMHltubb98KIL4PFX5s1CRyc+rfEc5Ai03
	+QfjoS1rxasgQKaxSFSGVf1xQHui5Gm8aKhtqLpsE+86Z3LAh0CAsT2F96xh/s14
	VWlHbuhQLRcjSrba8U7CMqFtHBWn2EaT2eA46X/QebfigZ7RUXsk1uBCQ==
X-ME-Sender: <xms:EkS6ZMgienXk8JjEfpgFlvY5X9pkSc9AbG43tU2kur0_UuAw2M_jnA>
    <xme:EkS6ZFCbloiQE3vOnLZuhn1hfV6lyrJnlP7LgCwXr24xOv8pM6QcyW5gUOSSDdtTL
    z8xDU5D2Y7JLPxYLOs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrhedvgddtfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:EkS6ZEFZyvz2M_zmqOjwIIZtuzZWJXtTRgMZAhZoOi5b2TpkpDc9LQ>
    <xmx:EkS6ZNTSJ1kvuNceVcqk_YWWdZWJBtYJeIR_O5aazJTtlOQDQXLgOg>
    <xmx:EkS6ZJwAEy3EHVhfD9GGhaPy63AcO8hLQy5Ex8Mv4pbfVmCnnrvSKQ>
    <xmx:E0S6ZB9G6fJ4Qf5Ii-X-43JluDJPbcFXMxZFbvRUkha_Cc9Xr7g2jQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 8BB29B60089; Fri, 21 Jul 2023 04:38:42 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-531-gfdfa13a06d-fm-20230703.001-gfdfa13a0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-Id: <5107c48f-7d91-498c-9cc0-7609b361878d@app.fastmail.com>
In-Reply-To: <20230621130552.00001574@Huawei.com>
References: <202306211545.7b6CdqsL-lkp@intel.com>
 <CAHp75VcNj-P_WCvx2Pf9sj_ir2oKf2AZ-mdTP=KHSuPY7WcjeA@mail.gmail.com>
 <010ac7c3707f4eb0aef285b5e823f8e3@analog.com>
 <20230621130552.00001574@Huawei.com>
Date: Fri, 21 Jul 2023 10:38:22 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jonathan Cameron" <Jonathan.Cameron@Huawei.com>,
 "Kim Seer Paller" <KimSeer.Paller@analog.com>
Cc: "Andy Shevchenko" <andy.shevchenko@gmail.com>,
 "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
 "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
 "kernel test robot" <lkp@intel.com>
Subject: Re: [jic23-iio:testing 6/10] drivers/iio/adc/max14001.c:135:13: warning:
 result of comparison of constant 18446744073709551615 with expression of type
 'typeof (_Generic((mask), char: (unsigned char)0, unsigned char: (unsigned
 char)0, signed char: (unsi...
Content-Type: text/plain

On Wed, Jun 21, 2023, at 14:05, Jonathan Cameron wrote:

> It's only called from one place, I'd just put the code inline so that the
> constant nature of that variable is explicit.  Or pass in the FIELD_PREP()
> value rather than computing it in the function.

As far as I understand it, clang warnings are intentionally generated
without taking constant-folding across inline functions into account,
in order to be completely reproducible regardless of optimization level,
while gcc generates most warnings after inlining and constant folding
in order to better analyze what actually happens.

     Arnd
