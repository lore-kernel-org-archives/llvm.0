Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FE4155CB9;
	Fri,  7 Jun 2024 07:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717744060; cv=none; b=LL3GKHvt2BGv6SMM3wT3J69FnyVzF0FTHgwMMbM1GttS4qM9RENnqHU3D4m/c9T20W+XHIP89eXeyDm8pgTMZuPlk+Wl96eMSC7E1eUePHIqAS7c6h+crSz7qxjlrXKEB32mkkd/5UliO6uA29ydRStW/UnX9KvqP3GKoyrXRb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717744060; c=relaxed/simple;
	bh=VzBTgEMap71oyb/fn732U1n7GZFsqV7RO4coQFnXqjs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HaotsWUEiGCcFgeIZbXN0is6G/a7klSciBo8hSjJi60fV2cB2W0z9ffqmML3ghzgLgU2XPMimTXd1CtbM1SWZhaaGzV7PlC1c4/G0jGQL7S2Zd+qr/iE7Hdy6lpUESzqlo01rroEFLFZg+gH2SaHNAODrRkuieMhCtTTvTfO4uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Al0EVLK8; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Al0EVLK8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717744059; x=1749280059;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VzBTgEMap71oyb/fn732U1n7GZFsqV7RO4coQFnXqjs=;
  b=Al0EVLK8gkpTdP+HSll1JH7VFUDEYJkHoFySirXzPV0Z93dZTN0sUs6u
   dCtc7lGjuUVXM45zSOMcD3GS/PxLlvSOXTtwDTGltFEmAHVXmnt9sUe/R
   k9uncc0BNFkPa7Qkjmcr8hOMTE5ta58V36QW/zOOikp/1nHW8s/heiAZX
   tGn9CLgectaNI0YKvPUll6aXJHfncF12vXhJxbH6n5c72htsiV5d+apHO
   /WenunXuO68jtx0Xb/sE49f2uGgvQ3zrxaNKAgj60f0ncdIm2sTl5boLO
   MQsNqveSULF4huRXNImV2WR4K37iIrKmJg84B8iyIDXuaSZwbALBwkzhO
   w==;
X-CSE-ConnectionGUID: ZQw1ZsT0TlW+k7fext0D7w==
X-CSE-MsgGUID: By6Vh1m2SoaC01HJrpENqw==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="25081310"
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; 
   d="scan'208";a="25081310"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 00:07:36 -0700
X-CSE-ConnectionGUID: XUOnWj95RdCa9aahY4x9SA==
X-CSE-MsgGUID: VLJJbcerQ7+JNR4h5gTJHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; 
   d="scan'208";a="38313412"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 07 Jun 2024 00:07:35 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFThF-0004CG-0a;
	Fri, 07 Jun 2024 07:07:33 +0000
Date: Fri, 7 Jun 2024 15:07:27 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [broonie-misc:kvm-arm64-fix-pkvm-sve-vl 3/5]
 arch/arm64/kernel/fpsimd.c:1096:36: warning: format specifies type 'unsigned
 int' but the argument has type 'unsigned long'
Message-ID: <202406071530.vhvvPnx1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/misc.git kvm-arm64-fix-pkvm-sve-vl
head:   68353e223a2346c7009e15d8b44f6c58e0d5a094
commit: e231f23d830ceaa42055c7464e12f55faf811198 [3/5] arm64/fpsimd: Discover maximum vector length implemented by any CPU
config: arm64-randconfig-002-20240607 (https://download.01.org/0day-ci/archive/20240607/202406071530.vhvvPnx1-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240607/202406071530.vhvvPnx1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406071530.vhvvPnx1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kernel/fpsimd.c:26:
   In file included from include/linux/ptrace.h:10:
   In file included from include/linux/pid_namespace.h:7:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> arch/arm64/kernel/fpsimd.c:1096:36: warning: format specifies type 'unsigned int' but the argument has type 'unsigned long' [-Wformat]
    1095 |                 pr_warn("%s: cpu%d: increases maximum VL to %u\n",
         |                                                             ~~
         |                                                             %lu
    1096 |                         info->name, smp_processor_id(), max_vl);
         |                                                         ^~~~~~
   include/linux/printk.h:517:37: note: expanded from macro 'pr_warn'
     517 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                                    ~~~     ^~~~~~~~~~~
   include/linux/printk.h:464:60: note: expanded from macro 'printk'
     464 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:436:19: note: expanded from macro 'printk_index_wrap'
     436 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   2 warnings generated.


vim +1096 arch/arm64/kernel/fpsimd.c

  1074	
  1075	/*
  1076	 * Check whether the current CPU supports all VQs in the committed set.
  1077	 * This function is called during the bring-up of late secondary CPUs only.
  1078	 */
  1079	int vec_verify_vq_map(enum vec_type type)
  1080	{
  1081		struct vl_info *info = &vl_info[type];
  1082		DECLARE_BITMAP(tmp_map, SVE_VQ_MAX);
  1083		unsigned long b, max_vl;
  1084	
  1085		vec_probe_vqs(info, tmp_map);
  1086	
  1087		/*
  1088		 * Currently the maximum VL is only used for pKVM which
  1089		 * doesn't allow late CPUs but we don't expect asymmetry and
  1090		 * if we encounter any then future users will need handling so
  1091		 * warn if we see anything.
  1092		 */
  1093		max_vl = __bit_to_vl(find_first_bit(tmp_map, SVE_VQ_MAX));
  1094		if (max_vl > info->max_cpu_vl) {
  1095			pr_warn("%s: cpu%d: increases maximum VL to %u\n",
> 1096				info->name, smp_processor_id(), max_vl);
  1097			info->max_cpu_vl = max_vl;
  1098		}
  1099	
  1100		bitmap_complement(tmp_map, tmp_map, SVE_VQ_MAX);
  1101		if (bitmap_intersects(tmp_map, info->vq_map, SVE_VQ_MAX)) {
  1102			pr_warn("%s: cpu%d: Required vector length(s) missing\n",
  1103				info->name, smp_processor_id());
  1104			return -EINVAL;
  1105		}
  1106	
  1107		if (!IS_ENABLED(CONFIG_KVM) || !is_hyp_mode_available())
  1108			return 0;
  1109	
  1110		/*
  1111		 * For KVM, it is necessary to ensure that this CPU doesn't
  1112		 * support any vector length that guests may have probed as
  1113		 * unsupported.
  1114		 */
  1115	
  1116		/* Recover the set of supported VQs: */
  1117		bitmap_complement(tmp_map, tmp_map, SVE_VQ_MAX);
  1118		/* Find VQs supported that are not globally supported: */
  1119		bitmap_andnot(tmp_map, tmp_map, info->vq_map, SVE_VQ_MAX);
  1120	
  1121		/* Find the lowest such VQ, if any: */
  1122		b = find_last_bit(tmp_map, SVE_VQ_MAX);
  1123		if (b >= SVE_VQ_MAX)
  1124			return 0; /* no mismatches */
  1125	
  1126		/*
  1127		 * Mismatches above sve_max_virtualisable_vl are fine, since
  1128		 * no guest is allowed to configure ZCR_EL2.LEN to exceed this:
  1129		 */
  1130		if (__bit_to_vl(b) <= info->max_virtualisable_vl) {
  1131			pr_warn("%s: cpu%d: Unsupported vector length(s) present\n",
  1132				info->name, smp_processor_id());
  1133			return -EINVAL;
  1134		}
  1135	
  1136		return 0;
  1137	}
  1138	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
