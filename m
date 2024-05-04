Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5AEB182CC;
	Sat,  4 May 2024 11:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714820669; cv=none; b=UYeWYs57KKpmaJhpV8k98okaLGBN2OJeaHNY41cqcBSg1hEBs+eGevRM52d3ywb7qQBHZJupNHrQhHhL9B6z0Z14r18gLa1ZK2oAYulOXm8uIs41WE1deledHvSQBJu45d76xwWosOvJzaI2ZqhMQP9Ca/bzEqt4X5wKgI/iUig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714820669; c=relaxed/simple;
	bh=U/t9C+WEvKNHW48WsEKYhsm91mCgW8aNRsnMdr9VMNI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ATApCwgKd38ANQc/IcsPpbqygG5qY2gdY52x/5z2l6+D6xXMeMEjS1BUFiV/n0sTA4x99OwA46+ksQKKaQHEO+CEoT3mgUpcInNsENQJBahCAz1CxeBRmL1C3nfCuWXOrwMh7AViEagQFuIxn2yX8gK9B7wsCXzaSNtfM4pghII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=id/SoVeg; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="id/SoVeg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714820667; x=1746356667;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U/t9C+WEvKNHW48WsEKYhsm91mCgW8aNRsnMdr9VMNI=;
  b=id/SoVegif3swCoOhczxHMGTpmP0EYtcH9JjlKz+f9I/YOyyArwgDDhh
   BclAdwxNzBUDEHcxH7SRHsWCtA86WIy2ZBvB/QSdNTHcWW0oCA8SU46qR
   hPmIt5UoJ9nfSC2VNEEBFQ8oiHP0Gwdar+i8OAVEr0dQ1mOJgFLYLdNoP
   sZteaQ12yCU0R5FDz8R3egYNc9JschW5pEXTES4GwePDozcQpD3r1qri+
   fgTzTCfKoQqo3gf/eXPs4g0ReaShgc8HkG43vgmQQ4u50pYQzKFjrJ5jC
   G8rHZ+p5vF3LaJbyLVOtvq1KAm0KFIUmPteeeJpbKzQ3PyWL9zDZQeXg0
   A==;
X-CSE-ConnectionGUID: TtYTOlnKSgufaBFS6gU6MA==
X-CSE-MsgGUID: KtMFoxutRHSYJg1Pgjm0Cg==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="21774800"
X-IronPort-AV: E=Sophos;i="6.07,253,1708416000"; 
   d="scan'208";a="21774800"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2024 04:04:26 -0700
X-CSE-ConnectionGUID: XUBezRDnSlaEJrOhtFAV9Q==
X-CSE-MsgGUID: MfqAF+GaS6mJKb1U1L1WGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,253,1708416000"; 
   d="scan'208";a="32203511"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 04 May 2024 04:04:25 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3DBn-000ChB-0B;
	Sat, 04 May 2024 11:04:23 +0000
Date: Sat, 4 May 2024 19:03:57 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/200-dcp 206/210] drivers/gpu/drm/apple/av.c:300:22:
 warning: variable 'dev_link' set but not used
Message-ID: <202405041856.17BImNr8-lkp@intel.com>
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
commit: 53bd36e4e44587ff94d2b9fd00bbc8ad47ecad5a [206/210] drm: apple: audio: Make the DP/HDMI audio driver a full driver
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20240504/202405041856.17BImNr8-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 37ae4ad0eef338776c7e2cffb3896153d43dcd90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240504/202405041856.17BImNr8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405041856.17BImNr8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/apple/av.c:15:
   In file included from drivers/gpu/drm/apple/afk.h:14:
   In file included from drivers/gpu/drm/apple/dcp.h:7:
   In file included from include/drm/drm_atomic.h:31:
   In file included from include/drm/drm_crtc.h:32:
   In file included from include/drm/drm_modes.h:33:
   In file included from include/drm/drm_connector.h:32:
   In file included from include/drm/drm_util.h:36:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
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
>> drivers/gpu/drm/apple/av.c:300:22: warning: variable 'dev_link' set but not used [-Wunused-but-set-variable]
     300 |         struct device_link *dev_link;
         |                             ^
   6 warnings generated.


vim +/dev_link +300 drivers/gpu/drm/apple/av.c

   293	
   294	int avep_init(struct apple_dcp *dcp)
   295	{
   296		struct audiosrv_data *audiosrv_data;
   297		struct platform_device *audio_pdev;
   298		struct device *dev = dcp->dev;
   299		struct device_node *endpoint, *audio_node = NULL;
 > 300		struct device_link *dev_link;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
