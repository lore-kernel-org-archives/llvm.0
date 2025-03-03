Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974741531C8;
	Mon,  3 Mar 2025 17:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741021805; cv=none; b=gcIpxcToNVpBZgFM42s7UeyPAc3qPWdxzhjleOH0nSggysdnoMv15YUa99XVB6SFffHc8ZcvWx6aJVRpIL8xjWsmewCsfU3CfkqnOyYKcSve/YlnfSOQ9XoVl8p910lWEccO2kRpOMmOd05k3vEvYD25gM/3dPzr8Ask5ULCI3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741021805; c=relaxed/simple;
	bh=a3ZobddhipgWojHTpxG17gQFRmXW4aCuZ7oTKhRfslU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MDu6KXVyX/SMx0KHQKBXzutFmgSmMF3fahfF+jXbCorCofvgYVal8dWycykDd4hBQNZr18H1G6nQsi+s6QbgPgg2Ua4nMODJ7gYaLi3CjLtdGqzSJQXWe/HXIKuJSmK9QEqg3TeXCzd34rH3FHeXdl48HmB2KyS4aLyleBpM61w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ODT2KNfw; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ODT2KNfw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741021803; x=1772557803;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a3ZobddhipgWojHTpxG17gQFRmXW4aCuZ7oTKhRfslU=;
  b=ODT2KNfweJvSazdCfrfSQ9TXAhzqhe9B/AejMCAsKIUb+L4Ua95dLckM
   +FgVdONGI0ggTm00DUX7qWhL8Y+t2/Io8zoa6+iIdw6cB0Q4mhVrgJmsF
   yx9viuVrzZw3C654yArU6/709Ie+NMwZ8Gv09UmeuEo7ZqzszYYr/IfgV
   M7HeA4XGrh9r1J2kkMSkZ/zfr5CjxnJGUbaf4GeNbsAsCjbROSIDJdL9F
   8xf3mHF9GPTcrrn3nw/5+xAWIdSIz0hnxg+BHmKrCqVKar0BPu4SvW0Y2
   n8j748bcFSO3Kb6/BVkXJu2zhggs4uaPb3Tod2SiberYlJ+VYqSCje1hS
   A==;
X-CSE-ConnectionGUID: +pVaQItWSB+s9ujLjiiHNA==
X-CSE-MsgGUID: H6qiRYUCQF+a6ydpUJOiJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="67278619"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; 
   d="scan'208";a="67278619"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 09:10:02 -0800
X-CSE-ConnectionGUID: 3ajuHV0FRV6fRSfK+2AYzg==
X-CSE-MsgGUID: apAQwzfQR8SYamVRB7lkTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; 
   d="scan'208";a="118791181"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 03 Mar 2025 09:10:01 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tp9Ik-000IkE-2q;
	Mon, 03 Mar 2025 17:09:58 +0000
Date: Tue, 4 Mar 2025 01:09:08 +0800
From: kernel test robot <lkp@intel.com>
To: Rik van Riel <riel@surriel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Borislav Petkov (AMD)" <bp@alien8.de>,
	Nadav Amit <nadav.amit@gmail.com>
Subject: [bp:tip-x86-cpu-tlbi 15/18] arch/x86/mm/tlb.c:492:2: error: call to
 undeclared function 'mm_clear_asid_transition'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202503040000.GtiWUsBm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bp/bp.git tip-x86-cpu-tlbi
head:   8dce44810022279f97780a5eadda766a6f4017a3
commit: a05a1e35e67bfe03704633c51ca9b03e16fffd06 [15/18] x86/mm: Enable broadcast TLB invalidation for multi-threaded processes
config: i386-buildonly-randconfig-003-20250303 (https://download.01.org/0day-ci/archive/20250304/202503040000.GtiWUsBm-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250304/202503040000.GtiWUsBm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503040000.GtiWUsBm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/mm/tlb.c:492:2: error: call to undeclared function 'mm_clear_asid_transition'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     492 |         mm_clear_asid_transition(mm);
         |         ^
   arch/x86/mm/tlb.c:492:2: note: did you mean 'mm_in_asid_transition'?
   arch/x86/include/asm/tlbflush.h:299:20: note: 'mm_in_asid_transition' declared here
     299 | static inline bool mm_in_asid_transition(struct mm_struct *mm) { return false; }
         |                    ^
   1 error generated.


vim +/mm_clear_asid_transition +492 arch/x86/mm/tlb.c

   455	
   456	static void finish_asid_transition(struct flush_tlb_info *info)
   457	{
   458		struct mm_struct *mm = info->mm;
   459		int bc_asid = mm_global_asid(mm);
   460		int cpu;
   461	
   462		if (!mm_in_asid_transition(mm))
   463			return;
   464	
   465		for_each_cpu(cpu, mm_cpumask(mm)) {
   466			/*
   467			 * The remote CPU is context switching. Wait for that to
   468			 * finish, to catch the unlikely case of it switching to
   469			 * the target mm with an out of date ASID.
   470			 */
   471			while (READ_ONCE(per_cpu(cpu_tlbstate.loaded_mm, cpu)) == LOADED_MM_SWITCHING)
   472				cpu_relax();
   473	
   474			if (READ_ONCE(per_cpu(cpu_tlbstate.loaded_mm, cpu)) != mm)
   475				continue;
   476	
   477			/*
   478			 * If at least one CPU is not using the global ASID yet,
   479			 * send a TLB flush IPI. The IPI should cause stragglers
   480			 * to transition soon.
   481			 *
   482			 * This can race with the CPU switching to another task;
   483			 * that results in a (harmless) extra IPI.
   484			 */
   485			if (READ_ONCE(per_cpu(cpu_tlbstate.loaded_mm_asid, cpu)) != bc_asid) {
   486				flush_tlb_multi(mm_cpumask(info->mm), info);
   487				return;
   488			}
   489		}
   490	
   491		/* All the CPUs running this process are using the global ASID. */
 > 492		mm_clear_asid_transition(mm);
   493	}
   494	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
