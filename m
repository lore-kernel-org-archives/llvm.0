Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B17128DC4;
	Sat, 11 Jul 2026 19:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783799746; cv=none; b=ArFqzNKj5BJH96KOvdioKUXIcUWMM8Pazmp4j8yQvj6BWqMAgRKXFbBd7wt5XRoK6uajW6eEPfA1ToOkcTK8V2nVB5RcNyHIDHdM+fEHsuhRhQ8a+aidWR5X48j498EWP5CED6igGgunkq5Fp0Y8sO8x05HnfOFLRzjm8kILA0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783799746; c=relaxed/simple;
	bh=G5bQDDm1hW3Vzwfp7wD2hg24BFAicJWOOkUJG68ZnPs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=q5IjtQT09NWmQgPkXif6aaKUy/qXCohxUZt6DnhLa34p2zSWQLzta0IbDte9socnVqsDR03268yCyVgCt+M9cqXMm4Ao1YphS3ktwLNdrCZEVUhjZpu7y9B4Zp0/TDIKSXQgwqp/0QHw5m1ZL+U9/Qg0ObIQWDb6e7/eGiXVbgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nsVJo+Ax; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nsVJo+Ax"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783799745; x=1815335745;
  h=date:from:to:cc:subject:message-id;
  bh=G5bQDDm1hW3Vzwfp7wD2hg24BFAicJWOOkUJG68ZnPs=;
  b=nsVJo+AxyoxWTcQ0ErrIiOT54u6OzbaLvyX7M8s2XNS7OSwoH0NmWnjX
   vYQi91jEVZU8kGekpDdI90ys2vmeuhNBol5xWSu/4LTkFmlPkcg4H5Pit
   z4dMjoY6mS1h4YLk8uNLkNNGQ58ahhwInp7H0397WhBj6eLkowNw8EzOr
   vHkNejmNORbiyjnG2XwP+MdJ17IjA4E0uBKEjV/4S+RzCztU/Ggc8vWMA
   8Ml+opvDDY/yVRLZ5mDL+Bc7VrJuMbyH3sTox1miusMADoAeXXitNJFok
   4qsMqVSaypSIedyO3fZrDJFNoyvsJAKWUgXDuoGiu2uxuVZINT8sJAGPe
   w==;
X-CSE-ConnectionGUID: aQo2xXqrS7mzoKUro4ebSA==
X-CSE-MsgGUID: tDcSeWC4TcqgFJl2RkaJKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="107270861"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="107270861"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2026 12:55:44 -0700
X-CSE-ConnectionGUID: uLauX8/XSXi9niDotQgMGw==
X-CSE-MsgGUID: ADmFVInmT1WE65ZGqyf3KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="251200213"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 11 Jul 2026 12:55:41 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1widnX-00000000KMg-1egY;
	Sat, 11 Jul 2026 19:55:39 +0000
Date: Sun, 12 Jul 2026 03:55:05 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [avpatel:riscv_kvm_nested_v2 22/22]
 arch/riscv/kvm/vcpu_nested_swtlb.c:116:8: warning: variable 'gstage_gpa' set
 but not used
Message-ID: <202607120314.kpuwkBUA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_kvm_nested_v2
head:   8f3684e0c4a0188f47cba12c50d419fdf6c5a69e
commit: 8f3684e0c4a0188f47cba12c50d419fdf6c5a69e [22/22] RISC-V: KVM: Emulate G-stage using software walks for nested guest
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20260712/202607120314.kpuwkBUA-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project b3e6e6dabdc02153552a64fc74ff5c7532447eed)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260712/202607120314.kpuwkBUA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607120314.kpuwkBUA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/riscv/kvm/vcpu_nested_swtlb.c:116:8: warning: variable 'gstage_gpa' set but not used [-Wunused-but-set-variable]
     116 |         gpa_t gstage_gpa;
         |               ^
   1 warning generated.


vim +/gstage_gpa +116 arch/riscv/kvm/vcpu_nested_swtlb.c

   107	
   108	int kvm_riscv_vcpu_nested_swtlb_xlate(struct kvm_vcpu *vcpu,
   109					      const struct kvm_cpu_trap *trap,
   110					      struct kvm_gstage_mapping *out_map,
   111					      struct kvm_cpu_trap *out_trap)
   112	{
   113		struct riscv_guest_gstage_walk_data wdata = { 0 };
   114		unsigned long page_size, fault_addr;
   115		struct kvm_vcpu_nested_csr *nsc;
 > 116		gpa_t gstage_gpa;
   117		int rc = 0;
   118	
   119		if (!kvm_riscv_nested_available())
   120			return -ENOENT;
   121	
   122		nsc = vcpu->arch.nested.csr;
   123		switch ((nsc->hgatp & HGATP_MODE) >> HGATP_MODE_SHIFT) {
   124		case HGATP_MODE_OFF:
   125			wdata.pgd_levels = 0;
   126			break;
   127	#ifdef CONFIG_32BIT
   128		case HGATP_MODE_SV32X4:
   129			wdata.pgd_levels = 2;
   130			break;
   131	#else
   132		case HGATP_MODE_SV39X4:
   133			wdata.pgd_levels = 3;
   134			break;
   135		case HGATP_MODE_SV48X4:
   136			wdata.pgd_levels = 4;
   137			break;
   138		case HGATP_MODE_SV57X4:
   139			wdata.pgd_levels = 5;
   140			break;
   141	#endif
   142		default:
   143			return -EINVAL;
   144		}
   145		wdata.out_trap = out_trap;
   146	
   147		fault_addr = (trap->htval << 2) | (trap->stval & 0x3);
   148		if (wdata.pgd_levels) {
   149			/* TODO: */
   150			gstage_gpa = (nsc->hgatp & HGATP_PPN) << PAGE_SHIFT;
   151			rc = riscv_guest_pgtbl_walk(&riscv_guest_gstage_ops, &wdata, vcpu,
   152						    0, wdata.pgd_levels - 1, fault_addr, out_map);
   153		} else {
   154			out_map->level = wdata.pgd_levels - 1;
   155			page_size = kvm_riscv_gstage_level_to_page_size(out_map->level);
   156			out_map->addr = fault_addr & ~(page_size - 1);
   157			out_map->pte = pfn_pte(PFN_DOWN(out_map->addr),
   158					       __pgprot(_PAGE_PRESENT |
   159							_PAGE_READ |
   160							_PAGE_WRITE |
   161							_PAGE_EXEC |
   162							_PAGE_USER |
   163							_PAGE_GLOBAL |
   164							_PAGE_ACCESSED |
   165							_PAGE_DIRTY));
   166		}
   167	
   168		return rc;
   169	}
   170	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
