Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92C1355F46;
	Thu,  2 Jul 2026 15:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783005944; cv=none; b=m/6bDH3e3wwfOwzMHMBttL+AM/hqTAlaUi9rsE/a6df+tOZU3tHvjFu61x1lajwrYBLxeqTyt76hdLmBZk23gIkklOhxufyX06p9CpAEFqgcJifDbHAElXFKnPvNGzo8Zz/3iN0mA0ytLBBZpuIY/dZtRQ3otSYp2ab1MoSgzwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783005944; c=relaxed/simple;
	bh=yqkhHqfadN2MkW6W07ws7e+VvMRCV+QJq5z39f9fyh4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mQ1LwE6n2x6PJTexRBj0Xdw724zaimlam8D5GFoCw+cVa6ukYSGJO9udzvJJNh8YFZtLZ/wWnztUr1VM0a3x8pRiEp2i4LhR4eyxOHZj143d/opEIRZBvKOP0A28zz3r4/0lOeIXbvtfCod9HrtkKe35Yko5bASrB5//9sBsa8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hy0XxTjw; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hy0XxTjw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783005943; x=1814541943;
  h=date:from:to:cc:subject:message-id;
  bh=yqkhHqfadN2MkW6W07ws7e+VvMRCV+QJq5z39f9fyh4=;
  b=hy0XxTjwIeYhoySNZa8SO8OuQ9rWKtqy0cqx4hzWDfz3mIZ1hJ5khOTX
   NwCOCGi7SfcO7KvvH8AcANyc+5TwYB1sAU3eBQZKWtl9Ki5d4kf2A3tVG
   CuvgjODxmlJV+OcavyFbLhvX+KWtuKbzdfA0u87vmXtfu58Gp6BqK7vOM
   0AgLZnjc4o9s20ulSt1Bb/ax2KyJqQ9v0Q/mbGeTOJep+5AaX4wAqe5Yd
   yGy7zyuZKG4eQ5UuEMF13wjr28sgFIWWphgbE3AvG7fxNBLv8nNBkm2yu
   l0WRuhco/e1I9X1/+qMvpdhDcFgJvC0ggbCHACWCRnY7q4HPTXtfK1EkO
   Q==;
X-CSE-ConnectionGUID: 8sfkXs7bTga3cfTsuYC2wg==
X-CSE-MsgGUID: KYrCddtaRFKqpR81b4tHRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="83540684"
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; 
   d="scan'208";a="83540684"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 08:25:42 -0700
X-CSE-ConnectionGUID: fuJzY76JS5qtYh+z+mVyaQ==
X-CSE-MsgGUID: PhQ6nHyZTkGHgC5kYSO66g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; 
   d="scan'208";a="253044625"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 02 Jul 2026 08:25:40 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfJIG-00000000AuD-1wcq;
	Thu, 02 Jul 2026 15:25:37 +0000
Date: Thu, 02 Jul 2026 23:25:12 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-07-01-3 18/302]
 sound/soc/generic/simple-card.c:676:3: error: cannot jump from this goto
 statement to its label
Message-ID: <202607022329.TsqIGy7U-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Kuninori,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/morimoto/linux sound-cleanup-2026-07-01-3
head:   9f2eeab90c3fd87a2e2ea2b1be8d3e7848523d90
commit: 7a1dd19f0560d8a14f45577df018cf298d4ed84b [18/302] ASoC: simple-card: merge extra method into simple_parse_of()
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20260702/202607022329.TsqIGy7U-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607022329.TsqIGy7U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607022329.TsqIGy7U-lkp@intel.com/

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
