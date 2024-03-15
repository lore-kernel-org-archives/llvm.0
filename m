Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0911AAAE;
	Fri, 15 Mar 2024 10:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710499269; cv=none; b=Jg8eqK75L/Su14MBCJs17mymCZdEj21/+macGrDp3F5WvsHd/RlcjB8+V38W8QxqulUjPAol+qTUK1rvQvL8FdGVDmF5MGgs1tfX4T/Wrgc9LEgeHv4B6X1CgSIb933kvFHPxxfy0X8Pm/SGW3oMmZq0rQn4PXjSR495S3ua19c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710499269; c=relaxed/simple;
	bh=UZIh4RWlmuJj7zw//NWn6gkP3mK2M7AyXurlP+QFgG0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hkdrUd03QIJasLgyhnWozWxe9lmHdE2jf0UtFqS/R/vGlU2HQAWuCBAz5g1VDsl19dDp87Z/KmV+C5q9sSkBlnBrqm0iFfmeKcTy+G+LfpM0PXB4GnBwL3oSrL7vArdGHB+ITUbqQ0R/zZkVFQ7hNESWwr2Y9sZ3kAf/X4vwuvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aCns+xfQ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aCns+xfQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710499268; x=1742035268;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UZIh4RWlmuJj7zw//NWn6gkP3mK2M7AyXurlP+QFgG0=;
  b=aCns+xfQnfb2SPk7705+uPB0QgRSrNhkRW6aplu1HWsevf76sNJUG6Ij
   kHrYOMdxtbmeK27iHPuPdhwB1rQkS6Eb49HBHbspHinRgZxVkeTDRBi35
   i3y7YNIvCYRWjqsLcnCJRzjT/LjFiPDoe6tOjnXt7rq2vEDjPqCHJQLnq
   BTa2cZreqBsFHDf0kw7+29rNCp9l6H4bL3cmVH24DKrfnWrP6KJN76OwK
   FjK4QaLae0KP27SkbN5wll0U8NkI3ZNavDXpRqv7nKcX4j8vTFb2e1EEj
   dGRBtied5qHz3cquj8QWHxe8oY5u1rnnfgI5ppbZtxshR/Jhdk3jIjbvk
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5300262"
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; 
   d="scan'208";a="5300262"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2024 03:41:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; 
   d="scan'208";a="17300576"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 15 Mar 2024 03:41:06 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rl4zm-000ELR-2p;
	Fri, 15 Mar 2024 10:41:02 +0000
Date: Fri, 15 Mar 2024 18:40:45 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/msr_uaccess_cleanup 15/15] arch/x86/kvm/x86.c:326:32:
 error: variable has incomplete type 'enum kvm_msr_access'
