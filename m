Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417213EDAA9;
	Wed,  5 Aug 2026 08:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785920175; cv=none; b=D+DLOqXvc4gYsKincHSIl8m1sadGD5tYnGmCtDM9Dz8gic4ft5XsC3RMU9rlkiD19G650k3aLL2bCB+9MY6eGV1Sq6czn5aCcBN9kL9jJ5Kw0sAJXcGKEImJJPOZrLOxeQqSRSiUX85uCrjulxXW15kcxrVIeT37SQdAjmhj3yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785920175; c=relaxed/simple;
	bh=c1UWBt4NKwp/S1Xy1eTVYRe7ecOvNJ78Tx3gq4vGMu8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YUW8hBQ4j8Iv+Ng2YAAIcmyekDli9BjQtPpu1UMvPoI7fbW4XwIfX2qm+89uDmeUw7QcazLN9OStyuBlN6dDeqDMPgvJCLPpt4TarJA1rQjqtBNC/jEr78b0sEc2v5mUlFEadd/S0BFmZ6mSRdXFZ3Pg8oQXWaKgqd3LbHOVMAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TXdASI44; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TXdASI44"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785920173; x=1817456173;
  h=date:from:to:cc:subject:message-id;
  bh=c1UWBt4NKwp/S1Xy1eTVYRe7ecOvNJ78Tx3gq4vGMu8=;
  b=TXdASI44kLP0oUOqGAwT9RFCsHGhovmkYl0bbCfp1zcllT73ADW2/uKD
   BwUPRga41q81fFakqpnxFLC8ekzY1/WC6a45zTyzQHFXWp2JYnP8FaNKb
   kfaiHU+tBaoOaQfQD9XzASCqsEH8UHgTHdzJVGUkkhuenreG8mAhwHWmv
   4zGbCSt7P+X1N98MkJe8Xzk1mxzFzuCmihCOQ2SNJGr6Djv/UcEqRDkh7
   WscgB8hlxLUDQ/Gdv0aE7yoJifieS/24Hyp1mTjiCKZDVUeqIx/qeczyx
   kW6PAORIbk6pMIBUoVdhKqlTCUQjHN1SsGbixGkDS+z9kyRnihG9Fl5Cq
   A==;
X-CSE-ConnectionGUID: xklDcAhRTKuQq8cONdXl6Q==
X-CSE-MsgGUID: hcJdC9FOR2yW2Uw1o3gs5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="86603796"
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="86603796"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 01:56:13 -0700
X-CSE-ConnectionGUID: MBzm0MZTR/KxP6/KRq2wHA==
X-CSE-MsgGUID: 38DoW8BiQv+WcZEs/kiovA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="259989102"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 05 Aug 2026 01:56:12 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrXQ0-00000000Byn-3tCI;
	Wed, 05 Aug 2026 08:56:08 +0000
Date: Wed, 05 Aug 2026 16:56:02 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Dmitry Ilvokhin <d@ilvokhin.com>
Subject: [peterz-queue:locking/core 17/21]
 arch/x86/boot/../include/asm/cpufeatures.h:228:68: warning: '/*' within block
 comment
Message-ID: <202608051606.XGxMBLUb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/core
head:   098a858bcdad1b6327e23274626c9fb36c5932fc
commit: 6cbc4e025e8c31cdc861ad9f2f53dc0eb290d586 [17/21] x86/paravirt: Use static_call() for the paravirt spinlock ops
config: i386-buildonly-randconfig-003-20260805 (https://download.01.org/0day-ci/archive/20260805/202608051606.XGxMBLUb-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260805/202608051606.XGxMBLUb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608051606.XGxMBLUb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/boot/mkcpustr.c:15:
>> arch/x86/boot/../include/asm/cpufeatures.h:228:68: warning: '/*' within block comment [-Wcomment]
     228 | /* free: was #define X86_FEATURE_PVUNLOCK               ( 8*32+20) /* PV unlock function */
         |                                                                    ^
   1 warning generated.


vim +228 arch/x86/boot/../include/asm/cpufeatures.h

   222	
   223	#define X86_FEATURE_VMMCALL		( 8*32+15) /* "vmmcall" Prefer VMMCALL to VMCALL */
   224	#define X86_FEATURE_XENPV		( 8*32+16) /* Xen paravirtual guest */
   225	#define X86_FEATURE_EPT_AD		( 8*32+17) /* "ept_ad" Intel Extended Page Table access-dirty bit */
   226	#define X86_FEATURE_VMCALL		( 8*32+18) /* Hypervisor supports the VMCALL instruction */
   227	#define X86_FEATURE_VMW_VMMCALL		( 8*32+19) /* VMware prefers VMMCALL hypercall instruction */
 > 228	/* free: was #define X86_FEATURE_PVUNLOCK               ( 8*32+20) /* PV unlock function */
   229	#define X86_FEATURE_VCPUPREEMPT		( 8*32+21) /* PV vcpu_is_preempted function */
   230	#define X86_FEATURE_TDX_GUEST		( 8*32+22) /* "tdx_guest" Intel Trust Domain Extensions Guest */
   231	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
