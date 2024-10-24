Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D602040A3;
	Thu, 24 Oct 2024 14:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729778884; cv=none; b=f0g62On59wP5EhG8ZYiXplFxPvSFywQ6nMSWuBIlKcrcg08gDLNBcGkElBjXxUje4EM1JRVKNWWRKjT9gq12cgQPrgEdCNNCgi/cMsNoXFA4qydJlKcpEMY9libhP3JdfUE9GNHITimn0gm4oviX3Ls+ZJrzDDL/sqcnMYX4agk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729778884; c=relaxed/simple;
	bh=Qxa+QSOwueB8oA05Lq3Gey9Hrj8lg0DH5kej7OaVX68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B9cHHnFWIgl82HLsfBObt6pu9iNCXr8SlDKjbGf+J54AKBorQLt59RHrBMw6N2RTlRpaONh4DK5V3qsVUAvRmQAaIYC8ZxmeGzdbioiL8GnDaR/NMb4ojKY1XdfwQd+prURtPl1pID3K4NlegY5Hn3wlfgZAeqwCF6gQ9Zlg0L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UW0mzwBA; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UW0mzwBA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729778881; x=1761314881;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Qxa+QSOwueB8oA05Lq3Gey9Hrj8lg0DH5kej7OaVX68=;
  b=UW0mzwBA9S/Ug+vNh0vgT7mGk+yXvpfuc2KP8KAP2CQcvO7I8j/XF9aG
   MmjDsemekPj7iSzYDq5AEjTkAU4rTql/NUgZc94eqbclN5/mYszj6WRWs
   l4JWgyxM8F0r6ivoF7Zd6S74OmN2p/Vw1pceRSvF/tBUyPjnnZ8/5TSkm
   w1UFFodgWlDtqhmiuBSZlRmDUdPxFuSua09nLD8MJC1ryDlJNqypzg5xH
   o/dK+Ux+tt1kVgt1XKvv4XkTly15iRMHk6I3hJuibBiEDgWwTgRRaA2Nc
   hvbNfFtnFlCerlYxCG1zo60FHdUnZ8A0kdvuRpNUFG8aFFYc4w0Qu38Ke
   Q==;
X-CSE-ConnectionGUID: us7De3CTR6+GVndfTFEYrw==
X-CSE-MsgGUID: FVB52BT0Qh2/DMDt6aWe/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="46896504"
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="46896504"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 07:07:58 -0700
X-CSE-ConnectionGUID: y0RwckpeT5eUtYO2Y8xpWA==
X-CSE-MsgGUID: chDKO1bGRECbXH9ymkM/AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="111443374"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 24 Oct 2024 07:07:57 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3yVG-000WVQ-1G;
	Thu, 24 Oct 2024 14:07:54 +0000
Date: Thu, 24 Oct 2024 22:07:24 +0800
From: kernel test robot <lkp@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 7/7] [DISCUSSION] drm/gem: Add cgroup memory accounting
Message-ID: <202410242215.yXbniQdG-lkp@intel.com>
References: <20241023075302.27194-8-maarten.lankhorst@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023075302.27194-8-maarten.lankhorst@linux.intel.com>

Hi Maarten,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on drm-exynos/exynos-drm-next next-20241024]
[cannot apply to tj-cgroup/for-next drm-xe/drm-xe-next akpm-mm/mm-everything drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip linus/master v6.12-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maarten-Lankhorst/kernel-cgroup-Add-dev-memory-accounting-cgroup/20241023-155504
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20241023075302.27194-8-maarten.lankhorst%40linux.intel.com
patch subject: [PATCH 7/7] [DISCUSSION] drm/gem: Add cgroup memory accounting
config: i386-buildonly-randconfig-002-20241024 (https://download.01.org/0day-ci/archive/20241024/202410242215.yXbniQdG-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241024/202410242215.yXbniQdG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410242215.yXbniQdG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/media/cec/core/cec-adap.c:15:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/media/cec/core/cec-adap.c:20:
   In file included from include/drm/drm_device.h:4:
>> include/linux/cgroup_dev.h:61:12: error: cannot combine with previous 'int' declaration specifier
      61 | static int int dev_cgroup_try_charge(struct dev_cgroup_device *cgdev,
         |            ^
>> include/linux/cgroup_dev.h:65:1: error: expected identifier or '('
      65 | {
         | ^
   1 warning and 2 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [y]:
   - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]


vim +/int +61 include/linux/cgroup_dev.h

487073b1855ef4 Maarten Lankhorst 2024-10-23  60  
487073b1855ef4 Maarten Lankhorst 2024-10-23 @61  static int int dev_cgroup_try_charge(struct dev_cgroup_device *cgdev,
487073b1855ef4 Maarten Lankhorst 2024-10-23  62  				     u32 index, u64 size,
487073b1855ef4 Maarten Lankhorst 2024-10-23  63  				     struct dev_cgroup_pool_state **ret_pool,
487073b1855ef4 Maarten Lankhorst 2024-10-23  64  				     struct dev_cgroup_pool_state **ret_limit_pool);
487073b1855ef4 Maarten Lankhorst 2024-10-23 @65  {
487073b1855ef4 Maarten Lankhorst 2024-10-23  66  	*ret_pool = NULL;
487073b1855ef4 Maarten Lankhorst 2024-10-23  67  
487073b1855ef4 Maarten Lankhorst 2024-10-23  68  	if (ret_limit_pool)
487073b1855ef4 Maarten Lankhorst 2024-10-23  69  		*ret_limit_pool = NULL;
487073b1855ef4 Maarten Lankhorst 2024-10-23  70  
487073b1855ef4 Maarten Lankhorst 2024-10-23  71  	return 0;
487073b1855ef4 Maarten Lankhorst 2024-10-23  72  }
487073b1855ef4 Maarten Lankhorst 2024-10-23  73  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
