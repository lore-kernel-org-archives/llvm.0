Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D57D165F18;
	Sun,  6 Oct 2024 03:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728186537; cv=none; b=Ze3/xQLRa0gKWqYIja9lSte+2hsG6RgjlQVThTa2/+oqDuIFSz4VYxAlkOd4V7SyvqnIfBcfXrHfhK8ipmU0eda7wCMxaD4tpZ4e7DZz8zbHu6FZkw9iRQLOysotbW9xaCnl/R3t9MUwnz2UHNFsY9DaxxeJrqKS3C/rIbtAFmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728186537; c=relaxed/simple;
	bh=iUPq+okSRnZVzjF3vcoCT6/LuZAjdwh7VY9OMNwZc6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OKpfIJEcGV/4j79JxYjK5duy0HlxKvoYdtQCJILvnSdCVtQ7Qi7ipWS7IZttYQjwJn4wJOcc5cgI93JyHfeQu+PF/nkL2oNtsJ/9K/20GjYCjZlYfZM3unS4o1nlzLRRMcqA45WA4KPHtOGJIIczkudqoghUp3EfXEpQPbqCTog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bff0d1fF; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bff0d1fF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728186531; x=1759722531;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iUPq+okSRnZVzjF3vcoCT6/LuZAjdwh7VY9OMNwZc6Y=;
  b=Bff0d1fFJsNS1B425GNkfU1gyAnQ+eEJ0UiNV/kcF2CDYU8/zIm4/Msd
   6KImf6MvO/y9PQdsE7JtXG+xj+e5mTqeddCBChRYjQ+lk7a+h+QCL1/MI
   dAoEWG2/c2g0i1kkjaYl9nq8iNqSLWNsTa1cndibLYJVvrbsXgWv1PTru
   QGBNQLflWP4DDtlBoYD6NPZlRIF8nL4/74Mh78bRkAnm+8ekGXLylv//6
   f0LOW8PK9w+2hlhBJ2fgNYUjQsizmR98PwIfZddxXrdZU2e2yZunvbQHa
   mSHa7/F5pUmLNOq806wfThegCmHeMmetKJnG14ka3U4nk5PE2nYXuc+sJ
   A==;
X-CSE-ConnectionGUID: FS6uS1XCT3KBY0IYr1qB+A==
X-CSE-MsgGUID: v8rv3pf6TLqQx3orkycBUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11216"; a="38754412"
X-IronPort-AV: E=Sophos;i="6.11,181,1725346800"; 
   d="scan'208";a="38754412"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2024 20:48:46 -0700
X-CSE-ConnectionGUID: Y6A2i61WSe69PQZ8sjNQ5w==
X-CSE-MsgGUID: PVoQW+4OSC23b6geYwbXvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,181,1725346800"; 
   d="scan'208";a="105949498"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 05 Oct 2024 20:48:45 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxIGA-0003aK-1g;
	Sun, 06 Oct 2024 03:48:42 +0000
Date: Sun, 6 Oct 2024 11:47:54 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:kvm-arm64/feat-fixes-6.12 37/49]
 arch/arm64/kvm/at.c:267:6: warning: variable 'as_el0' is uninitialized when
 used here
Message-ID: <202410061119.ccaHoq5a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/feat-fixes-6.12
head:   a93b14eac64358fe16486139d8dcb4cd938129ab
commit: 75fa9d9d7336ae94248a098f2c56e6176ae43794 [37/49] KVM: arm64: Extract translation helper from the AT code
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241006/202410061119.ccaHoq5a-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project fef3566a25ff0e34fb87339ba5e13eca17cec00f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241006/202410061119.ccaHoq5a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410061119.ccaHoq5a-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/at.c:7:
   In file included from include/linux/kvm_host.h:16:
   In file included from include/linux/mm.h:2236:
   include/linux/vmstat.h:503:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     503 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     504 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:510:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     510 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     511 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:517:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     517 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:523:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     523 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     524 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/at.c:267:6: warning: variable 'as_el0' is uninitialized when used here [-Wuninitialized]
     267 |             as_el0 && (tcr & (va55 ? TCR_E0PD1 : TCR_E0PD0)))
         |             ^~~~~~
   arch/arm64/kvm/at.c:103:29: note: initialize the variable 'as_el0' to silence this warning
     103 |         bool va55, tbi, lva, as_el0;
         |                                    ^
         |                                     = 0
   arch/arm64/kvm/at.c:1292:22: warning: variable 'mmu' set but not used [-Wunused-but-set-variable]
    1292 |                 struct kvm_s2_mmu *mmu;
         |                                    ^
   6 warnings generated.


