Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9AE1FBCB0;
	Mon,  3 Feb 2025 08:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738569913; cv=none; b=c380Z1dZaksdxhSDNYgAETlxBd40aS0QEtFd8dJmp8uEKoIxI29ejgYSaXgFa0rPxNnzdOlU/mq/cs4fRIjZAeLjvlNlEshP/sJBTbeA2rPdpYijKrZ45ldtP9w0bHP2HiCnahQXs2VNRVFhUurFad/IBK9yANLMXcpCL4v48Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738569913; c=relaxed/simple;
	bh=xlHn3pcZ8+WlMUhfZrITsZCJ6+VFQ7SuwSKKKjVaFek=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TlJC1860K8KwqtYR5Y4kiXLTrULcOYR5pjTXsKzRRLthqwZojl9i/qgvS/9rSktACOrZGOQPmMFo5b0ZObwrC78nvCPoZW6caNw4cCVdlWe5vYaYO+jJUeT+p/DD1D25ofhWOMn8n9fyphGt4UX6oAgkBFnDWQ7UF/p6N7R/TV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GgwLufPP; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GgwLufPP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738569911; x=1770105911;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xlHn3pcZ8+WlMUhfZrITsZCJ6+VFQ7SuwSKKKjVaFek=;
  b=GgwLufPPpHeoJnIll45YwkcwmkjfOj6mUIq0WbE8kp3r9ZbWhzKc0p+E
   7gN1mvjR7nsi8FYc1l9v/PvsPLbDNbtsAEb0MTH1TpeOX88LAjWdvL4YX
   EqI9655wl3ziN42IsqQENNnp+uZlomwhwK4siIn7qPsgxxpQlZ8lIkmdc
   IbZiJdKrb+5zAcqnA6twVjsHYRcs1qytmzbrofC/2bRjGBBf5ZSUNvw4g
   r5ydxRmQU2RX79UnSHXKajfVwR5CYfLGzva+4gkGgKvm57UrP9/1EBc34
   aRrdVm3V0H5C4BfT2ZdOwYsqTyv3ZNPZRM4RUgxsd6v/TnB95kboRKNHu
   g==;
X-CSE-ConnectionGUID: 4+VsT2f7TR+hWGN+lTHlDw==
X-CSE-MsgGUID: ugVekRvBT0mddpRyEOULjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="39206917"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="39206917"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 00:05:10 -0800
X-CSE-ConnectionGUID: KpHln3aLT0Kd8HYyyjuiJQ==
X-CSE-MsgGUID: EuMTAcs8TAWEQPM3Bkbd/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114847087"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 03 Feb 2025 00:03:49 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1terQp-000qex-32;
	Mon, 03 Feb 2025 08:03:47 +0000
Date: Mon, 3 Feb 2025 16:03:26 +0800
From: kernel test robot <lkp@intel.com>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [broonie-ci:v2_20250123_cezary_rojewski_asoc_intel_avs_add_support_for_maliboulake_configuration
 7/11] sound/soc/intel/avs/tgl.c:10:10: fatal error: 'asm/cpuid.h' file not
 found
Message-ID: <202502031651.7qyLIQo7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git v2_20250123_cezary_rojewski_asoc_intel_avs_add_support_for_maliboulake_configuration
head:   3318c70b5b94baa4e764ab05fa97c74643e7dc35
commit: de555b6bab20afcb0f7ba2b2ac3ba9877fa77a5c [7/11] ASoC: Intel: avs: Configure basefw on TGL-based platforms
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250203/202502031651.7qyLIQo7-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250203/202502031651.7qyLIQo7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502031651.7qyLIQo7-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from sound/soc/intel/avs/tgl.c:9:
   In file included from include/linux/pci.h:37:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2224:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/intel/avs/tgl.c:10:10: fatal error: 'asm/cpuid.h' file not found
      10 | #include <asm/cpuid.h>
         |          ^~~~~~~~~~~~~
   3 warnings and 1 error generated.


vim +10 sound/soc/intel/avs/tgl.c

     8	
     9	#include <linux/pci.h>
  > 10	#include <asm/cpuid.h>
    11	#include "avs.h"
    12	#include "messages.h"
    13	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
