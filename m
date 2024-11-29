Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524D41EA65;
	Fri, 29 Nov 2024 00:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732840388; cv=none; b=Ipimaf680SOUz0muvj8MvUxUo6ZW5z3BA9QmVtHGDgLE9ypI2xWllMroYf38J1NQ3MLD0C5A6bOc2c9LD4focoskPTulA6YkeMgxhPHn9zQdrxZ+s3Ky3XX3U30QzuImE2zP05I1kh9IQhP2HCSmYdyEDwyAizkExE1ZF0KV4s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732840388; c=relaxed/simple;
	bh=vgUuRha6R8uXiL3+Gh/b7pVLd+4zjiLJoXVOd3LJx9w=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gGLYP9kiU/2C+blxt2V0YK2pTF0BvXj7fDYjFojrCYnJvElpM43N9bQRbATCfXbRJwUuVLgjgUKmCm/JWvBdlTCy45l1UWLBpNM4UeYGYwM+4ljd+e1w9IPbZAfCCV6PrtmvQCaTb8rtXah9PkNdceuVdDSv40rBwQhcajEeRFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YcTYGUQm; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YcTYGUQm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732840386; x=1764376386;
  h=date:from:cc:subject:message-id:mime-version;
  bh=vgUuRha6R8uXiL3+Gh/b7pVLd+4zjiLJoXVOd3LJx9w=;
  b=YcTYGUQmbqA5qTa7F5CfjW4ZpjhKtiAnn3iKteKHOBwOj3HgpJFff221
   Wg8p8D14Tbp6oMvIyVfa9icK44TOnbaonTzAtaU3fVX6ayoAIZ8mAw4nx
   FEnOhsaDOoPYT3gJ3/tszbAl39+CWjCkWyhdB4++t3GHZRMcEl9RJYz1X
   9w4KRmqsjzfK/l72X6cb5/04fVxaR1SRkBP5U06dV0HClOcw18WVauA8s
   aAGb/65Ldc3PF2AEqkSYcRy2GuupZtEbKM7H3zSfQhB4HgzmW6WKwf3/q
   f8kIs7JzhHN/MAz3XA62ghnFM2NJPCW3bh5xN4fDLjT54OgJoq27IBW54
   Q==;
X-CSE-ConnectionGUID: q/4ls+JkQoCLQawsXgqQdQ==
X-CSE-MsgGUID: 81A6oj+pRVG1nXNSzurnhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="33130096"
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; 
   d="scan'208";a="33130096"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 16:33:06 -0800
X-CSE-ConnectionGUID: RYWaRhfjQeueUai7X51sag==
X-CSE-MsgGUID: PGpToJxxQZqQhZ7bCB5KyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; 
   d="scan'208";a="92160465"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 28 Nov 2024 16:33:04 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGowQ-000ABn-26;
	Fri, 29 Nov 2024 00:33:02 +0000
Date: Fri, 29 Nov 2024 08:32:36 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [jpoimboe:objtool-loongarch 2/4] vmlinux.o: warning: objtool:
 bch2_key_has_snapshot_overwrites+0x1b3: unsupported stack register
 modification
Message-ID: <202411290819.Do5qv0Kp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Josh Poimboeuf <jpoimboe@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-loongarch
head:   719e621826002a47d82ee36f9f436e9126b65980
commit: 608b37bdda2a1bb6ea171f9711d0aabaf953bc2e [2/4] objtool/loongarch: Simplify frame pointer detection
config: x86_64-randconfig-014-20241128 (https://download.01.org/0day-ci/archive/20241129/202411290819.Do5qv0Kp-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241129/202411290819.Do5qv0Kp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411290819.Do5qv0Kp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: __sev_get_ghcb+0x3b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __sev_put_ghcb+0x3b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __sev_es_ist_exit+0x39: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: kernel_exc_vmm_communication+0x9e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_syscall_64+0x69: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_int80_emulation+0x38: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_fast_syscall_32+0x56: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __rdgsbase_inactive+0x24: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __wrgsbase_inactive+0x29: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret+0x8e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_debug_user+0x41: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_nmi+0x39: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: poke_int3_handler+0x37: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: native_sched_clock+0x73: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: pvclock_clocksource_read_nowd+0x86: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: local_clock_noinstr+0x4a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode_prepare+0x39: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_enter_from_user_mode+0x39: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_exit+0x2d: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_enter+0x42: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_exit+0x63: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_idle_exit+0x43: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_kernel_enter+0x13: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_kernel_enter_state+0x2e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_idle_enter+0x10: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_kernel_exit+0x31: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_kernel_exit_state+0x2e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_nmi_enter+0x23: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_irq_enter+0x24: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_irq_exit+0x24: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: check_preemption_disabled+0x33: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mwait_idle+0x27: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: acpi_processor_ffh_cstate_enter+0x76: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: intel_idle+0x67: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: intel_idle_s2idle+0x74: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: intel_idle_xstate+0x6c: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: intel_idle_ibrs+0x6c: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: intel_idle_irq+0x67: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: acpi_idle_enter+0x3d: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: acpi_idle_enter_s2idle+0x45: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: poll_idle+0x48: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: default_enter_idle+0x29: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ftrace_likely_update+0xaa: call to __stack_chk_fail() with UACCESS enabled
   vmlinux.o: warning: objtool: .text.jffs2_erase_pending_blocks: unexpected end of section
   vmlinux.o: warning: objtool: .altinstr_replacement+0xf92: redundant UACCESS disable
   vmlinux.o: warning: objtool: bch2_bucket_backpointer_mod_nowritebuffer+0x33c: unsupported stack register modification
   vmlinux.o: warning: objtool: .altinstr_replacement+0xfa2: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xfb2: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x107e: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x10de: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x11bd: redundant UACCESS disable
   vmlinux.o: warning: objtool: __bch2_journal_key_search+0x85e: stack state mismatch: cfa1=4+208 cfa2=5+208
>> vmlinux.o: warning: objtool: bch2_key_has_snapshot_overwrites+0x1b3: unsupported stack register modification
>> vmlinux.o: warning: objtool: __bch2_create+0x795: stack state mismatch: cfa1=4+696 cfa2=5+696
>> vmlinux.o: warning: objtool: snapshots_seen_update+0x336: return with modified stack frame
   vmlinux.o: warning: objtool: bch2_evacuate_bucket+0x791: return with modified stack frame
   vmlinux.o: warning: objtool: .altinstr_replacement+0x1449: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x1557: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x164e: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x171f: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x1755: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x1804: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x182a: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x18fb: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x19cc: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x1a9d: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x1bba: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x1c88: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x1d59: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x1dc2: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x1e80: redundant UACCESS disable
   vmlinux.o: warning: objtool: mpt3sas_transport_add_host_phy+0x3ae: stack state mismatch: cfa1=4+104 cfa2=5+104
   vmlinux.o: warning: objtool: mpt3sas_transport_add_expander_phy+0x3ad: stack state mismatch: cfa1=4+104 cfa2=5+104
>> vmlinux.o: warning: objtool: rpmsg_create_ept+0xd9: sibling call from callable instruction with modified stack frame
>> vmlinux.o: warning: objtool: do_ipv6_getsockopt+0x11eb: return with modified stack frame

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
