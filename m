Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A891DFFD;
	Mon, 25 May 2026 02:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779677633; cv=none; b=P1kYEJ4yILDctkb8DO9brCFn472hPPM0y9JGbsc19WqK/uiXGyixxG8Y8wRv3UsGAiY0ST9nPJAuhjQGquCOIPGndkqJKpIAZaoCT4VUb8zFgwFfqFwrHVN5bOtGK26SabxJDxuz4JlvGH1+I53clDO63Rz0xSzEPF4CcHBmE9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779677633; c=relaxed/simple;
	bh=hwOuAEmplfzx9fbVV7W3dmxACtrcJ5PMn0n9YOlqAdY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=p0fa0GEHJtAr1qxUws09+M+VyPFAiT4ogXCn3POmMDbpaDUHKrAYSDTW7cNCj4tYxtih9CMPJ4V9TrBhp0rruVN4iKfEBA7a9/XsfDLzoEog0Fe5JVCFpktVFlTTl7NxKMt192Hpckk7hySWma0CPEkLtPR1iTp4LbMTbITXPfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VJoXuaiU; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VJoXuaiU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779677631; x=1811213631;
  h=date:from:to:cc:subject:message-id;
  bh=hwOuAEmplfzx9fbVV7W3dmxACtrcJ5PMn0n9YOlqAdY=;
  b=VJoXuaiUIwMtcQlMP4z5tblLdBkfDBD0yn1hgN0qNUf50Ooupb9nw23W
   wZOhtzB8iQs/eCW00FUZb58oDtndOc8T8WGQ3KqAenF0GKuzGsikp5cFF
   KsRyem/aX3tPh6Fw90taE0HxtkW/nD+7h01XYE4aYYsxmYkXseD+f3iEw
   i5W/ef6wzeIHAcEP/3IVMuugdUjZqGqtzLPPgaIXdn4fN8MvIJ9lp8Ydt
   X4+P7cBY1C6jI0CP52iMdRj3R06ZwVg/JUtvYb+PLoYzhkYZcQqCUpMZz
   26LN6ZHTU93jqdBL4VaZ0PSjGD33psSAtdgpsrDupiFtkRAO84ac/4QQ7
   g==;
X-CSE-ConnectionGUID: MMlw9l8sREK92T4J8k1JnA==
X-CSE-MsgGUID: S7qqNh+zS5WlO6ycF1IIUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11796"; a="79646793"
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; 
   d="scan'208";a="79646793"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2026 19:53:50 -0700
X-CSE-ConnectionGUID: LmBU10b8RJK7ia7SE04NoA==
X-CSE-MsgGUID: U9UTgVJtRsGVWbL3EbRDYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; 
   d="scan'208";a="235115921"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 24 May 2026 19:53:49 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRLRq-000000000tR-0z6j;
	Mon, 25 May 2026 02:53:46 +0000
Date: Mon, 25 May 2026 10:52:59 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-05-22 254/254]
 sound/soc/intel/avs/pcm.c:1403:10: warning: variable 'ret' is uninitialized
 when used here
Message-ID: <202605251045.pFlF5gea-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-05-22
head:   65ed982efb72231d8feca201fdeb06adb64515a0
commit: ae2fc31a59658ed97d7e5f9219d412f764d245f0 [254/254] ASoC: intel: avs: use snd_soc_component_alloc()
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260525/202605251045.pFlF5gea-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260525/202605251045.pFlF5gea-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605251045.pFlF5gea-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/intel/avs/pcm.c:1403:10: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
    1403 |                 return ret;
         |                        ^~~
   sound/soc/intel/avs/pcm.c:1391:9: note: initialize the variable 'ret' to silence this warning
    1391 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +/ret +1403 sound/soc/intel/avs/pcm.c

  1384	
  1385	int avs_register_component(struct device *dev, const char *name,
  1386				   struct snd_soc_component_driver *drv,
  1387				   struct snd_soc_dai_driver *cpu_dais, int num_cpu_dais)
  1388	{
  1389		struct avs_soc_component *acomp;
  1390		char *cpname;
  1391		int ret;
  1392	
  1393		cpname = devm_kstrdup(dev, name, GFP_KERNEL);
  1394		if (!cpname)
  1395			return -ENOMEM;
  1396	
  1397		acomp = devm_kzalloc(dev, sizeof(*acomp), GFP_KERNEL);
  1398		if (!acomp)
  1399			return -ENOMEM;
  1400	
  1401		acomp->base = snd_soc_component_alloc(dev, drv, NULL, cpname, NULL, NULL);
  1402		if (!acomp->base)
> 1403			return ret;
  1404	
  1405		snd_soc_component_attach_priv(acomp->base, acomp);
  1406		INIT_LIST_HEAD(&acomp->node);
  1407	
  1408		drv->use_dai_pcm_id = !obsolete_card_names;
  1409	
  1410		return snd_soc_component_add(acomp->base, cpu_dais, num_cpu_dais);
  1411	}
  1412	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
