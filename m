Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D18570807;
	Tue, 11 Feb 2025 11:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739273042; cv=none; b=XWwqGzyvdQZwILflHEFZTozdbzNm2HFLLVj2E82tGvZbQhxP8f6j1Ym3YyxsdhS1LEIjfGJkPvpK0OJDVWBpBlXOhzcKk6QN6VX0TI9ef8sD4kKFVsi7dYxhys4QYycwWS2kqnxdqiaRi/TwsIB/XCmbjBn1N+HMjIYLaAc3GsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739273042; c=relaxed/simple;
	bh=X/zvCFYSHUi0LicZVW0H90lzfveDqAaplHRxI+CUewQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bahR6mSPSZXsz7Ra+c7Fs02jQXTd33ESuhv9YVcB4EG+jxvgctcdoITSaUfYxAL0nDuyZsc9znhwGAqvbEv+YhvlZsZkKNpbnkruoGXyhSKV1gPamQ2rfApcqvKse/iRc5mFXke8xPTN/EpByajitx9K/9PfKGqo0lbaB+o6Lo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O8JSxtbX; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O8JSxtbX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739273041; x=1770809041;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=X/zvCFYSHUi0LicZVW0H90lzfveDqAaplHRxI+CUewQ=;
  b=O8JSxtbX7bBQSmZPJZ0pz+w5RhoWsKFGm0ac+UWV6UzA2Kh5S7Ur9O3J
   3kaQ8PX3qS2za8BiWNBISr2NMM5KP/6T5ybuHYsnzCcTeq3Cmhiz6AHGV
   f6/VvziXyAeqFCp30hu+RkUhFAlSluFWr5VRV54n3CzZni0IPEgJHU9+F
   DqjTP6DE5UyDJmmN8jt0bfwDJ/czAHF6cLx+D0PpoA/OPVfAiB7vMUTci
   QluUQLU1HQWBuzebVA7sRRL1TEuELi9H5VhCDG4Wp3+MOFDE/Yfc3JvTl
   2LitFRyznlX4nG0N62YLlddYwG6kusjqSbMv0LURuLGx6+Z7/DFrQHvoE
   g==;
X-CSE-ConnectionGUID: 6lHtscx8RI2EPBubFnghWQ==
X-CSE-MsgGUID: nREu6dJNSniA+2Fd5Vlkbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="57296046"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="57296046"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 03:24:00 -0800
X-CSE-ConnectionGUID: WbKqWQqcTMyCYBR2xWMHzA==
X-CSE-MsgGUID: /dWchxRhTc+Zr0WcEjoSsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112962395"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 Feb 2025 03:23:59 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thoMu-00145v-1N;
	Tue, 11 Feb 2025 11:23:56 +0000
Date: Tue, 11 Feb 2025 19:23:26 +0800
From: kernel test robot <lkp@intel.com>
To: Tony Luck <tony.luck@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 3/4] ACPI/MRRM: Add "node" symlink to
 /sys/devices/system/memory/rangeX
Message-ID: <202502111945.ZftqkQvL-lkp@intel.com>
References: <20250210211223.6139-4-tony.luck@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210211223.6139-4-tony.luck@intel.com>

Hi Tony,

kernel test robot noticed the following build errors:

[auto build test ERROR on a64dcfb451e254085a7daee5fe51bf22959d52d3]

url:    https://github.com/intel-lab-lkp/linux/commits/Tony-Luck/ACPICA-Define-MRRM-ACPI-table/20250211-051427
base:   a64dcfb451e254085a7daee5fe51bf22959d52d3
patch link:    https://lore.kernel.org/r/20250210211223.6139-4-tony.luck%40intel.com
patch subject: [PATCH 3/4] ACPI/MRRM: Add "node" symlink to /sys/devices/system/memory/rangeX
config: x86_64-randconfig-003-20250211 (https://download.01.org/0day-ci/archive/20250211/202502111945.ZftqkQvL-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250211/202502111945.ZftqkQvL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502111945.ZftqkQvL-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/acpi/acpi_mrrm.c:135:31: error: no member named 'node' in 'struct zone'
     135 |                                 node = node_devices[zone->node];
         |                                                     ~~~~  ^
   1 error generated.


vim +135 drivers/acpi/acpi_mrrm.c

   121	
   122	static __init int add_node_link(struct mrrm_mem_range_entry *entry)
   123	{
   124		struct node *node = NULL;
   125		int ret = 0;
   126		int nid;
   127	
   128		for_each_online_node(nid) {
   129			for (int z = 0; z < MAX_NR_ZONES; z++) {
   130				struct zone *zone = NODE_DATA(nid)->node_zones + z;
   131	
   132				if (!populated_zone(zone))
   133					continue;
   134				if (zone_intersects(zone, PHYS_PFN(entry->base), PHYS_PFN(entry->length))) {
 > 135					node = node_devices[zone->node];
   136					goto found;
   137				}
   138			}
   139		}
   140	found:
   141		if (node)
   142			ret = sysfs_create_link(&entry->dev.kobj, &node->dev.kobj, "node");
   143	
   144		return ret;
   145	}
   146	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
