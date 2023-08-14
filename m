Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E76D100AA;
	Mon, 14 Aug 2023 22:16:06 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 1B4CC3200077;
	Mon, 14 Aug 2023 18:16:05 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Mon, 14 Aug 2023 18:16:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1692051364; x=1692137764; bh=QJ
	R51bEkCKpwnjQrYK4r+uAxugleJLFkM5RBAQVFZzA=; b=eeFEmiurDO61mEve4C
	488V5ji40gpfYeCUvSTKtz5nYsgBaFUBDsWlkunf7pN61aNk862VyLSUUWSZqZBX
	zxnKC2WYRCsqtsQQE8Vn3jC6ThHJfZ4/Ss2bznW13i/L/ZujIboUeLzDApb66thR
	5swZeyXZB204adklfjmpGjxWZZT/kqY9jWM/xhp1Efa5Okb4XSFSDDeFAmtDeAN7
	QqC9nFbwnoN+mZrnAdG52FQ+D0Qgn8N2yJYNDcQ7R83SqXtcw20ufGRvkLzgYxs2
	BimOksVeAUKP7fxQZTzqNJw3VOzqcVE14RV23G3QDT/2F/Hb1J/ZdFSuBbQ82Fp4
	mMQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1692051364; x=1692137764; bh=QJR51bEkCKpwn
	jQrYK4r+uAxugleJLFkM5RBAQVFZzA=; b=1D+n2vZhcl2w+3uepuBkQnfSJ9czi
	rq2ciqNxbEHux6/TrDiE+mBIO4tnM9uKXz0PqRbCLddHQLGC4yMhL7RTPu5Pu8YX
	81FFUcZk+GDeLx/0A7m8SDlcoVsYsdDAP5gTuAt6KBNf+ws2a7Dax8OH+Q2N2veX
	6MWWiAUC/143UiSO2iitjSo/2zeD8mfHRAifvYGmaOjGvuL3Hk3W4L9YJbqNgWyN
	g4P4cGtHczVQFw/AGa6oSdJM9EjpZC4sPNAC0bgjAWCfgSABiC7G1aalzxMXEhD5
	38/gsyN/yKqIb2T8iz/59SwvZD8gdRx64iohPTem/Uto+7Xxi6orYloYw==
X-ME-Sender: <xms:pKfaZBLhJ4rGgrrBJYGQL_zs8brXJHihdZ7Dxhenr4BPraD6L7qpwQ>
    <xme:pKfaZNIcvwek92Zuw_lYyahVHt7SabnayS2CZr70GM3FcDtY_mBqTRdQz9Cwx9b4n
    N-a5sUF4NHqe59w6wg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedruddtiedgtdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:pKfaZJtJPKUwSpJ8OP7dcvBHIdMJkKFHtbQAKW4r7-5apIhf6Wu8Xw>
    <xmx:pKfaZCYFlA6-MxIy6EY3mvoxWB1RLIR5aJubMzG3iPKT75XR7VBWmw>
    <xmx:pKfaZIYZ8iB0GspwqkY0h8F2QS9EadQoxOmru0dACWBw91edxuhQbw>
    <xmx:pKfaZAGwU_c6tqni_wpkBl4igfzW2Sms2SBrwYwKlGNSNBADH6bgqQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 42AFDB60089; Mon, 14 Aug 2023 18:16:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-624-g7714e4406d-fm-20230801.001-g7714e440
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-Id: <7dfa4337-fc2f-4a02-a12e-f94feca7362b@app.fastmail.com>
In-Reply-To: <ZNql2TqaVFnMKlzJ@shell.armlinux.org.uk>
References: <202308150547.m54XHV12-lkp@intel.com>
 <ZNql2TqaVFnMKlzJ@shell.armlinux.org.uk>
Date: Tue, 15 Aug 2023 00:15:43 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Russell King" <linux@armlinux.org.uk>,
 "Ard Biesheuvel" <ardb@kernel.org>, "kernel test robot" <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [arm:for-next 4/4] arch/arm/vfp/vfpmodule.c:324:13: error: static
 declaration of 'VFP_bounce' follows non-static declaration
Content-Type: text/plain

On Tue, Aug 15, 2023, at 00:08, Russell King (Oracle) wrote:
> On Tue, Aug 15, 2023 at 05:06:03AM +0800, kernel test robot wrote:
>>    1 error generated.
>
> I'm guessing this is a conflict between Arnd's patch
>
> ae1f8d793a19 ("ARM: 9304/1: add prototype for function called only from asm")
>
> merged in v6.5-rc1 and Ard's patch, and that part of Arnd's patch
> needs to be reverted since VFP_bounce is now static. Agreed?

Yes, with Ard's change, the prototype I added is neither required nor correct.

My series contained another patch that added a prototype for
vfp_entry(), and this is also obsoleted by Ard's series, but you
did not merge it anyway, so it's all good on that one.

      Arnd
