Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6BA1552FD;
	Sun, 24 May 2026 14:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779633130; cv=none; b=Y5PxTPYXmbgzEb4SSU6i2ZXNBPSHHOgI+CbgPrwGRwD6HA204okD3ITEbKBBQ4VneGRIKT1RSPQpFURYG37vBdazLIJ9K+6vza5JxoMGusAEU0pScfSBscGZ4fqV/AhuSAIS5hx9FRVtitw4GynXla6lh2tOCbj3eDgAp0VkvDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779633130; c=relaxed/simple;
	bh=pYQXL+bqtTgenaDOuVvhvbPmBkfyHntGffU5SXZOfZw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hlTD+GtsBlcMhkdA469ie/XIPzo40j00TEi6OmI9YZtMKtpj2FR5KigBGFAgneTDE+x9dPmZ3uwR2X/Ou7JyrysMxkgZwNjY/zwiSLIPSBHWJ8zwuZ3qpPEjmGs7nQ6LDV0F9OZbyA5E3dMMvAdYVHxqURzWrJTkWGps/xZW3Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PNPyxmLb; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PNPyxmLb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779633128; x=1811169128;
  h=date:from:to:cc:subject:message-id;
  bh=pYQXL+bqtTgenaDOuVvhvbPmBkfyHntGffU5SXZOfZw=;
  b=PNPyxmLbuY3ocvSqCWACMGCsRxqDbpZ8rOip+TLrcqgRFYwuYNJl99vD
   GwtAh9+JObZ3y/iXuCCvcYKGDYdT+gsGDrnNVodceVGIRchg9QQfeQ5Sl
   wS54msVpBn9BxKJgN9r0vPQdvfl31tmkCfa1NleRv0Ygu5mxWHhBZ0ZJK
   nHvyWIChaEpG03h1FLjDm6te6duPbJ77vcPex0Y336oU9aAgvGYXxFfNe
   f5YTpIo8o52DCTGgStdZPtRAOpwpBZHAcS1ajNahCFPcnHcNFX/oUM0Rb
   Esoo3ru1SbYOb3XfV7EAeUcr8F0CyV7JHyTS5uTLnLpVeZMw1uxUXQZC8
   A==;
X-CSE-ConnectionGUID: lTSXl0nxTy+P3GI1uGY5mg==
X-CSE-MsgGUID: VUuTjvmgSD6C9WgwcsyY/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11796"; a="91051025"
X-IronPort-AV: E=Sophos;i="6.24,166,1774335600"; 
   d="scan'208";a="91051025"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2026 07:32:08 -0700
X-CSE-ConnectionGUID: 7m7Puz5MSDaKBe4ufdttdQ==
X-CSE-MsgGUID: nTAjI9ucSpW07zt+G7kf0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,166,1774335600"; 
   d="scan'208";a="243189696"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 24 May 2026 07:32:06 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wR9s4-000000000Iv-1FSz;
	Sun, 24 May 2026 14:32:04 +0000
Date: Sun, 24 May 2026 22:31:45 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-05-22-2 254/254]
 sound/soc/soc-component.c:1712:18: warning: variable 'card' is uninitialized
 when used here
Message-ID: <202605242251.eayYIsmB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-05-22-2
head:   7f5e6579901e0a1f3ff8bb45002dc226961a56ce
commit: 7c301e5e1c9323583854c4f729b79bab3f15f93a [254/254] ASoC: soc-component: move snd_soc_register_[un]component() to soc-component.c
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260524/202605242251.eayYIsmB-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260524/202605242251.eayYIsmB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605242251.eayYIsmB-lkp@intel.com/

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
