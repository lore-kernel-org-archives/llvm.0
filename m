Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8AAC8EF;
	Fri, 28 Jul 2023 08:12:42 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::227])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 6C3F9C8F74;
	Fri, 28 Jul 2023 07:57:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 014CB20007;
	Fri, 28 Jul 2023 07:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690531053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ScMUZsSjWFnfnPG0k7Ki0OUsZkd3isIUjZzdal89Kfg=;
	b=EjBnhjUQKkvZ25HLo5W1nEJPJqG4q3xhpEP8pQc9NUQMbGmJBn4Bi3JpqZPy8mlme+bY+U
	JtNbbbBCRnfeBfY7fY4G3/9JqPCF+tX0fEM3ow2ROXTLMtdJN1WnG39xwQg43VSjAq1QQu
	KQKw1UO7wZIhYJy7z4ARlicVnS8bBLbnVmSfOmmq8z0vwBpBMPHQZDC+wWZjn8V+qU3pYe
	kEQYamoBLqW2+gAZy8ZCM2umL6kQ3DOpJTLYlCta/kaLmxSiVOHv1F5x4YSZh0JYT0N4X+
	1ERH319JSFpkTE7nvPiFjBbEkKVA5Wa5PAQgpwjMjQ+sxLRt0RFO74QdlASXqg==
Date: Fri, 28 Jul 2023 09:57:29 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: kernel test robot <lkp@intel.com>
Cc: Arseniy Krasnov <AVKrasnov@sberdevices.ru>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev
Subject: Re: [mtd:nand/next 31/32] drivers/mtd/nand/raw/meson_nand.c:244:59:
 error: initializer element is not a compile-time constant
Message-ID: <20230728095729.0acda79b@xps-13>
In-Reply-To: <202307281007.MMuVjmJ9-lkp@intel.com>
References: <202307281007.MMuVjmJ9-lkp@intel.com>
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
X-GND-Sasl: miquel.raynal@bootlin.com

Hi Arseniy,

lkp@intel.com wrote on Fri, 28 Jul 2023 10:57:07 +0800:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nan=
d/next
> head:   6680d8b67921fc732a59792dec6d3f94c031451c
> commit: 0e1db39336d8be4ddeb9f0d99720056f3ff41310 [31/32] mtd: rawnand: me=
son: support for 512B ECC step size
> config: x86_64-buildonly-randconfig-r003-20230727 (https://download.01.or=
g/0day-ci/archive/20230728/202307281007.MMuVjmJ9-lkp@intel.com/config)
> compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git =
ae42196bc493ffe877a7e3dff8be32035dea4d07)
> reproduce: (https://download.01.org/0day-ci/archive/20230728/202307281007=
.MMuVjmJ9-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202307281007.MMuVjmJ9-lkp=
@intel.com/
>=20
> All errors (new ones prefixed by >>):
>=20
> >> drivers/mtd/nand/raw/meson_nand.c:244:59: error: initializer element i=
s not a compile-time constant =20
>    static const struct nand_ecc_step_info axg_stepinfo[] =3D { axg_stepin=
fo_1024, axg_stepinfo_512 };
>                                                              ^~~~~~~~~~~~=
~~~~~
>    1 error generated.
>=20
>=20
> vim +244 drivers/mtd/nand/raw/meson_nand.c
>=20
>    243=09
>  > 244	static const struct nand_ecc_step_info axg_stepinfo[] =3D { axg_st=
epinfo_1024, axg_stepinfo_512 }; =20

Could you have a look?

Thanks,
Miqu=C3=A8l
