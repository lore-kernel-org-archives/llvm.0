Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8B83EBF38;
	Sun, 25 Jan 2026 00:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769302065; cv=none; b=UymG0cRcA/R4Ds13MF/hQCIWbSczJHDj79Yd4krQI9PFdlMLgl1Ajo06YY1+iBMUDOPGgVm5LxctHWK4Y5sNymVKmMrfhp/n0mXWCE0R3lJs6tTvOvEVXpw+Jv0Fab1LmvIHErn6KLaE021YE5Z4cj9ZS1ixuJ4yrVIA47prQes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769302065; c=relaxed/simple;
	bh=aBbJgPT0nv908QNO8XiKTcERvhXX4i+mqqMVou5jA2c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DCcTeq2lgFOfwnK+tO9UCKi1PrVT4ADce4QLohHcb3a9410gfBM6Up1FX2aO2fqhXpTPQDh4BfIN5Saj65o8Uj+ps9oyTgVNH4ZKC+hlEljNbrVFNMro1qgm/gougC331D1Box985N8Esn9MKxbzVUVoazNdjBvelXH2Aaok+LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QfX2l7mN; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QfX2l7mN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769302063; x=1800838063;
  h=date:from:to:cc:subject:message-id;
  bh=aBbJgPT0nv908QNO8XiKTcERvhXX4i+mqqMVou5jA2c=;
  b=QfX2l7mNMXuBM6dfd9s5Bfn/JoMBUXIecGCzSD5D2kCkFYudNdwDxX1l
   /t8WVf/6v1VK4MBHzre5GVj4sqnHOZFKO9ObENB7gsTeZGJEYocA5LO7n
   qsfuGGO2Y6LyRsqiwn9/mkXqYos47yx2rffQboMWdvKPb1Kecg1KK7SLB
   aa8683ojww77OtOPsAjdXcJd2HLAm9r93Q5HwvPvrSGLOnfxSJU06Y61/
   gd6mmShfehWxmYRjK4W1e+8Saj2P5JJYgqnIlane4M14oAlTnWzVVZo1u
   BBAb/cqM7cErrUqDvoGWnVtHrcAAB8RVzkJHkR+bKo8ByuCkrnPuI9RIL
   g==;
X-CSE-ConnectionGUID: KphIpo9SQZyU0T96KD5aBw==
X-CSE-MsgGUID: npEsrpujTVaiWb2PWuEZVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11681"; a="69533315"
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="69533315"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 16:47:42 -0800
X-CSE-ConnectionGUID: aTXk5cb7SgWtO81VVh0aaw==
X-CSE-MsgGUID: Sm4kjUjaSeataEStW0BrmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="207161730"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 24 Jan 2026 16:47:41 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjoHy-00000000Vdo-2G7u;
	Sun, 25 Jan 2026 00:47:38 +0000
Date: Sun, 25 Jan 2026 08:46:50 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/vmxon_sucks 17/18]
 arch/x86/kvm/vmx/main.c:1077:1: warning: unused label 'err_tdx_bringup'
