Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72F9155322;
	Sat, 22 Nov 2025 07:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763797485; cv=none; b=VdwdWqBWtxtmNm0/4rFOg7PJvJ5a7Wo5uhXudUkMwilMI/Ru20yGmzHZcpCvMhEfxoISEvm+wzMSNWB7+gtk8taATvhEL6QBMfwJf6d00am7NLPb3T013lzmhPlruBNzywk5+B5FkbrXzLFaHz3M2tQVoOV+BUnoZK3RdsjNQj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763797485; c=relaxed/simple;
	bh=xOnhEja5WyTbmypjcjjHguETyDXSm4wRUDvwkni9mRw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iNormnKXIm2c5MYTbIKf4fu7xHunA5H/fZurKWIUNP/el1TcKwS9Ul4q3XkuL3Kak5CQ7qlEBy4UXaPMkk++FTVxInUdAoqXNSHVVMr7XP9iRvEJzwd654N5H4FJEEt9KUItyDaKgjrmx3WCtRjtiHoHx5EWHrB3LZu6CeEfOMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f7MrHDdw; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f7MrHDdw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763797483; x=1795333483;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xOnhEja5WyTbmypjcjjHguETyDXSm4wRUDvwkni9mRw=;
  b=f7MrHDdweDM/9buDO95J6YYb69GMerABsWkWuyML9dP+x35x1TfqN5W5
   AcwqIr9BxNxwlirLrM+yEQOTzdAVkP+ihXrGh0I6NRLnAisVlmU5qZ2VM
   s1vsryA4rRGljgLuzzbOraei9l+wdNrebIm0KiaKzsmtOLxpRCHG0J5Sp
   hJUUEwX4cY3WIG+aSRpG90J8GY23UrXGHDer/l2dIBQRjBPsRsTn4HClE
   Xwfu1Hd5qmlL32KCYAUzeLav4tkYdO3lNyu/EzF8L8egaQHATQE68nYn+
   iwbaxumo3/xxRRCrVlfHXGqYLL/bN6frBbvhI9fbXDAeWM6mi8w9PYoEq
   Q==;
X-CSE-ConnectionGUID: /ceEMrK8TTalAcjS+L3S/g==
X-CSE-MsgGUID: v+8SyK5lTCCgabX5bI15vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="69739790"
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; 
   d="scan'208";a="69739790"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 23:44:43 -0800
X-CSE-ConnectionGUID: rm2chtZWSayit278uxG90g==
X-CSE-MsgGUID: INkUGgsqRZ+/frSrd/GXSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; 
   d="scan'208";a="192350308"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 21 Nov 2025 23:44:42 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMiIR-0007GT-2X;
	Sat, 22 Nov 2025 07:44:39 +0000
Date: Sat, 22 Nov 2025 15:44:04 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/vmxon_sucks 10/16] arch/x86/virt/hw.c:258:56: error:
 expected ';' after top level declarator
Message-ID: <202511221537.tOFi3YMn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/vmxon_sucks
head:   53a0058b6ceb67b7a632bf92718986b1b30438d3
commit: 3e6566e776aa77ac22ffb4bd16fca9e9afc9d98c [10/16] KVM: x86: Extract VMXON and EFER.SVME enablement to kernel
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251122/202511221537.tOFi3YMn-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511221537.tOFi3YMn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511221537.tOFi3YMn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/virt/hw.c:258:56: error: expected ';' after top level declarator
     258 | static int x86_svm_emergency_disable_virtualization_cpu { BUILD_BUG_ON(1); return -EOPNOTSUPP; }
         |                                                        ^
         |                                                        ;
>> arch/x86/virt/hw.c:330:8: error: called object type 'int' is not a function or function pointer
     330 |         (void)x86_virt_call(emergency_disable_virtualization_cpu);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/virt/hw.c:271:21: note: expanded from macro 'x86_virt_call'
     271 |                 __r = x86_svm_##fn();                   \
         |                       ~~~~~~~~~~~~^
   2 errors generated.


vim +258 arch/x86/virt/hw.c

   254	
   255	#else
   256	static int x86_svm_get_cpu(void) { BUILD_BUG_ON(1); return -EOPNOTSUPP; }
   257	static int x86_svm_put_cpu(void) { BUILD_BUG_ON(1); return -EOPNOTSUPP; }
 > 258	static int x86_svm_emergency_disable_virtualization_cpu { BUILD_BUG_ON(1); return -EOPNOTSUPP; }
   259	static __init int x86_svm_init(void) { return -EOPNOTSUPP; }
   260	#endif
   261	
   262	#define x86_virt_call(fn)				\
   263	({							\
   264		int __r;					\
   265								\
   266		if (IS_ENABLED(CONFIG_KVM_INTEL) &&		\
   267		    cpu_feature_enabled(X86_FEATURE_VMX))	\
   268			__r = x86_vmx_##fn();			\
   269		else if (IS_ENABLED(CONFIG_KVM_AMD) &&		\
   270			 cpu_feature_enabled(X86_FEATURE_SVM))	\
   271			__r = x86_svm_##fn();			\
   272		else						\
   273			__r = -EOPNOTSUPP;			\
   274								\
   275		__r;						\
   276	})
   277	
   278	int x86_virt_get_cpu(int feat)
   279	{
   280		int r;
   281	
   282		if (!x86_virt_feature || x86_virt_feature != feat)
   283			return -EOPNOTSUPP;
   284	
   285		if (this_cpu_inc_return(virtualization_nr_users) > 1)
   286			return 0;
   287	
   288		r = x86_virt_call(get_cpu);
   289		if (r)
   290			WARN_ON_ONCE(this_cpu_dec_return(virtualization_nr_users));
   291	
   292		return r;
   293	}
   294	EXPORT_SYMBOL_GPL(x86_virt_get_cpu);
   295	
   296	void x86_virt_put_cpu(int feat)
   297	{
   298		if (WARN_ON_ONCE(!this_cpu_read(virtualization_nr_users)) ||
   299		    this_cpu_dec_return(virtualization_nr_users))
   300			return;
   301	
   302		BUG_ON(x86_virt_call(put_cpu) && !virt_rebooting);
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
   313		if (!x86_virt_feature)
   314			return -EOPNOTSUPP;
   315	
   316		/*
   317		 * IRQs must be disabled as virtualization is enabled in hardware via
   318		 * function call IPIs, i.e. IRQs need to be disabled to guarantee
   319		 * virtualization stays disabled.
   320		 */
   321		lockdep_assert_irqs_disabled();
   322	
   323		/*
   324		 * Do the NMI shootdown even if virtualization is off on _this_ CPU, as
   325		 * other CPUs may have virtualization enabled.
   326		 *
   327		 * TODO: Track whether or not virtualization might be enabled on other
   328		 *	 CPUs?  May not be worth avoiding the NMI shootdown...
   329		 */
 > 330		(void)x86_virt_call(emergency_disable_virtualization_cpu);
   331		return 0;
   332	}
   333	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
