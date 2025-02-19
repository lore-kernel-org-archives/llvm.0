Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7AF1494DF;
	Wed, 19 Feb 2025 18:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739989208; cv=none; b=o2AVwN2HxyKBYSkaet/YsRqPWdc/jKaGwRCCID0a3DEBTBwJJCC1USZqnFtFUKxEJJnFBODKcEgYw8PeCpfyjH8/AIpUI2+ALnrQGqVcUvK44/G0QAg8OGQ3yggXfyeVD81ykbn46KsIJVt5J3ysYCil1e2rkq772cn3kfwZ6wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739989208; c=relaxed/simple;
	bh=3kziXbn//yaADzUrX0EyZDBLqNCTmgKRMDgdUCk/Cm4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SOHmBYNiku9oL+Fr14uRBY+hpTVpNRogohHkvzzT+cg7VRevJlhKZ0Cfy4czz4ubjWvHY15+A/YQ08rdSvTYAHl1qLhBLDt16XbomyEJJeevel6gCQVpYXYJhQKbdpaZFTI2ZeLMmY6Z1se6xLo4WS9uTHloPVVo3uKgkOH5RaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nTH/gYI/; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nTH/gYI/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739989207; x=1771525207;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3kziXbn//yaADzUrX0EyZDBLqNCTmgKRMDgdUCk/Cm4=;
  b=nTH/gYI/ME+XOLZ4bZV5rkq4cbWYcHMJVJjwx7bourt7jlIjAKUltvzk
   m7yVC4OL7i425RSJ19Ti6HF1Ksd992OZ1+NtiD24omQIXlEK3bJmNd7F/
   hu7MT8Tf0t+1sl1jCpUQdnkXTPcWwNbNzwRsLb753HT+fTXk6F2IG9eKc
   0cDTmPvLhN4acIQkMQJVruIKd0ooYHoerlkUCvQQx9xw9zn6tKNn4Hz1F
   4PmLUeztweONR8igbpdr9FYJm8N9oYtHtK7khXCrnwH1/aG86LKtN5XRM
   i5GsKEkPUViQOocqaYZBXO8DlzKoaofBgjgJ+Ggjw9hCH4eTiQIP+djln
   w==;
X-CSE-ConnectionGUID: POOhvhKTQpqPsHAn6vGTYg==
X-CSE-MsgGUID: M2GrgsJsQDWFKWed4oNp7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="51380863"
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; 
   d="scan'208";a="51380863"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 10:20:06 -0800
X-CSE-ConnectionGUID: UoPXK1CkTeO3RJVlM4kjXg==
X-CSE-MsgGUID: 7B61ae8aQAWjyeC9zznHvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; 
   d="scan'208";a="114983613"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 19 Feb 2025 09:49:12 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkoBr-0003GL-30;
	Wed, 19 Feb 2025 17:48:57 +0000
Date: Thu, 20 Feb 2025 01:48:34 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/fineibt-bhi 16/17]
 arch/x86/kernel/alternative.c:1620:26: error: expected ';' after asm
 statement
Message-ID: <202502200149.7Lh2AOUr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/fineibt-bhi
head:   fc37d12eb49df491173cf99055fce6108a2a99a3
commit: 5095a689d0f306c9ce4c9ff5d905626f0fa557ed [16/17] x86/ibt: Implement FineIBT-BHI mitigation
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250220/202502200149.7Lh2AOUr-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250220/202502200149.7Lh2AOUr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502200149.7Lh2AOUr-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/alternative.c:6:
   In file included from include/linux/perf_event.h:18:
   In file included from include/uapi/linux/bpf_perf_event.h:11:
   In file included from ./arch/x86/include/generated/uapi/asm/bpf_perf_event.h:1:
   In file included from include/uapi/asm-generic/bpf_perf_event.h:4:
   In file included from include/linux/ptrace.h:10:
   In file included from include/linux/pid_namespace.h:7:
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
>> arch/x86/kernel/alternative.c:1620:26: error: expected ';' after asm statement
    1620 |         OPTIMIZER_HIDE_VAR(addr)
         |                                 ^
         |                                 ;
   3 warnings and 1 error generated.


vim +1620 arch/x86/kernel/alternative.c

  1590	
  1591	/*
  1592	 * regs->ip points to one of the UD2 in __bhi_args[].
  1593	 */
  1594	static bool decode_fineibt_bhi(int ud_type, struct pt_regs *regs,
  1595				       unsigned long *target, u32 *type)
  1596	{
  1597		unsigned long addr;
  1598		u32 hash;
  1599	
  1600		/*
  1601		 * Fetch the return address from the stack, this points to the
  1602		 * FineIBT preamble. Since the CALL instruction is in the 5 last
  1603		 * bytes of the preamble, the return address is in fact the target
  1604		 * address.
  1605		 */
  1606		__get_kernel_nofault(&addr, regs->sp, unsigned long, Efault);
  1607		*target = addr;
  1608	
  1609		addr -= fineibt_preamble_size;
  1610		__get_kernel_nofault(&hash, addr + fineibt_preamble_hash, u32, Efault);
  1611		*type = (u32)regs->r10 + hash;
  1612	
  1613		/*
  1614		 * Non-fatal CFI cannot continue with the BHI stub, as it would
  1615		 * clobber the argument registers, relocate the instruction stream to
  1616		 * __bhi_args[0] to avoid this.
  1617		 */
  1618		addr = regs->ip & 0x1F;
  1619		addr += (unsigned long)&__bhi_args[0];
> 1620		OPTIMIZER_HIDE_VAR(addr)
  1621		addr += LEN_UD2;
  1622		regs->ip = addr;
  1623	
  1624		return true;
  1625	
  1626	Efault:
  1627		return false;
  1628	}
  1629	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
