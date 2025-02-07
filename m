Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44EDD23C8AA;
	Fri,  7 Feb 2025 21:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738965498; cv=none; b=rF4yAHkepTkzwV2iuelcBudCnAZFpzVQU9XOqj7QoUbzQ0ZryUm6/RYJV+QomnONkPYvXnLvYz/WKHj61dvqcM4sn40xymy4UdBcH0afE4RdxkPw3Qi+WY3EUUZIBEihC81rBmLLs5rJ+JR/mLx/iqRlDj4CkstYYyVRLpvGB24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738965498; c=relaxed/simple;
	bh=+0UJecPvaNHVEd/VrjUdDCAloPxRUR0ZBN+xsawcj+I=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i3LWlHxYjH4nWItN0JP5jYVao1p+b4LfTQByYrDSlmW1LPSSsGeIOZFVMzBYVOM+vwSMYRsFD/uPLmUFA2O+lDWmyKUDQgGcdw7rS+gOYaesZAmHD0TkhWL0e+wjGyjQQvSivGxBE2Jag4k+mKnvOY/jnjB/Kpuhfut1noU3dr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XQsd/0eg; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XQsd/0eg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738965496; x=1770501496;
  h=date:from:cc:subject:message-id:mime-version;
  bh=+0UJecPvaNHVEd/VrjUdDCAloPxRUR0ZBN+xsawcj+I=;
  b=XQsd/0egSISNYDBpKvWBCpKg6IzRN6Py8OASKPXCPhVlTt8HwXxHRRJP
   DDnbA+av/cmOqNTDzBUh8ZP+Nb1dlw6a4jnNH5Nby4S5jbsHOmFav0zn/
   Hq0OkkQcpAfjybvXc8kM3LzLRuKo0HFPPVydvCLFU67JEjnhcFrA335jf
   JsD4KcL0g3WWUh3pf4eRGAQxLhefdc7Bd0pHpPvTotfCfBIarRfRtDPZ4
   jHxLC2JkdIp3Hjz+QaQIIfAIvAHHLQ1wg5SJVoWpTWb1+n1ry0IA7Napr
   V9FEFmisei1zLYG10Uwe4sRtbDt+DIyb4GyVTpLxAMtWXde875XQqvWSN
   w==;
X-CSE-ConnectionGUID: JHnlOJ4gSH2KoUdieYfbeg==
X-CSE-MsgGUID: RHu5kPBtQU28fQYeo/vc4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="39311849"
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; 
   d="scan'208";a="39311849"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 13:58:15 -0800
X-CSE-ConnectionGUID: OOj/hpgSROGJuQ2E8NJ1rg==
X-CSE-MsgGUID: 9P3m7rBoQYC7C2J+GTpTPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; 
   d="scan'208";a="111584871"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 Feb 2025 13:58:14 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgWMV-000z69-24;
	Fri, 07 Feb 2025 21:58:11 +0000
Date: Sat, 8 Feb 2025 05:57:54 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:615:42: warning: arithmetic
 between different enumeration types ('enum amdgpu_ras_block' and 'enum
 amdgpu_ras_mca_block')
Message-ID: <202502080537.uHN24DQs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: John Clements <john.clements@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Hawking Zhang <Hawking.Zhang@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bb066fe812d6fb3a9d01c073d9f1e2fd5a63403b
commit: 640ae42efb828be69a9ee6ac88fb3d5a3e678ddf drm/amdgpu: Updated RAS infrastructure
date:   3 years, 5 months ago
config: x86_64-randconfig-161-20241229 (https://download.01.org/0day-ci/archive/20250208/202502080537.uHN24DQs-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502080537.uHN24DQs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502080537.uHN24DQs-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:29:
   In file included from include/linux/syscalls.h:87:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:6:
   In file included from include/linux/ring_buffer.h:5:
   In file included from include/linux/mm.h:1600:
   include/linux/vmstat.h:436:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     436 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     437 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:443:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     443 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     444 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:450:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     450 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:455:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     455 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     456 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:464:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     464 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     465 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:615:42: warning: arithmetic between different enumeration types ('enum amdgpu_ras_block' and 'enum amdgpu_ras_mca_block') [-Wenum-enum-conversion]
     615 |                 for (i = 0; i < AMDGPU_RAS_BLOCK_COUNT + AMDGPU_RAS_MCA_BLOCK_COUNT; i++) {
         |                                 ~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:858:6: warning: no previous prototype for function 'amdgpu_ras_mca_query_error_status' [-Wmissing-prototypes]
     858 | void amdgpu_ras_mca_query_error_status(struct amdgpu_device *adev,
         |      ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:858:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     858 | void amdgpu_ras_mca_query_error_status(struct amdgpu_device *adev,
         | ^
         | static 
   7 warnings generated.


vim +615 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c

   588	
   589	/* return an obj equal to head, or the first when head is NULL */
   590	struct ras_manager *amdgpu_ras_find_obj(struct amdgpu_device *adev,
   591			struct ras_common_if *head)
   592	{
   593		struct amdgpu_ras *con = amdgpu_ras_get_context(adev);
   594		struct ras_manager *obj;
   595		int i;
   596	
   597		if (!adev->ras_enabled || !con)
   598			return NULL;
   599	
   600		if (head) {
   601			if (head->block >= AMDGPU_RAS_BLOCK_COUNT)
   602				return NULL;
   603	
   604			if (head->block == AMDGPU_RAS_BLOCK__MCA) {
   605				if (head->sub_block_index >= AMDGPU_RAS_MCA_BLOCK__LAST)
   606					return NULL;
   607	
   608				obj = &con->objs[AMDGPU_RAS_BLOCK__LAST + head->sub_block_index];
   609			} else
   610				obj = &con->objs[head->block];
   611	
   612			if (alive_obj(obj))
   613				return obj;
   614		} else {
 > 615			for (i = 0; i < AMDGPU_RAS_BLOCK_COUNT + AMDGPU_RAS_MCA_BLOCK_COUNT; i++) {
   616				obj = &con->objs[i];
   617				if (alive_obj(obj))
   618					return obj;
   619			}
   620		}
   621	
   622		return NULL;
   623	}
   624	/* obj end */
   625	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
