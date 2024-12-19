Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E9A22257F;
	Thu, 19 Dec 2024 10:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734603180; cv=none; b=O6MMcQPO16uhZabZur34GrMCs9xtI0NdXsC86Tl7/g+j1TcYpSfkcs25gH+ZmvLLawDG08CDm4lvfetHW31g213qfin4x1Zcd+tEBcLANuKL4Nv0C6wAl68ir3SpHiCzllY1Kkzg7CTznm2d+8gGIsrkP1cUboPjyuD8KIathj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734603180; c=relaxed/simple;
	bh=m0HTemuK9KxuX94PNTB59KqWXDkCnMgWuTP44JYg8hs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SodIkbW8Jpapab0aa3wLHcs6RMuiam7NlCFoMMWDssGWs1EHO+Q7YoMt2joHCibC3ptsfG8q5NQUV4Y9JZ3QBO6lyRbV1IGhKgqHzcQVmJnUH+e6SIwONK9+MrItFqg7iGLo3N5XcYqwj5AuFKsHOZFjDhwxdZYQ4bR7a52u4+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fv6nuq6R; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fv6nuq6R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734603178; x=1766139178;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m0HTemuK9KxuX94PNTB59KqWXDkCnMgWuTP44JYg8hs=;
  b=fv6nuq6R/eBbvP9OZGs83G0gW9kypMC4xXR1QiNFTpslzHKSjvSCt5w7
   Xu1X9kQCAuXrXbYWFN4eBpLvcIRQvensVoXcywFlLmY7uISyDRU3tGn1W
   qPyGQr1fhEYLEmlm943E7EWI/DRYyF2/okUe7wIzSZ5iYK83N3HzbPDqN
   ikfsttbeTOeHPztVCok6RkeUIwBDWSTqZP6IolPhmdaojMyE1XiXw4x6h
   0cels5fFY+MlIiqmdGtOBVU58Y8YYJnIdw7FGMd+/sTfoV0Kk+X6/3iYP
   AIhY8xXVf8LbQAVHrGnLfN7C082DNjaEjb6bwEgDzi74pvj2FFIPv9XEG
   A==;
X-CSE-ConnectionGUID: RcCIVGtARIKM+ZaWtFkf9w==
X-CSE-MsgGUID: aLlL3stjTEaISnxOYVrj7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="39045200"
X-IronPort-AV: E=Sophos;i="6.12,247,1728975600"; 
   d="scan'208";a="39045200"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 02:12:56 -0800
X-CSE-ConnectionGUID: nIaWYPv5QOWwQ1xANTMJ6A==
X-CSE-MsgGUID: C87xoNhZRP6RS6Gt6xxRNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,247,1728975600"; 
   d="scan'208";a="97974038"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 19 Dec 2024 02:12:54 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tODWW-0000AF-0Z;
	Thu, 19 Dec 2024 10:12:52 +0000
Date: Thu, 19 Dec 2024 18:12:36 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:kvm-arm64/nv-next 7/20] arch/arm64/kvm/at.c:267:6:
 warning: variable 'as_el0' is uninitialized when used here
Message-ID: <202412191856.Qakq77aj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/nv-next
head:   200e6aefbe57cd21d7ad678ec89f103388b20382
commit: eca7e4423a05f5cef4a1c84f8d69e4abed046a0d [7/20] KVM: arm64: nv: Extract translation helper from the AT code
config: arm64-randconfig-001-20241219 (https://download.01.org/0day-ci/archive/20241219/202412191856.Qakq77aj-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241219/202412191856.Qakq77aj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412191856.Qakq77aj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/at.c:267:6: warning: variable 'as_el0' is uninitialized when used here [-Wuninitialized]
               as_el0 && (tcr & (va55 ? TCR_E0PD1 : TCR_E0PD0)))
               ^~~~~~
   arch/arm64/kvm/at.c:103:29: note: initialize the variable 'as_el0' to silence this warning
           bool va55, tbi, lva, as_el0;
                                      ^
                                       = 0
   1 warning generated.


vim +/as_el0 +267 arch/arm64/kvm/at.c

8a9b304d7e2276 Marc Zyngier 2024-10-23   97  
eca7e4423a05f5 Marc Zyngier 2024-09-24   98  static int setup_s1_walk(struct kvm_vcpu *vcpu, struct s1_walk_info *wi,
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
5e21b297872237 Marc Zyngier 2024-10-23  188  	/* R_JHSVW */
5e21b297872237 Marc Zyngier 2024-10-23  189  	wi->hpd |= s1pie_enabled(vcpu, wi->regime);
d6a01a2dc760c8 Marc Zyngier 2024-06-18  190  
8a9b304d7e2276 Marc Zyngier 2024-10-23  191  	/* Do we have POE? */
8a9b304d7e2276 Marc Zyngier 2024-10-23  192  	compute_s1poe(vcpu, wi);
8a9b304d7e2276 Marc Zyngier 2024-10-23  193  
8a9b304d7e2276 Marc Zyngier 2024-10-23  194  	/* R_BVXDG */
8a9b304d7e2276 Marc Zyngier 2024-10-23  195  	wi->hpd |= (wi->poe || wi->e0poe);
8a9b304d7e2276 Marc Zyngier 2024-10-23  196  
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
