Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2377538E;
	Sat, 20 Jan 2024 16:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705769151; cv=none; b=hXicXL6YAEOq9XLgagwRW6h0TvjrnWXu/k4Ne2ZwN/jFPVTwAnZS6ca0WxgnN7rr1bex0CCbRMjnA5n+jgOFfkmdEWb+2ZuPGDCzpPNfKRR6vwAb1O+s/C6rV2aOABeC9S/hlRsz84jA2nMj/NabIH+9h2mXw5rNejIqn3keNBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705769151; c=relaxed/simple;
	bh=oLfRbzsDL54Ca8ky7ImNsIIyd9ndBwYsmOAJIXNyOCI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GeVcULVWM+YkUCMZRIr2fHNtMBbjrwqLL8qweXo061W+ZI8iJJjzxZdR2O9CHJgphflg896+ZVgO96cETndB9j5NgdRNJBqPmqDaK/xs72RWUGTAIIaob59n3gMfvmmXwqU9V11ZKD8nldei/9pvm4Stl37JKjBX8kRNyynGLdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lutKKJry; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lutKKJry"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705769149; x=1737305149;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oLfRbzsDL54Ca8ky7ImNsIIyd9ndBwYsmOAJIXNyOCI=;
  b=lutKKJryeJp5dyIz4CHAL4P+oIoHx1OcwYjYMwo/ULC44ecbbGjOkoni
   EkxMH+Rd1ZAnU/jYY5cM15GbWLONhuKuF8Z7T3e0vF5PAtM8wIil5oTZL
   KONft3zL3NJhOe6nn6uNgmA36D3AP6+58yDGAlKymacUPFKqNrcG0JWRu
   o4U/2onr+1mZ8zf+uQ+9clFGg6gvpDATSKmEeK218ekhIT0+3YrMEujkj
   4i58BGY8KmnfZSwfIkrPjAjxxVZqCxEiioMmVQgQOovJuadiyRc0MZAwS
   xj4/bS9U8/+ZtG54gil37vEMIFNUwV+xWFyvXJ9s2+/BndPfTdF/IxGJN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10959"; a="7633293"
X-IronPort-AV: E=Sophos;i="6.05,208,1701158400"; 
   d="scan'208";a="7633293"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2024 08:45:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10959"; a="904438246"
X-IronPort-AV: E=Sophos;i="6.05,208,1701158400"; 
   d="scan'208";a="904438246"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2024 08:45:46 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRETY-0005HG-1z;
	Sat, 20 Jan 2024 16:45:44 +0000
Date: Sun, 21 Jan 2024 00:44:58 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:rmap_batching 3/11] include/linux/pgtable.h:227:3:
 error: call to undeclared function 'ptep_set_wrprotect'; ISO C99 and later
 do not support implicit function declarations
Message-ID: <202401210031.nDeCDGF7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux rmap_batching
head:   c54f3b69b7a799efa06dbf58a60db9b3fac04111
commit: d84c9158468598cb15b038bca27fd80e113b456c [3/11] mm/memory: optimize fork() with PTE-mapped THP
config: arm-mmp2_defconfig (https://download.01.org/0day-ci/archive/20240121/202401210031.nDeCDGF7-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240121/202401210031.nDeCDGF7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401210031.nDeCDGF7-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:29:
   include/linux/pgtable.h:218:38: error: use of undeclared identifier 'PFN_PTE_SHIFT'
           return __pte(pte_val(pte) + (1UL << PFN_PTE_SHIFT));
                                               ^
>> include/linux/pgtable.h:227:3: error: call to undeclared function 'ptep_set_wrprotect'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                   ptep_set_wrprotect(mm, addr, ptep);
                   ^
   include/linux/pgtable.h:227:3: note: did you mean 'pte_wrprotect'?
   arch/arm/include/asm/pgtable.h:226:21: note: 'pte_wrprotect' declared here
   static inline pte_t pte_wrprotect(pte_t pte)
                       ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:29:
   include/linux/pgtable.h:638:20: error: static declaration of 'ptep_set_wrprotect' follows non-static declaration
   static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long address, pte_t *ptep)
                      ^
   include/linux/pgtable.h:227:3: note: previous implicit declaration is here
                   ptep_set_wrprotect(mm, addr, ptep);
                   ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:1095:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                   return (set->sig[3] | set->sig[2] |
                           ^        ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:1095:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                   return (set->sig[3] | set->sig[2] |
                                         ^        ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:1095:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                   return  (set1->sig[3] == set2->sig[3]) &&
                            ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:1095:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                   return  (set1->sig[3] == set2->sig[3]) &&
                                            ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:1095:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                           (set1->sig[2] == set2->sig[2]) &&
                            ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:1095:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                           (set1->sig[2] == set2->sig[2]) &&
                                            ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:1095:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 3 is past the end of the array (which contains 2 elements) [-Warray-bounds]


vim +/ptep_set_wrprotect +227 include/linux/pgtable.h

   221	
   222	#ifndef wrprotect_ptes
   223	static inline void wrprotect_ptes(struct mm_struct *mm, unsigned long addr,
   224			pte_t *ptep, unsigned int nr)
   225	{
   226		for (;;) {
 > 227			ptep_set_wrprotect(mm, addr, ptep);
   228			if (--nr == 0)
   229				break;
   230			ptep++;
   231			addr += PAGE_SIZE;
   232		}
   233	}
   234	#endif
   235	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
