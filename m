Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582A42F39B9;
	Mon,  1 Jun 2026 16:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780331627; cv=none; b=CDnEr0j1kTmC/0BA4ww/qoXj0yH2f7lrp3WIcaeKdq6broxWddzeIvJXrnMvnqrnHfHR3IzYIQhc2aqtAnZSdJao0+0LF8EeCBw5OJ+YK1/PS+6FfCF/1C6bhSXMM7yiJ8ZGFx+K6nDboNjAy9ppQ1eY72CKxMrzy7cHxax/d0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780331627; c=relaxed/simple;
	bh=ebKm3dJWSNFg2rmyYUtsPFwqnZYwgOFM2M95McjVzOI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TG/CS03fZz8RS1bNi6e5bqXt5GIO6mxTGBu358hvj0l7c3N2rt6PzT7pclv+KA13tvf92fJVfqtAhnjh6sKKuYquqwKiXWI5h97oaH8WMkwa8JCecWcrkgZ9pqyitoCQ5QCPMmx8fbkHUYyRh+P2uQhWRvFm0JvFZFFw8bUlA2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bYIQ6DVI; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bYIQ6DVI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780331625; x=1811867625;
  h=date:from:to:cc:subject:message-id;
  bh=ebKm3dJWSNFg2rmyYUtsPFwqnZYwgOFM2M95McjVzOI=;
  b=bYIQ6DVIwaeJEuWoeGVCNn2XUyEHmJTMbdE/djoQufEjCY2l7hgAL3Cz
   um/714jDcDzPs8LHolTzTcbtTsFRVSJMLTqksSDKZTkSVp8ZpuouSWEnt
   VQYcGHj+nBmWGHMh/th5k9FUmHU+iCTCqE7L/GznCmE/uEYQzTlV6piGD
   RhqfEhB+8/P9Ri+So0IyKrSoUL/3jRyHWlgqkoEbWVtKf+Fjusckf++m3
   ITzrnl+5kNS5SkfnH+NMAhyEqR8IBorjUhPnxLi/j4+GUqOQFMA6usunW
   ws3l5wFhfOpN4Re8rl+Yl5S9KtWCSoHcymEVGkvD+nbz8iTJ6dqwA7rLe
   w==;
X-CSE-ConnectionGUID: 4/dunAcNTmahuatvwziFkw==
X-CSE-MsgGUID: VtE3kr9eQD6RAafaMDx4iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="81069832"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="81069832"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 09:33:44 -0700
X-CSE-ConnectionGUID: N1DxYKVjS6SN9Ae8p1HM7g==
X-CSE-MsgGUID: xfxY9SlBTvyuGhkZzztWgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="243450524"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 01 Jun 2026 09:33:42 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wU5a8-00000000AoG-0fOS;
	Mon, 01 Jun 2026 16:33:40 +0000
Date: Tue, 02 Jun 2026 00:33:17 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-06-01-3 290/290]
 sound/soc/generic/simple-card.c:676:3: error: cannot jump from this goto
 statement to its label
Message-ID: <202606020045.cX0Dqu3t-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Kuninori,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/morimoto/linux sound-cleanup-2026-06-01-3
head:   1ef39bbdce9099b285b9702e22c4defc277e42dd
commit: 4160628362aef03d1f41d98a46a26098032f8338 [290/290] ASoC: simple-card: merge extra method into simple_parse_of()
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260602/202606020045.cX0Dqu3t-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260602/202606020045.cX0Dqu3t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606020045.cX0Dqu3t-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/generic/simple-card.c:676:3: error: cannot jump from this goto statement to its label
     676 |                 goto end;
         |                 ^
   sound/soc/generic/simple-card.c:679:20: note: jump bypasses initialization of variable with __attribute__((cleanup))
     679 |         struct link_info *li __free(kfree) = kzalloc_obj(*li);
         |                           ^
   1 error generated.


vim +676 sound/soc/generic/simple-card.c

   668	
   669	static int simple_parse_of(struct simple_util_priv *priv)
   670	{
   671		struct snd_soc_card *card = simple_priv_to_card(priv);
   672		struct device *dev = card->dev;
   673		int ret = -EINVAL;
   674	
   675		if (!dev)
 > 676			goto end;
   677	
   678		ret = -ENOMEM;
   679		struct link_info *li __free(kfree) = kzalloc_obj(*li);
   680		if (!li)
   681			goto end;
   682	
   683		ret = simple_get_dais_count(priv, li);
   684		if (ret < 0)
   685			goto end;
   686	
   687		ret = -EINVAL;
   688		if (!li->link)
   689			goto end;
   690	
   691		ret = simple_util_init_priv(priv, li);
   692		if (ret < 0)
   693			goto end;
   694	
   695		ret = simple_util_parse_widgets(card, PREFIX);
   696		if (ret < 0)
   697			goto end;
   698	
   699		ret = simple_util_parse_routing(card, PREFIX);
   700		if (ret < 0)
   701			goto end;
   702	
   703		ret = simple_util_parse_pin_switches(card, PREFIX);
   704		if (ret < 0)
   705			goto end;
   706	
   707		/* Single/Muti DAI link(s) & New style of DT node */
   708		memset(li, 0, sizeof(*li));
   709		ret = simple_for_each_link(priv, li,
   710					   simple_dai_link_of,
   711					   simple_dai_link_of_dpcm);
   712		if (ret < 0)
   713			goto err;
   714	
   715		ret = simple_util_parse_card_name(priv, PREFIX);
   716		if (ret < 0)
   717			goto err;
   718	
   719		ret = simple_populate_aux(priv);
   720		if (ret < 0)
   721			goto err;
   722	
   723		ret = snd_soc_of_parse_aux_devs(card, PREFIX "aux-devs");
   724		if (ret < 0)
   725			goto err;
   726	
   727		snd_soc_card_set_drvdata(card, priv);
   728	
   729		simple_util_debug_info(priv);
   730	
   731		ret = devm_snd_soc_register_card(dev, card);
   732	err:
   733		if (ret < 0) {
   734			simple_util_clean_reference(card);
   735			return dev_err_probe(dev, ret, "parse error\n");
   736		}
   737	end:
   738		return simple_ret(priv, ret);
   739	}
   740	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
