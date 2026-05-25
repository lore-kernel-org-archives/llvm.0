Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C717E2F7F0C;
	Mon, 25 May 2026 06:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779692086; cv=none; b=gDY3TtiuNtx4cb2A9wzn+tAjJQrFjzYCgkbVpK+FHNJ1eFeoSU4HQnIPlGbl17cIp0mSW16azrMzgG0lY4Xs2Ntcq5oMPXCs2sib7z0rP8edFHZx9xas8AVnZexMgwWDSarXv8WDkvsfpsy3e/HxGk8ruXi9MC9XYKy+lgw0Hv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779692086; c=relaxed/simple;
	bh=KnWQo3kWcvCik0bv07YOk79yqQhdtr/EkBUeLqloD3s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ts/2jP9lLY5wpyn2oLJj6e0JHcp6Vk/6hYl31kSmgoTn23ZzMRPYj1RbP8EDHVCyejMWa8lddDHS29Fkc5TOpiYirtQ3TZN9Ls2Om/2CQxwznsZAhH0pYY3t8W52LBYLqUlrLS92oaaU4MkVNRdPJ/JYeidyhz9qck4tVn5M2JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RWcfMqIq; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RWcfMqIq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779692083; x=1811228083;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=KnWQo3kWcvCik0bv07YOk79yqQhdtr/EkBUeLqloD3s=;
  b=RWcfMqIqYW0ndZHEeLZGxfGIjSD9UdYxhCLeSUV/zahDQyd1B/777kGk
   x5+/9osr/Sp+yv79BJiXHBqfwXdaDTrwDREFr5qSF8EqEgtQ0Kq2LYPRX
   npLRNZcr4NQiDj5TkI8QwTwlNx8sPBJQWp5TP6eWqjrrb+VSxgvLfndm1
   wdvOhqIJBl/9xcLQRYIdJDRrmW8O75uy5dxUirnZiIjjWBNVFtqP3RnmU
   IbMWFpT0zioJmAORL7+UfUas1g080nT8rLBEj93QdsFG+xd3zKkfMVHOI
   juacNK0FYS5MJ06TTdhecFjjHyVhGCcfbpTUCIcc7X737VDIpQuO1q9AN
   w==;
X-CSE-ConnectionGUID: q9ZTNh62TQKOZ+g0brcgsA==
X-CSE-MsgGUID: WgFMDEXxSry0yw4KRB5wjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11796"; a="80628031"
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; 
   d="scan'208";a="80628031"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2026 23:54:42 -0700
X-CSE-ConnectionGUID: 07DeJTjUSR2v5bClPMMstA==
X-CSE-MsgGUID: 7pI3GzhwSPqTUM3IvQ/OPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; 
   d="scan'208";a="235163703"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 24 May 2026 23:54:40 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRPCw-000000001BK-0OCb;
	Mon, 25 May 2026 06:54:38 +0000
Date: Mon, 25 May 2026 14:54:14 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-05-22 254/254]
 sound/soc/intel/avs/boards/pcm3168a.c:115:35: warning: variable 'card' is
 uninitialized when used here
Message-ID: <202605251422.lO4uuYRc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/morimoto/linux sound-cleanup-2026-05-22
head:   65ed982efb72231d8feca201fdeb06adb64515a0
commit: 6aeffb844883a34370f83da1c9c96a0a66003076 [254/254] ASoC: intel: avs=
: pcm3168a: use snd_soc_card_register()
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/202605=
25/202605251422.lO4uuYRc-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f022=
7cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260525/202605251422.lO4uuYRc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605251422.lO4uuYRc-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/intel/avs/boards/pcm3168a.c:115:35: warning: variable 'card' i=
s uninitialized when used here [-Wuninitialized]
     115 |         ret =3D avs_create_dai_links(dev, &card->dai_link, &card=
->num_links);
         |                                          ^~~~
   sound/soc/intel/avs/boards/pcm3168a.c:103:27: note: initialize the varia=
ble 'card' to silence this warning
     103 |         struct snd_soc_card *card;
         |                                  ^
         |                                   =3D NULL
   1 warning generated.


vim +/card +115 sound/soc/intel/avs/boards/pcm3168a.c

