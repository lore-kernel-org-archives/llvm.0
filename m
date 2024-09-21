Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2194579EA;
	Sat, 21 Sep 2024 02:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726887267; cv=none; b=h29uWfGxaeHIpLcNJmW6WfpjAWLAHtWyR9QMcKY9aaGbfdVXgEGQumEEN+Bd0QU5utq/MaLlMefBgW27uLDIHCDumts4FW5KXLP+MEhog3/1HJYSaTFEq6g2LvnyC6pcQW+LwVSIeefXPD1+pgTpGixuV7wme5bc0cCzxe3QQPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726887267; c=relaxed/simple;
	bh=mxprMZ9K8lnvmkzjd2Oj4iybYq/EhPevXBngqZI0S6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hi9irY5cR7Da1y2A3cVTi+cC7eH6jhPTHkk6n6o9CCJ2lelTuSClZeILwitP2OtdT3o8Alid1n7j8C+qr9AIB2rvgEQdpSO3O1FSK3v+zi5i3SlqCod8dodyeA1J0vkl3WgNx8FBWorFc3amTyupSUCFs9ve4am1M5HpT4/fwak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=er9MWmQA; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="er9MWmQA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726887265; x=1758423265;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mxprMZ9K8lnvmkzjd2Oj4iybYq/EhPevXBngqZI0S6Q=;
  b=er9MWmQAZhlDUCj/Bp8pLpTofHfUitDlyj17+MrTLgbiZRcM4uPg9Q4T
   0TIl6AdlaL6+rmN2qKsMlUVDPueOBS3DGEodeQqaqOuf8KIOsjxVrpeeQ
   z1jwnfT9oj390Q8snA7XelIlFtstgr4PiDZXXaObpKn/7ngMqI6Dbttjs
   q+pMF8y/fScPmOoW/a/qq4vGHak5/KtQO+PRm1bTUgV2pqrU5RAgyXuFB
   7w1jedr3TJE4hiUel9zy6/NZNSl+yUucYrXnDLE8izSMQaVMUocx6BH8d
   X/W+kY51zjZZhOOPtStU5T1GZvXN3doK6Z3iU9HHYkCt1YY7rYoFt0epc
   g==;
X-CSE-ConnectionGUID: EFiYTRjgSDaIhGItRDvxZA==
X-CSE-MsgGUID: M+yn/iWpTta6cRU00RCCrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="25734427"
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; 
   d="scan'208";a="25734427"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 19:54:25 -0700
X-CSE-ConnectionGUID: 6dpsLhF5Sgae0mZoytr7ew==
X-CSE-MsgGUID: 7mIYj0E+SuuPiNbTIdWr1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; 
   d="scan'208";a="74889861"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 20 Sep 2024 19:54:23 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srqGK-000F4R-2T;
	Sat, 21 Sep 2024 02:54:20 +0000
Date: Sat, 21 Sep 2024 10:53:51 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/200-dcp 184/211]
 drivers/gpu/drm/apple/audio.c:207:16: error: call to undeclared function
 'snd_interval_rate_bits'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202409211047.rhmsZYHR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/200-dcp
head:   1ba049650cca30c3733a3e0e1b5d98a8cf8be2d9
commit: be8ab0c238fa8eb282684c6269632dbe8c187bb6 [184/211] gpu: drm: apple: Add DCP audio driver
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240921/202409211047.rhmsZYHR-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 8663a75fa2f31299ab8d1d90288d9df92aadee88)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240921/202409211047.rhmsZYHR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409211047.rhmsZYHR-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/apple/audio.c:16:
   In file included from include/linux/of_dma.h:14:
   In file included from include/linux/dmaengine.h:12:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2232:
   include/linux/vmstat.h:503:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     503 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     504 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:510:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     510 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     511 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:517:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     517 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:523:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     523 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     524 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/apple/audio.c:207:16: error: call to undeclared function 'snd_interval_rate_bits'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     207 |         return snd_interval_rate_bits(r, hits.rates);
         |                ^
   drivers/gpu/drm/apple/audio.c:600:12: error: incompatible function pointer types initializing 'void (*)(struct platform_device *)' with an expression of type 'int (struct platform_device *)' [-Wincompatible-function-pointer-types]
     600 |         .remove = dcpaud_remove,
         |                   ^~~~~~~~~~~~~
   4 warnings and 2 errors generated.


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
