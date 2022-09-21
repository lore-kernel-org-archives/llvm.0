Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4797C
	for <llvm@lists.linux.dev>; Wed, 21 Sep 2022 08:40:15 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 92580FF808;
	Wed, 21 Sep 2022 08:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663749607;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oH68prWr+K6M/+VJN9mzBk6EPAXOvKLVuiYE0zxGZhw=;
	b=Y/YVy0AYv5xSD1rLRsws62bKktXHFgH5j56412XfcXvwjPG+kKQGANrM/mpAYWax33jv2S
	vZzKtPKH1DKS811KpQ7LvZW+sO5WIuAp/JgtRkF1Orq00jY70w17oH9k8NT327PMHKLA0j
	1zPqh/K56pYtNqn0uaOOywpbBcTXbYam11imD4zg8DuRHTuPv8ZcSchelLO0MnkjrTwhgk
	5ewiaDtCC67j0mVFvU/LUhVqOAC851zBtzT1+IzluBFwpXbrNqZMaoE4iUZwI7z6IZBESm
	UCCyrMrOGXzC0KDXzr42t4rsLd0h3G9FAflmPwHC0xAMU9KdPmpGWGbovQINhA==
Date: Wed, 21 Sep 2022 10:40:02 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: kernel test robot <lkp@intel.com>
Cc: Valentin Korenblit <vkorenblit@sequans.com>, llvm@lists.linux.dev,
 kbuild-all@lists.01.org, linux-kernel@vger.kernel.org
Subject: Re: [mtd:nand/next 11/31]
 drivers/mtd/nand/raw/cadence-nand-controller.c:1893:4: error: implicit
 declaration of function 'ioread64_rep' is invalid in C99
Message-ID: <20220921104002.226ff3f6@xps-13>
In-Reply-To: <202209210641.MziHAbW7-lkp@intel.com>
References: <202209210641.MziHAbW7-lkp@intel.com>
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

lkp@intel.com wrote on Wed, 21 Sep 2022 06:31:23 +0800:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nan=
d/next
> head:   63de24fccb6b831be1abfe07292449105b467731
> commit: 7e7dc04774b18c0e42ce74aa3357021cda979674 [11/31] mtd: rawnand: ca=
dence: support 64-bit slave dma interface
> config: x86_64-randconfig-a001 (https://download.01.org/0day-ci/archive/2=
0220921/202209210641.MziHAbW7-lkp@intel.com/config)
> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c=
006a5895fc0e329fe15fead81e37457cb1d1)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/c=
ommit/?id=3D7e7dc04774b18c0e42ce74aa3357021cda979674
>         git remote add mtd https://git.kernel.org/pub/scm/linux/kernel/gi=
t/mtd/linux.git
>         git fetch --no-tags mtd nand/next
>         git checkout 7e7dc04774b18c0e42ce74aa3357021cda979674
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=
=3D1 O=3Dbuild_dir ARCH=3Dx86_64 SHELL=3D/bin/bash drivers/mtd/nand/raw/
>=20
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
>=20
> All errors (new ones prefixed by >>):
>=20
> >> drivers/mtd/nand/raw/cadence-nand-controller.c:1893:4: error: implicit=
 declaration of function 'ioread64_rep' is invalid in C99 [-Werror,-Wimplic=
it-function-declaration] =20
>                            ioread64_rep(cdns_ctrl->io.virt, buf, len_in_w=
ords);
>                            ^
> >> drivers/mtd/nand/raw/cadence-nand-controller.c:1962:4: error: implicit=
 declaration of function 'iowrite64_rep' is invalid in C99 [-Werror,-Wimpli=
cit-function-declaration] =20
>                            iowrite64_rep(cdns_ctrl->io.virt, buf, len_in_=
words);
>                            ^
>    2 errors generated.

I've dropped your patch from nand/next, here you can check what's
missing in the configuration, should not be too hard to solve. Once
done, you can send a new version of the patch.

Thanks,
Miqu=C3=A8l