Message-ID: <202601250852.HdOhE7uD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux x86/vmxon_sucks
head:   812d315824cbec66990b83771c86b0ef6f6fc0e6
commit: 7fcfe117b421e1077f02e13d0cd5e8d1457f4b15 [17/18] KVM: TDX: Fold tdx_bringup() into tdx_hardware_setup()
config: x86_64-buildonly-randconfig-003-20260125 (https://download.01.org/0day-ci/archive/20260125/202601250852.HdOhE7uD-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260125/202601250852.HdOhE7uD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601250852.HdOhE7uD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/vmx/main.c:1077:1: warning: unused label 'err_tdx_bringup' [-Wunused-label]
    1077 | err_tdx_bringup:
         | ^~~~~~~~~~~~~~~~
   1 warning generated.


vim +/err_tdx_bringup +1077 arch/x86/kvm/vmx/main.c

d6bee7813752b3 Kai Huang      2025-01-22  1040  
d6bee7813752b3 Kai Huang      2025-01-22  1041  static int __init vt_init(void)
d6bee7813752b3 Kai Huang      2025-01-22  1042  {
09b3d3c17f365f Isaku Yamahata 2024-10-30  1043  	unsigned vcpu_size, vcpu_align;
d6bee7813752b3 Kai Huang      2025-01-22  1044  	int r;
d6bee7813752b3 Kai Huang      2025-01-22  1045  
d6bee7813752b3 Kai Huang      2025-01-22  1046  	r = vmx_init();
d6bee7813752b3 Kai Huang      2025-01-22  1047  	if (r)
d6bee7813752b3 Kai Huang      2025-01-22  1048  		return r;
d6bee7813752b3 Kai Huang      2025-01-22  1049  
09b3d3c17f365f Isaku Yamahata 2024-10-30  1050  	/*
09b3d3c17f365f Isaku Yamahata 2024-10-30  1051  	 * TDX and VMX have different vCPU structures.  Calculate the
09b3d3c17f365f Isaku Yamahata 2024-10-30  1052  	 * maximum size/align so that kvm_init() can use the larger
09b3d3c17f365f Isaku Yamahata 2024-10-30  1053  	 * values to create the kmem_vcpu_cache.
09b3d3c17f365f Isaku Yamahata 2024-10-30  1054  	 */
09b3d3c17f365f Isaku Yamahata 2024-10-30  1055  	vcpu_size = sizeof(struct vcpu_vmx);
09b3d3c17f365f Isaku Yamahata 2024-10-30  1056  	vcpu_align = __alignof__(struct vcpu_vmx);
09b3d3c17f365f Isaku Yamahata 2024-10-30  1057  	if (enable_tdx) {
09b3d3c17f365f Isaku Yamahata 2024-10-30  1058  		vcpu_size = max_t(unsigned, vcpu_size,
09b3d3c17f365f Isaku Yamahata 2024-10-30  1059  				sizeof(struct vcpu_tdx));
09b3d3c17f365f Isaku Yamahata 2024-10-30  1060  		vcpu_align = max_t(unsigned, vcpu_align,
09b3d3c17f365f Isaku Yamahata 2024-10-30  1061  				__alignof__(struct vcpu_tdx));
161d34609f9b31 Isaku Yamahata 2024-12-10  1062  		kvm_caps.supported_vm_types |= BIT(KVM_X86_TDX_VM);
09b3d3c17f365f Isaku Yamahata 2024-10-30  1063  	}
09b3d3c17f365f Isaku Yamahata 2024-10-30  1064  
d6bee7813752b3 Kai Huang      2025-01-22  1065  	/*
d6bee7813752b3 Kai Huang      2025-01-22  1066  	 * Common KVM initialization _must_ come last, after this, /dev/kvm is
d6bee7813752b3 Kai Huang      2025-01-22  1067  	 * exposed to userspace!
d6bee7813752b3 Kai Huang      2025-01-22  1068  	 */
09b3d3c17f365f Isaku Yamahata 2024-10-30  1069  	r = kvm_init(vcpu_size, vcpu_align, THIS_MODULE);
d6bee7813752b3 Kai Huang      2025-01-22  1070  	if (r)
d6bee7813752b3 Kai Huang      2025-01-22  1071  		goto err_kvm_init;
d6bee7813752b3 Kai Huang      2025-01-22  1072  
d6bee7813752b3 Kai Huang      2025-01-22  1073  	return 0;
d6bee7813752b3 Kai Huang      2025-01-22  1074  
d6bee7813752b3 Kai Huang      2025-01-22  1075  err_kvm_init:
fcdbdf63431c9f Kai Huang      2024-11-15  1076  	tdx_cleanup();
fcdbdf63431c9f Kai Huang      2024-11-15 @1077  err_tdx_bringup:

:::::: The code at line 1077 was first introduced by commit
:::::: fcdbdf63431c9faf639bffc957ea2ce9b545432e KVM: VMX: Initialize TDX during KVM module load

:::::: TO: Kai Huang <kai.huang@intel.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
