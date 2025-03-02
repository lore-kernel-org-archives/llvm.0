Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7783175D50;
	Sun,  2 Mar 2025 04:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740890359; cv=none; b=ZBwvssPc7q6+tAwaBnMihgtrH4H6yayayiyZDNErLz/SK1UVgxRCiqXFAT5XXK8/KIPMPLLTHkstyKIOcbg8fG6ukr3vu4Ix5OosfXufl42Qhbeqf1eEQIWO90Kzv+/LcUTNsDmMhKLetCY4/UbMal5w8T9Fi4M7fXFsN5BySro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740890359; c=relaxed/simple;
	bh=IdMjaK9xgHI+W9iXYhbBJedV3Qp+YpLsAvp+7dad2r0=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KIdmk/1ChVQoIKINep6ytm/G33RPEDl6OXNDxnC1lsCTqGNhmIUgoidSKS2eHpay+We9443pmeFU1fg1TyYoDytz8I0sNmFtmk+PXKsYE7XqXyr2fx3lgFm5PVNbl1NmHa+CfabluonpR3FtKJuBBES8xrYOrhHnbMvT5ZL2Uyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DVJ+85bN; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DVJ+85bN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740890358; x=1772426358;
  h=date:from:cc:subject:message-id:mime-version;
  bh=IdMjaK9xgHI+W9iXYhbBJedV3Qp+YpLsAvp+7dad2r0=;
  b=DVJ+85bNCtsvxuITm75ZnNW69O9eQq3bUC7U3Xxu66+/MrTnD0apnBXP
   viLTfP432RJefONdqqSjraBDCO7ucTOywSrpRCdndL2c82Bhb8cHmF6G0
   sFGvmrkIDorXuR8Jgnt4ocHjADwq8g+AtVvkEVye/4AIix4EwD4WxPsm/
   +WIDsKo6Alp92sofPEkFfF3M6FzEJM4Fkw9a/uzdicRPcDuNTbzHgCPyu
   0SFa0uCSr+6c8IyyHP/gBtdmQYTcTe6967py0TWhQu1TR3Q3Aqihr6ckx
   qNT/YC8vOspvX4lxRFt9ZkNGbgIEG2LeJAknqna/5bhiLqdNwmlLW8yLN
   g==;
X-CSE-ConnectionGUID: eRikR+59S9Gi5/eG4yI9Mw==
X-CSE-MsgGUID: EQi8XpgjQjOBAcpRAZ+Rig==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41972366"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="41972366"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 20:39:18 -0800
X-CSE-ConnectionGUID: jfsO0aUZQj2Zb8OerSALnA==
X-CSE-MsgGUID: FiAQiKiZRpm7OQ7oPF6EeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="140922584"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 01 Mar 2025 20:39:16 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tob6f-000H3u-36;
	Sun, 02 Mar 2025 04:39:13 +0000
Date: Sun, 2 Mar 2025 12:38:37 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: net/netfilter/nf_bpf_link.c:186:33: warning: bitwise operation
 between different enumeration types ('enum bpf_reg_type' and 'enum
 bpf_type_flag')
Message-ID: <202503021244.CdSIteqW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Florian Westphal <fw@strlen.de>
CC: Alexei Starovoitov <ast@kernel.org>

Hi Florian,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ece144f151ac7bf8bb5b98f7d4aeeda7a2eed02a
commit: fd9c663b9ad67dedfc9a3fd3429ddd3e83782b4d bpf: minimal support for programs hooked into netfilter framework
date:   1 year, 10 months ago
config: x86_64-buildonly-randconfig-004-20241224 (https://download.01.org/0day-ci/archive/20250302/202503021244.CdSIteqW-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250302/202503021244.CdSIteqW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503021244.CdSIteqW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/netfilter/nf_bpf_link.c:2:
   In file included from include/linux/bpf.h:21:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:1970:
   include/linux/vmstat.h:502:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     502 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     503 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:509:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     509 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     510 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:516:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     516 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:521:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     521 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     522 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> net/netfilter/nf_bpf_link.c:186:33: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     186 |         info->reg_type = PTR_TO_BTF_ID | PTR_TRUSTED;
         |                          ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   5 warnings generated.


vim +186 net/netfilter/nf_bpf_link.c

   170	
   171	static bool nf_ptr_to_btf_id(struct bpf_insn_access_aux *info, const char *name)
   172	{
   173		struct btf *btf;
   174		s32 type_id;
   175	
   176		btf = bpf_get_btf_vmlinux();
   177		if (IS_ERR_OR_NULL(btf))
   178			return false;
   179	
   180		type_id = btf_find_by_name_kind(btf, name, BTF_KIND_STRUCT);
   181		if (WARN_ON_ONCE(type_id < 0))
   182			return false;
   183	
   184		info->btf = btf;
   185		info->btf_id = type_id;
 > 186		info->reg_type = PTR_TO_BTF_ID | PTR_TRUSTED;
   187		return true;
   188	}
   189	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
