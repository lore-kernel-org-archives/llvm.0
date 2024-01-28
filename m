Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025982C6AA;
	Sun, 28 Jan 2024 16:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706460758; cv=none; b=Ng19pJgKRbwgpFqPbIGDMEMkUywnwFbhKyB+UV/E26ZBGAPp9+soTPhYLVGTLMcbkEvfQjPY4eH051V7P+Mg3cExvwIz9QQdHTcin+1xhHUU5pcr80fPu3V5xzJ6A3NeL/kkVZ4gEolfvuEvMBERVJ4TiOJL8mOtoL+P6kywD9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706460758; c=relaxed/simple;
	bh=rqiN7WutWbK5ymMl1qTBn2MlnbhUIc4/u+NN2fkjLnk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AwO2h9fhslcl1sJzWBoHPrpAJOGgmVVgC32DqvQ3djSCZZ0AgjFDXSMQNXWyU4u7cD4QFkolW8DCVewWpYwa2cQ17oV51J2U6AQIiz7Ttzbxmod2uFiN5VpNGElLBgC91Z190mvvHtAz3hwLit1KY765hdRgCDl+n6tT9ptOO00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pf5q1maU; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pf5q1maU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706460756; x=1737996756;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rqiN7WutWbK5ymMl1qTBn2MlnbhUIc4/u+NN2fkjLnk=;
  b=Pf5q1maUXaVb8dIG8WMse5xnS5qwFWZxHS43BvAjMDwv2XhXJKolX4TQ
   grSVYON89GrD2yTAbDVzakHDjdjCJLGNIou/Mi5jy+PW0xenbBIYGsinY
   o6ZZ9L26rXJ9SrfJ0Rm4ZSZPTchiVsCwLw3lGlSF2bc7OjLdVa/5HKHPb
   XFKLGNMe7FVni9WzSJxaCIogTYFNtcmd1zaUKTs5cPI/oZluZTq1UWcOo
   T1ColCK44cFaxx2loEK68bt9CdeI7WHwNPQr6/hYtZrMW/o3q2PZcFrPE
   X8/KKDiLkEqjOp/ujZ6hUjAdsQK0+CyH60w9pGYlL8OU2FyVywmIDLPJ3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="10175112"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="10175112"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2024 08:52:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="3162821"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 28 Jan 2024 08:52:34 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rU8OW-0003a0-0G;
	Sun, 28 Jan 2024 16:52:32 +0000
Date: Mon, 29 Jan 2024 00:52:24 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:rmap_batching 135/136]
 include/asm-generic/tlb.h:631:3: error: call to undeclared function
 '__tlb_remove_tlb_entry'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202401290041.ATnzeEJA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux rmap_batching
head:   865e6d6a176a1f50bcbb7dd1d6a57b803e398039
commit: 4779a2a486fbf2d3850b6256cd4c51f2d617c714 [135/136] mm/mmu_gather: add tlb_remove_tlb_entries()
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20240129/202401290041.ATnzeEJA-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project a31a60074717fc40887cfe132b77eec93bedd307)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240129/202401290041.ATnzeEJA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401290041.ATnzeEJA-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/proc/task_mmu.c:27:
   In file included from arch/powerpc/include/asm/tlb.h:39:
>> include/asm-generic/tlb.h:631:3: error: call to undeclared function '__tlb_remove_tlb_entry'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     631 |                 __tlb_remove_tlb_entry(tlb, ptep, address);
         |                 ^
   arch/powerpc/include/asm/tlb.h:22:32: note: expanded from macro '__tlb_remove_tlb_entry'
      22 | #define __tlb_remove_tlb_entry  __tlb_remove_tlb_entry
         |                                 ^
   include/asm-generic/tlb.h:631:3: note: did you mean 'tlb_remove_tlb_entries'?
   arch/powerpc/include/asm/tlb.h:22:32: note: expanded from macro '__tlb_remove_tlb_entry'
      22 | #define __tlb_remove_tlb_entry  __tlb_remove_tlb_entry
         |                                 ^
   include/asm-generic/tlb.h:626:20: note: 'tlb_remove_tlb_entries' declared here
     626 | static inline void tlb_remove_tlb_entries(struct mmu_gather *tlb,
         |                    ^
     627 |                 pte_t *ptep, unsigned int nr, unsigned long address)
     628 | {
     629 |         tlb_flush_pte_range(tlb, address, PAGE_SIZE * nr);
     630 |         for (;;) {
     631 |                 __tlb_remove_tlb_entry(tlb, ptep, address);
         |                 ~~~~~~~~~~~~~~~~~~~~~~
         |                 tlb_remove_tlb_entries
   In file included from fs/proc/task_mmu.c:27:
   arch/powerpc/include/asm/tlb.h:41:20: error: static declaration of '__tlb_remove_tlb_entry' follows non-static declaration
      41 | static inline void __tlb_remove_tlb_entry(struct mmu_gather *tlb, pte_t *ptep,
         |                    ^
   arch/powerpc/include/asm/tlb.h:22:32: note: expanded from macro '__tlb_remove_tlb_entry'
      22 | #define __tlb_remove_tlb_entry  __tlb_remove_tlb_entry
         |                                 ^
   include/asm-generic/tlb.h:631:3: note: previous implicit declaration is here
     631 |                 __tlb_remove_tlb_entry(tlb, ptep, address);
         |                 ^
   arch/powerpc/include/asm/tlb.h:22:32: note: expanded from macro '__tlb_remove_tlb_entry'
      22 | #define __tlb_remove_tlb_entry  __tlb_remove_tlb_entry
         |                                 ^
   2 errors generated.


vim +/__tlb_remove_tlb_entry +631 include/asm-generic/tlb.h

   605	
   606	/**
   607	 * tlb_remove_tlb_entry - remember a pte unmapping for later tlb invalidation.
   608	 *
   609	 * Record the fact that pte's were really unmapped by updating the range,
   610	 * so we can later optimise away the tlb invalidate.   This helps when
   611	 * userspace is unmapping already-unmapped pages, which happens quite a lot.
   612	 */
   613	#define tlb_remove_tlb_entry(tlb, ptep, address)		\
   614		do {							\
   615			tlb_flush_pte_range(tlb, address, PAGE_SIZE);	\
   616			__tlb_remove_tlb_entry(tlb, ptep, address);	\
   617		} while (0)
   618	
   619	/**
   620	 * tlb_remove_tlb_entries - remember unmapping of multiple consecutive ptes for
   621	 *			    later tlb invalidation.
   622	 *
   623	 * Similar to tlb_remove_tlb_entry(), but remember unmapping of multiple
   624	 * consecutive ptes instead of only a single one.
   625	 */
   626	static inline void tlb_remove_tlb_entries(struct mmu_gather *tlb,
   627			pte_t *ptep, unsigned int nr, unsigned long address)
   628	{
   629		tlb_flush_pte_range(tlb, address, PAGE_SIZE * nr);
   630		for (;;) {
 > 631			__tlb_remove_tlb_entry(tlb, ptep, address);
   632			if (--nr == 0)
   633				break;
   634			ptep++;
   635			address += PAGE_SIZE;
   636		}
   637	}
   638	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
