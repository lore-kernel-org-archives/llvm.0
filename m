Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806AE175D5E;
	Sat, 12 Oct 2024 11:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728733625; cv=none; b=I8u5K3z18wuP89qdgKg9msyf2W/n1KXgJDf+N3Lmz9go7NVQ6ESWjiiHTeW8Nelf9fx6cqea/jJNAfnRMi4qS24ILm+3E+Fz/m1NROFZZ/KshN4FGvA10ti1HNN6nh6JyyvmM42bMGe4FqcVBDZn9EEaqM6eu08h11jbZYk19Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728733625; c=relaxed/simple;
	bh=oQSwr7hVbpWZ+NncALtS0fH65mGwMztKrBDdktyw2XA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mgNAu/G8jXxZ260qxX3bidd0Nwe01wAfl2FCqd5U6EnPkv2YTvG8lgXGc1AA1CEz+Tko2gJ/dV5SfjXWhRkshYrwVtlZOmzNkwFyBY6mHfbluzYqzOO6kSBTQrudWltqKnNJYv/sO3jdB4og5/mC3GJms250kK3q5RATznv1x+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H2kKM+IG; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H2kKM+IG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728733624; x=1760269624;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oQSwr7hVbpWZ+NncALtS0fH65mGwMztKrBDdktyw2XA=;
  b=H2kKM+IG84Z6Xpxg9KMcfsvKNq0sw+3wCV3Hw+WLT72uPd3EQgznQ0rZ
   hSdLujGaNCISpetEF0LLpOSeoXSUNJ+szphEoyfbH7Sgu96P2Xn9HZL+I
   nrlquutXWHFLB0veT4hf3waJxUvdX3aA+Pz2a/iwk4pdfz1K3QGGpONFJ
   +thF2/rJKMadG9OQC7AY2tWgWsqQ+Ae/Vcz6mise+4jnzo+8r19MYB7eB
   ZAAa0tdH++rwAvoxSr+pLTrruOmmqiSDQY1V6fgbC4vRKEo1sj2DMbsIf
   XZYRddYFQZoRgQDfjSIkQUgz8xmmK/0h7zf8r0yQozhKWO/OcaUKkJdw1
   A==;
X-CSE-ConnectionGUID: 4CfpP2XaRsOqqH+k6PD+6w==
X-CSE-MsgGUID: U7XG79sFRM6orF59SNHNNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28232318"
X-IronPort-AV: E=Sophos;i="6.11,198,1725346800"; 
   d="scan'208";a="28232318"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2024 04:47:03 -0700
X-CSE-ConnectionGUID: Qg1arbBLQmWP1K3QafQfvg==
X-CSE-MsgGUID: BAZMZLegQjaPS7hg268LUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,198,1725346800"; 
   d="scan'208";a="82145078"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 12 Oct 2024 04:47:02 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szaaJ-000DK3-2p;
	Sat, 12 Oct 2024 11:46:59 +0000
Date: Sat, 12 Oct 2024 19:46:14 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:vdso/store 20/75]
 arch/x86/entry/vdso/vma.c:199:3: warning: label followed by a declaration is
 a C23 extension
Message-ID: <202410121905.2nMyOLfW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git vdso/store
head:   79c4677efae9ab2e20e0ff126c6528160f57b5eb
commit: eb954cf66837e55fd111758f273e5bdf9ca148ee [20/75] x86: vdso: Split virtual clock pages into dedicated mapping
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241012/202410121905.2nMyOLfW-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241012/202410121905.2nMyOLfW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410121905.2nMyOLfW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/entry/vdso/vma.c:199:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     199 |                 struct pvclock_vsyscall_time_info *pvti =
         |                 ^
   arch/x86/entry/vdso/vma.c:209:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     209 |                 unsigned long pfn = hv_get_tsc_pfn();
         |                 ^
   2 warnings generated.


vim +199 arch/x86/entry/vdso/vma.c

   192	
   193	static vm_fault_t vvar_vclock_fault(const struct vm_special_mapping *sm,
   194					    struct vm_area_struct *vma, struct vm_fault *vmf)
   195	{
   196		switch (vmf->pgoff) {
   197	#ifdef CONFIG_PARAVIRT_CLOCK
   198		case VDSO_PAGE_PVCLOCK_OFFSET:
 > 199			struct pvclock_vsyscall_time_info *pvti =
   200				pvclock_get_pvti_cpu0_va();
   201			if (pvti && vclock_was_used(VDSO_CLOCKMODE_PVCLOCK))
   202				return vmf_insert_pfn_prot(vma, vmf->address,
   203						__pa(pvti) >> PAGE_SHIFT,
   204						pgprot_decrypted(vma->vm_page_prot));
   205			break;
   206	#endif /* CONFIG_PARAVIRT_CLOCK */
   207	#ifdef CONFIG_HYPERV_TIMER
   208		case VDSO_PAGE_HVCLOCK_OFFSET:
   209			unsigned long pfn = hv_get_tsc_pfn();
   210	
   211			if (pfn && vclock_was_used(VDSO_CLOCKMODE_HVCLOCK))
   212				return vmf_insert_pfn(vma, vmf->address, pfn);
   213			break;
   214	#endif /* CONFIG_HYPERV_TIMER */
   215		}
   216	
   217		return VM_FAULT_SIGBUS;
   218	}
   219	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
