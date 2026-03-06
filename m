Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DC13ED5D0;
	Fri,  6 Mar 2026 19:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772825385; cv=none; b=dCgrzBNuLZyiZ9MxeXvcBRLLraCSTjL+bBOoCf9znVSwBhJ5r0XDSNu+R0gR+bd/G/Iw2h6Ye78gDPzHbvnVh6LwYnt1KkSqf0psqAetstX/SQAdbNVJmS5q+ROBWDbvvB6IZoUA2b7h8Lf4SqnIRYwq62iDDztjz0fT2aKlVXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772825385; c=relaxed/simple;
	bh=uTRYiBb0yE2NuRsV1GylJH9VCT4et0wRBglhvrD5Ayk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Jwx8sz4aEWp7FVhF7rwX7kyPwkaeSM/V3XcXEczcxZrRFLMeTdMhv3Yyb8JVK5AnKSKBVhedFoW3R3W/9SIF9vJKAIi/9CmDyEBwy9Z5JizPmlvp+mOm7H5uuF5mFBb6kLEm7kzvhCL5CplA3vR/dyUnfz408etm1xK1FRa9IO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nY/H1Vgc; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nY/H1Vgc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772825385; x=1804361385;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=uTRYiBb0yE2NuRsV1GylJH9VCT4et0wRBglhvrD5Ayk=;
  b=nY/H1VgcRBWLvZ49g+qFsY/+RwSo0ruRILBmVJ5pFWdI2GGQziXpZh2N
   EycBUokUSmJUh/QiFQSfX79YZ7TBQHRMdF1guol18IFjhaxYHTNJfZ+sX
   SKiu7qiWzzMovTnkBy0fcldLo4gEsoT6sJnSaiv7juT/V7W1HImQ98qr6
   rllRJ2qMfqg+R0stk0YkHgvXwPMQzWjG2tJ9vffDhn/3GuSPz1T+n9jo0
   C1vLrp0qh2bD4HZCFBPw2cg9NbQWko5R8edmnot91FPDAuA9KR0sPvW0S
   oJtpE5HYaBCjRlTB7PY7F6mP9OsdwM0aRozCAzr9XEeiLtgejTFLBzKJX
   Q==;
X-CSE-ConnectionGUID: 5Q1r3rl6ScGociKXx/hNHA==
X-CSE-MsgGUID: 8h0hsD4tS6iwdnpZnhHUaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="84651920"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="84651920"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 11:29:44 -0800
X-CSE-ConnectionGUID: Cjlle7F9QHOjaCiQaXNVag==
X-CSE-MsgGUID: DjTsS5irRC2kIqkkArr8Tw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 06 Mar 2026 11:29:42 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyark-000000001JB-12LD;
	Fri, 06 Mar 2026 19:29:40 +0000
Date: Sat, 07 Mar 2026 03:29:10 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-03-04-3 79/79]
 sound/soc/tegra/tegra_wm8962.c:80:50: error: incomplete definition of type
 'struct snd_soc_dai'
Message-ID: <202603070342.p8xGMhAo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/morimoto/linux sound-cleanup-2026-03-04-3
head:   778b9472f0c90f749c084257e0893772fd5ff6ac
commit: 798582c384840a76b6ed244f493279dc13151eb2 [79/79] move struct dai
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260=
307/202603070342.p8xGMhAo-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c32=
caeec8158d634bb71ab8911a6031248b9fc47)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260307/202603070342.p8xGMhAo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603070342.p8xGMhAo-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

>> sound/soc/tegra/tegra_wm8962.c:80:50: error: incomplete definition of ty=
pe 'struct snd_soc_dai'
      80 |                 struct snd_soc_component *component =3D codec_da=
i->component;
         |                                                       ~~~~~~~~~^
   include/sound/soc.h:413:8: note: forward declaration of 'struct snd_soc_=
dai'
     413 | struct snd_soc_dai;
         |        ^
   sound/soc/tegra/tegra_wm8962.c:105:49: error: incomplete definition of t=
ype 'struct snd_soc_dai'
     105 |         struct snd_soc_component *component =3D codec_dai->compo=
nent;
         |                                               ~~~~~~~~~^
   include/sound/soc.h:413:8: note: forward declaration of 'struct snd_soc_=
dai'
     413 | struct snd_soc_dai;
         |        ^
   2 errors generated.


vim +80 sound/soc/tegra/tegra_wm8962.c

