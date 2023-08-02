Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5521863B1;
	Wed,  2 Aug 2023 12:46:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4656440002;
	Wed,  2 Aug 2023 12:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690980404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cVTldcbbPgJzCZAyPVUaTznIo/cxygxAPNS8Ayeoui4=;
	b=G+sQNZprV2IpUHiP3QW5ps4HqkIRy/VLtA4fPayqEbu5mOZOD8M32P3qGb6TSjJijF9VHI
	ostbsJE31JUOee3+DFwMf63RrGNEDRMIcdpRi3/PQBu3E1S/bCUp8VhqseUmhkHKK8/EIr
	RSKQgxlj77VXtPuKPPeMykSyX4DMuoVaL0Z1/43K3mgCr+1cvq3OzkkKXM7rn9d+e7EArf
	awplI3aFY4kLWZiZ38ZIOjRNuEbrre2CG1zC8gbg3iE8gMVx/n32yVomH58oTv5RFHEGTs
	coj0QLeb03McHGR5yxgO4H1T6zrF44Oya5kaPQt9/9r6B6zPH7Oxc4cTis7IIg==
Date: Wed, 2 Aug 2023 14:46:42 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v7 7/7] nvmem: core: Expose cells through sysfs
Message-ID: <20230802144642.3d003c2e@xps-13>
In-Reply-To: <202308021505.FG8g7tZG-lkp@intel.com>
References: <20230801182132.1058707-8-miquel.raynal@bootlin.com>
	<202308021505.FG8g7tZG-lkp@intel.com>
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

Hello,

lkp@intel.com wrote on Wed, 2 Aug 2023 15:40:10 +0800:

> Hi Miquel,
>=20
> kernel test robot noticed the following build warnings:
>=20
> [auto build test WARNING on char-misc/char-misc-testing]
> [also build test WARNING on char-misc/char-misc-next char-misc/char-misc-=
linus linus/master v6.5-rc4 next-20230801]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>=20
> url:    https://github.com/intel-lab-lkp/linux/commits/Miquel-Raynal/nvme=
m-core-Create-all-cells-before-adding-the-nvmem-device/20230802-022331
> base:   char-misc/char-misc-testing
> patch link:    https://lore.kernel.org/r/20230801182132.1058707-8-miquel.=
raynal%40bootlin.com
> patch subject: [PATCH v7 7/7] nvmem: core: Expose cells through sysfs
> config: x86_64-randconfig-x005-20230731 (https://download.01.org/0day-ci/=
archive/20230802/202308021505.FG8g7tZG-lkp@intel.com/config)
> compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git =
ae42196bc493ffe877a7e3dff8be32035dea4d07)
> reproduce: (https://download.01.org/0day-ci/archive/20230802/202308021505=
.FG8g7tZG-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308021505.FG8g7tZG-lkp=
@intel.com/
>=20
> All warnings (new ones prefixed by >>):
>=20
> >> drivers/nvmem/core.c:2264:1: warning: unused label 'del_cells' [-Wunus=
ed-label] =20
>    del_cells:
>    ^~~~~~~~~~
>    1 warning generated.

This warning triggers with CONFIG_NVMEM_SYSFS=3Dn, I'll fix that.
I'll wait a bit anyway to get some feedback about the new approach.

>=20
>=20
> vim +/del_cells +2264 drivers/nvmem/core.c
>=20
>   2261=09
>   2262		return 0;
>   2263=09
> > 2264	del_cells: =20
>   2265		nvmem_device_remove_all_cells(nvmem);
>   2266	put_layout:
>   2267		nvmem_layout_put(nvmem->layout);
>   2268		return ret;
>   2269	}
>   2270=09
>=20


Thanks,
Miqu=C3=A8l
