Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DD018A922;
	Wed, 18 Dec 2024 10:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734516697; cv=none; b=XxijJdWmBckXs3ucO3VlHA2tDazL+CvmIE8RxVtVSwFfNE6QILr5COcTABFAA/6X4iyOXP8zfqqFfmnRs/ALzvnk4xzghMG+txca+7M8hfoZleOKEwv36nTAnVU5JjfAv1u/LbnwzDA7PIDZf4mrgGHJqf8/4RfOgeF3bs26Nw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734516697; c=relaxed/simple;
	bh=WMvlYVGz3j4rZ5QesExKs8qmH9X91M1RjiYxC53mldU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hrgcfQJlrLatBxWo+iXyzuaSBwEpCoBFSK141TtAh3DVardBzGomeJeK66r5EM17YgUkPz3uKPZRTOAGOKH78VHHp/+72q5/LSfu0TsfiB4pN4m+Ia9O0v8v05LgPb3W7hMkn595S/7ZpvMyvVb7fLPu0+syg1wK4OF8reSqACk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gb9QOlNM; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gb9QOlNM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734516696; x=1766052696;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WMvlYVGz3j4rZ5QesExKs8qmH9X91M1RjiYxC53mldU=;
  b=Gb9QOlNMpT3iVKbCaHeRNujoqlJxs6G0erZmGYjDK3Uc+Hca8KjGL4ue
   qLnJhiI1AWPgtMw45wNSM+Xxm5E0IVpia3kVaDtEK/QKhpwMIm7tR1QPu
   2ctkcPwhzZ21sMGoSnMY6aIgFicYp1XN+KSoTxb7SwaPCd5/a2MO8o0tl
   wMQXDj/hLbR/JzxzqkOur5T3K3Gegm1HKcQJVDwL5DtsY4/H9d1ME4oqH
   6wyln794i28Q4Ktv2DmBKO8Ci5p8YvcnyuT4VnPSPubp891O/1xPzUHIK
   a/m/WMnHZ3pSEmmVrI7ojwU1IbpnGfYpI/a+t/zWShkJaQhi0INX/+Z1z
   A==;
X-CSE-ConnectionGUID: qB4ZBgzVS+CggujUsdflqg==
X-CSE-MsgGUID: BuW3my9jTruLE3Tk/xk2RQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="34877136"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="34877136"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 02:11:35 -0800
X-CSE-ConnectionGUID: 4UF7S7U5R9OyuvYrO/UqyQ==
X-CSE-MsgGUID: eh7KBheZQmaDDgvL3CzGlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="102806771"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 18 Dec 2024 02:11:34 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNr1f-000GHK-0a;
	Wed, 18 Dec 2024 10:11:31 +0000
Date: Wed, 18 Dec 2024 18:10:33 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:kvm-arm64/nv-next 14/20]
 arch/arm64/include/asm/kvm_nested.h:341:9: error: use of undeclared
 identifier 'FIX_VNCR'
Message-ID: <202412181841.zAqOqCRd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/nv-next
head:   1e2a09d0a43f9c19dae9d321b4a5c840d45fc88b
commit: 0cb2c18e124cd31e01221ed6c60fddc478e3286b [14/20] KVM: arm64: nv: Handle mapping of VNCR_EL2 at EL2
config: arm64-randconfig-001-20241218 (https://download.01.org/0day-ci/archive/20241218/202412181841.zAqOqCRd-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 2dc22615fd46ab2566d0f26d5ba234ab12dc4bf8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241218/202412181841.zAqOqCRd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412181841.zAqOqCRd-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kernel/smp.c:21:
   In file included from include/linux/mm.h:2223:
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
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/kernel/smp.c:46:
   In file included from arch/arm64/include/asm/kvm_mmu.h:99:
   In file included from arch/arm64/include/asm/kvm_emulate.h:21:
>> arch/arm64/include/asm/kvm_nested.h:341:9: error: use of undeclared identifier 'FIX_VNCR'
     341 |         return FIX_VNCR - cpu;
         |                ^
   4 warnings and 1 error generated.


vim +/FIX_VNCR +341 arch/arm64/include/asm/kvm_nested.h

   337	
   338	static inline unsigned int vncr_fixmap(unsigned int cpu)
   339	{
   340		BUG_ON(cpu > NR_CPUS);
 > 341		return FIX_VNCR - cpu;
   342	}
   343	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
