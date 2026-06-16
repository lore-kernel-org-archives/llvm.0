Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66F627707;
	Tue, 16 Jun 2026 00:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781569376; cv=none; b=CTrfK+tPfNXPwfV2/CBdvm1x87YEVecIGKgBwSQy3Sgx/N5tBf2/Jd+dr2SGnm3kkzQJoS27RiG4Oc1zHx9QaUsfrJuqmProIhOahtPi+y9Sa4RZscpnfYKCcuzt384tNwWeMjdJUJZYzou/+G1FQoThcGyDV2GYeHKwgyKOy08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781569376; c=relaxed/simple;
	bh=/rAsLrMvHSOafjSgSwU1QSC3xpjRkY420OGI1tnpVhM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fZ+wr0qShM5OvAiS/jjxp04MBZU+t1zjPMScYSl1M83WKaYT24zIfgmHTQGxUCaFPvh+1kaA9K7moFNdaO/alGveVWT0UWoXY2RQ0uXsADr+dLrDezOL7lYWmZHoPLgUOSajBrQW/ceeH3TFiR1RDkCJqtolTf/Dce6t6fhGum8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M7VBLHZD; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M7VBLHZD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781569375; x=1813105375;
  h=date:from:to:cc:subject:message-id;
  bh=/rAsLrMvHSOafjSgSwU1QSC3xpjRkY420OGI1tnpVhM=;
  b=M7VBLHZD7xAeMYZG+v8GO49CAXa1CfEYKjbugVnp5gXN0DuuBJWN0Mn/
   TH35hEoNJpVocMYkkyOqk1GSnD0LBGeLiuE5JsUNDLX3IvF2k/ifBdrOz
   Gs1smlVk05k6poUa2LnPrgHCfGeeAosw2pIfWxCUI3xRMU9Tcv8fqqFa+
   IXScRTBBfpV00Hwj5kEz2ZvxomOaTRR4m5I/pKyGOvZ1AUjERaYHO2EpA
   syjNRaRkPizNy08iCW2ml38OQqwSEkYJqOiIRnZras0/kwmSK3mmsOf/M
   HEAV97xyEbiPlP+Uq7S8JuwP9ZkEphUrQAk/Jro2X6+JZdRCaXDwQewXm
   w==;
X-CSE-ConnectionGUID: 66SmcatsRESaPTFS7bbm3Q==
X-CSE-MsgGUID: 0UXIwZuETJO4aPTDLV99JA==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82520025"
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="82520025"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 17:22:54 -0700
X-CSE-ConnectionGUID: GmU1vi8LQCCOUW7Cpcy5Og==
X-CSE-MsgGUID: TFHIdC8SSzSKre/uDVpxoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="241240359"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 15 Jun 2026 17:22:53 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZHZq-0000000051F-3mL7;
	Tue, 16 Jun 2026 00:22:50 +0000
Date: Tue, 16 Jun 2026 02:22:34 +0200
From: kernel test robot <lkp@intel.com>
To: Fu Hao <fuhao@open-hieco.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: arch/x86/kernel/cpu/microcode/hygon.c:343:42: error: use of
 undeclared identifier 'hypervisor_present'; did you mean
 'x86_hypervisor_present'?
Message-ID: <202606160254.dKPf3HDp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Fu-Hao/x86-cpu-hygon-Adjust-the-die_id-and-logical_die_id-for-Hygon-models-0x4-through-0x8/20260615-203418
head:   1d23a5cab2f87c46644839ad70174c6dec28882d
commit: f0def51fc06432aa3420f72e2d81e82892868813 x86/microcode/hygon: Add microcode loading support for Hygon processors
date:   12 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260616/202606160254.dKPf3HDp-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260616/202606160254.dKPf3HDp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606160254.dKPf3HDp-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/cpu/microcode/hygon.c:343:42: error: use of undeclared identifier 'hypervisor_present'; did you mean 'x86_hypervisor_present'?
     343 |         if (IS_ENABLED(CONFIG_MICROCODE_DBG) && hypervisor_present)
         |                                                 ^~~~~~~~~~~~~~~~~~
         |                                                 x86_hypervisor_present
   arch/x86/include/asm/processor.h:736:13: note: 'x86_hypervisor_present' declared here
     736 | extern bool x86_hypervisor_present;
         |             ^
   1 error generated.


vim +343 arch/x86/kernel/cpu/microcode/hygon.c

   327	
   328	static bool apply_hygon_patch(struct hygon_microcode *mc, u32 *cur_rev,
   329					  unsigned int patch_size)
   330	{
   331		unsigned long patch_start = (unsigned long)&mc->header.data;
   332		unsigned long patch_end = patch_start + patch_size - 1;
   333	
   334		native_wrmsrq(HYGON_MSR_PATCH_LOADER, patch_start);
   335		invlpg(patch_start);
   336	
   337		/*
   338		 * Invalidate the next page if the patch image crosses a page boundary.
   339		 */
   340		if (hygon_pages_crossed(patch_start, patch_size))
   341			invlpg(patch_end);
   342	
 > 343		if (IS_ENABLED(CONFIG_MICROCODE_DBG) && hypervisor_present)
   344			microcode_rev[smp_processor_id()] = mc->header.patch_level;
   345	
   346		*cur_rev = get_current_patch_level();
   347	
   348		ucode_dbg("updated rev: 0x%x\n", *cur_rev);
   349	
   350		return *cur_rev == mc->header.patch_level;
   351	}
   352	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