Message-ID: <202403151821.yXAJWbwr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/msr_uaccess_cleanup
head:   08d9dcfffc5235154aa5ac85956aa72f18acea0b
commit: 08d9dcfffc5235154aa5ac85956aa72f18acea0b [15/15] writeme
config: i386-buildonly-randconfig-002-20240315 (https://download.01.org/0day-ci/archive/20240315/202403151821.yXAJWbwr-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240315/202403151821.yXAJWbwr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403151821.yXAJWbwr-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> arch/x86/kvm/x86.c:326:17: warning: declaration of 'enum kvm_msr_access' will not be visible outside of this function [-Wvisibility]
     326 |                                               enum kvm_msr_access rw,
         |                                                    ^
>> arch/x86/kvm/x86.c:326:32: error: variable has incomplete type 'enum kvm_msr_access'
     326 |                                               enum kvm_msr_access rw,
         |                                                                   ^
   arch/x86/kvm/x86.c:326:17: note: forward declaration of 'enum kvm_msr_access'
     326 |                                               enum kvm_msr_access rw,
         |                                                    ^
>> arch/x86/kvm/x86.c:329:25: error: use of undeclared identifier 'MSR_TYPE_W'; did you mean 'MR_TYPES'?
     329 |         const char *op = rw == MSR_TYPE_W ? "wrmsr" : "rdmsr";
         |                                ^~~~~~~~~~
         |                                MR_TYPES
   include/linux/migrate_mode.h:32:2: note: 'MR_TYPES' declared here
      32 |         MR_TYPES
         |         ^
>> arch/x86/kvm/x86.c:332:21: error: use of undeclared identifier 'MSR_TYPE_R'; did you mean 'MR_TYPES'?
     332 |         BUILD_BUG_ON(rw != MSR_TYPE_R && rw != MSR_TYPE_W);
         |                            ^~~~~~~~~~
         |                            MR_TYPES
   include/linux/build_bug.h:50:19: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |                          ^
   include/linux/build_bug.h:39:58: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                                          ^
   include/linux/compiler_types.h:435:22: note: expanded from macro 'compiletime_assert'
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:423:23: note: expanded from macro '_compiletime_assert'
     423 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^
   include/linux/compiler_types.h:415:9: note: expanded from macro '__compiletime_assert'
     415 |                 if (!(condition))                                       \
         |                       ^
   include/linux/migrate_mode.h:32:2: note: 'MR_TYPES' declared here
      32 |         MR_TYPES
         |         ^
   arch/x86/kvm/x86.c:332:41: error: use of undeclared identifier 'MSR_TYPE_W'; did you mean 'MR_TYPES'?
     332 |         BUILD_BUG_ON(rw != MSR_TYPE_R && rw != MSR_TYPE_W);
         |                                                ^~~~~~~~~~
         |                                                MR_TYPES
   include/linux/build_bug.h:50:19: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |                          ^
   include/linux/build_bug.h:39:58: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                                          ^
   include/linux/compiler_types.h:435:22: note: expanded from macro 'compiletime_assert'
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:423:23: note: expanded from macro '_compiletime_assert'
     423 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^
   include/linux/compiler_types.h:415:9: note: expanded from macro '__compiletime_assert'
     415 |                 if (!(condition))                                       \
         |                       ^
   include/linux/migrate_mode.h:32:2: note: 'MR_TYPES' declared here
      32 |         MR_TYPES
         |         ^
   arch/x86/kvm/x86.c:339:19: error: use of undeclared identifier 'MSR_TYPE_R'; did you mean 'MR_TYPES'?
     339 |         if (ret && rw == MSR_TYPE_R)
         |                          ^~~~~~~~~~
         |                          MR_TYPES
   include/linux/migrate_mode.h:32:2: note: 'MR_TYPES' declared here
      32 |         MR_TYPES
         |         ^
>> arch/x86/kvm/x86.c:1712:54: error: too many arguments to function call, expected 1, have 2
    1712 |                 return static_call(kvm_x86_get_msr_feature)(index, data);
         |                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~        ^~~~
   arch/x86/include/asm/kvm-x86-ops.h:130:1: note: '__SCT__kvm_x86_get_msr_feature' declared here
     130 | KVM_X86_OP(get_msr_feature)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/x86.c:139:2: note: expanded from macro 'KVM_X86_OP'
     139 |         DEFINE_STATIC_CALL_NULL(kvm_x86_##func,                      \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     140 |                                 *(((struct kvm_x86_ops *)0)->func));
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call.h:238:2: note: expanded from macro 'DEFINE_STATIC_CALL_NULL'
     238 |         DECLARE_STATIC_CALL(name, _func);                               \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:39:22: note: expanded from macro 'DECLARE_STATIC_CALL'
      39 |         extern typeof(func) STATIC_CALL_TRAMP(name);
         |                             ^~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~~~~~~
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^~~~
   <scratch space>:5:1: note: expanded from here
       5 | __SCT__kvm_x86_get_msr_feature
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/x86.c:1735:53: error: use of undeclared identifier 'MSR_TYPE_R'
    1735 |         return kvm_do_msr_uaccess(vcpu, index, data, true, MSR_TYPE_R,
         |                                                            ^
   arch/x86/kvm/x86.c:1926:63: error: use of undeclared identifier 'MSR_TYPE_W'
    1926 |         return kvm_do_msr_uaccess(vcpu, index, data, host_initiated, MSR_TYPE_W,
         |                                                                      ^
   arch/x86/kvm/x86.c:1966:63: error: use of undeclared identifier 'MSR_TYPE_R'
    1966 |         return kvm_do_msr_uaccess(vcpu, index, data, host_initiated, MSR_TYPE_R,
         |                                                                      ^
   1 warning and 9 errors generated.


vim +326 arch/x86/kvm/x86.c

   320	
   321	typedef int (*msr_uaccess_t)(struct kvm_vcpu *vcpu, u32 index, u64 *data,
   322				     bool host_initiated);
   323	
   324	static __always_inline int kvm_do_msr_uaccess(struct kvm_vcpu *vcpu, u32 msr,
   325						      u64 *data, bool host_initiated,
 > 326						      enum kvm_msr_access rw,
   327						      msr_uaccess_t msr_uaccess_fn)
   328	{
 > 329		const char *op = rw == MSR_TYPE_W ? "wrmsr" : "rdmsr";
   330		int ret;
   331	
 > 332		BUILD_BUG_ON(rw != MSR_TYPE_R && rw != MSR_TYPE_W);
   333	
   334		/*
   335		 * Zero the data on read failures to avoid leaking stack data to the
   336		 * guest and/or userspace, e.g. if the failure is ignored below.
   337		 */
   338		ret = msr_uaccess_fn(vcpu, msr, data, host_initiated);
   339		if (ret && rw == MSR_TYPE_R)
   340			*data = 0;
   341	
   342		if (ret != KVM_MSR_RET_INVALID)
   343			return ret;
   344	
   345		if (!ignore_msrs) {
   346			kvm_debug_ratelimited("unhandled %s: 0x%x data 0x%llx\n",
   347					      op, msr, *data);
   348			return ret;
   349		}
   350	
   351		if (report_ignored_msrs)
   352			kvm_pr_unimpl("ignored %s: 0x%x data 0x%llx\n", op, msr, *data);
   353		
   354		return 0;
   355	}
   356	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