79ebb596201c86 Cezary Rojewski    2025-02-03   97 =20
79ebb596201c86 Cezary Rojewski    2025-02-03   98  static int avs_pcm3168a_=
probe(struct platform_device *pdev)
79ebb596201c86 Cezary Rojewski    2025-02-03   99  {
091614d1c57193 Amadeusz S=C5=82awi=C5=84ski 2025-04-07  100  	struct snd_so=
c_acpi_mach *mach;
091614d1c57193 Amadeusz S=C5=82awi=C5=84ski 2025-04-07  101  	struct avs_ma=
ch_pdata *pdata;
79ebb596201c86 Cezary Rojewski    2025-02-03  102  	struct device *dev =3D =
&pdev->dev;
79ebb596201c86 Cezary Rojewski    2025-02-03  103  	struct snd_soc_card *ca=
rd;
6aeffb844883a3 Kuninori Morimoto  2026-05-21  104  	struct snd_soc_card_dri=
ver *card_driver;
6aeffb844883a3 Kuninori Morimoto  2026-05-21  105  	char *card_name =3D NUL=
L, *long_name =3D NULL, *driver_name =3D NULL;
79ebb596201c86 Cezary Rojewski    2025-02-03  106  	int ret;
79ebb596201c86 Cezary Rojewski    2025-02-03  107 =20
091614d1c57193 Amadeusz S=C5=82awi=C5=84ski 2025-04-07  108  	mach =3D dev_=
get_platdata(dev);
091614d1c57193 Amadeusz S=C5=82awi=C5=84ski 2025-04-07  109  	pdata =3D mac=
h->pdata;
091614d1c57193 Amadeusz S=C5=82awi=C5=84ski 2025-04-07  110 =20
6aeffb844883a3 Kuninori Morimoto  2026-05-21  111  	card_driver =3D devm_kz=
alloc(dev, sizeof(*card_driver), GFP_KERNEL);
6aeffb844883a3 Kuninori Morimoto  2026-05-21  112  	if (!card_driver)
79ebb596201c86 Cezary Rojewski    2025-02-03  113  		return -ENOMEM;
79ebb596201c86 Cezary Rojewski    2025-02-03  114 =20
79ebb596201c86 Cezary Rojewski    2025-02-03 @115  	ret =3D avs_create_dai_=
links(dev, &card->dai_link, &card->num_links);
79ebb596201c86 Cezary Rojewski    2025-02-03  116  	if (ret)
79ebb596201c86 Cezary Rojewski    2025-02-03  117  		return ret;
79ebb596201c86 Cezary Rojewski    2025-02-03  118 =20
091614d1c57193 Amadeusz S=C5=82awi=C5=84ski 2025-04-07  119  	if (pdata->ob=
solete_card_names) {
6aeffb844883a3 Kuninori Morimoto  2026-05-21  120  		card_name =3D "avs_pcm=
3168a";
091614d1c57193 Amadeusz S=C5=82awi=C5=84ski 2025-04-07  121  	} else {
6aeffb844883a3 Kuninori Morimoto  2026-05-21  122  		driver_name =3D "avs_p=
cm3168a";
6aeffb844883a3 Kuninori Morimoto  2026-05-21  123  		long_name =3D card_nam=
e =3D "AVS I2S PCM3168A";
091614d1c57193 Amadeusz S=C5=82awi=C5=84ski 2025-04-07  124  	}
6aeffb844883a3 Kuninori Morimoto  2026-05-21  125 =20
6aeffb844883a3 Kuninori Morimoto  2026-05-21  126  	card_driver->name =3D d=
river_name;
6aeffb844883a3 Kuninori Morimoto  2026-05-21  127  	card_driver->dapm_widge=
ts =3D card_widgets;
6aeffb844883a3 Kuninori Morimoto  2026-05-21  128  	card_driver->num_dapm_w=
idgets =3D ARRAY_SIZE(card_widgets);
6aeffb844883a3 Kuninori Morimoto  2026-05-21  129  	card_driver->dapm_route=
s =3D card_routes;
6aeffb844883a3 Kuninori Morimoto  2026-05-21  130  	card_driver->num_dapm_r=
outes =3D ARRAY_SIZE(card_routes);
6aeffb844883a3 Kuninori Morimoto  2026-05-21  131  	card_driver->fully_rout=
ed =3D true;
6aeffb844883a3 Kuninori Morimoto  2026-05-21  132 =20
6aeffb844883a3 Kuninori Morimoto  2026-05-21  133  	card =3D devm_snd_soc_c=
ard_alloc(dev, THIS_MODULE, card_driver,
6aeffb844883a3 Kuninori Morimoto  2026-05-21  134  				       card_name, lo=
ng_name, NULL);
6aeffb844883a3 Kuninori Morimoto  2026-05-21  135  	if (!card)
6aeffb844883a3 Kuninori Morimoto  2026-05-21  136  		return -ENOMEM;
6aeffb844883a3 Kuninori Morimoto  2026-05-21  137 =20
6aeffb844883a3 Kuninori Morimoto  2026-05-21  138  	return devm_snd_soc_car=
d_register(card);
79ebb596201c86 Cezary Rojewski    2025-02-03  139  }
79ebb596201c86 Cezary Rojewski    2025-02-03  140 =20

:::::: The code at line 115 was first introduced by commit
:::::: 79ebb596201c86712fe38b0ef73d25d07b932664 ASoC: Intel: avs: Add pcm31=
68a machine board

:::::: TO: Cezary Rojewski <cezary.rojewski@intel.com>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
