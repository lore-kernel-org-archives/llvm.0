Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C686728EA;
	Sat,  4 May 2024 07:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714808845; cv=none; b=J1odPuarkOV5bSClXmmZs0Rl83UBRWIJUxpo9ujH/q3uL7f4ToIRD6XPKHmXJdetZqxxKpYJGFuMCpp3opG8/46kR4VLvbfB2M5s3BSZzD+ORafXrWZJbGNI4nHJmsEufpa3Sko80OtCNvBqBPCDyzFbqWPCacQxcp4+cxyi61w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714808845; c=relaxed/simple;
	bh=32V+YIrHxeW1LpW7FHQwSop8JBXmcJhjrOHaGLLcdF8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TE1jbijoUAPMqUIgEUcjORxr49CIRPfaDwHa8vfWqDbBvCAt9C/Vhm/wqWuB5P6hD3XL7BnKe1PfL9oyGTBaCfKGQarcvT49u+ji+vJlyDpNma2LT9Tb0YCjGd5H/blB5I6L1iwoSeZq+bolukLBALC0PLnbD/cQHD+jwhNCukY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K9jtvMBt; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K9jtvMBt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714808843; x=1746344843;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=32V+YIrHxeW1LpW7FHQwSop8JBXmcJhjrOHaGLLcdF8=;
  b=K9jtvMBtQASgyDOFgisciSWA+rwC1+6TaKWXDMUaESQK4l9v2B6dz3Nu
   Rha5L9EV3AaknQOUIkvnsJYeKnGYvTRSx4qkcbDi8HdidPGpTxlGkgt1l
   zm9SOYTAnh95oeS6m1eMiJdbbkmn+u1oaf1snvDDWnmwUCM1q/Ja2ZIAz
   5/FT52XpHacx9nRQJylnZ5Dlc+AyYEJ2wgyTgMn8pEwVOjIWIBxT8g4VN
   BWQNPeg1251hjk20/2cNAal4IP29XNmjWq7ra8YBeBBpcy4GQ6f9e42hu
   yUjuJBAmpKKdq0/i/VqRBK+mFm/xdQkzRc77s8LxoQED171k8drA2rYKb
   Q==;
X-CSE-ConnectionGUID: +wSB3lGeQ2CwhVaro657Dw==
X-CSE-MsgGUID: nJyHf4nXQ3CDxlmDIKF0Xw==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="14434266"
X-IronPort-AV: E=Sophos;i="6.07,253,1708416000"; 
   d="scan'208";a="14434266"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2024 00:47:23 -0700
X-CSE-ConnectionGUID: fhLpzgb3Ryy+ZB+6NUiu2w==
X-CSE-MsgGUID: GhURB8v7SPKGLpnUB7cORw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,253,1708416000"; 
   d="scan'208";a="32475102"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 04 May 2024 00:47:21 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3A74-000CYR-1c;
	Sat, 04 May 2024 07:47:18 +0000
Date: Sat, 4 May 2024 15:46:44 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/200-dcp 200/210]
 drivers/gpu/drm/apple/audio.c:207:16: error: call to undeclared function
 'snd_interval_rate_bits'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202405041538.fxUW99lW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/200-dcp
head:   38ae67fe4628d642a9dc626b9ba75bb2ac4bd701
commit: 35a895171434f74b9b12efa9c7c3251983586bde [200/210] gpu: drm: apple: Add DCP audio driver
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20240504/202405041538.fxUW99lW-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 37ae4ad0eef338776c7e2cffb3896153d43dcd90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240504/202405041538.fxUW99lW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405041538.fxUW99lW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/apple/audio.c:16:
   In file included from include/linux/of_dma.h:14:
   In file included from include/linux/dmaengine.h:12:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2188:
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
