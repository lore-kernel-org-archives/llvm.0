Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD427A
	for <llvm@lists.linux.dev>; Thu, 21 Apr 2022 13:49:24 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (unknown [217.70.183.200])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id C239EC102E
	for <llvm@lists.linux.dev>; Thu, 21 Apr 2022 13:48:16 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id EB16A20009;
	Thu, 21 Apr 2022 13:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1650548888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mkq8nOmP/hkj33Kz6ueYMGynBvEyRGCifdNeOr4fyAE=;
	b=R4QGnFTrYxq2ZhlwahioY4zA/zn54XYnkiaFuH80uixKudj1OZznXjurrZ/SIuJ1/Fvvvi
	KgVHJKPcS99Kxrb2DNlOJ1t3E6I7bf1NYF/bhkQbhkEjxXiRBxXZ/kdALIUvaTxTPktyem
	aevxoZDczXa4FKWy832UtfReOaMeWrFaoRLwV6rixEGekJRSdJlLCfY17VUYgEul8y15/w
	3+SCWPVSy51FHLCHyCFH19/VZrn7bKhUr7uDtGf9oWvIlA3oeF5vkkqPRk9y+OqTZ45k+w
	1w54vc1BRbeQ8BoFUdmfYrE87hlBVjv6ZLWVvjYpmXHrol2tqaNyKgFwJ4HxdQ==
Date: Thu, 21 Apr 2022 15:48:06 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: kernel test robot <lkp@intel.com>
Cc: Jean-Marc Eurin <jmeurin@google.com>, llvm@lists.linux.dev,
 kbuild-all@lists.01.org, linux-kernel@vger.kernel.org
Subject: Re: [mtd:mtd/next 10/11] drivers/mtd/mtdoops.c:244:39: warning:
 format specifies type 'long' but the argument has type 'unsigned int'
Message-ID: <20220421154806.52e1992b@xps13>
In-Reply-To: <202204212106.9R1ylUB7-lkp@intel.com>
References: <202204212106.9R1ylUB7-lkp@intel.com>
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

Hi Jean-Marc,

lkp@intel.com wrote on Thu, 21 Apr 2022 21:22:47 +0800:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd=
/next
> head:   f812679fab605b3d5b853ed24a81dabb222ea23a
> commit: 0629fcef16d703d384f76cb2c2c3a119a9149a34 [10/11] mtd: mtdoops: Cr=
eate a header structure for the saved mtdoops.
> config: hexagon-randconfig-r045-20220420 (https://download.01.org/0day-ci=
/archive/20220421/202204212106.9R1ylUB7-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project bac6=
cd5bf85669e3376610cfc4c4f9ca015e7b9b)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/c=
ommit/?id=3D0629fcef16d703d384f76cb2c2c3a119a9149a34
>         git remote add mtd https://git.kernel.org/pub/scm/linux/kernel/gi=
t/mtd/linux.git
>         git fetch --no-tags mtd mtd/next
>         git checkout 0629fcef16d703d384f76cb2c2c3a119a9149a34
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=
=3D1 O=3Dbuild_dir ARCH=3Dhexagon SHELL=3D/bin/bash drivers/mtd/
>=20
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>=20
> All warnings (new ones prefixed by >>):
>=20
> >> drivers/mtd/mtdoops.c:244:39: warning: format specifies type 'long' bu=
t the argument has type 'unsigned int' [-Wformat] =20
>                                   page * record_size, retlen, sizeof(hdr)=
, ret);
>                                                               ^~~~~~~~~~~
>    include/linux/printk.h:446:60: note: expanded from macro 'printk'
>    #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
>                                                        ~~~    ^~~~~~~~~~~
>    include/linux/printk.h:418:19: note: expanded from macro 'printk_index=
_wrap'
>                    _p_func(_fmt, ##__VA_ARGS__);                         =
  \
>                            ~~~~    ^~~~~~~~~~~
>    1 warning generated.

I've dropped the series for now. Please have a look at the reports and
propose a new version when this is fixed?

Thanks,
Miqu=C3=A8l
