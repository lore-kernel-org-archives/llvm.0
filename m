Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43BC846A1
	for <llvm@lists.linux.dev>; Wed, 21 Sep 2022 14:47:32 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 256CF24000A;
	Wed, 21 Sep 2022 14:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663771644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7z2OzmJ4KIwla1j7xDlTS961KmTG9mEAzWmGpQXUWyk=;
	b=WKlYFuKpgZnWmR+wTXjf4JAWqhcrzqqtNZ7Fqo4TNizTJrG8xc+aCGYVAwlMgm7k5gncJq
	8BZmw+RMUJmKeGomPE6Zi6AgxWaS/B9cnJlc4G+33rzS5uUAiR4LohGd3rSN3EzWatW8Be
	qKlhHzcgBAza/4kWu93Hqa3OwzJT4v7Buu4yw+eGgv7Obwos23xUEIMHERR2PW2OjaRxsR
	k/h2HA+mYbVxC9QxLLTDbPRHsST4JAhr8FwhlCM+LfJr/2XX2cPtHis0guQFgBqdVwkP8c
	qWAQzedv0dDa7dcQscBMwoK3PiEPfjimvy2/a/znVjbbdVwjzs/hoFJpCqx3tw==
Date: Wed, 21 Sep 2022 16:47:19 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Valentin Korenblit <vkorenblit@sequans.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
 kbuild-all@lists.01.org, linux-kernel@vger.kernel.org, Arnd Bergmann
 <arnd@arndb.de>
Subject: Re: [mtd:nand/next 11/31]
 drivers/mtd/nand/raw/cadence-nand-controller.c:1893:4: error: implicit
 declaration of function 'ioread64_rep' is invalid in C99
Message-ID: <20220921164720.6bbc56d5@xps-13>
In-Reply-To: <7074197c-aa8d-f763-cb0f-03ea5335b923@sequans.com>
References: <202209210641.MziHAbW7-lkp@intel.com>
	<20220921104002.226ff3f6@xps-13>
	<ffde44bc-d4ae-4052-c60c-35c8775a5101@sequans.com>
	<7074197c-aa8d-f763-cb0f-03ea5335b923@sequans.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Valentin,

+ Arnd

The (erased) context of this thread:
https://lore.kernel.org/llvm/202209210641.MziHAbW7-lkp@intel.com/

vkorenblit@sequans.com wrote on Wed, 21 Sep 2022 14:27:47 +0200:

> Hi Miquel,
>=20
> I see that x86_64 doesn't support readsq/writesq because of
> CONFIG_GENERIC_IOMAP (I was building for arm64). However,
> __raw_readq/writeq are available and there are a few drivers
> using them.

I would suggest to rather try using [read|write]sq() to get rid
of the CONFIG_GENERIC_IOMAP dependency. But it looks like those
functions are not defined on 32-bit architectures anyway. So if we want
the driver to compile on both arm and aarch64, it will not be enough.

In practice, I guess we should never have the 64-bit accessor executed
when running on a 32-bit platform thanks to the following conditions:

  1885			u8 data_dma_width =3D cdns_ctrl->caps2.data_dma_width;
  1886=09
  1887			int len_in_words =3D (data_dma_width =3D=3D 4) ? len >> 2 : len >>=
 3;
  1888=09
  1889			/* read alingment data */
  1890			if (data_dma_width =3D=3D 4)
  1891				ioread32_rep(cdns_ctrl->io.virt, buf, len_in_words);
  1892			else
> 1893				ioread64_rep(cdns_ctrl->io.virt, buf, len_in_words);

So maybe we could have something awful yet simple, like the following
within the Cadence driver:

#if !CONFIG_64BIT
readsq(...) { BUG()? }
#endif

Arnd, I've seen a couple of similar issues on the mailing lists in the
past 5 years but I could not find any working solution, I don't know
how all these threads have settled in the end. I thought maybe you
would have a better idea than the above hack :)

> Do you want me to re-implement readsq and writesq in Cadence
> driver privately or do you suggest a different (cleaner) approach?

I would rather prefer to avoid this solution, as anyway I believe there
is no "generic" implementation working in all cases, there were a
couple of attempts IIRC to bring generic helpers like the above for all
architectures, but none of them landed in Linus' tree, probably because
it just cannot be made...

Thanks,
Miqu=C3=A8l
