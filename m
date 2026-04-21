Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79A53D76;
	Tue, 21 Apr 2026 00:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776729787; cv=none; b=QQORZgO2gme636wXhIug7N0rPWifOJQYMlbbCmo/1so/KMQbtNEOkzBKtaxhkOwvjl+ElxwIIeRF9FVaUF8xhR/ewbSyNJi71nPwKsA4gtxLNx9c/hnmntE6wFiMHW24JtBJDoVfyYI3iaI625GKOWzrSkwovYTzEWP251sAFqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776729787; c=relaxed/simple;
	bh=SJx2kf6D1+0QT92aMma83VleiJDCi/O6swIOtZouGQ0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kyfaGPpvUOayRIRSGuL95+kYto07V4QMbnxhYOBLnIAdFBW7B1V2p47cdQH1pKh/tBaeC8SlNgPeiCwa2BkyjTm+epk1Lcvq0/krSx7EzPj77oetYsJPjcyVgC/6O+LPQgcpeDJHL1wB+ukM27sgDb8c0vP1ojhmqm1nul7Mzs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gs8wHIkr; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gs8wHIkr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776729786; x=1808265786;
  h=date:from:to:cc:subject:message-id;
  bh=SJx2kf6D1+0QT92aMma83VleiJDCi/O6swIOtZouGQ0=;
  b=gs8wHIkrHqgZLcaNn1LYjcG9X7CkufSe/rqX2WCqBZUwwVtX/N+Qnqf8
   BGSZVw9burUPdSL/0EuI1fs1GjWSGhhAgxdveWifvvu6KfGYG0LPdDsLs
   zcTa34exj+IXDxq2jE1NuJK5g7UFiII1cmlQZYevOzpzzgPAFWOfFJ5Np
   bv1x9xmg7c6q55au+4PSxkjNhoBGPh2GyQ1KPglNA/aR8fGcGQAbOLR7H
   tDmmCaQ5yCCR0UcTOuDTyexJ/Lsgv81j5TtM9Jq3iHAuU8diDYJeC6nBo
   igFuJiv2i/aX2wIU+UabmLXtZ8aBQMthUAirXJsN+YoeNouEjQw7vAyKj
   w==;
X-CSE-ConnectionGUID: s7lbD01UTQiYkuqTdCbwNw==
X-CSE-MsgGUID: 6I4DWpy5SqSbTXtFiJ2GBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="65191159"
X-IronPort-AV: E=Sophos;i="6.23,190,1770624000"; 
   d="scan'208";a="65191159"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2026 17:03:06 -0700
X-CSE-ConnectionGUID: 2ORWJukxQJ2j3pLVyX4Ppg==
X-CSE-MsgGUID: Uua7gTxsRse26Fr3EOLq0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,190,1770624000"; 
   d="scan'208";a="236843948"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 20 Apr 2026 17:03:03 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wEyZw-0000000031s-0TOW;
	Tue, 21 Apr 2026 00:03:00 +0000
Date: Tue, 21 Apr 2026 08:02:26 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-04-20 127/127]
 sound/soc/soc-component.c:1712:18: warning: variable 'card' is uninitialized
 when used here
Message-ID: <202604210755.vDZ5fdMu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-04-20
head:   c0eca3aad838fa892c00ca5d3141b136aac51b91
commit: bfa0d5aadb75033c0a6038d125e5e98d4d6311eb [127/127] ASoC: soc-component: move snd_soc_register_[un]component() to soc-component.c
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20260421/202604210755.vDZ5fdMu-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260421/202604210755.vDZ5fdMu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604210755.vDZ5fdMu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/soc-component.c:1712:18: warning: variable 'card' is uninitialized when used here [-Wuninitialized]
    1712 |         soc_card_rebind(card);
         |                         ^~~~
   sound/soc/soc-component.c:1684:27: note: initialize the variable 'card' to silence this warning
    1684 |         struct snd_soc_card *card;
         |                                  ^
         |                                   = NULL
   1 warning generated.


vim +/card +1712 sound/soc/soc-component.c

  1679	
  1680	int snd_soc_component_add(struct snd_soc_component *component,
  1681				  struct snd_soc_dai_driver *dai_drv,
  1682				  int num_dai)
  1683	{
  1684		struct snd_soc_card *card;
  1685		int ret;
  1686		int i;
  1687		guard(mutex)(&client_mutex);
  1688	
  1689		if (component->driver->endianness) {
  1690			for (i = 0; i < num_dai; i++) {
  1691				convert_endianness_formats(&dai_drv[i].playback);
  1692				convert_endianness_formats(&dai_drv[i].capture);
  1693			}
  1694		}
  1695	
  1696		ret = soc_component_register_dais(component, dai_drv, num_dai);
  1697		if (ret < 0) {
  1698			dev_err(component->dev, "ASoC: Failed to register DAIs: %d\n",
  1699				ret);
  1700			goto err_cleanup;
  1701		}
  1702	
  1703		if (!component->driver->write && !component->driver->read) {
  1704			if (!component->regmap)
  1705				component->regmap = dev_get_regmap(component->dev,
  1706								   NULL);
  1707		}
  1708	
  1709		/* see for_each_component */
  1710		list_add(&component->list, soc_component_get_list_head());
  1711	
> 1712		soc_card_rebind(card);
  1713	
  1714	err_cleanup:
  1715		if (ret < 0)
  1716			snd_soc_component_del(component);
  1717	
  1718		return ret;
  1719	}
  1720	EXPORT_SYMBOL_GPL(snd_soc_component_add);
  1721	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
