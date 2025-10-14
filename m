Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479CB2D239A;
	Tue, 14 Oct 2025 19:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760470984; cv=none; b=BzbsvVjbVFr6glMslpPjvRka6232f6PI7alLQFU9x+3FcdTbMHZQIJrtJ1U62sT/K1XFaRNY5ErY/A/e9dvmQOLXhjiS4S/AIq50E/HksH9+XeMLzLj7eprenjmlpfzXVEajTTdRKamRz7ppW3SOAdDG8YZ4HDpneFedxPaLAx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760470984; c=relaxed/simple;
	bh=EWgw3GLR6oRJ1kHguVBl4EyHjggRRJZVdezRBUpJWNY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eY8AxNgNFsMwalt1xwjiMG3WEqaJhOsnWfTMFRzssqmKUCKLPaOyFU1mBgZLYQmYLm+TvUVWNAOurTJhKBVzuQ6rUSr8QNeWOp4JxhxMIVpt2I41KaabSI0uEUYAm7seX5GmoXFGgZNLSmlzm5BE+3ApkifV7GFfzDmr+41LuCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VlefJFjQ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VlefJFjQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760470982; x=1792006982;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EWgw3GLR6oRJ1kHguVBl4EyHjggRRJZVdezRBUpJWNY=;
  b=VlefJFjQZ11KYKueeTGWWBdU4AtaZGogcuFfSmDB8Jd2egEiUnRItt2H
   4kUO0yUfuLxsCyUriONEW/xD7O94oLhCSqaIo1Tsw9ifS5W/+qBEoRN2d
   4LPq9U+NmJCXcL3g2IFv2xO6rAtEjMACVfwThpKiS6hSTcC+JcQ7TeKbv
   bdQ5wCVUQ17/HauBbdVWaR7NvMbUhsXTEpfqX3a0tIF8zY4rpopbJ8wtS
   xoKjAX/AInH+TXgdOt5d88JTtpRVEcArmAuaksv59l67FnftIhUqiKBeE
   /1HI7PHn1BrYLgg8GmxFs3ULqm/RzMEdIG4pf/msAm/sB/zovvYLseqJE
   A==;
X-CSE-ConnectionGUID: nGc9ChKZSZiwhXS6qmm8Ew==
X-CSE-MsgGUID: fos1/Ra1TVOoKpL/NzHDVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="61847602"
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; 
   d="scan'208";a="61847602"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 12:42:54 -0700
X-CSE-ConnectionGUID: aXu6CnSrSEiPfneed3k1XQ==
X-CSE-MsgGUID: ItSb2ZoMS0ma9rcCgTTF+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; 
   d="scan'208";a="182751611"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 14 Oct 2025 12:42:51 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8kv3-00037r-1x;
	Tue, 14 Oct 2025 19:42:49 +0000
Date: Wed, 15 Oct 2025 03:42:21 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/vmxon_sucks 17/19] arch/x86/virt/hw.c:302:9: error:
 assigning to 'int' from incompatible type 'void'
Message-ID: <202510150357.nbUFdnh8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/vmxon_sucks
head:   24e9ac2db43ec73d19dc6896a507de1ff078c2bc
commit: 72541a6245fb93cdc3c8aa8140b20dd1701c0e63 [17/19] KVM: x86: Extract VMXON and EFER.SVME enablement to kernel
config: x86_64-buildonly-randconfig-004-20251015 (https://download.01.org/0day-ci/archive/20251015/202510150357.nbUFdnh8-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251015/202510150357.nbUFdnh8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510150357.nbUFdnh8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/virt/hw.c:302:9: error: assigning to 'int' from incompatible type 'void'
     302 |         BUG_ON(x86_virt_call(put_cpu) && !virt_rebooting);
         |         ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/virt/hw.c:269:7: note: expanded from macro 'x86_virt_call'
     269 |                 __r = x86_svm_##fn();                   \
         |                     ^
   include/asm-generic/bug.h:71:45: note: expanded from macro 'BUG_ON'
      71 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                    ~~~~~~~~~^~~~~~~~~~
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
>> arch/x86/virt/hw.c:324:8: error: call to undeclared function 'x86_svm_emergency_disable_virtualization_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     324 |         (void)x86_virt_call(emergency_disable_virtualization_cpu);
         |               ^
   arch/x86/virt/hw.c:269:9: note: expanded from macro 'x86_virt_call'
     269 |                 __r = x86_svm_##fn();                   \
         |                       ^
   <scratch space>:209:1: note: expanded from here
     209 | x86_svm_emergency_disable_virtualization_cpu
         | ^
   arch/x86/virt/hw.c:324:8: note: did you mean 'x86_vmx_emergency_disable_virtualization_cpu'?
   arch/x86/virt/hw.c:269:9: note: expanded from macro 'x86_virt_call'
     269 |                 __r = x86_svm_##fn();                   \
         |                       ^
   <scratch space>:209:1: note: expanded from here
     209 | x86_svm_emergency_disable_virtualization_cpu
         | ^
   arch/x86/virt/hw.c:121:12: note: 'x86_vmx_emergency_disable_virtualization_cpu' declared here
     121 | static int x86_vmx_emergency_disable_virtualization_cpu(void)
         |            ^
   2 errors generated.
--
>> arch/x86/kernel/crash.c:114:2: error: call to undeclared function 'x86_virt_emergency_disable_virtualization_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     114 |         x86_virt_emergency_disable_virtualization_cpu();
         |         ^
   1 error generated.


vim +302 arch/x86/virt/hw.c

   293	
   294	void x86_virt_put_cpu(int feat)
   295	{
   296		if (WARN_ON_ONCE(!this_cpu_read(virtualization_nr_users)))
   297			return;
   298	
   299		if (this_cpu_dec_return(virtualization_nr_users) && !virt_rebooting)
   300			return;
   301	
 > 302		BUG_ON(x86_virt_call(put_cpu) && !virt_rebooting);
   303	}
   304	EXPORT_SYMBOL_GPL(x86_virt_put_cpu);
   305	
   306	/*
   307	 * Disable virtualization, i.e. VMX or SVM, to ensure INIT is recognized during
   308	 * reboot.  VMX blocks INIT if the CPU is post-VMXON, and SVM blocks INIT if
   309	 * GIF=0, i.e. if the crash occurred between CLGI and STGI.
   310	 */
   311	int x86_virt_emergency_disable_virtualization_cpu(void)
   312	{
   313		/*
   314		 * IRQs must be disabled as virtualization is enabled in hardware via
   315		 * function call IPIs, i.e. IRQs need to be disabled to guarantee
   316		 * virtualization stays disabled.
   317		 */
   318		lockdep_assert_irqs_disabled();
   319	
   320		/*
   321		 * TODO: Track whether or not virtualization might be enabled on other
   322		 *	 CPUs?  May not be worth avoiding the NMI shootdown...
   323		 */
 > 324		(void)x86_virt_call(emergency_disable_virtualization_cpu);
   325		return 0;
   326	}
   327	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
