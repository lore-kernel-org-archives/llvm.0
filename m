Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E946813AA5F;
	Mon, 15 Jul 2024 20:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721074224; cv=none; b=cq3dXL5zdHzCA3VUhf8pfkqTNtw+RL49nSclwbT2VOFKZYNYBYsxN8pTXHdldd1Fge9631ttl01jx9wrSBLZz5GuOcz8uvBP2fSJLTlWSmdbfDqej5auRPpLX9XWtd8rMhg4T1RsZtEPqc+3HACEr3XuQTXW1or3vWO7/o85Vek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721074224; c=relaxed/simple;
	bh=HHujnsrnjf1PnrK3YMKyzJS+PCOaLIFZiXhW3Fom7U8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=egOpaAG0I4I22/2SlUU1HQBI14ewB655mw/v+/HUY+qALLu7eq+LzRAmXYyCAhhalLxhMGsAJyXGc7gK89/udrqPal4dQsEEykBY/6dNpTlbZYJULiKZle6oHXfHPW6Rl5GUXb6enDb67sicd14byUjeZokfJUyZy5b6nKkaLVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AbnAjBTH; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AbnAjBTH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721074223; x=1752610223;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HHujnsrnjf1PnrK3YMKyzJS+PCOaLIFZiXhW3Fom7U8=;
  b=AbnAjBTHMFGJdjoPat4pSxCmzg5fVXHwjWjei4egOIopk0WekrIRZmCD
   PDeJqC5JJ60Yfh5sUoQ6OtkJfp8nu9fHnaSW//yjUY4AMDvNHFSE5LMr/
   KHYJ8o8t3yVSI8+SeuhXSXGEl3H0/0mBFdxm628E1VO0kE9F1ASDtxBYu
   nk45OmttitlpqOmys2UndOBy6N6KtfdWpqPOTOYv2XNneZhwHEhCOSHuO
   eqMEzGFEYbV4XkTL1MFrkHYuT/OOHUmjvnHk0AZeV0smviL1bpEU0QecQ
   ZZmTtl74etDEpAlqsjBjCzHlklH9r6jX6g5iIPoPxhzqqfoXaIDMYdgEI
   w==;
X-CSE-ConnectionGUID: +Z/nrwJhR5CnUCG5Mb/rjg==
X-CSE-MsgGUID: zPuE+noYQEK353EplSx5FA==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="18594188"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="18594188"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 13:10:23 -0700
X-CSE-ConnectionGUID: U96Xw8LsRLuws3US+xiY4w==
X-CSE-MsgGUID: 6nxUefcwTpe1o3gxrRxGzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="49798795"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 15 Jul 2024 13:10:21 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sTS1a-000eYU-1g;
	Mon, 15 Jul 2024 20:10:18 +0000
Date: Tue, 16 Jul 2024 04:09:28 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/200-dcp 200/228]
 drivers/gpu/drm/apple/audio.c:207:16: error: call to undeclared function
 'snd_interval_rate_bits'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202407160435.X1nnb6pb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/200-dcp
head:   8055be462c879e6a7eb5585450fd146af0c37127
commit: 933ebbe879c9436382bcb4f70572d754fb02a247 [200/228] gpu: drm: apple: Add DCP audio driver
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240716/202407160435.X1nnb6pb-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240716/202407160435.X1nnb6pb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407160435.X1nnb6pb-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/apple/audio.c:16:
   In file included from include/linux/of_dma.h:14:
   In file included from include/linux/dmaengine.h:12:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2210:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/apple/audio.c:207:16: error: call to undeclared function 'snd_interval_rate_bits'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     207 |         return snd_interval_rate_bits(r, hits.rates);
         |                ^
   drivers/gpu/drm/apple/audio.c:413:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     413 |         int ret;
         |             ^
   6 warnings and 1 error generated.


vim +/snd_interval_rate_bits +207 drivers/gpu/drm/apple/audio.c

   196	
   197	static int dcpaud_rule_rate(struct snd_pcm_hw_params *params,
   198	                             struct snd_pcm_hw_rule *rule)
   199	{
   200		struct dcp_audio *dcpaud = rule->private;
   201		struct snd_interval *r = hw_param_interval(params,
   202					SNDRV_PCM_HW_PARAM_RATE);
   203		struct dcp_sound_format_mask hits;
   204	
   205	        dcpaud_consult_elements(dcpaud, params, &hits);
   206	
 > 207	        return snd_interval_rate_bits(r, hits.rates);
   208	}
   209	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
