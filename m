Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8F15695;
	Thu, 21 Nov 2024 22:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732229227; cv=none; b=AFQdbXxWxlT9fQeBDdY83+GcTiTFAKicHZo9jBaTnLoDNjcWW1mCVJ1/souqJO1VLOGWf70og5YpgmhEtnTjrpoItLfBiR6q+baweYtcflyoOzPDfnRXxcb80qe1x85XG4b0ss1AEQHK2I9Lc1tEeB068xIqq1Ja1PCOZjOPCU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732229227; c=relaxed/simple;
	bh=GIfH8aSWjDQTES4Gga+8C1uRNRSvs56NVV94Dae94X8=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GOHG+97Ygvtw3r3S09V1yRlh4OuQZx8J32lKNpC7uFgd0lT0KI7mvzTD2Rh5NE7tCSEcwv6IibUhEHRqqXaApB/dVIpx6cr2gbahGtKD6BDj7N9b6xXrQvpFGLk+Jt/KeBafEfoAtuHd2Ql0Nil+l3oJ3ctmb27hTGGmXQ8sKTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OrdxEbko; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OrdxEbko"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732229226; x=1763765226;
  h=date:from:cc:subject:message-id:mime-version;
  bh=GIfH8aSWjDQTES4Gga+8C1uRNRSvs56NVV94Dae94X8=;
  b=OrdxEbkomgNQQAbPs5qtUngXy7CptcHgzpOZGjDrufHN9oHUI4sZPzR2
   gCbCTOLJm/VIiOZ10y/z9EerblCI1YXFgsIKpuq2mNQHQKXYDghM7q06S
   m+TsWa0YacefC2emoFlkSoJS4NkbOmp8Csr/JF5L5kmHS+WjoSP+8Iuyt
   v0KtDgSzNhAqlEx1Q3+2KGP+5nDixiFOnGm0iD412nzZTVmfblwr3skrl
   u7U3wHbE+jZNcenFfDIZSl2vinYpfTYHpbBzdc3RsUy2NTh3KHx9rGHda
   9diaUApHoeAWACfxyq+qHciznFedLXbgbuhMZ+/vpXQPtEqqfEnui4qlE
   g==;
X-CSE-ConnectionGUID: Bn25fcytT3m3pJGCteGq4Q==
X-CSE-MsgGUID: 67rkQXq/TxuqtEZX9/Zw3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="36150202"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; 
   d="scan'208";a="36150202"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 14:47:05 -0800
X-CSE-ConnectionGUID: /dOg2v6XRpOfSVU6L0eyMg==
X-CSE-MsgGUID: 334EuYSgTWiEU+CVjnmrTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; 
   d="scan'208";a="94482429"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 21 Nov 2024 14:47:03 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEFwz-0003R6-1U;
	Thu, 21 Nov 2024 22:47:01 +0000
Date: Fri, 22 Nov 2024 06:46:36 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: snd_pcm_ioctl_xfern_compat+0x717:
 undefined stack state
Message-ID: <202411220648.agMk3SFa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Dan Carpenter <error27@gmail.com>
CC: Vlastimil Babka <vbabka@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fc39fb56917bb3cb53e99560ca3612a84456ada2
commit: cd7eb8f83fcf258f71e293f7fc52a70be8ed0128 mm/slab: make __free(kfree) accept error pointers
date:   7 months ago
config: x86_64-buildonly-randconfig-002-20241122 (https://download.01.org/0day-ci/archive/20241122/202411220648.agMk3SFa-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241122/202411220648.agMk3SFa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411220648.agMk3SFa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: ftrace_likely_update+0x445: call to __stack_chk_fail() with UACCESS enabled
   vmlinux.o: warning: objtool: ___bpf_prog_run+0x22d: sibling call from callable instruction with modified stack frame
>> vmlinux.o: warning: objtool: snd_pcm_ioctl_xfern_compat+0x717: undefined stack state
   vmlinux.o: warning: objtool: do_syscall_64+0x4f: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_int80_emulation+0x2a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_fast_syscall_32+0x5c: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: kvm_spurious_fault+0x1c: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: vmx_update_host_rsp+0x30: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: vmx_vcpu_enter_exit+0x2c: call to context_tracking_enabled_this_cpu() leaves .noinstr.text section
   vmlinux.o: warning: objtool: svm_vcpu_enter_exit+0x28: call to context_tracking_enabled_this_cpu() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __rdgsbase_inactive+0x25: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __wrgsbase_inactive+0x2a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: handle_bug+0x4: call to kmsan_unpoison_entry_regs() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret+0x8f: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_debug_user+0x42: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_nmi+0x47: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: poke_int3_handler+0x3b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: native_sched_clock+0x6d: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: pvclock_clocksource_read_nowd+0x77: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: local_clock_noinstr+0x6b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode_prepare+0x45: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_enter_from_user_mode+0x45: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_exit+0x32: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_enter+0x4f: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_exit+0x5a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_kernel_exit_state+0x2b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_nmi_enter+0x2d: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_kernel_enter_state+0x2e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_idle_enter+0x3c: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_kernel_exit+0x40: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_idle_exit+0x4f: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_kernel_enter+0x4b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_irq_enter+0x29: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_irq_exit+0x29: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __ct_user_enter+0x3d: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: context_tracking_recursion_enter+0x41: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mwait_idle+0x2d: call to ftrace_likely_update() leaves .noinstr.text section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
