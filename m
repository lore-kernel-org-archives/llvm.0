Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14EF0348C66;
	Tue,  2 Jun 2026 06:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780381911; cv=none; b=MO6CU+wR7BZnNiTzoSbYGeF53aDpRykoEaerHWRqW7uIHZx+DbVFGHtjAVNNFgxRth7lcmke7SUnDPqiAgZAO8Ob/sbGQb0sWsarpKpkN2HoAXPXfcfTJ7giuvPVXS0DYmgVpM+EjNiZX2+rnNqQ1iVpCaneoh8US4fHhg9ql0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780381911; c=relaxed/simple;
	bh=DNNKIAuBD00M0sTiFrn6qsVxqCcToQTnD8ZfbO+A/I4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rNQL02o7rE4rTHLxO4FqiP4rwDwxREhyHAoC1MXhQxhGuLcssvNdilGj39bS7e5i1ZhPmUwtU8wGG2xtyXlbO26oNjzfyJoEtCpoQ+4ecRTTaM0KlqSelTlY3JsvTiE7GgjzXjhykN9fzzYmDi7t20ay0LBMj7BKnU9xDspJP7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aYa4NO26; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aYa4NO26"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780381909; x=1811917909;
  h=date:from:to:cc:subject:message-id;
  bh=DNNKIAuBD00M0sTiFrn6qsVxqCcToQTnD8ZfbO+A/I4=;
  b=aYa4NO26cxWUcIJuFhGPxswe01PgoKElf/i2iMoGH+OTxSnma5eSCZRI
   MvEP/FX5D3gaui+yYl7Nuw2s1ES15jK+9D6xQJ4fspZ/MBUeZM1TtE/ll
   Rujfw0bFQqN2VffdnxbuPGehSLwuLpE1tGJTWCn7GWLojeQB9cZOgdGRd
   +5lDoVUejVbtfVPBtsrl/Cs7R8CwjxrtNUJtDBFN5IzS5K855W1OZbHCn
   s5gX7Bwo1Tcq7VpTN7SyMBwjrZQDCeFwx62tWDthvan75wLIi2yfO2g4q
   /WZJb0ogh+sdnz/Qi4QFQz3PtyWb9PGrf+V3VJ61YJYfJGbz84zmIQSZJ
   w==;
X-CSE-ConnectionGUID: o7PXVgs0TF63lcfxVnzzZA==
X-CSE-MsgGUID: qHvzs+ncQqesRvxoxBZxlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="68703336"
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="68703336"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 23:31:48 -0700
X-CSE-ConnectionGUID: m69XUQPORU6H7zFlp00CrQ==
X-CSE-MsgGUID: U5/DbXK+SQqOb1u+5aki9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="243924215"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 01 Jun 2026 23:31:46 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUIf9-00000000BbW-2qKf;
	Tue, 02 Jun 2026 06:31:43 +0000
Date: Tue, 02 Jun 2026 14:31:29 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-06-01-3 290/290]
 sound/soc/sdca/sdca_asoc.c:449:42: error: incompatible pointer types passing
 'struct snd_soc_component *' to parameter of type 'struct regmap *'
Message-ID: <202606021426.jj3i0meq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-06-01-3
head:   1ef39bbdce9099b285b9702e22c4defc277e42dd
commit: f66a1b718fbcb7553fef8ad2e807c9e84ca546e5 [290/290] dai
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20260602/202606021426.jj3i0meq-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e5ab4f8a1f766febdc65ce89c00dec85393cfd68)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260602/202606021426.jj3i0meq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606021426.jj3i0meq-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/sdca/sdca_asoc.c:389:5: error: conflicting types for 'sdca_asoc_pde_poll_actual_ps'
     389 | int sdca_asoc_pde_poll_actual_ps(struct device *dev, struct snd_soc_component *component,
         |     ^
   include/sound/sdca_asoc.h:103:5: note: previous declaration is here
     103 | int sdca_asoc_pde_poll_actual_ps(struct device *dev, struct regmap *regmap,
         |     ^
>> sound/soc/sdca/sdca_asoc.c:449:42: error: incompatible pointer types passing 'struct snd_soc_component *' to parameter of type 'struct regmap *' [-Wincompatible-pointer-types]
     449 |         ret = sdca_asoc_pde_poll_actual_ps(dev, component,
         |                                                 ^~~~~~~~~
   sound/soc/sdca/sdca_asoc.c:422:18: note: passing argument to parameter here
     422 | EXPORT_SYMBOL_NS(sdca_asoc_pde_poll_actual_ps, "SND_SOC_SDCA");
         |                  ^
   2 errors generated.


vim +449 sound/soc/sdca/sdca_asoc.c

   423	
   424	static int entity_pde_event(struct snd_soc_dapm_widget *widget,
   425				    struct snd_kcontrol *kctl, int event)
   426	{
   427		struct snd_soc_component *component = snd_soc_dapm_to_component(widget->dapm);
   428		struct device *dev = snd_soc_component_to_dev(component);
   429		struct sdca_entity *entity = widget->priv;
   430		int from, to;
   431		int ret;
   432	
   433		if (!component)
   434			return -EIO;
   435	
   436		switch (event) {
   437		case SND_SOC_DAPM_POST_PMD:
   438			from = widget->on_val;
   439			to = widget->off_val;
   440			break;
   441		case SND_SOC_DAPM_POST_PMU:
   442			from = widget->off_val;
   443			to = widget->on_val;
   444			break;
   445		default:
   446			return 0;
   447		}
   448	
 > 449		ret = sdca_asoc_pde_poll_actual_ps(dev, component,
   450						   SDW_SDCA_CTL_FUNC(widget->reg),
   451						   SDW_SDCA_CTL_ENT(widget->reg),
   452						   from, to,
   453						   entity->pde.max_delay,
   454						   entity->pde.num_max_delay);
   455		if (ret)
   456			dev_err(dev, "%s: PDE transition %x -> %x failed, err=%d\n",
   457				entity->label, from, to, ret);
   458	
   459		return ret;
   460	}
   461	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
