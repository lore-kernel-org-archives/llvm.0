Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41732F28
	for <llvm@lists.linux.dev>; Wed,  2 Feb 2022 21:31:54 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 69D68100003;
	Wed,  2 Feb 2022 21:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1643837513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ck01TfGCbXI5iRbQk6CNxchBoOVAYhSCtSFRw6kvyPo=;
	b=a5GIl4KKJFJWBcGCXe+4aGdOMjpOk/RE+kxOXB0KhvAqpViEhQJuhrzLECjd8gtPegRu7g
	KS2HobdjnwPirW6Ghv7jKD2q88ZH43e7QJwie8j86yQ6uBuLVaS3pFJwjVefeT1GTEx+EI
	29ftYV8U6MpnldUA5kEQFPgnlQgpn+nl2UVC9ADhda6m3A5PNsoghcJfr/28SGGdVQimsN
	LnxJSxnaka3TVOajuvEOvMfqJj2BN0pM2HXwECFR8MiNg1PtDmj/Zng8jvLrB1V5jG0iEJ
	yy3majIxI38wC3AwDMqLzsIojPvxabe7dcnj4oi1Q+tAFvofu16FgVlx5u4pBQ==
Date: Wed, 2 Feb 2022 22:31:49 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
 kbuild-all@lists.01.org, linux-kernel@vger.kernel.org
Subject: Re: [mtd:spi-mem-ecc 30/30] ld.lld: error: undefined symbol:
 nand_ecc_unregister_on_host_hw_engine
Message-ID: <20220202223149.25ddc760@xps13>
In-Reply-To: <YfrHs81VGzUggPC6@sirena.org.uk>
References: <202202011308.a6RlPiGp-lkp@intel.com>
	<20220202154504.7737deed@xps13>
	<YfqhJZ+BzfMrpN4Y@sirena.org.uk>
	<20220202163452.746d50ca@xps13>
	<YfquJwtbg/hF5WJF@sirena.org.uk>
	<20220202183500.7e4ef7cb@xps13>
	<YfrHs81VGzUggPC6@sirena.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Mark,

broonie@kernel.org wrote on Wed, 2 Feb 2022 18:04:35 +0000:

> On Wed, Feb 02, 2022 at 06:35:00PM +0100, Miquel Raynal wrote:
>=20
> > > depends on MTD=3Dy if SPI_MXC=3Dy =20
>=20
> > In this case I believe we should also add =20
>=20
> > depends on MTD=3Dm if SPI_MXC=3Dm ? =20
>=20
> It doesn't specifically need MTD to be a module so just a straight
> dependency should be fine I guess.
>=20
> > Anyway, this would force building the ECC support (and MTD...) even
> > though we don't need it in most cases. =20
>=20
> > My idea was to give people the right to only select SPI_MXIC without
> > really caring about MTD/ECC support at all because this is IMHO a
> > valid use case. We would then save a few kiB of extra MTD fat. =20
>=20
> Is that something that people actually do - does this controller get
> used without the MTD functionality?  Most of these controllers seem to
> be really bad generic SPI controllers that would rarely get used for
> anything other than MTD devices, if this one is a useful generic
> controller your approach makes more sense although I do worry about
> people getting noticably worse performance if they don't build MTD in.

This one in particular really is a SPI controller, and can really be
used without MTD at all. I don't know how good are the performances
with it but it is sure that there is no performance hit when the MTD
stack is not pulled in.

Also, for the example I mentioned CONFIG_MTD but in fact I simplified a
bit the situation as this driver is actually implying
CONFIG_MTD_NAND_ECC which selects CONFIG_MTD_NAND_CORE.

CONFIG_MTD_NAND_CORE is a subset of MTD. Building this subset
really is not needed when playing with eg. a SPI-NOR. And even with a
SPI-NAND which would require CONFIG_MTD_NAND_CORE anyway, it would not
be necessarily to have CONFIG_MTD_NAND_ECC enabled because most NANDs
have on-die support for it and thus do not need extra code to handle
bitflips.

That is the reason why I felt a bit puzzled in the first place by the
need to pull all MTD in a build which would select this SPI controller
driver.

Thanks,
Miqu=C3=A8l