vim +/as_el0 +267 arch/arm64/kvm/at.c

ef34e2a33d6845 Marc Zyngier 2024-09-13   97  
75fa9d9d7336ae Marc Zyngier 2024-09-24   98  static int setup_s1_walk(struct kvm_vcpu *vcpu, struct s1_walk_info *wi,
d6a01a2dc760c8 Marc Zyngier 2024-06-18   99  			 struct s1_walk_result *wr, u64 va)
d6a01a2dc760c8 Marc Zyngier 2024-06-18  100  {
d6a01a2dc760c8 Marc Zyngier 2024-06-18  101  	u64 hcr, sctlr, tcr, tg, ps, ia_bits, ttbr;
d6a01a2dc760c8 Marc Zyngier 2024-06-18  102  	unsigned int stride, x;
d6a01a2dc760c8 Marc Zyngier 2024-06-18  103  	bool va55, tbi, lva, as_el0;
d6a01a2dc760c8 Marc Zyngier 2024-06-18  104  
d6a01a2dc760c8 Marc Zyngier 2024-06-18  105  	hcr = __vcpu_sys_reg(vcpu, HCR_EL2);
d6a01a2dc760c8 Marc Zyngier 2024-06-18  106  
d6a01a2dc760c8 Marc Zyngier 2024-06-18  107  	va55 = va & BIT(55);
d6a01a2dc760c8 Marc Zyngier 2024-06-18  108  
d6a01a2dc760c8 Marc Zyngier 2024-06-18  109  	if (wi->regime == TR_EL2 && va55)
d6a01a2dc760c8 Marc Zyngier 2024-06-18  110  		goto addrsz;
d6a01a2dc760c8 Marc Zyngier 2024-06-18  111  
d6a01a2dc760c8 Marc Zyngier 2024-06-18  112  	wi->s2 = wi->regime == TR_EL10 && (hcr & (HCR_VM | HCR_DC));
d6a01a2dc760c8 Marc Zyngier 2024-06-18  113  
d6a01a2dc760c8 Marc Zyngier 2024-06-18  114  	switch (wi->regime) {
d6a01a2dc760c8 Marc Zyngier 2024-06-18  115  	case TR_EL10:
d6a01a2dc760c8 Marc Zyngier 2024-06-18  116  		sctlr	= vcpu_read_sys_reg(vcpu, SCTLR_EL1);
d6a01a2dc760c8 Marc Zyngier 2024-06-18  117  		tcr	= vcpu_read_sys_reg(vcpu, TCR_EL1);
d6a01a2dc760c8 Marc Zyngier 2024-06-18  118  		ttbr	= (va55 ?
d6a01a2dc760c8 Marc Zyngier 2024-06-18  119  			   vcpu_read_sys_reg(vcpu, TTBR1_EL1) :
d6a01a2dc760c8 Marc Zyngier 2024-06-18  120  			   vcpu_read_sys_reg(vcpu, TTBR0_EL1));
d6a01a2dc760c8 Marc Zyngier 2024-06-18  121  		break;
d6a01a2dc760c8 Marc Zyngier 2024-06-18  122  	case TR_EL2:
d6a01a2dc760c8 Marc Zyngier 2024-06-18  123  	case TR_EL20:
d6a01a2dc760c8 Marc Zyngier 2024-06-18  124  		sctlr	= vcpu_read_sys_reg(vcpu, SCTLR_EL2);
d6a01a2dc760c8 Marc Zyngier 2024-06-18  125  		tcr	= vcpu_read_sys_reg(vcpu, TCR_EL2);
d6a01a2dc760c8 Marc Zyngier 2024-06-18  126  		ttbr	= (va55 ?
d6a01a2dc760c8 Marc Zyngier 2024-06-18  127  			   vcpu_read_sys_reg(vcpu, TTBR1_EL2) :
d6a01a2dc760c8 Marc Zyngier 2024-06-18  128  			   vcpu_read_sys_reg(vcpu, TTBR0_EL2));
d6a01a2dc760c8 Marc Zyngier 2024-06-18  129  		break;
d6a01a2dc760c8 Marc Zyngier 2024-06-18  130  	default:
d6a01a2dc760c8 Marc Zyngier 2024-06-18  131  		BUG();
d6a01a2dc760c8 Marc Zyngier 2024-06-18  132  	}
d6a01a2dc760c8 Marc Zyngier 2024-06-18  133  
d6a01a2dc760c8 Marc Zyngier 2024-06-18  134  	tbi = (wi->regime == TR_EL2 ?
d6a01a2dc760c8 Marc Zyngier 2024-06-18  135  	       FIELD_GET(TCR_EL2_TBI, tcr) :
d6a01a2dc760c8 Marc Zyngier 2024-06-18  136  	       (va55 ?
d6a01a2dc760c8 Marc Zyngier 2024-06-18  137  		FIELD_GET(TCR_TBI1, tcr) :
d6a01a2dc760c8 Marc Zyngier 2024-06-18  138  		FIELD_GET(TCR_TBI0, tcr)));
d6a01a2dc760c8 Marc Zyngier 2024-06-18  139  
d6a01a2dc760c8 Marc Zyngier 2024-06-18  140  	if (!tbi && (u64)sign_extend64(va, 55) != va)
d6a01a2dc760c8 Marc Zyngier 2024-06-18  141  		goto addrsz;
d6a01a2dc760c8 Marc Zyngier 2024-06-18  142  
d6a01a2dc760c8 Marc Zyngier 2024-06-18  143  	va = (u64)sign_extend64(va, 55);
d6a01a2dc760c8 Marc Zyngier 2024-06-18  144  
d6a01a2dc760c8 Marc Zyngier 2024-06-18  145  	/* Let's put the MMU disabled case aside immediately */
d6a01a2dc760c8 Marc Zyngier 2024-06-18  146  	switch (wi->regime) {
d6a01a2dc760c8 Marc Zyngier 2024-06-18  147  	case TR_EL10:
d6a01a2dc760c8 Marc Zyngier 2024-06-18  148  		/*
d6a01a2dc760c8 Marc Zyngier 2024-06-18  149  		 * If dealing with the EL1&0 translation regime, 3 things
d6a01a2dc760c8 Marc Zyngier 2024-06-18  150  		 * can disable the S1 translation:
d6a01a2dc760c8 Marc Zyngier 2024-06-18  151  		 *
d6a01a2dc760c8 Marc Zyngier 2024-06-18  152  		 * - HCR_EL2.DC = 1
d6a01a2dc760c8 Marc Zyngier 2024-06-18  153  		 * - HCR_EL2.{E2H,TGE} = {0,1}
d6a01a2dc760c8 Marc Zyngier 2024-06-18  154  		 * - SCTLR_EL1.M = 0
d6a01a2dc760c8 Marc Zyngier 2024-06-18  155  		 *
d6a01a2dc760c8 Marc Zyngier 2024-06-18  156  		 * The TGE part is interesting. If we have decided that this
d6a01a2dc760c8 Marc Zyngier 2024-06-18  157  		 * is EL1&0, then it means that either {E2H,TGE} == {1,0} or
d6a01a2dc760c8 Marc Zyngier 2024-06-18  158  		 * {0,x}, and we only need to test for TGE == 1.
d6a01a2dc760c8 Marc Zyngier 2024-06-18  159  		 */
d6a01a2dc760c8 Marc Zyngier 2024-06-18  160  		if (hcr & (HCR_DC | HCR_TGE)) {
d6a01a2dc760c8 Marc Zyngier 2024-06-18  161  			wr->level = S1_MMU_DISABLED;
d6a01a2dc760c8 Marc Zyngier 2024-06-18  162  			break;
d6a01a2dc760c8 Marc Zyngier 2024-06-18  163  		}
d6a01a2dc760c8 Marc Zyngier 2024-06-18  164  		fallthrough;
d6a01a2dc760c8 Marc Zyngier 2024-06-18  165  	case TR_EL2:
d6a01a2dc760c8 Marc Zyngier 2024-06-18  166  	case TR_EL20:
d6a01a2dc760c8 Marc Zyngier 2024-06-18  167  		if (!(sctlr & SCTLR_ELx_M))
d6a01a2dc760c8 Marc Zyngier 2024-06-18  168  			wr->level = S1_MMU_DISABLED;
d6a01a2dc760c8 Marc Zyngier 2024-06-18  169  		break;
d6a01a2dc760c8 Marc Zyngier 2024-06-18  170  	}
d6a01a2dc760c8 Marc Zyngier 2024-06-18  171  
d6a01a2dc760c8 Marc Zyngier 2024-06-18  172  	if (wr->level == S1_MMU_DISABLED) {
d6a01a2dc760c8 Marc Zyngier 2024-06-18  173  		if (va >= BIT(kvm_get_pa_bits(vcpu->kvm)))
d6a01a2dc760c8 Marc Zyngier 2024-06-18  174  			goto addrsz;
d6a01a2dc760c8 Marc Zyngier 2024-06-18  175  
d6a01a2dc760c8 Marc Zyngier 2024-06-18  176  		wr->pa = va;
d6a01a2dc760c8 Marc Zyngier 2024-06-18  177  		return 0;
d6a01a2dc760c8 Marc Zyngier 2024-06-18  178  	}
d6a01a2dc760c8 Marc Zyngier 2024-06-18  179  
d6a01a2dc760c8 Marc Zyngier 2024-06-18  180  	wi->be = sctlr & SCTLR_ELx_EE;
d6a01a2dc760c8 Marc Zyngier 2024-06-18  181  
d6a01a2dc760c8 Marc Zyngier 2024-06-18  182  	wi->hpd  = kvm_has_feat(vcpu->kvm, ID_AA64MMFR1_EL1, HPDS, IMP);
d6a01a2dc760c8 Marc Zyngier 2024-06-18  183  	wi->hpd &= (wi->regime == TR_EL2 ?
d6a01a2dc760c8 Marc Zyngier 2024-06-18  184  		    FIELD_GET(TCR_EL2_HPD, tcr) :
d6a01a2dc760c8 Marc Zyngier 2024-06-18  185  		    (va55 ?
d6a01a2dc760c8 Marc Zyngier 2024-06-18  186  		     FIELD_GET(TCR_HPD1, tcr) :
d6a01a2dc760c8 Marc Zyngier 2024-06-18  187  		     FIELD_GET(TCR_HPD0, tcr)));
f3bb78db82eae5 Marc Zyngier 2024-09-08  188  	/* R_JHSVW */
f3bb78db82eae5 Marc Zyngier 2024-09-08  189  	wi->hpd |= s1pie_enabled(vcpu, wi->regime);
d6a01a2dc760c8 Marc Zyngier 2024-06-18  190  
ef34e2a33d6845 Marc Zyngier 2024-09-13  191  	/* Do we have POE? */
ef34e2a33d6845 Marc Zyngier 2024-09-13  192  	compute_s1poe(vcpu, wi);
ef34e2a33d6845 Marc Zyngier 2024-09-13  193  
ef34e2a33d6845 Marc Zyngier 2024-09-13  194  	/* R_BVXDG */
ef34e2a33d6845 Marc Zyngier 2024-09-13  195  	wi->hpd |= (wi->poe || wi->e0poe);
ef34e2a33d6845 Marc Zyngier 2024-09-13  196  
d6a01a2dc760c8 Marc Zyngier 2024-06-18  197  	/* Someone was silly enough to encode TG0/TG1 differently */
d6a01a2dc760c8 Marc Zyngier 2024-06-18  198  	if (va55) {
d6a01a2dc760c8 Marc Zyngier 2024-06-18  199  		wi->txsz = FIELD_GET(TCR_T1SZ_MASK, tcr);
d6a01a2dc760c8 Marc Zyngier 2024-06-18  200  		tg = FIELD_GET(TCR_TG1_MASK, tcr);
d6a01a2dc760c8 Marc Zyngier 2024-06-18  201  
d6a01a2dc760c8 Marc Zyngier 2024-06-18  202  		switch (tg << TCR_TG1_SHIFT) {
d6a01a2dc760c8 Marc Zyngier 2024-06-18  203  		case TCR_TG1_4K:
d6a01a2dc760c8 Marc Zyngier 2024-06-18  204  			wi->pgshift = 12;	 break;
d6a01a2dc760c8 Marc Zyngier 2024-06-18  205  		case TCR_TG1_16K:
d6a01a2dc760c8 Marc Zyngier 2024-06-18  206  			wi->pgshift = 14;	 break;
d6a01a2dc760c8 Marc Zyngier 2024-06-18  207  		case TCR_TG1_64K:
d6a01a2dc760c8 Marc Zyngier 2024-06-18  208  		default:	    /* IMPDEF: treat any other value as 64k */
d6a01a2dc760c8 Marc Zyngier 2024-06-18  209  			wi->pgshift = 16;	 break;
d6a01a2dc760c8 Marc Zyngier 2024-06-18  210  		}
d6a01a2dc760c8 Marc Zyngier 2024-06-18  211  	} else {
d6a01a2dc760c8 Marc Zyngier 2024-06-18  212  		wi->txsz = FIELD_GET(TCR_T0SZ_MASK, tcr);
d6a01a2dc760c8 Marc Zyngier 2024-06-18  213  		tg = FIELD_GET(TCR_TG0_MASK, tcr);
d6a01a2dc760c8 Marc Zyngier 2024-06-18  214  
d6a01a2dc760c8 Marc Zyngier 2024-06-18  215  		switch (tg << TCR_TG0_SHIFT) {
d6a01a2dc760c8 Marc Zyngier 2024-06-18  216  		case TCR_TG0_4K:
d6a01a2dc760c8 Marc Zyngier 2024-06-18  217  			wi->pgshift = 12;	 break;
d6a01a2dc760c8 Marc Zyngier 2024-06-18  218  		case TCR_TG0_16K:
d6a01a2dc760c8 Marc Zyngier 2024-06-18  219  			wi->pgshift = 14;	 break;
d6a01a2dc760c8 Marc Zyngier 2024-06-18  220  		case TCR_TG0_64K:
d6a01a2dc760c8 Marc Zyngier 2024-06-18  221  		default:	    /* IMPDEF: treat any other value as 64k */
d6a01a2dc760c8 Marc Zyngier 2024-06-18  222  			wi->pgshift = 16;	 break;
d6a01a2dc760c8 Marc Zyngier 2024-06-18  223  		}
d6a01a2dc760c8 Marc Zyngier 2024-06-18  224  	}
d6a01a2dc760c8 Marc Zyngier 2024-06-18  225  
d6a01a2dc760c8 Marc Zyngier 2024-06-18  226  	/* R_PLCGL, R_YXNYW */
d6a01a2dc760c8 Marc Zyngier 2024-06-18  227  	if (!kvm_has_feat_enum(vcpu->kvm, ID_AA64MMFR2_EL1, ST, 48_47)) {
d6a01a2dc760c8 Marc Zyngier 2024-06-18  228  		if (wi->txsz > 39)
d6a01a2dc760c8 Marc Zyngier 2024-06-18  229  			goto transfault_l0;
d6a01a2dc760c8 Marc Zyngier 2024-06-18  230  	} else {
d6a01a2dc760c8 Marc Zyngier 2024-06-18  231  		if (wi->txsz > 48 || (BIT(wi->pgshift) == SZ_64K && wi->txsz > 47))
d6a01a2dc760c8 Marc Zyngier 2024-06-18  232  			goto transfault_l0;
d6a01a2dc760c8 Marc Zyngier 2024-06-18  233  	}
d6a01a2dc760c8 Marc Zyngier 2024-06-18  234  
d6a01a2dc760c8 Marc Zyngier 2024-06-18  235  	/* R_GTJBY, R_SXWGM */
d6a01a2dc760c8 Marc Zyngier 2024-06-18  236  	switch (BIT(wi->pgshift)) {
d6a01a2dc760c8 Marc Zyngier 2024-06-18  237  	case SZ_4K:
d6a01a2dc760c8 Marc Zyngier 2024-06-18  238  		lva = kvm_has_feat(vcpu->kvm, ID_AA64MMFR0_EL1, TGRAN4, 52_BIT);
d6a01a2dc760c8 Marc Zyngier 2024-06-18  239  		lva &= tcr & (wi->regime == TR_EL2 ? TCR_EL2_DS : TCR_DS);
d6a01a2dc760c8 Marc Zyngier 2024-06-18  240  		break;
d6a01a2dc760c8 Marc Zyngier 2024-06-18  241  	case SZ_16K:
d6a01a2dc760c8 Marc Zyngier 2024-06-18  242  		lva = kvm_has_feat(vcpu->kvm, ID_AA64MMFR0_EL1, TGRAN16, 52_BIT);
d6a01a2dc760c8 Marc Zyngier 2024-06-18  243  		lva &= tcr & (wi->regime == TR_EL2 ? TCR_EL2_DS : TCR_DS);
d6a01a2dc760c8 Marc Zyngier 2024-06-18  244  		break;
d6a01a2dc760c8 Marc Zyngier 2024-06-18  245  	case SZ_64K:
d6a01a2dc760c8 Marc Zyngier 2024-06-18  246  		lva = kvm_has_feat(vcpu->kvm, ID_AA64MMFR2_EL1, VARange, 52);
d6a01a2dc760c8 Marc Zyngier 2024-06-18  247  		break;
d6a01a2dc760c8 Marc Zyngier 2024-06-18  248  	}
d6a01a2dc760c8 Marc Zyngier 2024-06-18  249  
d6a01a2dc760c8 Marc Zyngier 2024-06-18  250  	if ((lva && wi->txsz < 12) || (!lva && wi->txsz < 16))
d6a01a2dc760c8 Marc Zyngier 2024-06-18  251  		goto transfault_l0;
d6a01a2dc760c8 Marc Zyngier 2024-06-18  252  
d6a01a2dc760c8 Marc Zyngier 2024-06-18  253  	ia_bits = get_ia_size(wi);
d6a01a2dc760c8 Marc Zyngier 2024-06-18  254  
d6a01a2dc760c8 Marc Zyngier 2024-06-18  255  	/* R_YYVYV, I_THCZK */
d6a01a2dc760c8 Marc Zyngier 2024-06-18  256  	if ((!va55 && va > GENMASK(ia_bits - 1, 0)) ||
d6a01a2dc760c8 Marc Zyngier 2024-06-18  257  	    (va55 && va < GENMASK(63, ia_bits)))
d6a01a2dc760c8 Marc Zyngier 2024-06-18  258  		goto transfault_l0;
d6a01a2dc760c8 Marc Zyngier 2024-06-18  259  
d6a01a2dc760c8 Marc Zyngier 2024-06-18  260  	/* I_ZFSYQ */
d6a01a2dc760c8 Marc Zyngier 2024-06-18  261  	if (wi->regime != TR_EL2 &&
d6a01a2dc760c8 Marc Zyngier 2024-06-18  262  	    (tcr & (va55 ? TCR_EPD1_MASK : TCR_EPD0_MASK)))
d6a01a2dc760c8 Marc Zyngier 2024-06-18  263  		goto transfault_l0;
d6a01a2dc760c8 Marc Zyngier 2024-06-18  264  
d6a01a2dc760c8 Marc Zyngier 2024-06-18  265  	/* R_BNDVG and following statements */
d6a01a2dc760c8 Marc Zyngier 2024-06-18  266  	if (kvm_has_feat(vcpu->kvm, ID_AA64MMFR2_EL1, E0PD, IMP) &&
d6a01a2dc760c8 Marc Zyngier 2024-06-18 @267  	    as_el0 && (tcr & (va55 ? TCR_E0PD1 : TCR_E0PD0)))
d6a01a2dc760c8 Marc Zyngier 2024-06-18  268  		goto transfault_l0;
d6a01a2dc760c8 Marc Zyngier 2024-06-18  269  
d6a01a2dc760c8 Marc Zyngier 2024-06-18  270  	/* AArch64.S1StartLevel() */
d6a01a2dc760c8 Marc Zyngier 2024-06-18  271  	stride = wi->pgshift - 3;
d6a01a2dc760c8 Marc Zyngier 2024-06-18  272  	wi->sl = 3 - (((ia_bits - 1) - wi->pgshift) / stride);
d6a01a2dc760c8 Marc Zyngier 2024-06-18  273  
d6a01a2dc760c8 Marc Zyngier 2024-06-18  274  	ps = (wi->regime == TR_EL2 ?
d6a01a2dc760c8 Marc Zyngier 2024-06-18  275  	      FIELD_GET(TCR_EL2_PS_MASK, tcr) : FIELD_GET(TCR_IPS_MASK, tcr));
d6a01a2dc760c8 Marc Zyngier 2024-06-18  276  
d6a01a2dc760c8 Marc Zyngier 2024-06-18  277  	wi->max_oa_bits = min(get_kvm_ipa_limit(), ps_to_output_size(ps));
d6a01a2dc760c8 Marc Zyngier 2024-06-18  278  
d6a01a2dc760c8 Marc Zyngier 2024-06-18  279  	/* Compute minimal alignment */
d6a01a2dc760c8 Marc Zyngier 2024-06-18  280  	x = 3 + ia_bits - ((3 - wi->sl) * stride + wi->pgshift);
d6a01a2dc760c8 Marc Zyngier 2024-06-18  281  
d6a01a2dc760c8 Marc Zyngier 2024-06-18  282  	wi->baddr = ttbr & TTBRx_EL1_BADDR;
d6a01a2dc760c8 Marc Zyngier 2024-06-18  283  
d6a01a2dc760c8 Marc Zyngier 2024-06-18  284  	/* R_VPBBF */
d6a01a2dc760c8 Marc Zyngier 2024-06-18  285  	if (check_output_size(wi->baddr, wi))
d6a01a2dc760c8 Marc Zyngier 2024-06-18  286  		goto addrsz;
d6a01a2dc760c8 Marc Zyngier 2024-06-18  287  
d6a01a2dc760c8 Marc Zyngier 2024-06-18  288  	wi->baddr &= GENMASK_ULL(wi->max_oa_bits - 1, x);
d6a01a2dc760c8 Marc Zyngier 2024-06-18  289  
d6a01a2dc760c8 Marc Zyngier 2024-06-18  290  	return 0;
d6a01a2dc760c8 Marc Zyngier 2024-06-18  291  

:::::: The code at line 267 was first introduced by commit
:::::: d6a01a2dc760c8350fa182a6afd69fabab131f73 KVM: arm64: nv: Add SW walker for AT S1 emulation

:::::: TO: Marc Zyngier <maz@kernel.org>
:::::: CC: Marc Zyngier <maz@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
