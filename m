Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F961F8EF5;
	Tue,  4 Feb 2025 07:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738653270; cv=none; b=swEjMOKLsWtL7C8bpK8RLu2tjHiaaN3QpRSAgX3W1V2nAcxFetCVDtApOUJV+IAbZ79eFtNXpw60EirECwJONd+wyf/ddF5rH5hcLXnKGD+tXgFyq6+uCZ1jePslFpVawMdrFIGv6PFog2kDShan3m5lzMpOuC64QNxKs5Sj3iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738653270; c=relaxed/simple;
	bh=1ycC49c2fsA14ZcrJdVRjHXXDqHdL076bO/6awXhSv4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lpkGf9coW0cScp8HHHl0795yOK9+fnxjUpHyWmgT2D05jXnXf4x1sB0Fsh6RLWInwT3dMeZMA9+zl/wB/xdq7hWo32oXsb8xPVeZpt2sCm88meSUatf6Wk5ME/z/tbvPCoXx/B8GPmjuBo3J+KEVQpmydW/F9dFS21xOdxyL38g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mdunrnow; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mdunrnow"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738653269; x=1770189269;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1ycC49c2fsA14ZcrJdVRjHXXDqHdL076bO/6awXhSv4=;
  b=mdunrnow0O8uYrGF/rJCyXuix38fbAXHC8xdi4Gd1Pqe/bYpJwMgZLvS
   +z2/rBk7KmbgTnRCePFFvlie8QFeIuuld2SIOlH3E3FcE/QNkpL17invo
   qGMOUU78oL5HSD1PmmfJqX2jSPvazCl7IVTRaNulKKb6FKC/EU6/OzL8s
   2lg50tky0TTqCDmtWpbSr6TlRYZtlCsPvE1ZdL/qeF/z1xXm7FDtgwERe
   fA4i0m4BlqG5nskH7Fpojvc4oDRUa3MUpahTioU3Le4am/5YFXyMPyc4l
   0N4fKO98f6dWbhshbju9Q0PSTpm2cRnvPTXS342ZHzlqbBoAiqZmONxY9
   Q==;
X-CSE-ConnectionGUID: us9DfQxRQi+XwzFF+h+Csw==
X-CSE-MsgGUID: 7DFSCykMRUKkurJMUc3huQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="39321469"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; 
   d="scan'208";a="39321469"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 23:14:28 -0800
X-CSE-ConnectionGUID: 8iYRmaFZRXC+MwXEDp5ShA==
X-CSE-MsgGUID: Y8OLfZz5SqeWgjAW1DWHGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; 
   d="scan'208";a="115529300"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 03 Feb 2025 23:14:26 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfD8a-000s8G-1N;
	Tue, 04 Feb 2025 07:14:24 +0000
Date: Tue, 4 Feb 2025 15:13:57 +0800
From: kernel test robot <lkp@intel.com>
To: Selvin Xavier <selvin.xavier@broadcom.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Leon Romanovsky <leon@kernel.org>
Subject: [leon-rdma:rdma-next 17/75]
 drivers/infiniband/hw/bnxt_re/debugfs.h:34:33: error: fields must have a
 constant size: 'variable length array in structure' extension will never be
 supported
Message-ID: <202502041505.33zAsiMp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rdma-next
head:   10565c5cadcb629f7780d24dd351878de9f46db5
commit: a3c71713d9548f1a9ee141c7cfb35550c3487443 [17/75] RDMA/bnxt_re: Congestion control settings using debugfs hook
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250204/202502041505.33zAsiMp-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250204/202502041505.33zAsiMp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502041505.33zAsiMp-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/infiniband/hw/bnxt_re/main.c:39:
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
   In file included from drivers/infiniband/hw/bnxt_re/main.c:70:
>> drivers/infiniband/hw/bnxt_re/debugfs.h:34:44: warning: variable length array used [-Wvla]
      34 |         struct bnxt_re_cc_param        gen0_parms[BNXT_RE_CC_PARAM_GEN0];
         |                                                   ^~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/bnxt_re/debugfs.h:24:31: note: expanded from macro 'BNXT_RE_CC_PARAM_GEN0'
      24 | #define BNXT_RE_CC_PARAM_GEN0   __ffs(CMDQ_MODIFY_ROCE_CC_MODIFY_MASK_INACTIVITY_CP)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/infiniband/hw/bnxt_re/debugfs.h:34:33: error: fields must have a constant size: 'variable length array in structure' extension will never be supported
      34 |         struct bnxt_re_cc_param        gen0_parms[BNXT_RE_CC_PARAM_GEN0];
         |                                        ^
   4 warnings and 1 error generated.


vim +34 drivers/infiniband/hw/bnxt_re/debugfs.h

    32	
    33	struct bnxt_re_dbg_cc_config_params {
  > 34		struct bnxt_re_cc_param        gen0_parms[BNXT_RE_CC_PARAM_GEN0];

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