536ffa105e16ca3 Jonas Schw=C3=B6bel 2026-02-23  66 =20
536ffa105e16ca3 Jonas Schw=C3=B6bel 2026-02-23  67  static int tegra_wm8962=
_init(struct snd_soc_pcm_runtime *rtd)
536ffa105e16ca3 Jonas Schw=C3=B6bel 2026-02-23  68  {
536ffa105e16ca3 Jonas Schw=C3=B6bel 2026-02-23  69  	struct tegra_machine *=
machine =3D snd_soc_card_get_drvdata(rtd->card);
536ffa105e16ca3 Jonas Schw=C3=B6bel 2026-02-23  70  	struct snd_soc_card *c=
ard =3D rtd->card;
536ffa105e16ca3 Jonas Schw=C3=B6bel 2026-02-23  71  	struct snd_soc_dapm_co=
ntext *dapm =3D snd_soc_card_to_dapm(card);
536ffa105e16ca3 Jonas Schw=C3=B6bel 2026-02-23  72  	int err;
536ffa105e16ca3 Jonas Schw=C3=B6bel 2026-02-23  73 =20
536ffa105e16ca3 Jonas Schw=C3=B6bel 2026-02-23  74  	err =3D tegra_asoc_mac=
hine_init(rtd);
536ffa105e16ca3 Jonas Schw=C3=B6bel 2026-02-23  75  	if (err)
536ffa105e16ca3 Jonas Schw=C3=B6bel 2026-02-23  76  		return err;
536ffa105e16ca3 Jonas Schw=C3=B6bel 2026-02-23  77 =20
536ffa105e16ca3 Jonas Schw=C3=B6bel 2026-02-23  78  	if (!machine->gpiod_mi=
c_det && machine->asoc->add_mic_jack) {
536ffa105e16ca3 Jonas Schw=C3=B6bel 2026-02-23  79  		struct snd_soc_dai *c=
odec_dai =3D snd_soc_rtd_to_codec(rtd, 0);
536ffa105e16ca3 Jonas Schw=C3=B6bel 2026-02-23 @80  		struct snd_soc_compon=
ent *component =3D codec_dai->component;
536ffa105e16ca3 Jonas Schw=C3=B6bel 2026-02-23  81 =20
536ffa105e16ca3 Jonas Schw=C3=B6bel 2026-02-23  82  		err =3D snd_soc_card_=
jack_new_pins(rtd->card, "Mic Jack",
536ffa105e16ca3 Jonas Schw=C3=B6bel 2026-02-23  83  						 SND_JACK_MICROPH=
ONE,
536ffa105e16ca3 Jonas Schw=C3=B6bel 2026-02-23  84  						 machine->mic_jac=
k,
536ffa105e16ca3 Jonas Schw=C3=B6bel 2026-02-23  85  						 tegra_wm8962_mic=
_jack_pins,
536ffa105e16ca3 Jonas Schw=C3=B6bel 2026-02-23  86  						 ARRAY_SIZE(tegra=
_wm8962_mic_jack_pins));
536ffa105e16ca3 Jonas Schw=C3=B6bel 2026-02-23  87  		if (err) {
536ffa105e16ca3 Jonas Schw=C3=B6bel 2026-02-23  88  			dev_err(rtd->dev, "M=
ic Jack creation failed: %d\n", err);
536ffa105e16ca3 Jonas Schw=C3=B6bel 2026-02-23  89  			return err;
536ffa105e16ca3 Jonas Schw=C3=B6bel 2026-02-23  90  		}
536ffa105e16ca3 Jonas Schw=C3=B6bel 2026-02-23  91 =20
536ffa105e16ca3 Jonas Schw=C3=B6bel 2026-02-23  92  		wm8962_mic_detect(com=
ponent, machine->mic_jack);
536ffa105e16ca3 Jonas Schw=C3=B6bel 2026-02-23  93  	}
536ffa105e16ca3 Jonas Schw=C3=B6bel 2026-02-23  94 =20
536ffa105e16ca3 Jonas Schw=C3=B6bel 2026-02-23  95  	snd_soc_dapm_force_ena=
ble_pin(dapm, "MICBIAS");
536ffa105e16ca3 Jonas Schw=C3=B6bel 2026-02-23  96 =20
536ffa105e16ca3 Jonas Schw=C3=B6bel 2026-02-23  97  	return 0;
536ffa105e16ca3 Jonas Schw=C3=B6bel 2026-02-23  98  }
536ffa105e16ca3 Jonas Schw=C3=B6bel 2026-02-23  99 =20

:::::: The code at line 80 was first introduced by commit
:::::: 536ffa105e16ca3f6e7de53f9d6059f53d0207f7 ASoC: tegra: Support WM8962=
 by machine driver

:::::: TO: Jonas Schw=C3=B6bel <jonasschwoebel@yahoo.de>
:::::: CC: Mark Brown <broonie@kernel.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
