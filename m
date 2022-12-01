Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B72746B;
	Thu,  1 Dec 2022 16:23:04 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (unknown [217.70.183.198])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 9C519CFB0C;
	Thu,  1 Dec 2022 16:13:42 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 3A755C0005;
	Thu,  1 Dec 2022 16:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1669911214;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iz6LqZNPS0aBWMmTuZjugUJg8+g3aUv6Y3WZkCQjMkQ=;
	b=WpUF6RVuK5ycXMz/AtC1/CKhbkNJHz9rf56zlpex5/jIMkF2W7B5ZsYys3Os1ynDtV3cvN
	Jwa9BJ8jOsAkT+ri1iEdHy2lN60cw0YNk7EiHN23LKzq1HVknPKjgZOB8zpv/xWMQMOIk0
	oTooFDVw0eIT6xa724U2dvukvH5L/4/Woftvp+ybSe14DZWC4QNCY9Auo8l3RmQwKDdzaM
	F0RCLiFHlcT5Ga7+FGfVDmWBp+hd7TjSKW+DonAQuZWK+1mGSgXiinjjfAJ2CCMDSMMJCj
	PnNV3VD+XFBuQthKS7g+s9TtFoYGWMVFA+tJEzNz4iXdvI/UaoqDBoacSkib4g==
Date: Thu, 1 Dec 2022 17:13:31 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: kernel test robot <lkp@intel.com>, Mikhail Zhilkin
 <csharper2005@gmail.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, NOGUCHI
 Hiroshi <drvlabo@gmail.com>
Subject: Re: ld.lld: error: undefined symbol: __udivdi3
Message-ID: <20221201171331.42f05097@xps-13>
In-Reply-To: <Y4jPubD53yN32OUL@dev-arch.thelio-3990X>
References: <202212010140.pIueEBNb-lkp@intel.com>
	<20221201091610.524f7786@xps-13>
	<Y4jPubD53yN32OUL@dev-arch.thelio-3990X>
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

Hi Nathan,

nathan@kernel.org wrote on Thu, 1 Dec 2022 09:00:57 -0700:

> On Thu, Dec 01, 2022 at 09:16:10AM +0100, Miquel Raynal wrote:
> > Hi Mikhail, Hiroshi,
> >=20
> > lkp@intel.com wrote on Thu, 1 Dec 2022 01:46:36 +0800:
> >  =20
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linu=
x.git master
> > > head:   01f856ae6d0ca5ad0505b79bf2d22d7ca439b2a1
> > > commit: 9b78ef0c7997052e9eaa0f7a4513d546fa17358c mtd: parsers: add su=
pport for Sercomm partitions
> > > date:   6 months ago
> > > config: mips-randconfig-r033-20221128
> > > compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project =
6e4cea55f0d1104408b26ac574566a0e4de48036)
> > > reproduce (this is a W=3D1 build):
> > >         wget https://raw.githubusercontent.com/intel/lkp-tests/master=
/sbin/make.cross -O ~/bin/make.cross
> > >         chmod +x ~/bin/make.cross
> > >         # install mips cross compiling tool for clang build
> > >         # apt-get install binutils-mipsel-linux-gnu
> > >         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/li=
nux.git/commit/?id=3D9b78ef0c7997052e9eaa0f7a4513d546fa17358c
> > >         git remote add linus https://git.kernel.org/pub/scm/linux/ker=
nel/git/torvalds/linux.git
> > >         git fetch --no-tags linus master
> > >         git checkout 9b78ef0c7997052e9eaa0f7a4513d546fa17358c
> > >         # save the config file
> > >         mkdir build_dir && cp config build_dir/.config
> > >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cros=
s W=3D1 O=3Dbuild_dir ARCH=3Dmips SHELL=3D/bin/bash
> > >=20
> > > If you fix the issue, kindly add following tag where applicable
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > >=20
> > > All errors (new ones prefixed by >>):
> > >  =20
> > > >> ld.lld: error: undefined symbol: __udivdi3   =20
> > >    >>> referenced by scpart.c
> > >    >>>               mtd/parsers/scpart.o:(scpart_parse) in archive d=
rivers/built-in.a   =20
> > >  =20
> >=20
> > Can you please try to reproduce this with a mips toolchain as advised
> > and send a fix? =20
>=20
> For what it's worth, this is likely our bug:
>=20
> https://github.com/ClangBuiltLinux/linux/issues/1635
>=20
> It sounds like there are some merged LLVM patches that should help but I
> guess not based on this report...

Ah, yeah, thanks a lot for the share.

Cheers, Miqu=C3=A8l
