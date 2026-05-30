Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1962C340412;
	Sat, 30 May 2026 03:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780113318; cv=none; b=tm0ozEK9VLar+WqewNQHMkXpAf1LV8ZQLVmVRtdt0TfBWKLvbIz0ic/52vXbXJuoY+Wz0bonm8SqNcR71mkWIMuS4pMevd4poZWXaC9o8GWZXj+2Ulnrw3/0t91qAcL2W7mfjAWjxNJa3AKgfcplDu7e2f2GHVaApIfzoa59Ek0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780113318; c=relaxed/simple;
	bh=aJwzeyKml7IJhwfvewUlb7NkmWdPs/YwZ+SCH6Rxx2Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kqKRA+hIN7FzUiaHVIs90cLjlHLv40l/nN+ZF3eMiYlZMWjdwrE4r2taq+Bqx2Yi9P3/0XIDxuVZMzKvltHNEA10YpUbUWMahc5K6H5FR0Kn8A+wCl+fOSwxoNizjiWyDjFfWNF3p2t9whT/pjDbuxKiCKS5BoKFGrOkXu3WzYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q46rM/rr; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q46rM/rr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780113318; x=1811649318;
  h=date:from:to:cc:subject:message-id;
  bh=aJwzeyKml7IJhwfvewUlb7NkmWdPs/YwZ+SCH6Rxx2Y=;
  b=Q46rM/rrvMdeHD5kvI9Wtr8rjsj+QC15wHOOrgoW697d42S3/Db+BGJU
   kfhIVEA35nfuqTkc3Qis6In+tfV7fanyzAnrqnqWkaLMSnAElAJhO0V4/
   upE4A/nBwzNEy/MWefetRoteeIaKsAuZQim9XlQw4zUa5RBMyufdnxAtK
   LhM990i+uzOsxvsUTxQQrmf7Z9EoImbGWiGjwAmT5nEstGxkaClA2sJj1
   ukjjQ10jR2yRfH4BI9NJXvCwpZXBbah2ixGNW82GiGsNHMl1dL5trL0CF
   C0LTQ9UNP4tZnjjTvULTaUjX37I2zFJKO8bJFAKWNyC/VuEUhr1TnWj5Z
   w==;
X-CSE-ConnectionGUID: DRzPH7hQRAy8LJvxs1+rYQ==
X-CSE-MsgGUID: L5QTtS9KSOGfvr9qAAwafA==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="80691316"
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="80691316"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 20:55:15 -0700
X-CSE-ConnectionGUID: aA/91vsER6yZxrzz7knzUA==
X-CSE-MsgGUID: 95y4WLpVQryhNYrpv2TlNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="247296958"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 29 May 2026 20:55:13 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTAn1-0000000085Q-0589;
	Sat, 30 May 2026 03:55:11 +0000
Date: Sat, 30 May 2026 11:54:49 +0800
From: kernel test robot <lkp@intel.com>
To: Joerg Roedel <joerg.roedel@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [joro:kvm-planes-v7.0 16/62]
 include/linux/kvm_host.h:1023:56: error: no member named 'srcu_depth' in
 'struct kvm_vcpu'
Message-ID: <202605301115.imG5rX9h-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/joro/linux.git kvm-planes-v7.0
head:   dbb5c2770eccdd9477ce812561c61d49ef7891ab
commit: 4be7559caa1d9c7436c368cf89fee7d28d0559a9 [16/62] kvm: Move VCPU locking to struct kvm_vcpu_common
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20260530/202605301115.imG5rX9h-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260530/202605301115.imG5rX9h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605301115.imG5rX9h-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/loongarch/kernel/asm-offsets.c:14:
>> include/linux/kvm_host.h:1023:56: error: no member named 'srcu_depth' in 'struct kvm_vcpu'
    1023 |                   "KVM: Illegal vCPU srcu_idx LOCK, depth=%d", vcpu->srcu_depth - 1);
         |                                                                ~~~~  ^
   include/asm-generic/bug.h:185:38: note: expanded from macro 'WARN_ONCE'
     185 |         DO_ONCE_LITE_IF(condition, WARN, 1, format)
         |                                             ^~~~~~
   include/linux/once_lite.h:31:9: note: expanded from macro 'DO_ONCE_LITE_IF'
      31 |                         func(__VA_ARGS__);                              \
         |                              ^~~~~~~~~~~
   include/asm-generic/bug.h:166:29: note: expanded from macro 'WARN'
     166 |                 __WARN_printf(TAINT_WARN, format);                      \
         |                                           ^~~~~~
   include/asm-generic/bug.h:133:17: note: expanded from macro '__WARN_printf'
     133 |                 __warn_printk(arg);                                     \
         |                               ^~~
   In file included from arch/loongarch/kernel/asm-offsets.c:14:
   include/linux/kvm_host.h:1034:58: error: no member named 'srcu_depth' in 'struct kvm_vcpu'
    1034 |                   "KVM: Illegal vCPU srcu_idx UNLOCK, depth=%d", vcpu->srcu_depth);
         |                                                                  ~~~~  ^
   include/asm-generic/bug.h:185:38: note: expanded from macro 'WARN_ONCE'
     185 |         DO_ONCE_LITE_IF(condition, WARN, 1, format)
         |                                             ^~~~~~
   include/linux/once_lite.h:31:9: note: expanded from macro 'DO_ONCE_LITE_IF'
      31 |                         func(__VA_ARGS__);                              \
         |                              ^~~~~~~~~~~
   include/asm-generic/bug.h:166:29: note: expanded from macro 'WARN'
     166 |                 __WARN_printf(TAINT_WARN, format);                      \
         |                                           ^~~~~~
   include/asm-generic/bug.h:133:17: note: expanded from macro '__WARN_printf'
     133 |                 __warn_printk(arg);                                     \
         |                               ^~~
   2 errors generated.
   make[3]: *** [scripts/Makefile.build:184: arch/loongarch/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1337: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +1023 include/linux/kvm_host.h

8d5df887c3504a Joerg Roedel        2026-03-04  1018  
2031f2876896d8 Sean Christopherson 2022-04-15  1019  static inline void kvm_vcpu_srcu_read_lock(struct kvm_vcpu *vcpu)
2031f2876896d8 Sean Christopherson 2022-04-15  1020  {
2031f2876896d8 Sean Christopherson 2022-04-15  1021  #ifdef CONFIG_PROVE_RCU
4be7559caa1d9c Joerg Roedel        2026-03-04  1022  	WARN_ONCE(vcpu->common->srcu_depth++,
2031f2876896d8 Sean Christopherson 2022-04-15 @1023  		  "KVM: Illegal vCPU srcu_idx LOCK, depth=%d", vcpu->srcu_depth - 1);
2031f2876896d8 Sean Christopherson 2022-04-15  1024  #endif
4be7559caa1d9c Joerg Roedel        2026-03-04  1025  	vcpu->common->____srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
2031f2876896d8 Sean Christopherson 2022-04-15  1026  }
2031f2876896d8 Sean Christopherson 2022-04-15  1027  

:::::: The code at line 1023 was first introduced by commit
:::::: 2031f2876896d82aca7e82f84accd9181b9587fb KVM: Add helpers to wrap vcpu->srcu_idx and yell if it's abused

:::::: TO: Sean Christopherson <seanjc@google.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
